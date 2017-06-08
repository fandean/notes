# MySQL

标签（空格分隔）： DataBase

---

## MySQL常见问题

[MySQL Documentation](http://docs.oracle.com/cd/E17952_01/index.html "或见MySQL官网的DOC，更好") 

见[数据库使用中的一些问题.md](./数据库使用中的一些问题.md)



## MySQL常用命令

```SQL
--  Mysql常用命令 http://www.cnblogs.com/hateislove214/archive/2010/11/05/1869889.html # 导入导出数据库、表，略 # create database dbname; # 创建数据库 
SHOW DATABASES;

-- 创建用户
create user 'fan'@'%' identified by 'Security0;';
-- 为用户授权
-- grant privileges on *.* to 'fan'@'%';
-- 添加 with grant option 选项后该用户可以给其它用户授权
-- 添加关键词all可授予全部权限
grant all privileges on *.* to 'fan'@'%' identified by 'Security0;' with grant option ;


-- 必须刷新权限
flush privileges;


-- 更改密码
alter user user_name identified by 'New_passwd4!';


-- 创建数据库;字符编码采用 utf8




-- 查看所有用户,其中password_expired表示密码是否过期
select user, host,password_expired , password_last_changed , password_lifetime  
from mysql.user;




--  显示所有数据库 # drop database dbname; #删除数据库 
--  连接数据库 
USE test;

--  查看当前使用的数据库 
SELECT DATABASE ();

--  查看该数据库中所有的表
SHOW tables;


-- #### 表操作，操作之前应先连接到某个表 ########## #建表，create table tbname(); 直接见 show create table table_name; 查看table_name的建表语句; 
SHOW CREATE TABLE t1;

-- 查看建表信息 
DESC t1;

-- 获取表结构。同 show columns from table_name;输出结果还是有差异的。 
SHOW columns
FROM t1;


/*
MySQL会话信息
*/
SHOW VARIABLES LIKE 'character%';
+--------------------------+----------------------------+
| Variable_name            | Value                      |
+--------------------------+----------------------------+
| character_set_client     | utf8                       |
| character_set_connection | utf8                       |
| character_set_database   | latin1                     |
| character_set_filesystem | binary                     |
| character_set_results    | utf8                       |
| character_set_server     | latin1                     |
| character_set_system     | utf8                       |
| character_sets_dir       | /usr/share/mysql/charsets/ |
+--------------------------+----------------------------+



SHOW VARIABLES LIKE 'validate_password%';
+--------------------------------------+--------+
| Variable_name                        | Value  |
+--------------------------------------+--------+
| validate_password_check_user_name    | OFF    |
| validate_password_dictionary_file    |        |
| validate_password_length             | 8      |
| validate_password_mixed_case_count   | 1      |
| validate_password_number_count       | 1      |
| validate_password_policy             | MEDIUM |
| validate_password_special_char_count | 1      |
+--------------------------------------+--------+


-- SQL的执行顺序 from... where...group by... having.... select ... order by...limit...



--  创建表
CREATE TABLE test123 
(
  id       INT NOT NULL auto_increment,
  name     CHAR(40) NOT NULL,
  sex      CHAR(4) DEFAULT 'boy',
  school   VARCHAR(50) DEFAULT 'HeChi Universe',
  room     CHAR(10),
  PRIMARY KEY (id)
)
DEFAULT charset = utf8 auto_increment = 1000;




INSERT INTO test123
(
  name,
  sex,
  school,
  room
)
VALUES
(
  '徐开平',
  'boy',
  NULL,
  -- NULL则覆盖了默认值
  516
);

UPDATE test123
   SET school = 'HeChi Universe'
WHERE name = '徐开平';

INSERT INTO test123
(
  name,
  room,
  sex
)
VALUES
(
  '韦大宝',
  '516',
  'boy'
);



SELECT *
FROM test123;

SELECT *
FROM tutorials_tb1;

INSERT INTO t1
VALUES
(
  '4',
  'Java nihao',
  'fan',
  '2006-06-11'
);

--  id 应该是自动增长的。 
INSERT INTO t1
(
  t1_title,
  t1_author,
  submission_date
)
VALUES
(
  'SQL 必知必会',
  'fan',
  '2006-11-11'
);

--  更新数据 
UPDATE t1
   SET t1_title = 'Java 编程思想'
WHERE t1_author = 'fan';

DELETE
FROM t1
WHERE t1_id = 8;

DESC t1;

-- #取表结构 # 中文乱码 # 查看当前数据库相关编码集 
SHOW variables LIKE 'character%';

SET names utf8;

--  重命名表
SELECT *
FROM test123;

rename table test123 to 516SB;
select * from 516SB order by id desc;


-- 格式化日期
select date_format(now(), '%y年%m月%d日 %H点:%i分:%s秒');








-- 自定义函数 UDF（慕课网）
create function function_name
returns
{string|integer|real|decimal}
routine_body

其中：routine_body为函数体，它可以是：
1.合法的SQL语句构成
2.可以是简单的select或insert语句
3.函数体如果为复合结构则使用 begin...end语句；
4.复合结构可以包含声明，循环，控制结构;

create function fun_date() returns varchar(30)
return date_format(now(), '%y年%m月%d日 %H点:%i分:%s秒');

select fun_date();

-- 带参数的函数
create function f2(num1 smallint unsigned, num2 smallint unsigned)
returns float(10,2) unsigned
return (num1 + num2)/2;

select f2(5,8);

-- 带复合结构的函数
-- 需要修改分隔符  delimiter //
create function adduser(username varchar(20))
returns int unsinged
begin
insert test(username) values(username);  -- test是一个表，username是表的一个列。
retuen last_insert_id();
end

-- 删除函数
drop function [if exists] function_name;


自定义函数两个必要条件：
参数：可以有零个或多个
返回值：只能有一个。

                          分析
SQL命令  -->  MySQL引擎  ------> 语法正确
                                    |
                                    | 编译
                        执行         |
 客户端 <---  执行结果 <----   可识别的命令 

-- 存储过程（慕课网）
-- 存储过程是SQL语句和控制语句的预编译集合，以一个名称存储并作为一个单元处理。;

优点：速度快；

函数有函数体，过程有过程体。过程体中可使用部分SQL语句。
过程体中语句超过1条也需使用begin end语句包围。

调用存储过程，如果没有参数则可省略括号。

为避免混淆，参数名不能与数据表中列名相同。



-- 慕课网：MySQL开发技巧 一、二、三 
-- 讲的非常好。

-- 西天取经四人组表和悟空朋友表
;
use test;

create table qujin(
id int not null primary key auto_increment,
name varchar(20) not null,
over varchar(20) 
);


/*
创建表的另一种形式
*/
create table pengyou
as 
select * from qujin;      -- 但是 id 并不会自动增长.建议不用.
drop table pengyou;



create table pengyou(
id int not null primary key auto_increment,
name varchar(20) not null,
over varchar(20)
);
 

 

-- 旃檀 (zhan tan): 指檀香
INSERT  qujin (name,over) values('唐僧','旃檀功德佛'),('猪八戒','净坛使者'),('孙悟空', '斗战胜佛'),('沙僧','金身罗汉');
INSERT  into pengyou (name) values('孙悟空','成佛'),('牛魔王','被降服'),('蛟魔王','被降服'),('鹏魔王','被降服'),('狮驼王','被降服');
update pengyou set over = '被降服';
update pengyou set over = '成佛' where  name = '孙悟空';

select * from  pengyou;
select * from  qujin;


rename table  qujin to a;
select * from b;
rename table  pengyou to b;



/*
Join 
内连接  inner              交集部分
全外连接 full outer
左外连接
右外连接
交叉连接

这里没有讲到外键
*/
;
-- 内连接  inner         应用场景用于查找交集
;
select a.name, a.over, b.over from a inner join b on a.name = b.name;

-- 无where


-- 外连接示例:
select a.name, a.over, b.over
from a left join b 
on a.name = b.name;


-- 左外连接               应用场景，根据左外连接的结果排除只存在与左表但不存在与右表的值
select a.name, a.over, b.over
from a left join b 
on a.name = b.name
where b.name is null;   -- 条件是: 右边为null



-- 右外连接
select b.name, b.over, a.over
from a right join b 
on a.name = b.name
where a.name is null;


-- 全外连接      应用场景：排除两张表的公共部分
-- MySQL不支持全外连接,可使用左外连接加右外连接再通过union all进行组合,以实现全外连接.
where a.key is null or b.key is null;

-- 实现全外连接
select a.name, a.over, b.over
from a left join b 
on a.name = b.name
union all
select b.name, b.over, a.over
from a right join b 
on a.name = b.name; 

-- 利用全外连接,排除两表的公共部分
select a.name, a.over, b.over
from a left join b 
on a.name = b.name
where b.name is null
union all                       -- 为什么使用 union all
select b.name, b.over, a.over
from a right join b 
on a.name = b.name
where a.name is null;         -- 排除了公共部分,孙悟空


-- 交叉连接: Cross Join
-- 交叉连接又称笛卡尔连接
-- 连接时没有连接关键词on 
select a.id,  a.name, a.over, b.id, b.name, b.over from a,b; 




-- 与Join相关的SQL技巧
--  ------------------------------------------------

-- 1. 如何更新使用过滤条件中包括自身的表?
-- 情景: 把两表的公共部分的over列更新为"齐天大圣"
;
update a set over = '齐天大圣'
where a.name  in(
select b.name           -- 使用 a.name 都一样
from a inner join b
on a.name = b.name);

-- 这条语句在MySQL中不能执行,因为在MySQL中不能更新在from子句中出现的表
-- 在Oracle中可以.

-- 利用一个技巧: 不让出现在from从句中就让其出现在update中.
update a join (     -- 看不懂, 如果a是要更新的表,那么join是什么意思?
select b.name from a inner join b on              -- 先执行括号中的select,选择出公共部分,并将结果命名为b
a.name = b.name
) b on a.name = b.name set a.over = '齐天大圣';

select * from a;



-- 2. 如何使用join优化子查询
-- 情景: 匹配出取经四人组中的人在悟空兄弟们中的结果.
-- 原查询: 速度较慢
-- 原因: 对a表中的每一行都需要进行一次子查询.(理解这一句很重要)
select a.name, a.over, (select over
from b where a.name = b.name) as over2 
from a;
-- 除了慢而且怪异


-- 优化后的查询
select a.name, a.over, b.over as over2
from a left join b on a.name = b.name;





-- 3. 使用join优化聚合子查询
-- 引入一张新表,该表按日期记录四人组中每个人打怪的数量
create table user_kills(
id int primary key auto_increment,
user_id int not null references a(id),
timestr datetime not null default now(),
kills int not null check(kills > 0)
);

desc user_kills;
insert into user_kills(user_id, timestr, kills) values
(2,'2013-01-10',10),
(2,'2013-02-01',2),
(2,'2013-02-05',12),
(4,'2013-01-10',3),
(2,'2013-02-11',5),
(2,'2013-02-06',1),
(3,'2013-01-11',20),
(2,'2013-02-12',10),
(2,'2013-02-07',17);

select * from user_kills;
rename table daguai to user_kills;
commit;

-- 问题: 如何查询出四人组中打怪最多的日期?

;
select timestr,sum(kills) as kills from user_kills group by timestr  order by kills desc; 
select timestr ,sum(kills) from user_kills group by timestr  order by kills desc; 









/*
group by 与 order by
http://www.cnblogs.com/zsphper/archive/2010/06/10/mysql-group-by-order-by.html
*/
create table group_order(
id int primary key auto_increment,
name char(10) not null,
category_id int not null,
date datetime default now()
);
insert into group_order(name, category_id) values('eee',2);
commit;
select * from `group_order`;
select category_id, name from group_order group by category_id order by `date`;
select category_id, name from group_order group by category_id, name;
select * from group_order group by category_id, name, date,id ;  -- 排列顺序影响结果
;

-- 再次认识group by, limit 0,2 中0代表开始行2代表行数.
select category_id, name from group_order group by category_id, date, name 
order by `date` limit 0,2;

-- SQL的执行顺序 from... where...group by... having.... select ... order by...


select * from group_order where 1;

select group_concat(id order by `date` desc) from `group_order` 
group by category_id;

-- 执行错误
SELECT *
FROM `group_order`
WHERE id IN (SELECT SUBSTRING_INDEX(group_concat (id ORDER BY `date` DESC),',',1)
             FROM `group_order`
             GROUP BY category_id)
ORDER BY `date` DESC;
-- 执行错误
select category_id   from (select * from `group_order` order by `date` desc) `temp`  
group by category_id order by `date` desc;

```

## MySQL必知必会

```SQL
-- ########################################################
-- ## 
-- ########################################################

-- ######################################
-- # varchar 字段是将实际内容单独存储在聚簇索引之外，内容开头用1到2个字节表示实际长度（长度超过255时需要2个字节），因此最大长度不能超过65535。
-- #
-- # UTF-8：一个汉字 = 3个字节，英文是一个字节
-- # GBK： 一个汉字 = 2个字节，英文是一个字节
-- # 在utf-8状态下，汉字最多可以存 21844个字符串, 英文也为 21844个字符串。
-- #
-- # 在gbk状态下，汉字最多可以存 32766个字符串，英文也为 32766个字符串。;;
-- 
-- # SQL Workbench/J 
-- # ctrl + r 格式化语句
-- # 使用  29. Other SQL Workbench/J specific commands
-- #WbGrepDate -searchValue=fan


-- 书中各表之间的关系：  

-- orderitems表：               >              orders表:           -               customers表：
-- 各订单物品信息。                             另还包含日期                            客户信息
-- 主键( order_item + order_num )       外键： cust_id  ---------------------->  主键：cust_id        （猜想这组表是存在与供应商的数据库中，而供应商只需关心订单即可）
-- 外键 order_num    ----------------> 主键：order_num  


-- vendors表：               <               products表：            -               productnotes表：
-- 供应商信息                                 存储产品信息                                  产品备注          （猜想这组表是存在与客户数据库，客户只需关心产品信息）
-- 主键： vend_id    <------------------  外键：vend_id                                
--                                          主键： prod_id  <-------------------  外键：prod_id


-- 一个订单通常包含多个物品，一个订单只属于一个客户，但允许客户可以没有订单。如果需要增加订单，需要受到customers表中是否存在该订单中的客户信息的限制；插入订单后又要更新物品信息。
-- 一个供应商通常提供多个产品，一个产品通常只有一个备注。（是否允许供应商没有产品？）


-- 三范式：很有用

-- 当一对多或多对一时两者之间使用外键
-- 当多对多时需要建立中间表还有外键



                                         
-- ########################################################
-- # select 是最常使用的语句，相关书籍一半都是将select
-- ########################################################;
use MySQL_Crash_Course;
-- use jiaoxue;
-- use test;

show tables;
select * from customers;
select * from orders;
select * from orderitems;

select * from vendors;
select * from products;
select * from productnotes;


-- 哪些些客户没有订单
select cust_id , cust_name from customers where cust_id not in(select cust_id from orders); 
-- 找出哪些供应商没有提供产品: 要求有 vend_id 和 vend_name
select vend_id, vend_name from vendors where vend_id not in (select distinct vend_id from products);
-- 哪些客户有多个订单，   使用having过滤分组
select cust_id, count(*) from orders group by cust_id;
select cust_id, count(*) from orders group by cust_id having count(*) > 1;
-- 对于给定的客户(cust_name)需要哪些产品，各产品的总价为？ prod
-- cust_name --> cust_id --> order_id --> prod_name

select prod_id, sum(item_price * quantity) from orderitems where order_num in (20005, 20009) ;



select * from advisor;
select * from classroom;
desc t1;

update customers set cust_email = NULL where cust_name='fan';


SHOW VARIABLES LIKE 'character%';
show variables like 'char%';
show databases;
-- create database MySQL_Crash_Course default CHARSET 'utf8' COLLATE 'utf8_general_ci';
set names utf8;

create table test_charset2(
            id int NOT NULL AUTO_INCREMENT, 
            '姓名' varchar(20),  -- # 是因为 server 端的字符不同导致错误吗？
            '性别' varchar(10),
            primary key (id)        -- # 错误：id 需放在括号中
            )default charset=utf8;
            
create table test_charset(
            id int NOT NULL AUTO_INCREMENT, 
            name varchar(20), 
            sex varchar(10),
            primary key (id)                
            )default charset=utf8;
            
show tables;
select * from test_charset;
insert into test_charset(name,sex) values('范' , '男');
insert into test_charset(name,sex) values('fan', 'm');
delete from test_charset where id=1;
update from ;


-- 事先创建数据库，和表，可在本书网站下载建表和插入数据的sql文件。
-- 建立数据库时注明使用 utf8 字符集。【非必须】
-- 服务器和客户端和连接时都要是utf8,这个需要分别在/etc/my.cnf和~/.my.cnf文件中设置。
-- ########################################################
-- ## 第三章： 使用Mysql
-- ########################################################
-- 选择数据库
use MySQL_Crash_Course;
-- 显示数据库
show databases;
-- 显示表
show tables;
-- 显示表列
show columns from customers; -- or
desc customers;               -- desc 即 describe ,它是上述语句的快捷方式
-- 查看建表语句
show create table customers;
-- 查看建立数据库的语句
show create database MySQL_Crash_Course;
-- 显示服务器信息
show status;
-- 显示授予用户的安全权限; 授权语句。 all privileges 代表所有操作权限； *.* 代表所有数据库和其中的表格； % 表示可以位于任何主机
show grants;
-- 显示服务器错误和警告信息
show errors;
show warnings;
-- 显示该命令的帮助； 需要在mysql的命令行中使用
-- help show;

show variables;
-- 查看MySQL支持的存储引擎：
show engines;


-- ########################################################
-- ##  第四章： 检索数据
-- ########################################################

-- 检索单个列
show tables;
desc customers;
select cust_name from customers;

-- 检索多个列
show columns from products;
select prod_id id, prod_name 商品 , prod_price 价格 from products;

-- 检索所有列
select * from products;

-- 去除重复的行 。不相同distinct [di stigkt] k省略；只能用于所有列，即只能在所有列的前面。
select vend_id from products;
select distinct vend_id  from products;
-- 特别注意下面： 判断相同的条件发生变化，（仅1003,10.00被去除重复的一行)
select distinct vend_id , prod_price from products;

-- TODO 鄙人的总结： 

-- 限制结果
-- limit 限制返回不多于 3 行
select prod_name from products limit 3;
-- 指定开始行和行数。注意：第一行的行号为 0 
select prod_name from products limit 1,2;

-- 使用完全限定的表名
select products.prod_name from products;
select products.prod_name from MySQL_Crash_Course.products;


-- ########################################################
-- ## 第5章：排序检索数据
-- ########################################################

-- 理解 子句（clause）,SQL语句由子句构成；一个子句通常由一个关键字和所提供的数据组成。语句（应该指由;结束的一整条语句)
-- 子句的顺序是有限制的。



-- order by 子句取一个或多个列的名字，据此对输出进行排序。
select prod_name from products order by prod_name;
-- 先以价格排序，如果价格相同再以name进行排序。
select prod_id, prod_name, prod_price from products order by prod_price,prod_name;




-- 指定排序方向
-- 降序排序添加 desc关键字
select prod_id, prod_name, prod_price from products order by prod_price desc;
-- 先以price降序排列，价格相同则按name升序排列。 升序 asc 为默认值。
select prod_id, prod_name, prod_price from products order by prod_price desc, prod_name;



-- 技巧：  找出一列中的最大值或最小值。（不使用函数）， limit必须位于order by之后。
select prod_id , prod_name, prod_price from products  order by prod_price desc limit 1; 
select prod_id , prod_name, prod_price from products  order by prod_price limit 1; 






-- ########################################################
-- ## 第6章：过滤数据
-- ########################################################
select * from products;
-- 使用where子句

select prod_id, prod_name, prod_price from products where prod_price=2.5;

-- where子句操作符。比如：>= 、两个不等于<>和!=、between在指定的两个值之间,包括这两个边界值。
select prod_id, prod_name, prod_price from products where prod_name='safe';   -- MySQL中字符串居然不区分大小写

SELECT prod_id,
       prod_name,
       prod_price
FROM products
WHERE prod_price BETWEEN 2 AND 30
ORDER BY prod_price;

-- 注意：两个and,见下一章
select prod_id, prod_name, prod_price from products 
where prod_price between 2 and 30 and prod_price<>10 order by prod_price;


-- 空值检查 is NULL
select * from customers;
select * from customers where cust_name='E Fudd';
update customers set cust_email=NULL where cust_name='E Fudd';
select cust_name from customers where cust_email is NULL;
-- NULL 与 不匹配，看不懂。 略


-- ########################################################
-- ## 第7章：数据过滤
-- ########################################################
-- 组合where子句，使用AND 、 OR 子句，（逻辑操作符）
-- AND操作符，见上一章
select prod_id, prod_price, prod_name from products
where vend_id = 1003 AND prod_price < 10;

select prod_id, prod_price, prod_name from products
where vend_id = 1003 or prod_price > 50;


-- *************** 多个and和or的优先级问题 **************************
-- 例子：由 1002或1003制造的价格>=10的产品
select prod_id, prod_name, prod_price, vend_id from products
where vend_id=1002 or vend_id=1003 and prod_price>=10;            -- 查询结果错误
--  分析： and结合性高于or； 先执行 vend_id=1003 and prod_price>=10,在执行 vend_id=1002 or and的结果。

-- 解决方法一： 
select prod_id, prod_name, prod_price, vend_id from products
where vend_id=1002 and prod_price>=10 or vend_id=1003 and prod_price>=10; 
-- 解决方法二： 使用括号
select prod_id, prod_name, prod_price, vend_id from products
where (vend_id=1002  or vend_id=1003) and prod_price>=10; 


-- IN操作符, 
-- IN的最大优点是可以包含其它select语句（14章）
-- 圆括号在where子句中的另一个用法，为IN操作符指定条件范围。
select prod_id, prod_name, prod_price, vend_id from products
where vend_id in (1002,1001,1005) order by vend_id; 


-- NOT操作符
-- 否定它之后的任何条件



-- ########################################################
-- ## 第8章：使用通配符进行过滤
-- ########################################################

-- LIKE操作符,  全文匹配
-- 之前的操作符都是对于已知值进行过滤。
-- 通配符： 特殊字符
-- 搜索模式： search pattern, 最终的搜索条件。
-- LIKE操作符指示后面的，搜索模式利用通配符匹配，而不是直接相等匹配进行比较。

-- 百分号 % 通配符，表示任何字符出现任意次数。
-- 根据数据库自身的配置方式，可以不区分大小写。LIKE '%' 是无法匹配NULL的。
select prod_id, prod_name, prod_price from products where prod_name LIKE '%jet%';
select prod_id, prod_name, prod_price from products where prod_name LIKE 's%e';
-- 注意尾空格：在保存anvil时，如果它的后面有一个或多个空格，则LIKE '%anvil'不会匹配它，解决的方法是使用 '%anvil%'


-- 下划线(_)通配符
-- 下划线只匹配单个字符而不是多个字符。
select prod_id, prod_name, prod_price from products where prod_name LIKE '_ ton anvil';


-- 使用通配符的技巧
-- 1.不要过度使用；它处理时间要长。
-- 2.尽量不要用在搜索模式的开始处；因为这样会很慢。
-- 3.仔细注意通配符的位置。



-- ########################################################
-- #  第9章：  使用正则表达式进行搜索
-- ########################################################
-- MySQL用where子句对正则表达式提供了初步的支持（很少的支持）
-- 它支持 . 、 ^  、 $ 、 | 、 [] [^a] [1-7] 
select prod_name from products; 
-- regexp 关键字
-- 正则中的 . 表示匹配任意一个字符
select prod_name from products where prod_name regexp '.000' order by prod_name;
select prod_name from products where prod_name regexp '.' order by prod_name;
select prod_name from products where prod_name regexp '1000|2000' order by prod_name;
-- ****************** 注意： 区分以下两者的不同 *****************
select prod_name from products where prod_name regexp '[123] Ton' order by prod_name;
select prod_name from products where prod_name regexp '1|2|3 Ton' order by prod_name;
-- 匹配范围，分析结果
select prod_name from products where prod_name regexp '[1-5] Ton' order by prod_name;

-- 匹配正则表达式占用的特殊字符
-- 需使用 \\ 作为转义字符。如： \\- 表示查找-；\\\匹配\ ； \\n 匹配换行 \\r匹配回车
-- （MySQL要求两个\，其中Mysql自己解释一个，正则表达式库解释另一个）有些数据库可能只需要一个\
select prod_name from products where prod_name regexp '\.' order by prod_name;

-- 匹配字符类
-- 正则预定义了一些常用的字符集，称为字符类（character class)
-- 比如 [:alnum:] 任意字母和数字
-- [:space:] 任意空白字符  等等

-- 匹配多个实例
-- 重复元字符：  * 0或多个； + 1个或多个； ? 0个或1个；  {n}， {n,} , {n,m}  最后的m不超过255
select prod_name from products where prod_name regexp '\\([0-9] sticks?\\)' order by prod_name;
-- 注意上面的 ? 

select prod_name from products where prod_name regexp '[[:digit:]]{3}' order by prod_name;  
-- [:digit:]表示数字

-- 定位符：
--  ^ 文本的开始； $ 文本的结束
-- [[:<:]] 词的开始 ;   [[:>:]] 词的结束
select prod_name from products where prod_name regexp '^[0-9\\.]' order by prod_name;


/*
**************************LIKE 与 REGEXP 的不同： LIKE匹配整个串;REGEXP匹配子串 *******************
*/


-- 简单的正则表达式测试：  
-- 
-- 可以在不使用数据库表的情况下使用如下select语句来测试正则表达式；
select 'hell0' regexp '[0-9]';
-- 根据输出的结果，0表示没有匹配值，1表示有匹配值。




-- ########################################################
-- #  第10章：  创建计算字段
-- ########################################################

-- 1.计算字段
-- 直接从数据库中检索出转换、计算或格式化过的数据；（而不是检索出数据，然后在再客户应用中重新格式化。
-- 计算字段并不是实际存在于数据库表中；计算字段是运行时在select语句内创建的。

-- 字段（field)基本上与列(column)意思相同；字段一般用于在计算字段的连接上。



-- 2.拼接字段
-- vendors表包含供应商名和位置。最后的格式需为 name(location)，也就是说此报表需要单个值。
-- 拼接（concatenate）将值联结到一起构成单个值。

-- 在MySQL中可使用Concat()函数来拼接两个列。多数DBMS使用 + 或 || 来实现拼接。
-- 这是需要铭记的。
select * from vendors;
select Concat(vend_name, ' (', vend_country, ')')   -- 4个元素，参数
from vendors order by vend_name;
-- select语句返回包含4个元素的单个列（计算字段）


-- MySQL的RTrim()函数删除右侧多余空格。 同样还有 LTrim() 和 Trim()
select Concat(RTrim(vend_name),' (', RTrim(vend_country), ')')
from vendors order by vend_name;


-- 使用别名  AS   可以省略AS 
-- 在上面的查询中，是没有列名的。一个未命名的列不能用于客户机应用中，用完客户机没有办法引用它。
-- **为此** ,SQL支持别名（alias)
-- 别名有时也称为导出列（derived column)
select Concat(RTrim(vend_name),' (', RTrim(vend_country), ')') AS vend_title
from vendors order by vend_name;


-- 执行算术计算
-- 示例： orders表中包含收到的所有订单，orderitems表包含每个订单中的各项物品。 现检索订单号20005中的所有物品。
show tables;
select * from orders;
select * from orderitems; 
select prod_id, quantity,item_price from orderitems where order_num=20005;
-- 汇总物品价格
SELECT prod_id,
       quantity,
       item_price,
       quantity * item_price AS expanded_price
FROM orderitems
WHERE order_num = 20005;

-- MYSQL支持 + - * / 4种运算符，可使用圆括号限定优先级



-- 如何测试计算： 
-- 通过省略select的from子句可以简单的访问和处理表达式。例如： 
select 2*3;
select Trim('   abc   ');
select Now(); 




-- ########################################################
-- #  第11章：  使用数据处理函数
-- ########################################################
-- 注意： 函数的可移植性不强
-- 大多数SQL实现支持如下类型的函数：
-- 用于处理文本串，
-- 用于在数值数据上进行算术操作，
-- 用于处理日期和时间值
-- 返回DBMS正在使用的特殊信息的系统函数。



-- 文本处理函数
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- RTrim()
-- Upper()将文本转换为大写;
-- Left()返回串左边的字符
-- Right()
-- Locate()找出串的一个子串（Locate定位）
-- Lower()
-- SubStrig() 返回子串的字符

select vend_name, Upper(vend_name) AS vend_name_upcase from vendors;

-- 补充：字符串处理函数
char_length(s)    -- 返回字符串的字符数   
length             -- 返回字符串长度 （指所占用的内存空间，指的是占多少字节）
concat_ws(x,s1,s2,...)  -- 以指定分隔符连接字符串
concat(s1,s2,...)   -- 将字符串合并为一个字符串
left(s,n)/right(s,n) -- 返回字符串的前/后n个字符
lpad(s1, len, s2)/    -- 将字符串s1用s2填充到指定的len
rpad(s1, len, s2)
ltrim/rtrim/trim(s)
trim(s1 from s)       -- 去掉字符串s中开始处和结尾处的字符串s1
repeat(s,n)           -- 输出，重复s字符串n次
space(n)              -- 输出，n个空格
replace(s,s1,s2)      -- 将字符串s中的s1替换成s2；（搜索时区分大小写）
strcmp(s1,s2)         -- 比较字符串，忽略大小写
substring(s,n,len)    -- 在字符串s中从n位置开始截取len长度。从1开始
reverse(s)            -- 翻转字符串
elt(n,s1,s2,...)      -- 返回指定位置的的字符串。返回后面列出的字符串第几个位置的字符串

更多函数见麦子学院。
;

-- 比较这两者的差别
select char_length('maizi') AS 字符串的字符数量, length('maizi') AS 字符串长度（字节）;
select char_length('啊') AS 字符串的字符数量, length('啊') AS 字符串长度（字节）;

-- 拼接示例
select concat('Hello ','world');
-- 当拼接的字符串中有null结果为null
select concat('Hello ','world', null); 
-- 同时注意以下连接
select concat_ws('^_^','Hello','你好','Daling');
select concat_ws('','Hello','你好','Daling');
select concat_ws(null,'Hello','你好','Daling');     -- 结果为null
select concat_ws('^_^','Hello','你好','Daling',null); -- 结果不为null

-- 几个示例
select left('abcde',2), right('abcde',2);
select lpad('a',5,'?'), rpad('a',5,'!');
select trim('a' from 'abcda');
select substring('abcde',2,2);
select elt(2,'a','b','c');  -- 返回后面列出的字符串第几个位置的字符串



-- 日期处理函数
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- 一般，应用程序不使用用来存储日期和时间的格式，因此与其相关的函数总是被用来读取和处理这些值。
-- AddDate() 增加一个日期(天、周等）
-- AddTime() 增加一个时间（时、分等）
select CurDate()AS 返回当前日期;
select Now() AS 返回当前的时间日期;
select CurTime() AS 当前时间;
select hour(curtime()) AS 时间的小时;
select minute(Now()) AS 时间的分钟;      -- 传入时间日期也是可以的
select second(curtime()) AS 时间的秒数;
select Date(Now()) AS 返回时间的日期部分;        --  注释语句一定是 -- 加一个空格
select Year(CurDate()) AS '日期的年份';    
select DateDiff(CurDate(),'1992-01-01') '大概活了多少天';  -- 计算两个日期之差
-- Date_Add() -- 高度灵活的日期运算函数
select Data_Format('yyyy年mm月dd' , Now());  -- 返回一个格式化的日期或时间串
select Day(CurDate()) AS 该月的第几天; -- 返回一个日期的天数部分
select DayOfWeek(CurDate()) AS '日期在一周内的第几天'; -- 对于一个日期，返回对应的所在的一周内的第几天，其中星期天是第一天。
select month(CurDate()) AS 日期中月份;
select monthname(CurDate()) AS 日期中月份名称;
select dayname(CurDate()) AS 日期是星期几;
select weekday(CurDate()) AS 日期是星期几; -- 0代表星期一
select week(CurDate()) AS 日期是一年中的第几个星期; -- 0代表第一周

--   MySQL使用的日期格式： yyyy-mm-dd。 此为日期的首选格式。


select * from orders where order_date = '2005-09-01';  
-- 上面忽略了时间。其中order_date的数据类型为datetime。当时间不为 00:00:00是匹配不到的。
desc orders;  
show create table orders;
insert into orders(order_date, cust_id) values(Now(), 10002);
select * from orders;
select * from orders where order_date = Date(Now());   -- 比如此句就匹配不到结果

-- 使用Date()解决上面的问题,Date()的参数是 datetime类型。
update orders set order_date=Date(Now()) where order_num = 20010;
select * from orders where Date(order_date) = Date(Now());


-- 检索2005-09月的所有订单
select cust_id, order_num from orders 
where Date(order_date) between '2005-09-01' and '2005-09-30';
-- 方式二：
select cust_id, order_num from orders
where Year(order_date)= 2005 and Month(order_date) = 9;







-- 数值处理函数
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- 仅处理数值数据。 代数，三角，几何运算； 用的比较少， 具有讽刺意味的是
-- 在主要DBMS的函数中，数值函数是最一致最统一的函数。

select Abs(-22);  -- 绝对值
select Cos(0);     -- 返回角度的余弦
-- Exp();         -- 一个数的指数值
select Mod(5,2);     -- 返回操作的余数
select Pi();        -- 返回pi
select Rand(Second(Now()));      -- 返回一个随机数, 可指定种子数
select Sin(0);          -- 正弦值
select Sqrt(4);       -- 平方根
select Tan(45);     -- 正切



-- ########################################################
-- #  第12章：  汇总数据
-- ########################################################

-- 聚集函数
-- 我们经常需要汇总数据而不用把它们实际检索出来。比如：确定满足条件的行数，找出列表的最大值。
-- 这些都是对表中数据汇总（而不是实际数据本身），因此实际表数据是对时间和处理资源的一种浪费。
-- 这些叫  汇总信息  ， 可通过MySQL提供的5个聚集函数获得。

-- 聚集函数（aggregate function) 运行在行组上，计算和返回单个值的函数。   一般忽略NULL
-- AVG()       -- 某列的平均数; 只能用于单个列， 忽略NULL ， 利用算术操作符可以向 sum() 例子中那样执行多个列上的计算。
-- COUT()     -- 返回某列的行数
-- MAX()      -- 某列的最大值
-- MIN()
-- SUM()      -- 某列的值之和
select * from products;
-- 全都针对与列

select AVG(prod_price) AS avg_price from products;
select AVG(prod_price) AS avg_price from products where vend_id = 1002;

-- COUNT(*) 对计算表中行数
select count(*) 客户总数 from customers;   -- 省略 AS
-- COUNT(column) 对特定列计算行数

select max(prod_price) max_price from products;
-- 对非数值使用max() 如日期，文本。

select sum(quantity) items_ordered from orderitems where order_num = 20005;
-- sum()也可用来合计计算值
select sum(item_price * quantity) total_price from orderitems where order_num = 20005;



-- 聚集不同值
-- distinct 和 all 参数；all为默认无需指定。
select avg(prod_price) avg_price from products where vend_id = 1003;      -- 注意两者的不同
select avg(distinct prod_price) avg_price from products where vend_id = 1003;

-- distinct不能用于 count(*), 所以不能这样 count(distinct)
-- distinct必须使用列名，不能用于计算或表达式。


-- 组合聚集函数



-- ########################################################
-- #  第13章：  分组数据
-- ########################################################
-- 分组允许把数据分为多个逻辑组，**以便对每个组进行聚集计算**                  分组的目的

-- 创建分组
select vend_id, count(*) AS num_prods from products group by vend_id;   -- 根据id分组并排序，每个分组的行数
select vend_id  from products group by vend_id;

-- 使用group by子句的一些重要规定
-- 1. 他可以包含任意数目的列。这使得对分组进行嵌套，为数据分组提供更细致的控制
-- 2. 如果在group by中嵌套了分组，数据将在最后规定的分组上进行汇总
-- 3. group by 子句中列出的每个列都必须是检索列或有效的表达式（但不能是聚集函数）。如果在select中使用表达式，则必须在group by子句中指定相同的表达式，不能使用别名。
-- 4. 除聚集计算语句外，select语句中的每个列都必须在group by子句中给出。
-- 5. 如果分组列中具有NULL值，则NULL将作为一个分组返回。如果列中有多行NULL值，它们将分为一组。
-- 6. group by子句需在where后order by前。


-- 过滤分组
-- 包括或排除哪些分组
-- 为了得到这些数据，必须基于完整的分组。
-- where在此不起作用，因为它过滤的行而不是分组。  (having 过滤分组)  
-- 为此MySQL提供了 having 子句，having子句非常类似于where，一般情况（前面学习的）where子句都可以用having代替。
-- having支持所有where操作符。
-- 或者这样理解： where在分组前进行过滤；having在数据分组后进行过滤。where排除的行不包括在分组中，这可能会改变计算值,影响having。

SELECT cust_id,
       COUNT(*) AS orders
FROM orders
GROUP BY cust_id
HAVING COUNT(*) >= 2;     -- 至少有两个订单的客户


-- 同时使用where和having子句
select * from  orders;
-- 价格>=10并至少有两个订单的供应商
select vend_id, count(*) AS num_prods
from products
where prod_price >= 10
group by vend_id
having count(*) >= 2;


-- 分组和排序
-- group by 的输出可能不是分组的顺序（它的排序行为并不是SQL规范所要求的）
select vend_id , sum(prod_price)  
from products where prod_price >= 50 group by vend_id order by vend_id;

select order_num, sum(quantity*item_price) AS ordertotal
from orderitems
group by order_num
having sum(quantity * item_price) >= 50 order by ordertotal;   
-- 注意： having 与 order by 后面的表的区别。 order by可以直接使用 orderitems


-- select子句的排列顺序
--  select    from    where     group by   having    order by      limit 
-- 执行顺序，from .... select



-- ########################################################
-- #  第14章：  使用子查询
-- ########################################################

-- 子查询，即嵌套在其它查询中的查询。

-- orders表： 订单号， 客户ID，订单日期。    看起来是它连接了订购物品和客户
-- orderitems表： 存储各订单物品
-- customers表：存储客户信息
select * from orders;
select * from orderitems;
select * from customers;

-- 现在需要列出订购物品TNT2的所有客户

select order_num from orderitems where prod_id = 'TNT2';
select cust_id from orders where order_num in (20005, 20007);
select cust_name, cust_contact from customers where cust_id in (10001, 10004);
-- 合并三条select
SELECT cust_name,
       cust_contact
FROM customers
WHERE cust_id IN (SELECT cust_id
                  FROM orders
                  WHERE order_num IN (SELECT order_num 
                                        FROM orderitems 
                                        WHERE prod_id = 'TNT2'));

-- 列必须匹配。且通常子查询返回单个列并且与单个列匹配，如果需要也可使用多个列（并匹配多个列）。

-- 虽然子查询一般与IN操作符结合使用，但也可以用于测试 =  <> 等。


--  ****************************************** 重要 ************************************ 

-- 作为计算字段使用子查询

-- 假如需要显示customers表中每个客户的订单总数。订单与相应的客户ID存储在orders表中。

-- 先理解： 下面的代码对客户10001的订单进行计数
select count(*) as orders from orders where cust_id = 10001;          
-- 理解这一句,其顺序问题，先from --> where --> select


-- 然后，最终代码
select cust_id, cust_name, cust_contact, 
(select count(*)  from orders where orders.cust_id = customers.cust_id) as orders
from customers order by orders desc; 

-- orders是一个计算字段，它由圆括号中的子查询建立的。该子查询对检索出的每个客户执行一次。  ×××××××××××××× 
-- 并且是相关子查询（涉及外部查询的子查询），使用了完全限定名。


-- 不使用全局限定名时，分析其结果
select cust_id, cust_name, cust_contact, 
(select count(*)  from orders where  cust_id =  cust_id) as orders
from customers order by orders desc; 
-- 其子查询总是返回总订单数。


-- ########################################################
-- #  第15章：  联结表
-- ########################################################
-- 联结 join

-- 比较专业我无法解释，见书

-- vendors表包括所有供应商信息，并有一个标识符作为主键。
-- products表只存储产品信息；它除了存储供应商id外不存储其它供应商信息。vendors表的主键又叫做products的外键。

-- 关系数据库的设计基础：避免数据重复。要保证把信息分解成多个表。

-- 为什么要使用联结？
-- 由于设计数据库时数据被分解成多个表；要想使用单条select语句检索出数据，就需要使用联结。
-- 联结是一种机制，用来在一条select语句中关联表，因此称为联结。


-- 联结并不存在于实际的数据库表中；联结是由MySQL根据需要建立，它存在与查询的执行当中。

-- 维护引用完整性： 如果在products表中插入拥有非法供应商ID（即没有在vendors表中出现）的供应商的产品，则这些产品是不可访问的，
-- 因为它们没有关联到某个供应商。为防止这种情况，可通过在表的定义中指定主键和外键来实现。


-- 创建联结
select vend_name, prod_name, prod_price, vendors.vend_id from vendors, products 
where vendors.vend_id = products.vend_id          
-- 条件： 只有id相同时两个表中的数据才结合在一起，然后根据select的列检索出来。
order by vend_id, vend_name, prod_price; 

-- 理解条件很重要， 满足条件的行才进行联结
-- 在上面的select中，各列并不在同一个表中，但只有vend_id需要进行完整的名称限制。
-- where指定联结条件。没有联结条件的的表关系返回的结果为 笛卡尔积 （结果数 = 行数1 × 行数2）

-- 笛卡尔积
select vend_name, prod_name, prod_price, vendors.vend_id 
from vendors, products 
-- 没有联结条件       
order by vend_id, vend_name, prod_price; 


-- 内部联结
-- 目前所有的联结称为等值联结(equijoin)，它基于两个表之间的 **相等测试**。这种联结也称为内部联结。
-- 对于这种联结可以使用稍微不同的语法来明确指定联结的类型。如：
select vend_name, prod_name, prod_price, vendors.vend_id 
from vendors INNER JOIN products              -- 明确指定为内部联结
ON vendors.vend_id = products.vend_id         -- where 该为 ON ,用where也没有报错  
order by vend_id, vend_name, prod_price;


-- 联结多个表
select prod_name, vend_name, prod_price, quantity 
from orderitems, products, vendors
where products.vend_id = vendors.vend_id
and orderitems.prod_id = products.prod_id
and order_num = 20005;


-- 使用联结实现第14章中多重子查询相同的功能
select cust_name, cust_contact
from customers, orders, orderitems
where customers.cust_id = orders.cust_id      -- 前两个进行关联，后一个进行数据过滤
and orders.order_num = orderitems.order_num
and prod_id = 'TNT2';

select cust_name, cust_contact
from customers, orders, orderitems
where orders.order_num = orderitems.order_num   -- where 的这两个顺序在此没有影响
and customers.cust_id = orders.cust_id 
and prod_id = 'TNT2';




-- ########################################################
-- #  第16章：  创建高级联结
-- ########################################################

-- 本章介绍另外一些联结类型

-- 使用表别名
-- 给表起别名的两个主要理由：
-- 1.缩短SQL语句
-- 2.允许在单条select语句(子句)中多次使用相同的表。（有什么用？见下文）

select cust_name, cust_contact
from customers as c, orders as o, orderitems as oi
where c.cust_id = o.cust_id       
and o.order_num = oi.order_num
and prod_id = 'TNT2';

-- 根据之前讲的顺序，表别名可用在除group by 和 having之外的其它地方，比如select。

-- 应该注意，表别名只在查询执行中使用。与列别名不同，表别名不返回到客户机。



-- 使用不同类型的联结
-- 除了内部联结(等值联结)，还有其它三种联结： 自联结，自然联结，外部联结。


-- 自联结
-- 例子： 假如你发现某物品（id为DTNTR）存在问题，因此想知道该供应商的其它物品是否也存在问题。
-- 需先找到供应商id，再找出其它产品(而这些信息都存储在同一张表中)
-- 方法一：使用子查询
select * from products;
select vend_id ,prod_name, prod_price, prod_desc from products
where vend_id = (select vend_id from products where prod_id = 'DTNTR');

-- 方法二：使用联结
select p1.vend_id, p1.prod_name, p1.prod_price, p1.prod_desc from products as p1, products as p2
where p2.vend_id = p1.vend_id 
and p2.prod_id = 'DTNTR';               -- 此处应为 p2 而非 p1 


-- 自然联结
-- 无论何时对表进行联结，应该至少有一个列出现在不止一个表中（被联结的列）[这应该是自己决定的]
-- 自然联结排除多次出现，使每个列只返回一次。   每个列？
-- 系统不完成这项工作，由你自己完成它（自然联结），
-- 你只能选择那些唯一的列，这一般是对表使用通配符 * ，同时对其它表的列用明确子集来完成的。
select * from orders, vendors;         -- 笛卡尔积联结

select c.*, o.order_num, o.order_date, oi.prod_id, oi.quantity, oi.item_price
from customers as c, orders as o, orderitems as oi 
where c.cust_id = o.cust_id
and oi.order_num = o.order_num
and prod_id = 'FB';



-- 外部联结
-- 许多联结将一个表中的行与另一个表中的行相关联。但有时候会需要包含没有关联行的那些行。
-- -- 例如：列出所有产品以及订购数量，包括没有人订购的产品。
-- 联结包含了那些在相关表中没有关联行的行。这种类型的联结称为**外部联结**。

-- 为了检索所有客户，包括那些没有订单的客户。使用如下语句：
select customers.cust_id, orders.order_num, orders.cust_id
from customers LEFT OUTER JOIN orders      -- 使用LEFT指定，customers是包括所有行的表
ON customers.cust_id = orders.cust_id;    -- orders和customers 是通过 cust_id 进行关联的

-- 在使用OUTER JOIN语法时，必须使用RIGHT或LEFT关键字指定包括其所有行的表。
-- 在其它DBMS中似乎可以使用 *= 和 =* 来代替 ... (左边外部联结和右边外部联结）


-- 使用带聚集函数的联结
-- 示例：
-- 如果要检索每个客户所下的订单数，下面使用了count()函数的代码可完成此工作：

select customers.cust_name,customers.cust_id, count(orders.order_num) as 订单数 from customers INNER JOIN orders
ON customers.cust_id = orders.cust_id       -- 先在联结上进行限制
group by customers.cust_id;                 -- 然后再进行分组，再利用聚集函数


select customers.cust_name,customers.cust_id, count(orders.order_num) as 订单数 
from customers LEFT OUTER JOIN orders
ON customers.cust_id = orders.cust_id        
group by customers.cust_id;


-- ########################################################
-- #  第17章：  组合查询
-- ########################################################

-- MySQL允许执行多个查询（多条select语句）并将结果作为单个查询结果集返回。
-- 这些组合查询通常称为并（union)或复合查询（compound query）

-- 有两种基本情况，其中需要使用组合查询
-- 1. 在单个查询中从不同的表返回类似结构的数据
-- 2. 对单个表执行多个查询，按单个查询返回数据

-- 组合查询和多个where条件：
-- 多数情况，组合相同表的两个查询完成的工作与具有多个where子句条件的单条查询完成的工作相同。
use MySQL_Crash_Course;
-- 创建组合查询
select prod_id, prod_price, vend_id from products where prod_price <= 5
UNION
select prod_id, prod_price, vend_id from products where vend_id in (1001,1002) order by vend_id desc;

-- UNION规则
-- 必须两条以上select语句组成
-- 每个查询中的包含的列必须相同（但顺序不必相同）
-- 数据类型必须兼容：类型不必完全相同。


-- 包含或取消重复的行
-- UNION从查询结果中自动去除了重复的行（在上面的UNION语句中，如果单独执行每条select，总共会返回9行， 
-- 但使用union时，返回的只有8行，因为1002的FU1号产品同时满足两个条件）这与使用多个where子句条件一样
-- 。这是UNION的默认行为，如果需要，可以改变它，可以使用UNION ALL。





-- ########################################################
-- #  第18章：  全文本搜索
-- ########################################################
-- 并非所有引擎都支持全文搜索。在最常用的MyISAM和InnoDB，两者引擎中只有前者支持全文本搜索。
-- 本书的productnotes表使用了MyISAM引擎。

-- 全文本搜索
-- 性能较好，明确控制， 智能化的结果。
-- 在使用全文本搜索时，MySQL不需要分别查看每个行，不需要分别分析和处理每个词。MySQL可以指定列中各个词的一个索引
-- MySQL创建指定列中各词的一个索引，搜索可以针对这些词进行。
-- 为了进行全文本搜索，必须索引被搜索的列，而且需要随着数据的改变不断重新索引。


-- 启用全文本搜索支持
-- 一般在创建表时启用全文本搜索。使用FULLTEXT子句，后跟被索引列的一个逗号分隔的列表。也可在建表后指定。
-- 如： FULLTEXT(note_text)

-- 进行全文本搜索
-- 在索引之后，使用两个函数 Match() 和 Against() 执行全文本搜索，其中Match()指定被搜索的列，
-- Against()指定要使用的搜索表达式。

select note_text from productnotes 
where Match(note_text) Against('rabbit');  -- against参照

-- 传递给Match()的值必须与FULLTEXT()定义中的一样，且顺序也必须一样。
-- 搜索不区分大小写；除非使用BINARY方式。


-- 全文本搜索的一个重要部分就是对结果排序。具有较高等级的行先返回（比如上面的第一行中 rabbit
--  位于第3个词，比第二行中位于第20个词要优先）


-- 下面这一句演示了，排序如何工作
select note_text, Match(note_text) Against('rabbit') as Rank from productnotes;

-- Rank列，包含全文本搜索计算出的等级值。等级有MySQL根据行中词的数目、唯一词的数目、整个索引中
-- 词的总数以及包含该词的数目计算出来。


-- 使用查询扩展
-- 查询扩展用来设法放宽所返回的文本搜索结果的范围。
-- 在使用查询扩展时，MySQL对数据和索引进行两遍扫描类完成搜索：
-- 1. 第一次扫描：首先进行基本的全文本搜索
-- 2. 然后MySQL检查这些匹配行并选择有用的词
-- 3. 第二次扫描：使用原条件加有用词进行全文本搜索。

select note_text from productnotes where Match(note_text) Against('anvils');
-- 使用查询扩展
select note_text from productnotes 
where Match(note_text) Against('anvils' WITH QUERY EXPANSION);


-- 布尔文本搜索
-- 以布尔方式，可以提供关于如下内容的细节：
-- 要匹配的词； 要排斥的词(如果该行有某词就排除)；排列提示（指定那些词优先级更高）；表达式分组；...
-- 布尔方式，即使没有FULLTEXT索引也可使用，但这非常缓慢。
select note_text from productnotes 
where Match(note_text) Against('heavy' IN BOOLEAN MODE);  -- 还没有指定布尔操作符，结果与普通方式相同（但还是有差别）

-- 为了匹配含有 heavy 但不包含任意以 rope 开始的行，可以使用
select note_text from productnotes 
where Match(note_text) Against('heavy -rope*' IN BOOLEAN MODE);


--   全文本布尔操作符
--  +      包含，词必须存在
--  -     排除
--  >     包含，且增加等级值
--  <     包含， 减少 ...
--  ()    把词组成子表达式
--  ~     取消一个值的排序值
--  *     词尾的通配符
--  ""    定义一个短语


-- 另：
select note_text from productnotes 
where Match(note_text) Against('rabbit bait' IN BOOLEAN MODE);
-- 没有指定操作符，这个搜索匹配包含rabbit和bait中的至少一个词的行



-- 全文搜索的使用说明
-- 3各一下的短词会被忽略，被索引排除。
-- MySQL内建了非用词列表，这些词也会被忽略。
-- 许多词出现频率高，搜索它们没有用处。因此MySQL规定一个词多于50%以上就忽略该词。（但该规则不用与IN BOOLEAN MODE)
-- 表中行数少于3行，则不返回结果
-- 忽略词中的单引号，如： don't，'索引为 dont
-- 不具有词分隔符（包括中文日文）的语言不能恰当的返回全文搜索结果。





-- # 通配符：用来匹配值的一部分的特殊字符
-- # 搜索模式（search pattern) 由字面值、通配符或两者组合构成的搜索条件
-- ########################################################
-- #  第19章：  插入数据
-- ########################################################
select * from customers;
-- # 插入方法1 ： 必须按顺序给出全部值，相对简单但不安全。通用准则NULL的使用有限制
insert into customers 
values(NULL,
  'Pep E. LaPew',
  '100 Main Street',
  'Los Angeles',
  'CA',
  '90046',
  'USA',
  NULL,
  NULL);
    
-- ##更安全的插入语法.顺序自定，省略部分值，即使表结构改变也能使用。省略列：允许NULL或有默认值。
insert into customers(cust_address,
  cust_city,
  cust_state,
  cust_zip
  cust_contact,
  cust_country,
  cust_email)
values('Pep E. LaPew',
  '100 Main Street',
  'Los Angeles',
  'CA',
  '90046',
   NULL,
  'USA',
  NULL);
  

-- ## 插入检索出的数据； table_nane1 和 table_name2 的表结构相同。并且要考虑避免主键相同。
-- # insert into table_name1( 一定顺序的列名 ) select 相同顺序的列名 frome table_name2;
CREATE TABLE custnew
(
  cust_id      int       NOT NULL AUTO_INCREMENT,
  cust_name    char(50)  NOT NULL ,
  cust_address char(50)  NULL ,
  cust_city    char(50)  NULL ,
  cust_state   char(5)   NULL ,
  cust_zip     char(10)  NULL ,
  cust_country char(50)  NULL ,
  cust_contact char(50)  NULL ,
  cust_email   char(255) NULL ,
  PRIMARY KEY (cust_id)
) ENGINE=InnoDB;
show tables;


insert into custnew(
--   cust_id  ,
  cust_name,
  cust_address,
  cust_city,
  cust_state,
  cust_zip,
  cust_country,
  cust_contact,
  cust_email)
  select   cust_name,     -- 无需values
  cust_address,
  cust_city,
  cust_state,
  cust_zip,
  cust_country,
  cust_contact,
  cust_email
  from customers;       -- 没有where 实现整表复制

select * from custnew;
select * from customers;



--#######################################################
--   第20章        更新和删除数据      
-- update 列； delete 行
-- 清除列       删除行       它们两个都不删除表本身。
-- 如果两者都不带where子句，则作用的是表中所有的数据。
--#######################################################
select * from customers;
-- 更新数据
update customers set cust_email='fudd@gmail.com' where cust_name='E Fudd';
-- 更新多个列; 
--update customers set cust_name='fan' set cust_email='fan@gmail.com' where cust_id=10002;
update customers set cust_name='fan' , cust_email='fan@gmail.com' where cust_id=10002;
-- 清除列, 点击 send a RollBack to database 可撤销更改 ;
update customers set cust_email=NULL;
--########  将所有cust_id 加 1，只是举例 ########
update customers set cust_id=cust_id + 1;


-- IGNORE关键字
-- 如果使用UPDATE语句更新多行，并且在更新这些行中的一行或多行时出现错误，则整个update操作
-- 被取消（错误发生前的所有更新也被撤销）。如果需要即使发生错误也要更新，可使用IGNORE关键字
-- 如： update ignore customers ...;



-- 删除行
delete from customers where cust_id=10006;

-- ########### 使用update 和 delete 遵循的习惯 ###############
--   1.保证每个表都有主键
--   2.使用前where子句前，应该先用select进行测试
--   3. 





--#######################################################
-- 第21章： 创建和操纵表
--#######################################################
show tables;
select * from products;
show create table products;
select * from customers;
show create table customers;

create table customers2(
  id int(10) NOT NULL AUTO_INCREMENT,
  name varchar(40)  NOT NULL,
  address varchar(40)   NULL,
  city varchar(40)   NULL,
  state varchar(40)   NULL,
  zip char(10)   NULL,
  country varchar(20) NOT NULL DEFAULT 'USA',  
  contact varchar(20) DEFAULT NULL,           
  email varchar(50) DEFAULT NULL,
  primary key(id)
  ) ENGING=InnoDB default charset=utf8 auto_increment=10000; 
  
--内部引擎(不同引擎对不同任务的性能不同，外键不能跨引擎)， 字符集， 增长的初始值

-- 每个表只能有一个auto_increment 列，且它必须被索引（如，让它成为主键）
-- 指定默认值 USA
-- 默认为NULL



-- 使用NULL值
-- NULL值就是没有值或缺值。允许NULL值的列也允许在插入行时不给出该列的值。
-- NOT NULL就表示在插入更新时必须有值。


-- PRIMARY KEY 主键
-- primary key(逗号分隔的列表)


-- AUTO_INCREMENT 自动增长
-- 每个表只能有一个auto_increment 列，且它必须被索引（如，让它成为主键）
-- 可手动覆盖 AUTO_INCREMENT 的列，只要该值唯一。
-- 确定AUTO_INCREMENT值：可使用last_insert_id()函数来获得上次增长到的值（无需参数）。



-- 指定默认值
-- 默认值使用create table语句的列定义中的default关键字指定。

-- 不允许使用函数作为默认值；它们支持常量。
-- 一般使用默认值而不是UNLL值。


-- 引擎类型
-- MySQL有一个具体管理和处理数据的内部引擎。
-- 不同的引擎具有不同的功能和特性。

-- 几个需要知道的引擎：
-- InnoDB 是一个可靠的事务处理引擎，它不支持全文本搜索。
-- MEMORY，在功能上等于MyISAM，但由于数据存储在内存(而不是磁盘)，速度很快（适合用于临时表）
-- MyISAM 是一个性能极高的引擎，它支持全文本搜索，但不支持事务处理。

-- 外键不能跨引擎




--# 更新表 alter table; 

desc vendors;
-- 新增列
alter table vendors add vend_phone char(20);
select * from vendors;

-- 删除列
alter table vendors drop column vend_phone;


-- alter的常见用途是定义外键
alter table orderitems
add constraint fk_orderitems_orders                       -- constraint 限制，约束
foreign key (order_num) references orders (order_num);



-- 复杂的表结构更改一般需要手动删除过程，步骤如下：
-- 1 用新的列布局创建一个新表
-- 2. 使用insert select 语句从旧表复制数据到新表。如果有必要，可以使用转换函数和计算字段。
-- 3. 检验包含所需数据的新表
-- 4. 重命名旧表（如果确定也可删除）
-- 5. 用旧表原来的名字重命名新表
-- 6. 根据需要，重新创建触发器、存储过程、索引和外键。



-- 删除表
-- 删除整个表，而不是其内容。

-- drop table



-- 重命名表
-- rename table

-- rename table old to new;

-- 多表重命名
-- rename table old1 to new1,
--              old2 to new2;
                



-- #######################################################
-- # 第22章： 使用视图
-- #######################################################
-- 视图是虚拟的表。视图只包含使用时动态检索数据的查询。

-- 第15章的一个例子  ： 作用是检索订购了某个特定产品的客户。
-- 要想检索其它产品的相同数据，必须修改最后的where子句。
select cust_name, cust_contact
from customers, orders, orderitems
where customers.cust_id = orders.cust_id        -- 前两个进行关联，后一个进行数据过滤
and orders.order_num = orderitems.order_num
and prod_id = 'TNT2';


-- 现在，加入可以把整个查询包装成一个名为productcustomers的虚拟表，则可
-- 如下轻松的检索出相同的数据。
select cust_name, cust_contact
from producucustomers
where prod_id = 'TNT2';


-- 这就是视图的作用。productcustomers就是一个视图。
-- 作为视图，它不包含表中应该有的任何列或数据，它包含的是一个SQL查询。


-- 视图
-- 重用SQL语句
-- 简化复杂的SQL操作。不必知道查询细节。
-- 使用表的组成部分而不是整个表。
-- 保护数据。可以给用户授予表的特定部分的访问权限而不是整个表的访问权限。
-- 更改数据格式和表示。（重新格式化）

-- 把视图创建之后就可以把它看做表来使用。 能使用表的常见语句。


-- 视图的规则和限制：
-- 为了创建视图，必须具有足够的访问权限
-- 视图可以嵌套
-- order by 可以用在视图中，但如果从该视图检索数据select中也含有order by，那么该视图中的order by将被覆盖。
-- 视图不能索引，也不能有关联的触发器或默认值。
-- 视图可以和表一起使用。



-- 使用视图
-- 视图的创建： create view语句来创建。
-- 使用: show creater view viewname；查看创建视图的语句。
-- 使用: drop 删除视图，drop view viewname;
-- 更新视图：方法一，先用drop再用create。方法二，直接使用create or replace view;如果需要更新的视图不存在，则第二条更新语句会创建一个视图 



-- 利用视图简化复杂的联结
-- 创建之前例子的视图：
create view productcustomers as 
select cust_name, cust_contact, prod_id
from customers, orders, orderitems
where customers.cust_id = orders.cust_id         
  and orders.order_num = orderitems.order_num;

drop view productcustomers; 
select * from productcustomers;

select cust_name,cust_contact from productcustomers 
where prod_id = 'FB';


-- 用视图重新格式化检索出的数据（视图的另一常见用途）


-- 用视图过滤不想要的数据



-- 使用视图与计算字段




-- 更新视图
-- 视图能否更新，得视情况而定。
-- 通常视图是可更新的。更新一个视图将更新其基表。如果你对视图增加或删除行，实际上是对其基表增加或删除行。
-- 条件见书：  一般不进行更新

-- 视图主要用于数据检索





-- #######################################################
-- #  第23章： 使用存储过程
-- #######################################################

-- 存储过程

-- 考虑如下情形：
-- 为了处理订单，需要核对以保证库存中有相应的物品
-- 如果有物品，这些物品需要预定以便不将它们卖给别人，并且需要减少可用的物品数量以反应正确的库存量，
-- 库存中没有的物品需要订购，这需要与供应商进行某种交互
-- 关于哪些物品入库和哪些物品退订，需要通知相应的客户。

-- 如果是执行这类处理，需要针对多表的多条语句，并且顺序也不是固定的。。。
-- 怎样编写此代码？并根据结果有条件的执行另外的语句？

-- 可以创建存储过程。存储过程简单来说，就是为以后的使用而保存的一条或多条MySQL语句的集合。
-- 可将其视为批处理文件，虽然它们的作用不仅限于批处理。

-- 使用存储过程，需要安全访问权限。



-- 使用存储过程

-- 执行存储过程
-- MySQL称存储过程的执行为调用，因此MySQL执行存储过程的语句为CALL。CALL接受存储过程的名字以及
-- 需要传递给他的任意参数。

call productpricing(@pricelow,
                      @pricehigh,
                      @priceaverage);

-- 执行名为productpricing的存储过程，它计算并返回产品的最低、最高和平均价格。
-- 存储过程可以显示结果，也可不显示结果。

-- 存储过程实际就是一个函数。

-- 创建存储过程
-- 返回产品平均价格的存储过程
;
create procedure productpricing()
begin
  select Avg(prod_price) as priceaverage
  from products;                                -- 存储过程内 ，第一个分号;
end;                                            -- 第二个分号;

delimiter //
create procedure productpricing()
begin
  select Avg(prod_price) as priceaverage   
  from products;                                 
end //
delimiter ;

-- 由于有两个分号，则如果在命令行编写这段代码，必须先使用 delimiter 指定新的语句结束分隔符。
 
-- 调用此存储过程。
call productpricing();       -- 它会显示存储过程。


-- 删除存储过程
-- 存储过程在创建之后，被保存在服务器上以供使用，直至被删除。删除命令从服务器中删除存储过程。

drop procedure productpricing;      -- 注意后面没有使用 () 



-- 使用参数
-- 一般存储过程并不显示结果，而是把结果返回给你指定的变量。
-- 修改版
creat procedure productpricing(
    out pl decimal(8,2),          -- decimal是数据类型
    out ph decimal(8,2),
    out pa decimal(8,2)
)
begin
  select Min(prod_price)
  into p1
  from products;
  select Max(prod_price)
  into ph
  from products;
  select Avg(prod_price)
  into pa
  from products;
end;


-- #######################################################
-- # 第28章：
-- #######################################################

analyze table orders;

-- #######################################################
-- # 
-- #######################################################
```

## MySQL进阶

```sql
-- 麦子学院：MySQL 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- 麦子学院的这两套课程，MySQL基础课程 和 MySQL进阶课程 非常不错；并且配有Wiki（教课的完整记录） 
-- MySQL教程网址：http://www.maiziedu.com/course/list/all-mysql/0-1/
-- Wiki地址：http://www.maiziedu.com/wiki/mysql/concept/
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 


-- 麦子学院：MySQL基础
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- 只选取部分重点进行学习

-- MySQL命令行的使用技巧
开启日志： \T
以网格的形式显示,(在数据量多的时候，在输出语句后分号前添加) \G



-- 一个建表语句
CREATE  TABLE [IF NOT EXISTS] tbl_name
(字段名称 字段类型 [完整性约束条件]...）ENGINE=引擎名称 CHARSET='编码方式';


-- MySQL支持的数据类型
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
一共五类数据类型：http://www.maiziedu.com/wiki/mysql/type/
1). 整数类型： 
除bool,boolean其余都可分为有符号类型和无符号类型
tinyint     *    ：2^8
smallint         : 2^16
mediumint       :2^26               -1  
int          *    :2^32
bigint           :2^64
bool,boolean  * 等价于tinyint(1)，0为false，其余为true

查看帮助的三种形式：
help tinynt;
?int
\h int


2).浮点类型         占用空间
float[(M,D)]         4字节      一般精确到小数点后7位
double[(M,D)]        8字节
decimal[(M,D)]      M+2字节     定点数（精确度高不会进行四舍五入），和double一样但是其内部是以字符串形式来存储数值。

M是数字总位数，D是小数点后面的位数。
如果M和D被省略，则根据硬件允许的限制来保存值。


3）.字符串类型
char(M)     定长字符串,M表示字节数0<=M<=255
varchar(M)  变长字符串，L+1个字节，L为长度，L<=M，M最大65535
tinytext
text
mediumtext
longtext
enum("value1","value2",...) 枚举类型
set("value1","value2",...)   set集合，最多64个成员


4).日期时间类型
time
date
datetime
timestamp   时间戳
year        占用1字节

除year外
和日期时间有关的都是使用整型来保存时间戳以方便计算。




5）二进制类型
略


数据类型选取示例：麦子学院学员
编号：(整数：mediumint 无符号)
姓名：（字符串：varchar(20))
年龄：（整数：tinyint)
性别：(enum(‘男’，‘女’，‘保密’)
电话：（整型：int 无符号)
地址：（字符串： varchar(200))
邮箱：（字符串：varchar(50))
薪水：（浮点：float(6,2))
是否结婚：（布尔类型：tinyint(1))


-- 查看MySQL支持的存储引擎：;
show engines;
-- 显示支持的存储引擎信息;
show variables like 'have%';
-- 查看默认的存储引擎
show variables like 'storage_engine';

MySQL支持的注释：
# 
-- 


-- 测试日期时间类型(必看)
-- http://www.maiziedu.com/course/306-3350/



-- 分组查询
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
group by 按照给定列进行分组；分组后显示的结果只包含该分组中的第一行。

理解视频中group by同时按两个列进行分组后为什么显示10行数据（整个表中有12行），并且观察结果。

-- 分组查询配合聚合函数
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  
-- 如何得到分组详情：
配合 group_concat()得到分组详情。即传入一个列，那么分组中的这列数据都会显示出来。
select 



-- 字符串函数
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- 记录在MySQL必知必会的笔记中

-- 日期时间函数
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  
-- 记录在MySQL必知必会的笔记中

-- 条件判断函数和系统函数
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  

-- 三个条件判断函数
if(expr,v1,v2)   -- 如果表达式ecpr成立，返回结果v1；否则v2
ifnull(v1,v2)    -- 

case when exp1
then v1 [when exp2 then v2][else vn]
end
-- case表示函数开始，end表示函数结束，exp1成立则返回v1


-- 示例：
select id,username,score,IF(score >= 60, '及格','不及格') AS 是否及格 
from student;

select id,username,score,
case when score > 60 then '及格' when score=60 then '好险刚及格' else '没及格' end  AS 是否及格 
from student;


-- 系统函数
select version();       -- 数据库版本
select connection_id(); -- 当前服务器连接数
select database(),schema();        -- 两个都是得到当前数据库名
select user(),system_user(); -- 返回当前用户
select current_user(),current_user; -- 返回当前用户
select charset('str');       -- 返回字符串str的字符集
select collation('str');    -- 返回字符串str的校验字符集
select last_insert_id();    -- 得到最近生成的auto_increment值。 常用





-- 其它常用函数
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- 加密函数。常用前两个
-- 信息摘要算法，返回32为字符串。经常用来对密码进行加密。
select md5('str'), length(md5('str')) AS 长度; 
-- 密码算法。专门为MySQL添加用户时写的密码加密。
select password('str');  

-- password
use mysql;
show tables;    -- 有一个user表
select * from user;
select host, user, authentication_string, password_expired, password_last_changed from user;
use test;


-- 其它
select format(3.14567, 2);   -- 将数字进行格式化;这里是保存2位小数
select ascii('a');
select bin(20),oct(20),hex(20);  
select conv(5,10,2);      -- 指定进制转换，这里把5从10进制转换为2进制
select inet_aton(ip);    -- 将ip地址转换为数字。就可以把IP地址用整型数据来存储。
select inet_ntoa(n);     -- 将数字转换为ip地址
get_loct(name,time)     -- 定义锁
release_lock(name)      -- 解锁





-- 索引的使用
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- 什么是索引：
索引由数据库中一列或多列组合而成，其作用是提高对表中数据的查询速度
索引的优点是可以提高检索数据的速度
索引的缺点是创建和维护索引需要耗费时间
索引可以提高查询速度，会减慢写入速度
-- 索引的分类
普通索引
唯一索引：   比如primary key和unique是唯一索引
全文索引：   只支持英文，只能位于字符列，使用fulltext （可以使用** 代替）
单列索引
多列索引
空间索引: 用的少
;


-- 如何创建索引
-- 1）在建表的时候创建索引
;
-- 创建普通索引
create table index01(
id tinyint unsigned,
username varchar(20),
index in_id(id),            -- 索引名称in_id
key in_username(username)
);
show create table index01; -- index变为 key ？？
desc index01;               

-- 创建唯一索引
create table index02(
id tinyint unsigned auto_increment key,
username varchar(20) not null unique,
card char(18) not null,
unique key uni_card(card)
);
show create table index02;
desc index02;

-- 创建全文索引
create table index03(
id tinyint unsigned auto_increment key,
username varchar(20) not null unique,
userDescr varchar(20) not null,
fulltext index full_userDesc(userDesc)
);


-- 创建单列索引
create table index04(
id tinyint unsigned auto_increment key,
username varchar(20) not null unique,
userDescr varchar(20) not null,
fulltext index full_userDesc(userDesc)
);




http://www.maiziedu.com/course/306-3390/
-- 2）在已经存在的表上创建索引








-- 几个省略写法：
-- 主键： primary key 可以只写  key
-- insert into 可以只写 insert




/*
补充：逻辑操作符
《SQL入门经典》第5版
is null
between
in
like
exists      -- 重点介绍后面三个
unique
all 和 any
*/
;
use crash_course;

-- exists 用于搜索指定表里是否存在满足条件的记录
select * from orders;
select * from orderitems;
select * from customers;
select * from products;
-- 示例
select * from orderitems where exists (select * from orderitems where item_price > 51);



-- all 、some 和 any 操作符

-- all 用于把一个值与另一个集合里的全部值进行比较。
;
select * from orderitems where item_price > all (select item_price from orderitems where item_price < 50);


-- any用于把一个值与另一个列表里任意值进行比较。some是any的别名，它们可以互换使用。

select * from orderitems where item_price > any (select item_price from orderitems where item_price < 50);
-- 2.5的不大于任何一个所以结果中没有出现




# ########################################################
# 麦子学院：MySQL进阶
# ########################################################

-- 第1课： MySQL编码设定
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- 使用source执行sql文件中的语句

-- 查看编码格式：
show variables like "char%";

-- 1).更改服务器端编码：
如果上面的输出中 character_set_server的编码方式不为 utf8，则需要进行更改。
-- 在Windows中更改MySQL安装目录下的my.ini文件；在该文件的 [mysqld]下的
-- character_set_server=latin1改为 =utf8。更改[mysql]下的default-character_set=utf8

-- 2).更改客户端、连接、结果...编码
即更改:
character_set_client=utf8
character_set_connection=utf8
character_set_results=utf8

要在mysql命令行中或者在第三方连接工具中更改上面三个值可以直接使用命令： 
;
set name 'utf8';
;
此时如果创建数据库或表的创建语句中指定了使用的字符集是支持中文的，则现在就可以插入、显示中文了
;
-- 3).更改表中的字符编码和列中的字符编码
-- 表
alter table tb_name character set utf8;
-- 列 (只更改要插入中文的列)
alter table tb_name 
change col_name col_name varchar(20) character set utf8 not null;

-- 4).解决多张拥有数据的表的字符编码(表位于同一数据库中)
-- 即更改整个数据库的编码格式。
-- 解决思路：先导出整个数据库中表的结构，再导出表中的数据，然后删除原有数据库，然后再重新指定编码格式创建数据库
-- (在mysql命令行中)
-- 导出数据库中表的结构
mysqldump -uroot -p --default-character-set=utf8 -d db_name > /home/export.sql
-- 解释：导出时字符编码设置为utf8，db_name是要导出的数据库，后面是要保存建表语句的文件。

-- 导出数据库中所有表中的数据
mysqldump -uroot -p --quick  --no-create-info --extended-insert 
--default-character-set=utf8 db_name > /home/db_data.sql
-- 解释：--quick 快速导出；--no-create-info导出时不创建表；--en 使用多行插入；

-- 删除数据库
drop database db_name;

-- 重新创建数据库
create database db_name default charset utf8;

-- 向新创建的数据库中导入之前备份的数据
-- 先在db_data.sql文件开头添加： set name 'utf8' 避免导入时出现乱码。
mysql -uroot -p db_name < /home/db_data.sql




-- 第3课： 会话变量和全局变量
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
会话变量：单个客户端所拥有的变量。session variables
全局变量：用来配置所有客户端。 global variables  
;

show variables;
show session variables;             -- 默认指的就是
show session variables like 'auto%'; -- 查看该会话中autocommit是否为自动提交
set autocommit=off;     -- 设置会话变量autocommit的值为关闭自动提交

show global variables;
show global variables like 'auto%';
set global autocommit=on;




-- ************** 更详细的数据导入和导出见《MySQL Cookbook 2nd 中文版》 ***********/
-- 详细的介绍“生成和使用序列” （自动增长的值） 也见该书，该书用了一章的内容介绍了序列


/*
 * 备份数据
*/
-- MySQL数据库是基于磁盘的文件，普通的备份系统和例程就能备份MySQL的数据。但是由于这些文件总是处于打开和使用状态，
-- 普通的文件副本备份不一定总有效。

-- 可能解决方案：
-- 1. 使用命令行实用程序mysqldump转储所有数据库内容到某个外部文件。在进行常规备份前这个实用程序应该正常运行。
-- 2. 可用命令行使用程序mysqlhotcopy从一个数据库复制所有数据（并非所有数据库引擎都支持这个实用程序）
-- 3. 使用MySQL的backup table或select into outfile转储所有数据到某个外部文件。这两条语句都接受将要创建的文件
--    系统名，此系统文件必须不存在。否则会出错。数据可以使用restore table来复原。

-- 首先刷新未写数据。为了保证所有数据被写到磁盘（包括索引数据），可能需要在进行备份前使用flush tables语句



-- 进行数据库维护

-- 检查表键是否正确
analyze table a;

-- 针对许多问题对表进行检查
check table a;

-- 检查自最后一次检查以来改动过的表
changed ;  -- 为啥都失效了
extended;
fast;

-- 从一个表删除大量数据，回收所用的空间
optimize table table_name;



-- 查看日志文件

-- 错误日志：通常命名为 hostname.err，位于data目录中
-- 查询日志：记录了所有MySQL活动。此日志文件会变得非常大，因此不应该长期使用它。通常命名为hostname.log位于data目录，名称可以同--log命令行选项更改
-- 二进制日志：记录更新过数据（或可能更新）的所有语句。hostname-bin位于data目录。
-- 缓慢查询日志：

-- 在使用日志时，可用flush logs语句来刷新和重新开始所有日志文件


-- 改善性能

-- 见书《MySQL必知必会》



show variables like '%dir%';
-- 其中datadir的值为/var/lib/mysql/即为当前数据库文件存放目录。
-- 另外一个basedir参数表示mysql数据库的安装位置 



-- 《MySQL入门很简单》 第16章：数据备份与还原
-- 数据备份
-- 数据还原
-- 数据库迁移
-- 导出和导入文本文件


-- ====   数据备份 ======

-- 使用mysqldump命令备份

-- 该命令可以将数据库中的数据备份成一个文本文件。表的结构和表中的数据将存储在生成的文本文件中。
-- mysqldump命令的工作原理：
-- 它先查出需要备份的表的结构，再在文本文件中生成一个create语句。然后，将表中的所有记录转换成一条insert语句。

-- 命令示例：
mysqldump -u username -p dbname table1 table2 ... > BackupName.sql
-- 若省略table名则备份整个数据库。
-- 如果添加了tablename则可能导出的文件中并没有创建数据库的语句，此时该备份文件中的表及数据需还原到一个已经存在的数据库中

-- 备份多个数据库
mysqldump -u username -p --databases dbname1 dbname2 ... > Backup.sql

-- 也可以备份系统数据库 mysql 

-- 备份所有数据库
mysqldump -u username -p --all-databases > Backup.sql



-- 直接复制数据库文件
-- 这样做最好将服务器先停止。如果在复制数据库的过程中还有数据写入，会造成数据不一致。
-- 这种方法对InnoDB存储引擎的表不适用；对MyISAM存储引擎的表，备份和恢复很方便。


-- 使用mysqlhotcopy工具快速备份

-- 如果备份时不能停止MySQL服务器，可以采用mysqlhotcopy工具；该工具的备份方式比mysqldump命令快。

-- mysqlhotcopy工具是一个Perl脚本，主要在Linux下操作。
-- 该工具使用lock tables 、flush tables 和 cp（命令） 来进行快速备份。但它需要安装Perl的数据库接口包。
-- 由于该工具的原理与手工复制数据库文件类似，因此该工具只能备份MyISAM类型的表。

mysqlhotcopy [option] dbname1 dbname2 ...  bacuupDir/



-- ============ 数据还原  ===============

-- 对于使用mysqldump命令备份的文本文件；还原时可以使用MySQL命令来还原备份的数据。

mysql -u root -p [dbname] < backup.sql
-- 指定数据库名时，表示还原该数据库下的表。
-- 不指定数据库名时，表示还原特定的一个数据库。而备份文件中有创建数据库的语句。



-- 直接复制数据库目录
-- 直接复制备份的数据到MySQL的数据库目录下。此时必须保证两个MySQL数据库的主版本号是相同的；
-- 因为这样才能保证两个MySQL数据库的文件类型是相同的。

-- 使用mysqlhotcopy命令备份的数据也是通过这种方式还原。在Linux下，复制到数据库目录后，一定要将数据库的用户和组变为mysql
chown -R mysql.mysql dataDir

-- Linux下，MySQL数据库通常只有root用户和mysql用户组下的mysql用户可以访问



-- ========= 数据库迁移 =========

-- 数据库迁移是指将数据库从一个系统移动到另一个系统上。
-- 数据库迁移的原因：计算机升级、部分开发管理系统、升级MySQL数据库、换用其他数据库。
-- http://blog.csdn.net/qinxiandiqi/article/details/43270147

-- 一：  相同版本的MySQL数据库之间的迁移

-- 最常用和最安全的方法是使用mysqldump命令来备份数据库


-- 二： 不同版本的MySQL数据库之间的迁移

-- 高版本的MySQL数据库通常都会兼容低版本。
-- 最常用的方法mysqldump命令

-- 三：不同数据库之间迁移
-- 除了SQL语句存在不兼容的情况，不同的数据库之间的数据类型也有差异。

-- Windows系统下，通常可以通过MyODBC来实现MySQL与SQL Server之间的迁移。
-- MySQL迁移到Oracle时，需要使用 mysqldump 命令导出sql文件，然后手动更改sql文件中的create语句。



-- ============  表的导出和导入 ==========
-- MySQL数据库中的表可以导出成文本文件、XML文件、HTML文件。相应的文件也可以导入到MySQL数据库中。

-- 使用select ... into outfile 导出文本文件
-- 语法形式：
select [列名] from tbname [where ] into outfile '目标文件' [option];

-- 使用mysqldump命令导出文本文件
-- 基本语法形式：
mysqldump -u root -pPassword -T 目标目录 dbname tablename [option];

-- 示例：导出test数据库下student表的记录，其中字段间用","隔开,字符型数据用双引号括起来。
mysqldump -u root -pPWD -T C:\ test student
    "--fields-terminated-by=," "--fields-optionally-enclosed-by=""

-- 使用mysqldump命令还可以导出XML格式的文件"
mysqldump -u root -pPWD --xml|-X dbname tablename > C:/name.xml;



-- 用mysql命令导出文本文件
mysql -u root -pPWD -e "select 语句" dbname > C:\name.txt;
-- -e选项可以执行sql语句

-- mysql命令还可以导出XML文件和HTML文件
-- 在上面的命令基础上添加 --xml|-X （选择其一），或 --html|-H 



-- 用load data infile方式导入文本文件
load data [local] infile file into table tabename [option];

-- 示例：
load data infile 'C:\student.txt' into table student
  fields terminated by ',' optionally enclosed by "";   -- 指明该文件中的分隔符为','，字符串使用了'"'


-- 用mysqlimport命令导入文本文件
-- mysqlimport -u root -pPWD [-local] dbname file [option]
-- 同时也要注意分隔符问题

;;;;;;;;;;;;

/**************************************************************************
*   序列(sequence)
***************************************************************************/

-- 如果使用了BDB存储引擎，在表中删除一些行之后，这些行的序列值会被重用。
-- 查看一张表使用了什么存储引擎，的方法
show table status;
show create table bug;

select engine from information_schema.tables where table_schema = 'test' and table_name = 'bug';


-- 为表更改存储引擎的方法
alter table bug engine = MyISAM;

-- 清除一张表的所有信息，并将序列计数器重新初始化
truncate table tbname;


-- ==============  查询序列值  =====================

select last_insert_id();

-- 使用max(id)的方法来查询，但该方法没有考虑到MySQL服务器多线程的特性。
-- 因为我们要考虑的是： 获得的最大值是否是你生成的。
-- 解决这个问题的方法包括，将insert和select语句合并为一个事务或者锁定表。
-- 但MySQL提供了last_insert_id()函数可以更加简洁的获取正确的id值。

-- 一个用法
select * from bug where id = last_insert_id();

-- last_insert_id()返回值基于服务器的每一个客户端连接。它避免了不同用户之间的相互干扰（这是我们需要的）。

-- 很多MySQL接口含有API扩展，它可以返回auto_increment值，而不需要执行SQL语句。


-- 服务器端和



create table booksales
(
  title varchar(60) not null,
  copies int unsigned not null, -- xiaoliang
  primary key (title)
);

-- on duplicate key update
-- and 
-- last_insert_id(expr)
insert into booksales(title, copies)
  values('The Greater Trumps', last_insert_id(1))
  on duplicate key update copies = last_insert_id(copies+1);

select last_insert_id();

select * from booksales;
```
