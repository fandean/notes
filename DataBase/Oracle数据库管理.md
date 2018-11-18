# Oracle数据库管理



开启数据库
开启监听器

检查监听器是否正常开启

```
sqlplus /nologin
conn 连接
```



## 相关概念



### 数据库启动

数据库启动时要经历3个阶段： 

1. 启动实例（start An Instance)
2. 装载数据库（Mount The Database)
3. 打开数据库 (Open The Database)



### 数据库与实例

**数据库：**

数据库的名称（Database Name）和实例的名称（SID）是两个不同的概念，在RAC（集群）环境下，多个实例可以同时打开一个数据库；数据库的名称可以和实例的名称不同。

但通常在单机环境下，数据库的名称和实例的名称相同。（那么在单机创建多个数据库时是否需要同时创建对应的数据库实例？）



> **单实例数据库single-instance database:**
> 它并不是意为着一台主机只允许存在一个Oracle instance(实例)。
> A single-instance database is a database that is accessed(访问) by only one Oracle instance。同时只允许单个实例访问该数据库？





实例：

何为实例？



**当你使用sqlplus连接时，你连接的是数据库实例**，每一个实例都有一个实例ID，或叫做system ID (SID)。由于一个电脑中可以存在多个实例，所以必须指定你想连接哪个实例。对于本地连接，你可以通过**设置系统环境变量**的方法来识别一个实例；对于远程连接，通过指定网络地址和数据库服务名(a database service name)



> 可以这样简单理解：在单机模式一般就使用一个数据库，该数据库在安装Oracle时创建。
>
> 当然也可以创建多个数据库，对于新手通过图形界面更加方便。





### 物理结构

物理结构由数据文件(Datafiles)，联机日志文件(Online Redo logs),控制文件(control files)组成

除此之外还有一些其它文件，如参数文件。

一个或多个数据文件形成一个表空间（表空间是逻辑结构）。

### 逻辑结构

逻辑结构由： 数据块（Data Block)、区（Extent）、段（Segment）和表空间（Tablespace）组成。

```
                         数据库
                 
                 表空间            表空间
            
            段       段        段         段
         
        区    区     区    区  ...
        
    块    块    块      块    块   ...
```

表空间：用于存储数据库对象（比如：表，索引等）【而这些对象实际存放在数据文件中】





## 常用操作



查看数据库用户

```sql
-- 数据库用户及用户默认的表空间;
SELECT user_id,
       username,
       default_tablespace
FROM dba_users
ORDER BY user_id DESC;

-- 查看所有用户
select * from all_users;
select * from dba_users;
```

查看当前用户（会话）权限

```sql
select * from session_roles;
```

解锁用户
设置密码

```sql
-- 解锁scott用户，其默认密码是tiger。但默认密码提示无效(expire)更改密码为2tiger
alter user scott account unlock;
-- 重设密码
alter user scott identified by 2tiger;
```


查看数据库参数：`show parameter`

```sql
-- 查看当前数据库的实例名
-- show parameter要求数据库显示参数；instance_name为参数名称
show parameter instance_name;

-- show parameter支持部分匹配功能
show parameter instance;
```




```sql
-- 数据库用户及用户默认的表空间;
SELECT user_id,
       username,
       default_tablespace
FROM dba_users
ORDER BY user_id DESC;
```


```sql
-- 利用descibe命令查看已有数据表的表结构
DESC student;
desc tb_clazz;


/*
根据列名获得该列所出现的表名
很多时候需要从列追溯表信息
在oracle中可以通过视图 user_tab_cols获得当前用户的所有列的信息。
*/ 
SELECT table_name
FROM user_tab_cols
WHERE LOWER(column_name) = 'id';
select * from user_tab_cols;
```



想要**操作**数据库，首先需要创建用户并给用户授予权限；在创建用户时需要指定表空间并指定用户在表空间中能够使用的大小。因此，想要创建用户，首先需要创建数据库表空间。



创建表空间：

```sql
-- 创建表空间1
create tablespace itheima
datafile '/u01/app/oracle/oradata/oracle11g-data/itheima.dbf'
size 20M  --初始化大小
autoextend on  --自动扩展
next 10M;  --每次添加10M

-- 创建表空间2
create tablespace itheima
  datafile '/u01/app/oracle/oradata/oracle11g-data/itheima.dbf'
size 10M
extent management local autoallocate;

--  本地化管理方式创建,
-- extent management local autoallocate是设置当表空间大小已满时，用自动管理的方式扩展表空间。
```

创建用户：

```sql
create user itheima identified by fan123
  default tablespace itheima;
```

为用户授权：

```
grant connect, resource, dba to itheima;
```








```sql
/*
增加注释：
为了描述表、列的作用，可以使用comment语句为表和列增加注释
*/
-- comment on table tbname is 'text';
-- comment on column table.column_name is 'text';
;
comment on table tb_student is '学生表';
comment on column tb_student.tel is '电话'; 
/*
查看注释：利用数据字典
user_tab_comments 和 user_column_comments
*/
-- select * from user_tab_comments where comments is not null;
-- select * from user_col_comments where comments is not null;
select * from user_tab_comments;
select * from user_tab_comments where comments is not null;
select * from user_col_comments;
select * from user_col_comments where comments is not null;


-- 实现只复制数据结构
create table tb_clazz3
as 
select code from tb_clazz where code=NULL;  -- 让where无匹配行，则没有数据只是复制了表结构
```





## 字符集



查询server端的字符集：

```sql
select userenv('language') from dual;
```



查询oracle client端的字符集：

- 在windows平台下，就是注册表里面相应`OracleHome`的`NLS_LANG`。还可以在dos窗口里面自己设置，

  比如: `set nls_lang=AMERICAN_AMERICA.ZHS16GBK`

  这样就只影响这个窗口里面的环境变量。

- 在unix平台下，就是环境变量NLS_LANG。

  `echo $NLS_LANG`

  `AMERICAN_AMERICA.ZHS16GBK`



如果检查的结果发现server端与client端字符集不一致，请统一修改为同server端相同的字符集。



**补充：**

(1).数据库服务器字符集

```sql
select * from v$nls_parameters where parameter='NLS_CHARACTERSET';
select * from nls_database_parameters
```

来源于`props$`，是表示数据库的字符集。

 

(2).客户端字符集环境

```sql
select * from nls_instance_parameters
```

其来源于`v$parameter`，表示客户端的字符集的设置，可能是参数文件，环境变量或者是注册表

 

(3).会话字符集环境

```sql
select * from nls_session_parameters
```

来源于`v$nls_parameters`，表示会话自己的设置，可能是会话的环境变量或者是alter session完成，如果会话没有特殊的设置，将与`nls_instance_parameters`一致。

 



[Oracle 字符集的查看和修改 - 一江水 - 博客园](https://www.cnblogs.com/rootq/articles/2049324.html "Oracle 字符集的查看和修改 - 一江水 - 博客园")

[彻底搞懂Oracle字符集_oracle_脚本之家](https://www.jb51.net/article/39719.htm)

[Oracle11g创建表空间、创建用户、角色授权、导入导出表以及中文字符乱码问题 - 乐呵呵的小码农 - 博客园](https://www.cnblogs.com/bjh1117/p/6605037.html "Oracle11g创建表空间、创建用户、角色授权、导入导出表以及中文字符乱码问题 - 乐呵呵的小码农 - 博客园") （使用 PL/SQL 的配置）





## scott用户

scott是oracle创建时的一位员工的名字，该用户下提供了几个测试表来给我们练习

```sql
--07scott用户
--默认是锁定 默认密码：tiger

--为用户解锁
alter user scott account unlock;
--为用户设置密码
alter user scott identified by tiger;

/*
  表说明：
    dept      --部门表
    emp       --员工表
    salgrade  --工资等级表
    bonus     --工资表（现在不用)
*/
```

如果解锁 scott 用户时提示，scoot用户不存在，可以使用下面的bat来创建需要用到的测试表： 

scott.sql 文件：

```sql
Rem Copyright (c) 1990 by Oracle Corporation
Rem NAME
REM    UTLSAMPL.SQL
Rem  FUNCTION
Rem  NOTES
Rem  MODIFIED
Rem	gdudey	   06/28/95 -  Modified for desktop seed database
Rem	glumpkin   10/21/92 -  Renamed from SQLBLD.SQL
Rem	blinden   07/27/92 -  Added primary and foreign keys to EMP and DEPT
Rem	rlim	   04/29/91 -	      change char to varchar2
Rem	mmoore	   04/08/91 -	      use unlimited tablespace priv
Rem	pritto	   04/04/91 -	      change SYSDATE to 13-JUL-87
Rem   Mendels	 12/07/90 - bug 30123;add to_date calls so language independent
Rem
rem
rem $Header: utlsampl.sql 7020100.1 94/09/23 22:14:24 cli Generic<base> $ sqlbld.sql
rem
SET TERMOUT OFF
SET ECHO OFF
 
rem CONGDON    Invoked in RDBMS at build time.	 29-DEC-1988
rem OATES:     Created: 16-Feb-83
 
GRANT CONNECT,RESOURCE,UNLIMITED TABLESPACE TO SCOTT IDENTIFIED BY TIGER;
ALTER USER SCOTT DEFAULT TABLESPACE USERS;
ALTER USER SCOTT TEMPORARY TABLESPACE TEMP;
CONNECT SCOTT/TIGER
DROP TABLE DEPT;
CREATE TABLE DEPT
       (DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
	DNAME VARCHAR2(14) ,
	LOC VARCHAR2(13) ) ;
DROP TABLE EMP;
CREATE TABLE EMP
       (EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
	ENAME VARCHAR2(10),
	JOB VARCHAR2(9),
	MGR NUMBER(4),
	HIREDATE DATE,
	SAL NUMBER(7,2),
	COMM NUMBER(7,2),
	DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT);
INSERT INTO DEPT VALUES
	(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES
	(30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES
	(40,'OPERATIONS','BOSTON');
INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,to_date('13-JUL-87')-85,3000,NULL,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,to_date('13-JUL-87')-51,1100,NULL,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);
DROP TABLE BONUS;
CREATE TABLE BONUS
	(
	ENAME VARCHAR2(10)	,
	JOB VARCHAR2(9)  ,
	SAL NUMBER,
	COMM NUMBER
	) ;
DROP TABLE SALGRADE;
CREATE TABLE SALGRADE
      ( GRADE NUMBER,
	LOSAL NUMBER,
	HISAL NUMBER );
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
COMMIT;
 
SET TERMOUT ON

```



更正后的sql：

```sql
-- DROP TABLE DEPT;
CREATE TABLE DEPT
(DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
 DNAME VARCHAR2(14) ,
 LOC VARCHAR2(13) ) ;
-- DROP TABLE EMP;
CREATE TABLE EMP
(EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
 ENAME VARCHAR2(10),
 JOB VARCHAR2(9),
 MGR NUMBER(4),
 HIREDATE DATE,
 SAL NUMBER(7,2),
 COMM NUMBER(7,2),
 DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT);

INSERT INTO DEPT VALUES
                        (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES
                        (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES
                        (40,'OPERATIONS','BOSTON');



INSERT INTO EMP VALUES
                       (7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMP VALUES
                       (7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO EMP VALUES
                       (7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO EMP VALUES
                       (7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP VALUES
                       (7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP VALUES
                       (7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMP VALUES
                       (7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMP VALUES
                       (7788,'SCOTT','ANALYST',7566,to_date('3-10-1987','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
                       (7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP VALUES
                       (7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO EMP VALUES
                       (7876,'ADAMS','CLERK',7788,to_date('13-7-1987','dd-mm-yyyy'),1100,NULL,20);
INSERT INTO EMP VALUES
                       (7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMP VALUES
                       (7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
                       (7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);
-- DROP TABLE BONUS;
CREATE TABLE BONUS
(
  ENAME VARCHAR2(10)	,
  JOB VARCHAR2(9)  ,
  SAL NUMBER,
  COMM NUMBER
) ;
-- DROP TABLE SALGRADE;
CREATE TABLE SALGRADE
( GRADE NUMBER,
  LOSAL NUMBER,
  HISAL NUMBER );
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
COMMIT;
```

