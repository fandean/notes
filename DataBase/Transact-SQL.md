# Transact-SQL

标签（空格分隔）： DataBase

---

## 常用操作
### 行列转换
>参考：
[SQL Server 实现行列（纵横表）转换](http://www.codeceo.com/article/sql-server-row-column-change.html)
>
[ SQL Server 行列转换示例](http://blog.csdn.net/tjvictor/article/details/5186360 "查看其Sql Server 2008系列文章")
[SQL Server 批量插入数据的两种方法](http://blog.csdn.net/tjvictor/article/details/4360030)
[SQL Server 中使用参数化Top语句](http://blog.csdn.net/tjvictor/article/details/4327382)
>
[MySQL中行列转换的SQL技巧](http://cenalulu.github.io/mysql/column-row-reverse/)
>
[SQL Server 行列转换](http://codecloud.net/36646.html "排版不错")
[15 个常用的 SQL Server 高级语法](http://codecloud.net/5279.html "不错，提前看")
>
[重温SQL——行转列，列转行](http://www.cnblogs.com/kerrycode/archive/2010/07/28/1786547.html)
[SQL行转列汇总](http://www.cnblogs.com/maanshancss/archive/2013/03/13/2957108.html)
[@@IDENTITY (Transact-SQL)](https://msdn.microsoft.com/zh-cn/library/ms187342.aspx)
[]()


Declare cursor 才允許 for update 子句，Sql server可以在語句后添加 for update子句讓查詢出的數據可以改動。


**方括号：**

`[]` 里的内容表示是一个用户级的变量.
目的是防止用户使用的名称和系统保留字冲突
比如你有一个表名就叫 select
那么你 `select * from select` 肯定是不行的.
但是你 `select * from [select]` 就没问题了


> Sql server中解决与系统保留关键字冲突使用的是中括号.加上中括号,以声明其不是保留字.
`select * from [user] where username="$name"`
user就是关键字

当然不止中括号可以,""双引号也可以用.""的范围更广,可以适用于存储过程,而中括号不能用于存储过程,函数也一样.


```sql
-- sys.tables视图
-- 可得到数据库中的各个表，以及他们的架构名称

SELECT         SCHEMA_NAME(schema_id) AS table_schema_name, 
               name AS table_name
FROM             sys.tables;
```



[查看sqlserver的端口号](http://www.cnblogs.com/xwdreamer/archive/2012/06/23/2559344.html)

mysql的时候倒是见到过3306这个端口号，安装oracle的时候1521这个端口号




### Case語句和表達式
（PL/SQL）
Case語句可以在多個可能的系列中選擇一個語句系列執行。

#### 簡單Case語句：
簡單CASE語句是根據一個簡單的表達式結果來選擇要執行的PL/SQL語句。

```SQL
CASE expression
WHEN result1 THEN
	statements1
WHEN result2 THEN
	statements2
...
ELSE
	statements_else
END CASE;
```


case后面有值，相当于c#中的switch case

case 后面无值，相当于c#中的if…else if…else….


-----



```sql
use TestDB;

--创建测试表

if( exists ( select * from sys.objects where name = 'student'))
    drop table student
go
create table student
(
    id int identity(1,1) primary key,
    name varchar(20) not null,
    subject varchar(20) not null,
    score int not null
)    

-- 插入测试数据
insert into student values ('张三','语文',90),
('张三','数学',100),
('张三','英语',80),
('李四','英语',90),
('王五','语文',90),
('李四','语文',90),
('李四','数学',70),
('王五','数学',62),
('王五','英语',82)

select * from student

-- ------------------------------------------

select name as 姓名,
SUM(case [subject] when '语文' then score  end) as '语文',
SUM(case [subject] when '数学' then score  end ) as '数学',
SUM(case [subject] when '英语' then score else 0 end ) as '英语'
from student group by name

-- 如果要清除的了解上面的语句是如何运行可以先将 group by name 移除，观察结果。


select * from (
    select name,[subject],score from student
) s pivot (sum(score) for [subject] in (语文,数学,英语)) as pvt
order by pvt.name

declare @sql varchar(1000)
set @sql = 'select name as 姓名 , '
select @sql = @sql 
		+ 'sum(case [subject] when ''' 
		+ [subject] 
		+ ''' then score  else 0 end ) as '''
		+ QUOTENAME([subject]) 
		+ ''',' 
		from (select distinct [subject] from student ) as s --后加逗号，然后截取最后一个逗号
		
select @sql = LEFT(@sql,len(@sql)-1) + ' from student group by name '

print(@sql)
exec(@sql)

select QUOTENAME('aa[]bb') --其中quotename 用于将字符串为有效的标识符

-- print(@sql)的结果
select name as 姓名 , 
	sum(case [subject] when '数学' then score  else 0 end ) as '[数学]',
	sum(case [subject] when '英语' then score  else 0 end ) as '[英语]',
	sum(case [subject] when '语文' then score  else 0 end ) as '[语文]' 
	from student group by name 
```

LB绑定查询如果实在不行，可以在MI_LightBar 表中增加一个列 LBNo 该列存储的值为 lb1, lb2, lb3, lb4, lb5, ...，最终由于聚合函数无法处理字符串而导致该方法暂时失败（而Sql Server 在2012版本才支持字符串连接函数且该函数也不能用于group by中；或者自定义一个带聚合功能的函数）

>Sql Server提供类似MySQL的group_concat函数的功能的主要方法有SQLCLR UDA，（common language runtime (CLR) user-defined aggregates） (它需数据库实例启用SQLCLR支持)和T-SQL XML两种。
[Invoking CLR User-Defined Aggregate Functions](https://msdn.microsoft.com/en-us/library/ms131056\(v=sql.105\).aspx)
[Grouped Concatenation in SQL Server](https://sqlperformance.com/2014/08/t-sql-queries/sql-server-grouped-concatenation "主要参考此处")

**最終解決方案：**
max()函數是可以用於字符串的；不要在case子句中添加eles 0，這會將其變為數字。

```sql
SELECT         MI_Barcodes.Barcode_ID, MAX(MI_Barcodes.MachineType) AS MachineType, 
                          MAX(MI_Barcodes.Barcode) AS Barcode, MAX(MI_Barcodes.RecorderDate) 
                          AS RecorderDate, MAX(MI_Barcodes.ProductDate) AS ProductDate, 
                          MAX(MI_Barcodes.Line) AS Line, 
                          MAX(CASE LB_NO WHEN 'LB1' THEN LBBarcode END) AS LB1, 
                          MAX(CASE LB_NO WHEN 'LB2' THEN LBBarcode END) AS LB2
FROM             MI_Barcodes INNER JOIN
                          MI_LightBar ON MI_Barcodes.Barcode_ID = MI_LightBar.Barcode_ID
WHERE         (MI_Barcodes.MachineType = 'MI011A-H')
GROUP BY  MI_Barcodes.Barcode_ID

```


 SQL Server中函数的种类：
| 函数 |说明 |
|----|-----|
|行集函数|返回可在 SQL 语句中像表引用一样使用的对象。|
|聚合函数|对一组值进行运算，但返回一个汇总值。|
|排名函数|	对分区中的每一行均返回一个排名值。|
|标量函数|对单一值进行运算，然后返回单一值。 只要表达式有效，即可使用标量函数。|



### 序列号
[序列号](https://msdn.microsoft.com/zh-cn/library/ff878058.aspx)
[IDENTITY（属性）](https://msdn.microsoft.com/zh-cn/library/ms186775.aspx)

- IDENT_CURRENT 返回为某个会话和用域中的指定表生成的最新标识值。[IDENT_CURRENT (Transact-SQL)](https://msdn.microsoft.com/zh-cn/library/ms175098.aspx)
- @@IDENTITY 返回为跨所有作用域的当前会话中的某个表生成的最新标识值。[@@IDENTITY (Transact-SQL)](https://msdn.microsoft.com/zh-cn/library/ms187342.aspx)
- SCOPE_IDENTITY 返回为当前会话和当前作用域中的某个表生成的最新标识值。[SCOPE_IDENTITY (Transact-SQL)](https://msdn.microsoft.com/zh-cn/library/ms190315.aspx)
- 如果语句和事务失败，它们会更改表的当前标识，从而使标识列中的值出现不连贯现象。


[使用 MERGE 在单个语句中对表执行 INSERT 和 UPDATE 操作](https://msdn.microsoft.com/zh-cn/library/bb510625.aspx)
[Does SQL Server Offer Anything Like MySQL's ON DUPLICATE KEY UPDATE](http://stackoverflow.com/questions/1197733/does-sql-server-offer-anything-like-mysqls-on-duplicate-key-update)

> MySQL 
create table booksales
(
  title varchar(60) not null,
  copies int unsigned not null, -- xiaoliang
  primary key (title)
);
>
-- on duplicate key update
-- and 
-- last_insert_id(expr)
insert into booksales(title, copies)
  values('The Greater Trumps', last_insert_id(1))
  on duplicate key update copies = last_insert_id(copies+1);
>
select last_insert_id();

- [C# how to use scope identity](https://social.msdn.microsoft.com/Forums/en-US/4588e7bd-3fd6-4ef2-8d75-da4967a4d2e0/c-how-to-use-scope-identity?forum=transactsql)
- [获取SQL-SERVER数据库insert into操作的主键返回值](http://www.cnblogs.com/liulanglang/archive/2008/01/04/1025633.html)
- [.net中c#访问sql server插入数据时获取自增长列数据](http://ju.outofmemory.cn/entry/42085 "外加触发器方法")
- [\[C#-ADO.NET\] SqlCommand で IDENTITY 列を持ったテーブルに行を挿入した時の IDENTITY 列の値の取得](https://code.msdn.microsoft.com/DataAccess-howto-b5a084df)
- [How to get last inserted id?](http://stackoverflow.com/questions/5228780/how-to-get-last-inserted-id)
>**注意**：使用时将上面各链接中的@@identity替换为scope_identity()
使用语句：

```c#
var cmd = "INSERT INTO Mem_Basic(Mem_Na,Mem_Occ) VALUES(@na,@occ);SELECT CAST(scope_identity() AS int)";

//再通过`ExecuteScalar()`方法返回id值
```





### insert 插入多行数据
[INSERT (Transact-SQL)](https://msdn.microsoft.com/zh-cn/library/ms174335.aspx)
[表值构造函数 (Transact-SQL)](https://msdn.microsoft.com/zh-cn/library/dd776382.aspx)
[SQL Server 批量插入数据的两种方法](http://blog.csdn.net/tjvictor/article/details/4360030)

由于提供了所有列的值并按表中各列的顺序列出这些值，因此不必在列列表中指定列名。



参数
VALUES
介绍行值表达式列表。 每个列表都必须用括号括起来并由逗号分隔。
在每个列表中指定的值的数目必须相同，并且值必须采用与表中的列相同的顺序。 表中每个列的值必须指定，或者列列表必须显式为每个传入值指定列


#### 使用Bulk插入
bulk方法主要思想是通过在客户端把数据都缓存在Table中，然后利用SqlBulkCopy一次性把Table中的数据插入到数据库



>通过导入文件中保存的Barcode进行批量查询的方法是直接读取这些条码，放入查询语句的in子句中。

<br>

> 插入多行數據的另一種方法：使用select 和 union all
INSERT 
INTO 
   Student ( SNO, SNAME, SEX, DEPTNO, SAGE)
Select 1001, '张天', '男', 10, 20    Union   all  
Select 1002, '李兰', '女', 10, 21    Union   all  
Select 1003, '陈铭', '男', 10, 21    Union   all 
Select 1004, '刘茜', '女', 20, 21   Union   all 
Select 1005, '马朝阳', '男', 20, 22;


## 相關概念

### 视图
视图是一个虚拟的表，该表中的记录是由一个查询语句执行后所得到的查询结果构成。

```sql
create view view_name
[]
as select_statement {}
```

使用Create view语句创建视图时，Select子句里**不能**包含以下内容：

- Compute和Compute by子句
- ption子句
- into关键字
- 不能引用临时表或表变量


### 存储过程
存储过程是一组预先写好的能实现某种功能的T-SQL程序，指定一个程序名并编译后将其存储在SQL Server中。
它可以包含几乎所有的T-SQL语句，例如数据存取语句、流程控制语句、错误处理语句等。

系统存储过程：一般以"sp_"为前缀。系统存储过程存储在Resource数据库中。
扩展存储过程：一般以"xp_"为前缀。扩展存储过程允许使用其它编程语言（例如C#）创建自己的外部存储过程，其内容并不存储在SQL Server中，而是以DLL形式单独存在。(可能会被废除)
用户自定义存储过程：分为两种；1. T-SQL存储过程：它存储保存T-SQL语句的集合。2.CLR存储过程：它是针对.NET的CLR方法的引用（作为公共静态方法实现）。
```sql
create {proc|procedure}
    []
AS 
{sql_statement}
```

不能在存储过程中使用的语句：

- create aggregate
- 另一些create和alter语句，但不包含create/alter table
- use database_name
- ...


### 触发器
触发器实际上是一种特殊类型的存储过程，它是在执行某些特定的T-SQL语句时自动执行的一种存储过程。

触发器是针对数据表(库)的特殊存储过程。当这个表发生了insert、update、delete操作时会自动激活。


## Transact-SQL語法
Transact-SQL（又稱T-SQL）

[Transact-SQL 语法约定](https://msdn.microsoft.com/zh-cn/library/ms177563(v=sql.120).aspx)

上面链接处使用的测试服务器通常运行ANSI/ISO 1252代码页。有些代码示例使用字母N作为Unicode字符串常量的前缀。如果没有N前缀，则字符串被转换为数据库的默认代码页。此默认代码页可能不识别某些字符。所以最好安装中文版SQL Server 2008 R2带高级功能版。

变量 `@`为局部变量。`@@`为全局变量，全局变量由系统提供，用于存储系统信息，只可以使用全局变量，不能定义全局变量。

`@x -= 1` 变量自减1

字符串常量：是定义在单引号内的一串字符。如果字符串内容本身包含单引号，可以使用连续两个单引号来表示。如：`'I''m back'`。如果选项quoted_identifier设置为off，那么也可以使用双引号来表示字符串。
Unicode常量：必须有一个大写的N来区别字符串常量。例如：`N'string'`

不同的批处理使用GO来分隔。查询编辑器会自动根据GO指令来将T-SQL语句分为多个批来编译执行。
GO只用于编辑器中。

```sql
ALTER PROCEDURE [dbo].[Pro_SER1] 
   @id varchar(50),
   @lb varchar(50),
   @dt varchar(50),
	@no varchar(50)  
AS 
	begin
		Select * From TabSer1 Where s_id=@id And s_lb=@lb And s_dt=@dt
		If @@rowcount=0             -- @@rowcount的用法，與上一次Select的關係
			begin
				insert into TabSer1 Values(@id,@lb,@dt,@no)
			end
		else
			begin
				update TabSer1 set s_no=@no Where s_id=@id And s_dt=@dt And s_lb =@lb
			end
	end 
```



### 使用CAST转换数据类型
当要对不同的数据类型的数据进行运算时，必须将其转换成相同的数据类型。sql server中提供了两个函数进行数据类型的转换。

CAST语法如下：
`CAST(expression AS date_type [(length)])`
其中expression为任何有效的表达式，date_type为要转换的数据类型。length为nchar,nvarchar的等数据类型的长度。
```sql
select 产品类型 + '的单价为：' + CAST(单价 AS varchar(10)) + '元'
    AS 产品介绍
    from 产品
```

CONVERT转换数据类型：
```sql
convert(data_type [(length)], expression [, style])
```
多用于对日期类型和浮点类型转换为字符类型；并且可以指定转换的风格。

隐式类型转换：
系统会自动将一些数据类型进行转换


rand函数返回一个随机值；newid函数返回一个全局唯一标识符GUID。


### MSSQL為表或列添加註釋
[为SQL Server表中的列添加/修改/删除注释属性](http://www.aichengxu.com/sqlserver/6042366.htm)
[]()
[]()
[]()


```
/****** SSMS 中 SelectTopNRows 命令的指令碼  ******/
use GZAOI
go

SELECT TOP 100 [BTIME]
      ,[model]
      ,[Barcode]
      ,[data]
      ,[hostname]
      ,[uploadtime]
      ,[session]
      ,[shift]
      ,[cday]
      ,[judge]
      ,[ip]
  FROM [GZAOI].[dbo].[BM7DATAFREE]
  where hostname = 'gz-n-09' order by BTIME desc
  go



-- 瀟湘隱者
-- 數據庫版本
select @@VERSION;
-- 錯誤消息的嚴重等級
select COUNT(distinct severity) from sys.messages;



SELECT COUNT(model)
  FROM [GZAOI].[dbo].[BM7DATAFREE]
go



-----------------------------------------------------------

-- 監視工具   

-- [性能监视和优化工具] <https://msdn.microsoft.com/zh-cn/library/ms179428(v=sql.120).aspx>

-- 显示行数、保留的磁盘空间、表的磁盤空間，省略參數則顯示整個數據庫的。。。
exec sp_spaceused @objname = 'BM7DATAFREE'
go


-- 活動的
exec sp_who 'active'
 go


-- 用戶 gzaoi
exec sp_who 'gzaoi'
go

exec sp_who2 'active'
go 

-- 显示有关 Microsoft SQL Server 的统计信息
exec sp_monitor
go


-- 查看SQL Server中持有的鎖的信息
-- 死鎖的排查<從零開始學SQL Server>
exec sp_lock 52;

exec sp_lock;

select DB_NAME(7) as dbName;


-- sp_who2   sp_lock2  
```



-----------


```sql
-- 瀟湘隱者
-- 數據庫版本
select @@VERSION;
-- 錯誤消息的嚴重等級
select COUNT(distinct severity) from sys.messages;



SELECT COUNT(model)
  FROM [GZAOI].[dbo].[BM7DATAFREE]
go



-----------------------------------------------------------

-- 監視工具   

-- [性能监视和优化工具] <https://msdn.microsoft.com/zh-cn/library/ms179428(v=sql.120).aspx>

-- 显示行数、保留的磁盘空间、表的磁盤空間，省略參數則顯示整個數據庫的。。。
exec sp_spaceused @objname = 'BM7DATAFREE'
go


-- 活動的
exec sp_who 'active'
 go



-- 用戶 gzaoi
exec sp_who 'gzaoi'
go


exec sp_who2 'active'
go 



-- 显示有关 Microsoft SQL Server 的统计信息
exec sp_monitor
go





-- 查看SQL Server中持有的鎖的信息
-- 死鎖的排查
exec sp_lock 52;

exec sp_lock;

select DB_NAME(7) as dbName;




-- sp_who2   sp_lock2  





-- -------------------------------------------------------

/*
 * 服務器【啟動帳戶】及安全性
 * 
 * 各組件和可用啟動帳戶的關係，mssql中的組件都是以服務的方式存在于操作系統中，所以在
 * 服務的登錄身份中就有以下選項可以使用：
 * - 本地系統帳戶
 * - 本地用戶帳戶
 * - 域用戶帳戶
 * - 本地服務帳戶
 * - 網絡服務帳戶
 */



/*
 * 數據庫實例的組成架構
 * Sql server數據庫實例是數據存儲、事務處理的核心程序，而數據庫實例(Instance)就是實體化的內存文件，
 * 該文件是整個Sql Server的執行程序（sqlservr.exe）
 * 默認數據庫實例名稱MSSQLSERVER（只能有一個）
 * 命名數據庫實例名稱的組成，是計算機名加命名數據庫實例名稱
 */

-- 默認數據庫實例
select @@SERVICENAME 'Sql Server數據庫實例名稱',
		@@SERVERNAME  'Sql Server的本地服務器名稱';
		


/*
 * 除核心的數據庫實例，還有附屬的物理文件架構與邏輯的數據庫機構
 * 物理文件：數據庫文件  + 事務日誌文件
 * 邏輯對象：包含文件組合架構等
 
 * 每個數據庫實例可以建立多個數據庫，每個數據庫都由文件組包括數據文件和相應的事務日誌文件組成，每個數據庫
 * 對象分別屬於不同的架構，每個對象的空間配置由範圍和頁組成。
*/








-- 使用sp_configure存儲過程調整數據庫實例的參數

-- 先進行查看；配置名，配置上下限，完成的配置值，正在運行的配置值（這裡并沒有顯示高級參數）
-- 如果config_value與run_value不一致則該配置值需要進行reconfigure，并重啟數據庫實例
exec sp_configure
go


-- 還可使用目錄視圖sys.configurations來獲得所有的系統配置值
select * from sys.configurations;


select name '配置名稱',
	value_in_use '使用值',
	value '設置值',
	case is_dynamic when 1 then '重新Reconfigure'
					when 0 then '重新啟動數據庫實例' 
	end '執行方法'
from sys.configurations
where value<>value_in_use        -- 獲得尚未生效的配置選項
go



-- 通過圖形界面MSSMS查看數據庫實例的屬性，很重要的內容

-- 利用sp_procoption系統存儲過程將另一存儲過程設置成自動啟動







use GZTV;
-- 查詢數據庫中的表
select * from sys.tables;

select SUSER_NAME() 'Login',
		HOST_NAME() 'Client';

select SUSER_NAME(), HOST_NAME();



-- 服務器名稱變更技巧

-- 4種查看方法
select @@SERVICENAME 'Sql Server數據庫實例名稱',
		@@SERVERNAME  'Sql Server的本地服務器名稱';


select srvid '識別碼',
	srvname '服務器的名稱',
	schemadate '最近更新日期',
	case isremote
		when 1 then '遠程服務器'
		when 0 then '連接服務器'
	end '種類' 
from sys.sysservers;     -- 使用系統數據表

exec sp_helpserver     -- 使用系統存儲過程

select SERVERPROPERTY('servername');  -- 使用函數返回本地服務器名稱



-- 服務器名稱變更（略）


-- 利用開機自動啟動存儲過程傳送email給DBA







/*
 * 管理Sql Server服務器的十大技巧
*/

-- 一： telnet測試
-- 用來了解遠程數據庫實例是否已經啟動或是監聽端口是否正常
-- 通過監聽端口的響應來判斷實例是否處於接收狀態；還可判斷實例是否正常開啟TCP/IP通訊協議（如果使用其他通訊協議，
-- 則會顯示“不能打開到主機的連接”）

-- telnet gz-01 1433

-- 如果更改了端口，需要重啟數據庫實例

-- 端口更改后在程序開發中的SqlConnection對象的連接字符串中添加"Network Address=計算機名稱,1533"


-- 二： 別名的簡單化連接
-- 在Sql Server Configuration Manager中的 —— Sql Native Client配置 —— 別名
-- 配置好后即可在SSMS的服務器名稱中填寫別名，SQLCMD中使用 -S 參數



-- NET服務命令
-- 數據庫實例的停止、啟動與暫停等操作


-- 四：xp_cmdshell管理服務
-- xp_cmdshell擴展存儲過程的功能除了可以執行*操作系統的命令*外，還可進行其他服務的管理
-- 示例： exec master.sys.xpcmdshell 'net start "Sql Server Browser"'


-- 活動監視器
-- 通過查看選中進程的詳細數據查看進程的執行內容

-- 專用管理員連接
-- 可以在數據庫實例不響應一般連接時(如連接數超過限制時)，讓管理員連接仍然可以連接到服務器
-- 在連接時只需在服務器名稱前加"ADMIN:"即可




-- 取得基本數據庫信息
select name '數據庫名稱',create_date '創建日期',
	collation_name '排序',recovery_model_desc '復原模式'
from master.sys.databases
go


-- 取得數據庫基本信息
exec sp_helpdb


select * from sys.databases;


-- 查詢數據庫文件名稱
select fileid, name
from sys.sysaltfiles 
where dbid = DB_ID('GZTV')


use P10012
go

use master 


-- 找出含有特定數據列的數據表
select t.name + '.' + s.name      -- 返回數據庫表和數據列名稱  -- 包含名稱為 id 列的數據表
from sysobjects t, syscolumns s
where t.id = s.id and
    t.type = 'U' and   
    s.name = 's_id'  
go 


select top 100 * from syscolumns


-- 查詢該數據庫包含的表
select top 100 * from sys.tables;
go
;

select top 100 * from TabSer;


-- 判斷tempdb所在位置
select name, physical_name
from sys.master_files
where database_id = DB_ID('tempdb');


-- 检查数据库空间配置
exec sp_helpfile;

-- 数据库文件组名称与包含的数据文件数
exec sp_helpfilegroup;

-- 指定文件组名称时，可以显示文件组的星系信息（有两个结果）
exec sp_helpfilegroup 'primary';


-- 查询整体数据库的文件信息
select name, physical_name from sys.master_files;

-- 查询个别数据库的文件信息
select * from sys.database_files;


-- 查询文件组目录视图
select * from sys.filegroups;


select * from sys.data_spaces;


-- 检查数据库整体剩余空间
exec sp_spaceused;







-- Sql Server 2005提供的16大目录视图 (P131页)
-- 比如sys.tables、sys.views、sys.databases、、

-- 常用的元数据函数表
-- 例如： DB_ID()、DB_NAME()、、

-- 常用的管理系统存储过程
-- 例如：、sp_spaceused、sp_helpdb、sp_databases、sp_help、sp_helpfile

select * from sys.servers;




select * from sys.databases;
select * from syslogins;
select * from sys.endpoints;



select schema_name(schema_id) '架构', name '数据表名称'
from sys.tables;




-- 第4章：保护数据的备份操作

/*
除了对用户数据库进行备份外，建议对系统数据库也进行例行备份（tempdb与resource除外）

*/


-- 备份设备：是一种逻辑的对象，通过该对象，备份过程会将数据存放到物理的操作系统中，用于重复使用与自动恢复操作

-- 建立逻辑的备份设备
use master
go
exec master.dbo.sp_addumpdevice
@devtype = N'disk',   -- 选择存储位置为硬盘
@logicalname = N'AWDEV1',
@physicalname = N'C:\Backup\AWDEV1.bak'
go

-- 列出备份设备； name表示设备名称，physical_name表示实际的存储位置
select * from sys.backup_devices;


-- 数据库备份（即完整备份：备份数据与日志）
backup database [AdventureWorks]
to [AWDEV1]            -- 使用逻辑备份设备
go

-- 在备份过程中可以指定多个备份设备（并行，速度快），通过这种方式，数据会被平均分割到不同的备份设备上
-- 它们称为备份集，限制：每一个备份集中的设备类型必须相同；且这些设备只能一起使用(不可单独使用)，并支持多个数据库共享


-- 日志文件备份
backup log {database_name} to <...>



-- 直接使用实际路径与文件的备份方式
backup database [AdventureWorks]
to disk='C:\AWDEV1.bak' , disk='AWDEV2.bak'  -- 也可同时指定多个物理文件


```












## Sql Server学习笔记

```sql
-- Sql Server学习笔记

-- 《Microsoft SQL Server 2008技术内幕：T-SQL语言基础》
-- 本书源代码下载地址：http://tsql.solidq.com/books/tsqlfund2008/
-- 网盘上有针对该书的视频教程

-- 查看有关数据库的信息
sp_helpdb;

-- 查看当前数据库空间信息
sp_spaceused;

-- 查看数据库选项
sp_dboption;

/*
SSMS使用：

SSMS工具栏上显示的蓝色勾可以检查Sql语句是否正确。
可以直接将Object Explorer中的对象拖动到查询窗口。

*/


/*
可以将数据库看作是各种对象的容器，
每个实例可以包含多个数据库。
系统数据库：
用户数据库：

数据库有一个collation（排序规则）的属性；如果在创建数据库时没有为其指定属性值，则将使用默认排序规则。

数据库在物理上由数据文件和事务日志文件组成。
Sql Server可以同时写多个数据文件，但某一时刻只能以顺序方式写一个日志文件。

多个数据文件在逻辑上按照文件组(filegroup)的形式进行分组管理。
创建数据库对象时，就会将其保存在目标文件组中。
对象数据可能会保存在属于目标文件组的多个文件中。
通过文件组可以控制数据库对象的物理存储位置。
数据库必须要有一个主文件组(Primary)，而用户定义的文件组是可选的。
Primary文件组包含主数据文件（扩展名为.mdf）以及数据库的系统目录(catalog)
可以选择为primary增加多个辅助数据库文件（扩展名为.ndf)。
用户定义的文件组只能包含辅助数据文件。可以指定将哪个文件组作为默认为女儿家组。
创建对象是如果没有指定文件组，则位于默认文件组中。

架构(Schema)和对象
一个数据库可以包含多个架构，而每个架构又包含多个对象。可以将架构看作是各种对象的容器。这些对象可以是表、视图、存储过程等。

可以在架构级别上控制对象的访问权限。
此外架构也是一个命名空间，用作对象名称的前缀。比如dbo架构下的表 dbo.student
如果在引用对象时省略架构名称，它将先检查对象是否在用户默认的架构中，
如果不在则继续检查是否在dbo架构中。推荐在使用对象时在对象名前添加架构名前缀。

dbo为默认架构。

*/
IF DB_ID('TestDB') IS NULL	-- 函数DB_ID()返回数据库名称对应的数据库ID
	Create Database TestDB;  -- 注意这里采用了默认的文件设置，应该显示指定的。

-- 创建表
use TestDB;

IF OBJECT_ID('dbo.Employees','U') IS NOT NULL  --函数参数 U 代表用户表
	DROP TABLE dbo.Employees;
	

USE TSQLFundamentals2008;


/*
 * CASE表达式
 * 它是一个标量表达式，它基于一个逻辑来返回一个值。
 * 注意：它是一个表达式，而不是一条语句；也就是说，不能用它来控制活动的流程，也不能根据条件逻辑来做某些处理。
 * 相反，它只是根据条件逻辑来返回某个值。
 
 * CASE简单格式将一个值(或一个标量表达式)与一组可能的取值进行比较，并返回第一个匹配的结果。
 * 如果列表中没有值等于测试值，CASE表达式就返回其ELSE子句中列出的值，如果没有ELSE则默认看作是 ELSE NULL
 *
 * CASE简单表达式之有一个测试值(或表达式)，它紧跟在CASE关键字的后面，
 * 并与WHEN子句中的一组可能值进行比较。
 *
 * CASE搜索表达式要更加灵活，它可以在WHEN子句中指定谓词或逻辑表达式，而不限于相等性比较
 * CASE搜索表达式返回结果为TRUE的第一个WHEN逻辑表达式所关联的THEN子句中指定的值。
 * 
 */



---------------------------------------------------------------------
-- CASE Expression
---------------------------------------------------------------------

-- Simple
SELECT productid, productname, categoryid,
  CASE categoryid
    WHEN 1 THEN 'Beverages'
    WHEN 2 THEN 'Condiments'
    WHEN 3 THEN 'Confections'
    WHEN 4 THEN 'Dairy Products'
    WHEN 5 THEN 'Grains/Cereals'
    WHEN 6 THEN 'Meat/Poultry'
    WHEN 7 THEN 'Produce'
    WHEN 8 THEN 'Seafood'
    ELSE 'Unknown Category'
  END AS categoryname
FROM Production.Products;

SELECT orderid, custid, val,
  CASE NTILE(3) OVER(ORDER BY val)   -- 高级语法
    WHEN 1 THEN 'Low'
    WHEN 2 THEN 'Medium'
    WHEN 3 THEN 'High'
    ELSE 'Unknown'
  END AS titledesc
FROM Sales.OrderValues
ORDER BY val;

-- Searched
SELECT orderid, custid, val,
  CASE 
    WHEN val < 1000.00                   THEN 'Less then 1000'
    WHEN val BETWEEN 1000.00 AND 3000.00 THEN 'Between 1000 and 3000'
    WHEN val > 3000.00                   THEN 'More than 3000'
    ELSE 'Unknown'
  END AS valuecategory
FROM Sales.OrderValues;




/***
 * 查询元数据
 */

-- 目录视图
-- 目录视图提供了关于数据库中各对象的非常详细的信息。

-- sys.tables视图
-- 可得到数据库中的各个表，以及他们的架构名称
select SCHEMA_NAME(schema_id) AS table_schema_name, name as table_name -- schema_name()用于将id转换为对应的名称
from sys.tables;


-- sys.columns： 可以得到某个表的列信息
select * from Production.Suppliers;

TYPE_NAME(); -- 



/*
	信息架构视图
*/

-- 信息架构视图是位于 INFORMATION_SCHEMA架构内的一组视图。

-- INFORMATION_SCHEMA.TABLES 视图可以查询出当前数据库中用户表，及架构名称。

-- INFORMATION_SCHEMA.columns

-- Information Schema Views
SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = N'BASE TABLE';


/* 
	系统存储过程和函数
*/

-- System Stored Procedures and Functions
EXEC sys.sp_tables;

EXEC sys.sp_help		-- 该存储过程，接受一个对象作为输入，返回与之相关的多个结果集
  @objname = N'Sales.Orders';

EXEC sys.sp_columns
  @table_name = N'Orders',
  @table_owner = N'Sales';

EXEC sys.sp_helpconstraint		-- 返回对象中关于约束的信息
  @objname = N'Sales.Orders';

SELECT 
  SERVERPROPERTY('ProductLevel');

SELECT
  DATABASEPROPERTYEX(N'TSQLFundamentals2008', 'Collation')

SELECT 
  OBJECTPROPERTY(OBJECT_ID(N'Sales.Orders'), 'TableHasPrimaryKey');

SELECT
  COLUMNPROPERTY(OBJECT_ID(N'Sales.Orders'), N'shipcountry', 'AllowsNull');
  


/*
 * 第5章：表表达式
 * 
 */
-- 表表达式是一种命名的查询表达式，代表一个有效的关系表。
-- SQL Server支持4中表表达式： 派生表，公用表表达式（CTE），视图，内联表值函数（inline TVF）

-- 表表达式并不是物理上真实存在的对象，他们是虚拟的。
-- 使用表表达式的好处体现在代码的逻辑方面，而不是性能方面。

-- 用来定义表表达式的查询语句必须满足三个要求：
-- 1. 不保证有一定的顺序（即不能是order by）
-- 2. 所有的列必须有名称
-- 3. 所有的列名必须唯一



-- 派生表：在from子句中定义
SELECT *
FROM (SELECT custid, companyname
      FROM Sales.Customers
      WHERE country = N'USA') AS USACusts;


declare @empid as int = 3;  -- 作用与下面两句语法相同
declare @empid2 as int;
set @empid2 = 3;



-- 公用表表达式(CTE)
-- CTE是用with子句定义的

---------------------------------------------------------------------
-- Common Table Expressions
---------------------------------------------------------------------

WITH USACusts AS
(
  SELECT custid, companyname
  FROM Sales.Customers
  WHERE country = N'USA'
)
SELECT * FROM USACusts;  -- 向在with构造的表进行查询


-- 和派生表一样也可以在定义CTE的查询语句中使用参数。



-- 视图
-- 视图和内联表值函数是两种可重用的表表达式

IF OBJECT_ID('Sales.USACusts') IS NOT NULL
  DROP VIEW Sales.USACusts;
GO
CREATE VIEW Sales.USACusts
AS

SELECT
  custid, companyname, contactname, contacttitle, address,
  city, region, postalcode, country, phone, fax
FROM Sales.Customers
WHERE country = N'USA';
GO

-- 应避免在和视图有关的应用上下文中使用 select * 语句
-- 列是在编译视图时进行枚举的，新加的列可能不会自动加到视图中。（虽然可以通过使用sp_refreshview的存储过程来刷新视图）



-- 为了得到视图的定义：可以
select OBJECT_DEFINITION(OBJECT_ID('Sales.USACusts'));
-- 也可以使用存储过程 sp_helptext来进行查看，相比而言格式更好
exec sp_helptext 'Sales.USACusts';


-- 视图选项：

-- ENCRYPTION选项：该选项会对视图的定义语句进行混淆处理，避免他人查看。此时就无法通过OBJECT_DEFINITION()来查看定义。
-- 选项可以通过使用 with 子句进行添加

-- CHECK OPTION选项：
-- 该选项的目的是为了防止通过视图执行的数据修改与视图中设置的过滤条件发生冲突。



-- 内联表值函数
-- 内联表值函数是一种可重用的表表达式，能够支持输入参数。
-- 除了支持输入参数外，它与视图相似。（参数化的视图）

-- 同 create function ... as ...



-- SQL Server特有的apply运算符
-- 。。。



/*
 * 第6章：集合运算
*/
-- UNION (并集)
-- intersect (交集)
-- except（差集）
-- 集合运算的优先级


-- 集合论

-- 所谓集合是把我们直观或思维中确定的、不同的那些对象作为一个整体来考虑的结果。这些对象就是集合的元素。
-- **整体**应该将集合视为一个实体，重点关注的应该是一组对象。
-- **不同的**，指集合中的每一个元素必须是唯一的。可以通过定义键约束条件来强制要求表中每一行数据的唯一性。
-- 没有键就不能唯一标识一行数据，数据表也就不能满足集合的要求。
-- 相反这样的数据表称之为**多集**或包。

-- 集合的排列顺序并不重要，例如：{a,b,c} 和 {b,c,a}表示的是同一个集合。
-- 集合元素是由他们的属性来描述的，而与元素的顺序没有关系。
-- 很多程序员短时间没法接受查询数据表时，返回的集合元素之间没有一定的顺序。
-- 换句话说，对数据表的查询可以返回按任何顺序排列的数据行。除非你明确要求。


-- 集合运算是对输入的两个集合（应该是多集）进行的运算。
-- 本章在使用多集时表示，由两个输入的查询生成的可能包含重复记录的中间结果集。




/*
 * 第7章：透视、逆透视及分组集
*/

-- 对数据进行透视转换(pivoting)、逆透视转换(unpivoting)、处理分组集(grouping set)

-- 透视转换
-- 透视数据是一种把数据从行的状态旋转为列的状态的处理，在这个过程中可能需要进行聚合。

-- tempdb默认就存在的数据库
use tempdb;


SELECT * FROM dbo.Orders;

SELECT empid, custid, SUM(qty) AS sumqty
FROM dbo.Orders
GROUP BY empid, custid;

SELECT 'empid', custid, SUM(qty) AS sumqty  -- 两者之间结果的差别
FROM dbo.Orders
GROUP BY empid, custid;


-- 每个透视转换都将涉及3个逻辑处理阶段，每个阶段都由相关的元素，
-- 分组阶段：处理相关的分组或行元素
-- 扩展阶段：处理相关的扩展或列元素
-- 聚合阶段处理相关的聚合元素和聚合函数

-- 先弄清楚这三个阶段涉及到的元素

-- 两者透视转换的解决方案：
-- 1.使用标准的SQL解决方案
-- 2.使用T-SQL特定的pivot运算符进行解决

-- 1.
-- 分组阶段；使用group by子句实现
-- 扩展阶段；通过在select子句中为每个目标列指定case表达式来实现。这需要事先知道每个扩展元素的取值，并为每个值指定一个单独的case表达式。
-- 聚合阶段；通过为每个case表达式的结果应用相关的聚合函数来实现。

select empid,
	SUM(case when custid = 'A' then qty end)as A,
	SUM(case when custid = 'B' then qty end)as B,
	SUM(case when custid = 'C' then qty end)as C,
	SUM(case when custid = 'D' then qty end)as D
from dbo.Orders
group by empid;

	
-- 2.
-- pivot运算符也是在查询的from子句的上下文中执行操作。
-- 它对某个源表或表表达式进行操作、透视数据，再返回一个结果表。
-- 它同样涉及前面的三个逻辑处理阶段
-- 在pivot运算符的圆括号中要指定聚合函数、聚合元素、扩展元素、目标列名称的列表。
-- 注意：不需要显示的指定分组元素，它隐式的把源表中既没有指定为扩展元素，也没有指定为聚合元素的那些元素作为分组元素。
-- 所以在使用pivot时要保证pivot运算符的源表除了分组、扩展和聚合元素为，不能再包含其他属性列。
-- 为此，一般不直接把pivot运算符应用到源表，而是将其应用到一个表表达式

select empid, A, B,C,D
from (select empid,custid,qty
		from dbo.Orders) as D
	pivot(sum(qty) for custid in (A,B,C,D)) as p;






-- 逆透视




-- 分组集 grouping set

-- 分组集就是分组（group by子句）使用的一组属性（列名）
-- 在传统的SQL中一个聚合查询只能定义一个分组集。

select empid, custid, SUM(qty) as sumqty
from dbo.Orders
group by empid,custid;					-- 定义了(一个)分组集(empid,custid)

select SUM(qty) as sumqty
from dbo.Orders;						-- 定义了一个空的分组集()




/*
 * 第8章：数据修改
*/

-- 插入数据：
-- insert values
-- insert select : 可以将一组由select查询返回的结果行插入目标表中
-- insert exec ：可以把存储过程或动态SQL批处理返回的结果集插入目标表
-- select into ： 作用是创建一个目标表，并用查询返回的结果来填充它（非标）
-- bulk insert : 用于将文件中的数据大容量的导入一个以存在的表中。



-- identity属性
-- 带有该属性的列称为标识列，它是自动增长（种子，增量）的
-- SQL Server为引用标识列提供了更通用的格式：$identity
use TSQLFundamentals2008;
select $identity from HR.Employees;

-- 如果要获得这个新生成的标识值(比如，要在引用表中插入子行)，可以查询以下两个函数之一
-- @@identity和SCOPE_IDENTITY()
-- @@identity它是旧版本，它返回会话最后生成的一个标识值，而不考虑任何作用域
-- SCOPE_IDENTITY()会返回当前作用域（例如；同一存储过程）内会话生成的最后一个标识值。

-- 记住：@@identity和SCOPE_IDENTITY()都是返回当前会话生成的最后一个标识值。
@@IDENTITY 和 SCOPE_IDENTITY 可以返回当前会话中的所有表中生成的最后一个标识值。 但是，SCOPE_IDENTITY 只在当前作用域内返回值，而 @@IDENTITY 不限于特定的作用域。@@IDENTITY 函数的作用域是执行该函数的本地服务器上的当前会话。

-- 二者都不受其他会话中插入操作的影响。

-- 如果你想知道一个表当前的标识值（最后一次生成的值）而不考虑作用域。
-- 则应该使用 ident_current函数，并将表名作为其输入参数。

select  ident_current('HR.Employees');

IDENT_CURRENT 不受作用域和会话的限制，而受限于指定的表。 IDENT_CURRENT 可以返回任何会话和任何作用域中为特定表生成的标识值。

<https://msdn.microsoft.com/zh-cn/library/ms187342.aspx>

-- 注意以下关于标识属性的重要细节：
-- 如果导致当前标识值发生变化的insert语句插入失败(比如：违背表的check约束)，或者是该语句所在的事务发生了回滚。
-- 表中当前标识值的变化并不会被撤销。


-- 当然，这意味着，当你不在意标识值间有间隔时，应该只依赖标识属性自动生成标识值；
-- 否则，应该考虑使用自己的替代机制。


-- 标识属性必须要注意的另一个重要的地方是，不能在现有的列上增加或删除标识属性。

-- 如果为表设置了一个名为 identity_insert 的会话选项，则sql server允许在使用insert时显式的指定标识列的取值。
-- 不过没有任何选项可以对标识列进行更新。
-- 只有当为标识列显式提供的值大于表的当前标识值时，sql server才会改变表的当前标识值。

set identity_insert dbo.t1 ON;  -- 相反 off


-- 标识属性本身并不会强制限制标识列的唯一性，理解这一点很重要。
-- 当把identity_insert选项设置为ON后，显示指定的值可能已经存在与表中。


-- 可以使用 dbcc checkident 命令来重设表的当前标识值。（而非更新）




-- 删除数据
-- delete 和 truncate
-- truncate删除表中所有的行，它不需要过滤条件。特点：删除大量数据快，并重置标识列的种子值，危险。
-- truncate语句无法删除带有外键约束的目标表，即使引用表为空或外键被禁用也是如此，
-- 可以利用这一特性，可以创建虚拟表，让虚拟表包含需要保护的的表的外键；（创建之后可以禁用虚拟表的外键，来提升性能）
-- 使用truncate和drop语句时容易发生错误的是用在与联接有关的语句中


-- 与基于delete语句类似，T-SQL也支持一种基于联接的update语法，这不是标准的sql语法。
-- 联接在此处也是起过滤作用。




-- 合并数据
-- sql server 2008引入了一个 merge的语句，它能在一条语句中根据逻辑条件对数据进行不同的修改(insert、update和delete)。
-- merge是标准sql的一部分，但t-sql版本的merge语句增加了一些非标准的扩展

-- 一个merge语句实现的功能通常可以转换成sql server早期版本的多个其他dml语句的组合来实现。
use tempdb;

MERGE INTO dbo.Customers AS TGT		-- 指定目标表的名称
USING dbo.CustomersStage AS SRC		-- 指定来源表的名称
  ON TGT.custid = SRC.custid		-- 定义合并条件，定义来源表中的哪些行在目标表中有匹配
WHEN MATCHED THEN					-- 当找到匹配时
  UPDATE SET							-- 进行更新操作
    TGT.companyname = SRC.companyname,
    TGT.phone = SRC.phone,
    TGT.address = SRC.address
WHEN NOT MATCHED THEN				-- 当没有找到匹配
  INSERT (custid, companyname, phone, address)		-- 插入值
  VALUES (SRC.custid, SRC.companyname, SRC.phone, SRC.address);






/*
 * 第10章：可编程对象
 */
 
 -- 可编程对象包括变量、批处理、流程控制元素、游标、临时表、动态SQL、例程(如用户定义函数，存储过程，触发器)、错误处理。
 

-- 批处理：批处理是发送到sql server的一组单条或多条t-sql语句，这些语句会被编译为单个可执行单元。


-- 变量：
declare @i as int;			-- 定义变量，指定类型
set @i = 10;				-- 为变量赋值， set语句每次只能对一个变量进行操作
declare @j as int = 10;		-- 定义的同时进行赋值

print @i;					-- 打印该变量
go 


-- 当为标量变量赋值时，变量必须是标量表达式的结果。表达式可以是标量子查询。

-- set语句比赋值select语句更安全，因为它要求使用标量子查询来从表中提取数据。
-- 记住，如果在运行时，标量子查询返回了多个值，则会查询失败。

USE TSQLFundamentals2008;

DECLARE @empname AS NVARCHAR(61);

SET @empname = (SELECT firstname + N' ' + lastname
                FROM HR.Employees
                WHERE empid = 3);

SELECT @empname AS empname;
GO

-- 赋值 select语句
-- sql server支持一种非标准的赋值 select语句，允许在单独的语句中既查询数据也把从同一行中获得的多个值分配给多个变量。

-- 在使用赋值select语句时，如果查询的结果返回多个满足条件的结果行，则变量中保存的是最后一行中的值(排列是随机的)。
-- Using the SELECT command to assign multiple variables in the same statement
DECLARE @firstname AS NVARCHAR(20), @lastname AS NVARCHAR(40);

SELECT
  @firstname = firstname,		
  @lastname  = lastname
FROM HR.Employees
WHERE empid = 3;

SELECT @firstname AS firstname, @lastname AS lastname;
GO



-- 批处理
-- 批处理要经历的处理阶段有：分析，解析，优化(作为一个执行单元)。一个批处理可以包含多个事务。

-- 客户端应用程序的API（如ADO.NET）提供的方法可以把要执行的批处理代码提交到sql server。
-- 而诸如SSMS等工具，则提供了一个客户端命令GO，可以发出一批T-SQL语句结束的信号。
-- 注意GO是客户端工具的命令，而不是T-SQL服务器的命令


-- 批处理是作为一个单元而进行分析和执行的意组命令。如果分析成功，sql server接着就会尝试执行批处理。
-- 如果批处理存在语法错误，整个批处理就不会提交到sql server执行。


-- 变量和批处理
-- 变量是属于定义他们的批处理的局部变量。


-- 不能在同一批处理中编译的语句
-- create default, create function, create procedure, create rule , 
-- create schema, create trigger, create view

-- 下面的语句是无效的
if OBJECT_ID('Sales.MyView', 'V') is not null drop view Sales.MyView;
		-- 此处应该添加一个 go 命令
		
create view Sales.MyView
As 
select YEAR(orderdate) as orderyear, COUNT(*) as numorders
from Sales.Orders
group by YEAR(orderdate);
go

-- 以上批处理中 if 和 create view共同存在，是错误的。
-- 解决方法是在 if 语句后添加一个 go 命令。


-- 批处理是语句解析的单元
-- 批处理是语句解析的单元，这意味着检查数据对象和列是否存在是在*不同的批处理*上进行的。
-- 当设计批处理的边界时，应该牢记这一事实。


-- GO n 选项
-- 正整数n表示GO 之前的批处理将执行指定的次数。

set nocout on;  -- 该会话选项，可以得知DML语句执行时显示受影响的行数。


 
 
/* 流程控制元素
 */
  
-- T-SQL使用的是三值逻辑（true, false, unknown）
  
  
-- IF ... ELSE 流程控制
  
-- 可以在 IF ... ELSE流程中运行多条语句，则可使用语句块。
  
-- 语句块：
-- 语句块的边界是用一对begin 和 end 关键字标识的。
  
  
-- while 循环
-- while ... begin ... end



/* 
 *  游标
*/
-- 不带 order by 子句的查询返回的是一个集合（或多集）
-- 而带 order by 子句的查询返回的是一种ANSI称为游标的对象，因为这种结果的行之间具有固定的顺序，所以不是关系的结果（集合是不要去顺序的）


-- 游标这一术语的使用仅限于表达一种概念。
-- T-SQL也支持一种称为游标的对象，可以用它来处理查询返回的结果集中的各行，以指定的顺序一次只处理一行。
-- 这种处理方式与使用基于集合的查询（不带游标的普通查询）相反，普通的查询是把集合或多集作为一个整体来处理，不依赖任何顺序。


-- 建议使用基于集合的查询，而非游标。因为：
-- 使用游标严重违背了关系模型
-- 游标逐行对记录进行操作会带来一定的开销
-- 与基于集合的解决方案相比，它的代码更长，更难以维护。



-- 使用游标通常涉及以下步骤：
-- 1. 在某个查询的基础上声明游标
-- 2. 打开游标
-- 3. 从第一个游标记录中把列值提取到指定的变量
-- 4. 当还没有超出游标的最后一行时(@@fetch_status函数返回0时)，循环遍历游标记录
-- 5. 关闭游标
-- 6. 释放游标


-- 示例代码略





/*
 * 临时表
*/
-- sql server支持3种临时表：局部临时表，全局临时表，表变量。
-- 所有三种类型的临时表都是在tempdb数据库中创建的；即有对应的表作为物理表示，而非只存在与内存中。


-- 局部临时表：
-- 创建局部临时表，只需要在命名时以单个数字符号(#)作为前缀就行，如 #T1

-- 局部临时表只对创建它的会话在创建级和调用堆栈内部级是可见的。



-- 全局临时表：
-- 全局临时表，对其他所有会话都是可见的。
-- 当创建临时表的会话断开数据库联接，且没有活动引用全局临时表时，则该表会被删除

-- 要创建临时表，只需要在命名时用两个数字符号(##)作为前缀即可。



-- 表变量
-- 表变量使用declare语句声明
-- 它只对当前批处理可见

-- 使用 declare @result table ( "列 类型" );



-- 表类型
-- 通过创建表类型，可以把表的定义保存到数据库中，
-- 在以后定义表变量、存储过程和用户定义函数的输入参数时，可以将表类型作为表的定义而重用。

create type dbo.OrderTotalsByYear as table
(
	orderyear int not null primary key,
	qty int not null
);

declare @MyOrderTotalsByYear as dbo.OrderTotalsByYear;



/*
 * 动态SQL
*/
-- sql server允许用字符串来动态构造T-SQL代码的一个批处理，接着再执行这个批处理。
-- 这种功能称为动态sql。

-- 两者执行动态sql的方法：
-- exec命令： 可能导致sql注入(inject)
-- sp_executesql存储过程： 更安全


-- Simple example of EXEC
DECLARE @sql AS VARCHAR(100);
SET @sql = 'PRINT ''This message was printed by a dynamic SQL batch.'';';
EXEC(@sql);
GO

-- Using EXEC to returned space used of tables in database
USE TSQLFundamentals2008;

DECLARE
  @sql AS NVARCHAR(300),
  @schemaname AS sysname,
  @tablename  AS sysname;

DECLARE C CURSOR FAST_FORWARD FOR
  SELECT TABLE_SCHEMA, TABLE_NAME
  FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_TYPE = 'BASE TABLE';

OPEN C

FETCH NEXT FROM C INTO @schemaname, @tablename;

WHILE @@fetch_status = 0
BEGIN
  SET @sql =
    N'EXEC sp_spaceused N'''
    + QUOTENAME(@schemaname) + N'.'
    + QUOTENAME(@tablename) + N''';';    -- 可以在后面使用print函数将变量的值打印出来看它到底是什么？
	-- print(@sql);
  EXEC(@sql);

  FETCH NEXT FROM C INTO @schemaname, @tablename;
END

CLOSE C;

DEALLOCATE C;
GO

/*    
  SET @sql =
    N'EXEC sp_spaceused N'''
    + QUOTENAME(@schemaname) + N'.'
    + QUOTENAME(@tablename) + N''';';

-- 最后@sql的值是多少，直接使用 print 打印出来即可。


-- 解析方法，先去掉所有N 
-- 加号 + 是用来隔开每个字符串的，提取出每个字符串
'EXEC sp_spaceused ''' 表示字符串 exec sp_spaceused ' 

-- N'' 由于在' '中要使用' 需要用到两个连续的 '' 
*/

-- quotename函数，用于分隔输入的值。quotename的第2个参数用于指定用作分隔符的单字符字符串，如果不指定这个参数，
-- 则默认使用方括号。所以如果@tablename的值是N'My Table'，则quotename(@tablename)将返回N'[My Table]'，使变量值成为有效的标识符。



-- sp_executesql存储过程
-- sp_executesql存储过程只支持使用Unicode字符串作为其输入的批处理代码

-- The sp_executesql Stored Procedure

-- Simple example using sp_executesql
DECLARE @sql AS NVARCHAR(100);

SET @sql = N'SELECT orderid, custid, empid, orderdate
FROM Sales.Orders
WHERE orderid = @orderid;';

EXEC sp_executesql
  @stmt = @sql,
  @params = N'@orderid AS INT',
  @orderid = 10248;
GO



```






