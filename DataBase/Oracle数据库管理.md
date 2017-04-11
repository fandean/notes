# Oracle数据库管理

标签（空格分隔）： DataBase

---

## Oracle数据库常用操作


开启数据库
开启监听器

检查监听器是否正常开启

sqlplus /nologin
conn 连接

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
select * from session_roles;


解锁用户
设置密码
```sql
-- 解锁scott用户，其默认密码是tiger。但默认密码提示无效(expire)更改密码为2tiger
alter user scott account unlock;
-- 重设密码
alter user scott identified by 2tiger;
```


查看数据库参数：show parameter

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