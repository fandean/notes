---
layout: post
title: "MSSQL DataBase"
description: "MSSQL DataBase安装和维护"
date: 2016-12-10
tags: [DataBase]
category: DataBase
comments: true
share: true
---

* Kramdown table of contents
{:toc .toc}


# MSSQL DataBase



Sign up for **Visual Studio Dev Essentials** and download ?    
Read the SQL Server 2016 licensing datasheet    

[SQL Server 中WITH (NOLOCK)浅析](http://www.cnblogs.com/kerrycode/p/3946268.html)


### 工具

**[sqlcmd 实用工具](https://msdn.microsoft.com/zh-cn/library/ms162773.aspx)**  
Windows中安装该软件Microsoft Command Line Utilities 13.1 for SQL Server其安装包为MsSqlCmdLnUtils.msi。依赖于
[Microsoft ODBC Driver 13.1 for SQL Server ](http://go.microsoft.com/fwlink/?LinkId=825608)

安装后运行提示：      
Sqlcmd: Error: Microsoft ODBC Driver 13 for SQL Server : SQL Server Network Interfaces: 安全包中没有可用的凭证  
Sqlcmd: Error: Microsoft ODBC Driver 13 for SQL Server : Cannot generate SSPI context.

可以忽略该错误提示。

[使用 sqlcmd 实用工具](https://msdn.microsoft.com/zh-cn/library/ms180944.aspx)



**ODBC驱动程序：**  

[创建与 ODBC 数据源的连接](https://msdn.microsoft.com/zh-cn/library/aa984313\(v=vs.71\).aspx) 在服务器资源管理器中创建连接。     
[连接字符串关键字和数据源名称 (DSN)](https://msdn.microsoft.com/zh-cn/library/hh568455\(v=sql.110\).aspx)   

> 在服务器资源管理器中建立了与 ODBC 数据源的连接之后，只需轻松地将数据对象从服务器资源管理器拖到窗体或设计器上，即可创建 OdbcConnection、OdbcDataAdapter 和 OdbcCommand 对象。


### SQL Server 2016 Express LocalDB
[SQL Server 2016 Express LocalDB](https://msdn.microsoft.com/library/hh510202.aspx) 注意数据文件的保存位置。



**Starting LocalDB and Connecting to LocalDB**


1. [演练：创建 LocalDB 数据库](https://msdn.microsoft.com/zh-cn/library/ms233763\(v=vs.110\).aspx)   
2. [演练：连接到 SQL Server Express LocalDB 数据库中的数据（Windows 窗体）](https://msdn.microsoft.com/zh-cn/library/ms171890\(v=vs.110\).aspx)  



[在 Visual Studio 中访问数据](https://msdn.microsoft.com/zh-cn/library/wzabh8c4.aspx)   
[开放式数据库连接 (ODBC)](https://msdn.microsoft.com/zh-cn/library/s9ds2ktb.aspx)   


**连接到 SQL Server Express LocalDB**

1. Open command prompt
2. Run "SqlLocalDB.exe start"
3. System response "LocalDB instance "mssqllocaldb" started."
4. In VS， View/Server Explorer/(Right click) Data Connections/Add Connection
5. Data Source: Microsoft SQL Server (SqlClient)
6. Server name: (localdb)\MSSQLLocalDB
7. Log on to the server: Use Windows Authentication
  Press "Test Connection", Then OK.









## SQL Server

学习资料顶层目录：[MSDN Library: Microsoft SQL Server](https://msdn.microsoft.com/zh-cn/library/mt590198\(v=sql.1\).aspx)但是此处不大好找你想要的资料；事先要对其结构有所了解。

MSDN \| 服务器和企业开发 \| SQL Server \| SQL Server 2014 \| 产品文档 \| SQL Server 2014联机丛书 \| ...

看来SQL Server 2014版的联机丛书介绍的更详细，更容易找到想要的内容。例如： \|SQL Server 2014联机丛书 \| [数据库引擎(可以從這裡出發)](https://msdn.microsoft.com/zh-cn/library/bb500155\(v=sql.120\).aspx#) \| 数据库引擎功能和任务。这里的内容不错。还有其子目录 “数据库引擎实例”下的内容（比如服务器网络配置）。


> [适用于 SQL Server 的 Microsoft JDBC Drivers 6.0、4.2、4.1 和 4.0
> ](https://www.microsoft.com/zh-CN/download/details.aspx?id=11774 "或使用Google搜索最新的驱动版本")；可查看下载的压缩包中各jar包对应的sqlServer版本。
> 或见: [Microsoft JDBC Driver for SQL Server](https://msdn.microsoft.com/library/mt484311.aspx)



## 行列转换
>参考：
>[SQL Server 实现行列（纵横表）转换](http://www.codeceo.com/article/sql-server-row-column-change.html)
>
>[ SQL Server 行列转换示例](http://blog.csdn.net/tjvictor/article/details/5186360 "查看其Sql Server 2008系列文章")
>[SQL Server 批量插入数据的两种方法](http://blog.csdn.net/tjvictor/article/details/4360030)
>[SQL Server 中使用参数化Top语句](http://blog.csdn.net/tjvictor/article/details/4327382)
>
>[MySQL中行列转换的SQL技巧](http://cenalulu.github.io/mysql/column-row-reverse/)
>
>[SQL Server 行列转换](http://codecloud.net/36646.html "排版不错")
>[15 个常用的 SQL Server 高级语法](http://codecloud.net/5279.html "不错，提前看")
>
>[重温SQL——行转列，列转行](http://www.cnblogs.com/kerrycode/archive/2010/07/28/1786547.html)
>[SQL行转列汇总](http://www.cnblogs.com/maanshancss/archive/2013/03/13/2957108.html)





## Transact-SQL
Transact-SQL（又稱T-SQL）

[Transact-SQL 语法约定](https://msdn.microsoft.com/zh-cn/library/ms177563(v=sql.120).aspx)

上面链接处使用的测试服务器通常运行ANSI/ISO 1252代码页。有些代码示例使用字母N作为Unicode字符串常量的前缀。如果没有N前缀，则字符串被转换为数据库的默认代码页。此默认代码页可能不识别某些字符。所以最好安装中文版SQL Server 2008 R2带高级功能版。

变量 `@`为局部变量，`@@`为全局变量。


[動態 SQL 威力展示 (1) - 基本概念](https://dotblogs.com.tw/hunterpo/2010/02/05/13488)



### SQL Server的基本使用
极客学院视频


## SQL Server版本
[SQL Server 2016 版本](https://www.microsoft.com/zh-cn/sql-server/sql-server-editions) 功能比较。


| SQL Server 2016版本 | 适用于                                      | 许可模型 | 渠道可用性 | 价格              |
| ----------------- | ---------------------------------------- | ---- | ----- | --------------- |
| 开发人员版             | SQL Server 软件的全功能版本，允许开发人员经济高效地构建、测试和演示基于 SQL Server 软件的应用程序。 | 每用户  | 免费下载  | 免费              |
| Web版              | 面向公用网站的安全、经济高效且高度可扩展的数据平台。仅适用于第三方软件服务提供商。 | -    | 仅托管   | 联系您的托管合作伙伴以了解定价 |
| Express版          | 免费的入门级数据库，非常适合学习以及构建桌面和小型服务器的数据驱动型应用程序（容量大小最多为 10 GB）。 | -    | 免费下载  | 免费版             |
|                   |                                          |      |       |                 |



#### 开发版 SQL Server 2016 Developer Edition (Free!)

- SQL Server 2016 Developer Edition Download
- SQL Server Management Studio (SSMS) is a free integrated environment for working with SQL Server, and releases updated versions almost monthly, so visit the SSMS download page for the latest version. （由原本的170M变为900M）
  This release of SSMS can be installed in the following languages: 仔细查看，是可以选择语言版本的。
- SQL Server Data Tools (SSDT) is also free, and works best with Visual Studio. Visit the SSDT download page for the latest version, where you can also get the free version of Visual Studio 2015 Community.



## SQL Server on Linux

>以下内容基本全都来自于 [**SQL Server on Linux Documentation**](https://docs.microsoft.com/zh-cn/sql/linux/)


Linux版本是： SQL Server vNext CTP 1.2    
Community Technical Preview (**CTP**)  社区技术预览版（CTP） 
**vNext** 是SQL Server 2016的下一个版本  



### 1. 安装 SQL Server

[Install SQL Server on Linux
](https://docs.microsoft.com/zh-cn/sql/linux/sql-server-linux-setup) 包含服务开启和防火墙设置。
>**安装硬件要求：** You need at **least 3.25GB of memory** to run SQL Server on Linux. SQL Server Engine has only been tested up to 256GB of memory at this time.


> 或者直接利用SQL Workbench/J 进行连接：
> 连接字符串：URL=`jdbc:sqlserver://127.0.0.1:1433;` 省略了实例名或端口也是可以连接的。完整连接字符串为：`jdbc:sqlserver://serverName[\instanceName][:portNumber];property=value;property=value`
> 驱动包选择了sqljdbc4.jar。


### 2. 安装 SQL Server tools on Linux

[Install SQL Server tools on Linux](https://docs.microsoft.com/zh-cn/sql/linux/sql-server-linux-setup-tools)
> 第一次安装tools时提示无法解决依赖项；时隔1~2个月后，第二次(2017.01)直接就可以安装了。
>
> 它包含了如下两个工具：
> sqlcmd: Command-line query utility.
> bcp: Bulk import-export utility.



### 3. 连接 connect to the SQL Server

[Connect and query SQL Server on Linux with **sqlcmd**](https://docs.microsoft.com/zh-cn/sql/linux/sql-server-linux-connect-and-query-sqlcmd) 另包含了在Windows平台可用的连接管理工具。
> 比如介绍了Windows平台可用的连接工具：
>
- [SQL Server Management Studio (SSMS)]()
- [Windows PowerShell]()
- [SQL Server Data Tools (SSDT)]()
- [sql-cli](https://www.npmjs.com/package/sql-cli) Cross platform command line interface for SQL Server（需要npm）



sqlcmd使用示例：
```shell
sqlcmd -S 127.0.0.1 -U SA     # -S 服务器地址，-U 指定用户
password:                     # 输入密码
1> SELECT Name from sys.Databases;
2> GO                        # go回车执行上一条语句
3> quit
```






### Develop

介绍了几种工具如何连接和使用，推荐。

比如
Use SSMS on Windows to connect to SQL Server on Linux    
Use the mssql extension for Visual Studio Code    
Use SQL Server Data Tools (SSDT) with SQL Server on Linux    



### Manage
[Manage SQL Server on Linux](https://docs.microsoft.com/zh-cn/sql/linux/sql-server-linux-management-overview)

The mssql-conf tool configures SQL Server on Linux. For more information, see Configure SQL Server on Linux with mssql-conf.


### 迁移Migrate

**此处举例的是迁移 AdventureWorks 示例数据库** （Adventure Works 2014 Full Database Backup.zip）

[Restore a SQL Server database from Windows to Linux](https://docs.microsoft.com/zh-cn/sql/linux/sql-server-linux-migrate-restore-database) 将backup文件进行恢复的方法。



#### 示例代码和示例数据库

安装示例数据库的方法见 ↑ 迁移 章节。

> 新的示例数据库（可能版本太新不适合）
> [AdventureWorks Databases and Scripts for SQL Server 2016 CTP3
> ](https://www.microsoft.com/en-us/download/details.aspx?id=49502) 
> [Microsoft SQL Server Samples(样品)](https://msdn.microsoft.com/library/mt748083\(v=sql.1\).aspx)


Sample databases and sample code:

- They are not installed as part of SQL Server setup by default
- To install them for non-Express editions of SQL Server, see the [CodePlex Web site](http://go.microsoft.com/fwlink/?LinkId=87843)
- To read about support for SQL Server sample databases and sample code for SQL Server Express, see [Databases and Samples Overview](http://go.microsoft.com/fwlink/?LinkId=110391)

> 另见 [安装 AdventureWorks2008 示例数据库](https://msdn.microsoft.com/zh-cn/library/aa992075.aspx)


```
RESTORE DATABASE AdventureWorks
FROM DISK = '/var/opt/mssql/backup/AdventureWorks2014.bak'
WITH MOVE 'AdventureWorks2014_Data' TO '/var/opt/mssql/data/AdventureWorks2014_Data.mdf',
MOVE 'AdventureWorks2014_Log' TO '/var/opt/mssql/data/AdventureWorks2014_Log.ldf'
GO
```

此处需要知道.bak文件中有逻辑名称AdventureWorks2014_Data和AdventureWorks2014_Log文件。
可以通过如下语句查看一个.bak文件中的文件列表：
`RESTORE filelistonly  from disk='d:\master.bak'` 另还有命令`RESTORE headeronly  from disk='d:\master.bak'`获取.bak文件的头部信息。



[Northwind database](https://northwinddatabase.codeplex.com/)

![](http://download.codeplex.com/download?ProjectName=northwinddatabase&DownloadId=269242)


```
restore database Northwind2008
from disk = '/var/opt/mssql/backup/Northwind.bak'
with move 'Northwind' to '/var/opt/mssql/data/Northwind2008.mdf',
move 'Northwind_log' to '/var/opt/mssql/data/Northwind2008_log.ldf'
go
```





### SQL Server 主页

而所有都来自 [SQL Server主页](https://www.microsoft.com/zh-cn/sql-server/)

>
> [SQL Server Blog](https://blogs.technet.microsoft.com/dataplatforminsider/) 
> [Microsoft SQL Server Support Blog](https://blogs.msdn.microsoft.com/sqlblog/) 
> **[SQL Forums](https://social.msdn.microsoft.com/Forums/sqlserver/) 是个好地方**



以下来自Developer标签页（开发人员）   
[developer-tools 不错](https://www.microsoft.com/en-us/sql-server/developer-tools) 即：SQL 开发人员工具

- SQL extension for Visual Studio Code：扩展插件
- SQL Server Data Tools：在Visual Studio中使用的插件
- SQL Server Management Studio
- Command line interface and management tools：包含了 using SqlPackage and SQLCMD
- Data loading and migration(迁移)
- ...







## SQL Server數據庫系統的安装

SQL Server 2008 R2 Express with Advanced Services免费版，并且外加一些高级功能，比如报表功能。

下载地址和相关介绍见：[安装 AdventureWorks 数据库](https://msdn.microsoft.com/zh-cn/library/aa992075.aspx)（AdventureWorks数据库是一个示例数据库而已，它包含了微软网站中教学是要用到的数据库相关文件）该数据库的导入，见下载处的介绍。   
建议到MDSN我告诉你网站下载与服务器操作系统匹配的版本，低版本可能存在兼容性问题。





**安装中功能的选择：**

实例功能和共享功能全部选择。

**实例配置：**

安装默认实例，**默认实例名称**与计算机名称相同。一个计算机只允许一个默认实例，但允许存在多个命名实例。

实例还有ID。

安装了一个默认实例后还可以继续安装命名实例。实例指对外提供的一个数据库引擎。

命名实例的名称：是“计算机名\命名实例名称”

**服务器配置：**

SQL Server代理处选择，nt authority\system      
SQL Server Database Engine，选择nt authority\system   


**数据库引擎配置：**    

身份验证模式处可选择；Windows身份验证模式或者混合模式(SQL Server身份验证和Windows身份验证)

如果选择了Windows身份验证则在：     
还需在，指定SQL Server的管理员处；点击添加当前用户(Windows用户)。
此时下面的sa账户不能用来登录；  

它内置一个SQL Server系统管理员： sa     
它是SQL Server Administrator的缩写。





### SQL Server Management Studio的基本使用

它又称之为SSMS。它将之前2000的企业管理器与查询分析器集成在一起。

**打开SSMS：**
服务器类型选择：数据库引擎；（其它的类型有Reporting Services，Analysis Server，Integration Services，SQL Server Compact Edition）

服务器名称选择：实例名称

身份验证：

**基本使用：**
左边是“对象浏览器”，以树状文件夹形式呈现；最上面的是连接到的**实例**名称。

数据库中包含：系统数据库和用户数据库(ReportServer，ReportServerTempDB，是默认建立的)
展开数据库，右键选择某表，选择查看前200行。

单击新建查询；打开SQL编辑器。


>### SSMS的單獨安裝    
>[Microsoft SQL Server 2008 Management Studio Express  (SSMSE下載)](https://www.microsoft.com/zh-TW/download/details.aspx?id=7593 "請仔細查看安裝指示")    
>[Microsoft® SQL Server® 2008 R2 SP2 - Express Edition
>(Sql Server下載)](https://www.microsoft.com/zh-tw/download/details.aspx?id=30438)   

>[KB968930：Windows XP 更新](http://www.microsoft.com/zh-tw/download/details.aspx?id=16818&751be11f-ede8-5a0c-058c-2ee190a24fa6=True&e6b34bbe-475b-1abd-2c51-b5034bcdd6d2=True)：利用該更新安裝Windows PowerShell 2.0, 由於1.0已經沒有地方下載了，可用2.0代替。
>
>
- 步驟 1：下載並安裝 Microsoft .Net Framework 3.5 SP1。
- 步驟 2：下載並安裝 Windows Installer 4.5。
- 步驟 3：下載並安裝 Windows PowerShell 1.0。

>[Configure the Windows Firewall to Allow SQL Server Access](https://msdn.microsoft.com/zh-cn/library/cc646023.aspx)





#### SQL Server 2008的登录模式
如果sa用户无法进行登录，则需改变身份验证模式，重启服务。由于没有为sa设置密码，之后还需为其设置密码。

步骤：在对象浏览器中点击连接到的实例，右键选择“属性”|安全性|更改服务器身份验证|提示需要重启SQL Server。

重启SQL Server步骤：     
在对象浏览器中右键实例|重新启动

为sa设置密码：      
在对象浏览器中展开*安全性*，双击sa\|状态\|选择启用\|确定。 
**再次**进入sa，为其设置密码。




### SQL Server 服务的开启和关闭
*在SSMS中开启和关闭SQL Server 服务：*直接在实例名上点击右键，选择停止或启动即可。


在SSMS中关闭服务，并且断开连接，再次使用SSMS进行连接是不能连接成功的。   
此时可以通过配置管理器或Windows的服务中开启和关闭SQL Server 服务。   
在配置管理器中将"SQL Server(MSSQLSERVER)"服务启动即可。   



[第2课：从其他计算机进行连接](https://msdn.microsoft.com/zh-cn/library/ms345343(v=sql.120).aspx)      
数据库引擎的默认实例侦听端口 1433，其它命名实例的端口配置见上面的教程。    
[配置 Windows 防火墙以允许 SQL Server 访问](https://msdn.microsoft.com/zh-cn/library/cc646023(v=sql.120).aspx)     

特定端口和动态端口:    

要想允许SQL Server Browser服务，必须打开UDP端口1434。   

使用动态端口时打开对SQL Server的访问：    
在防火墙中新建一个规则类型为**程序**的入站规则。但通过这种方式只能访问一个 SQL Server 实例。   

数据库引擎经常使用的端口处有一个"Transact-SQL 调试器"的端口为TCP端口135。   



>网络命令： netstat


### SQL Server 2008 允许远程连接的解决方法

> **[SQL Server 2008 允许远程连接的解决方法](http://www.dedecms.com/knowledge/data-base/sql-server/2012/0618/1628.html "推荐")**；之前导致失败的原因居然是在配置VBox的NAT模式下的端口转发时填写了错误的端口号，我居然填写成了1434，应该填写为1433（根据教程中的方法查看）



### SQL Server 2008 创建数据库和表
通过SSMS操作，只需要在对象资源管理器中一级一级通过鼠标右键进行添加即可，在保存表结构时会让你输入表的名称。   

若要修改表结构，右键该表选择设计。右键选择列名下的某列名，可以为其添加一些约束。   

如何将两个字段同时设置为主键？   

使用Ctrl键同时选择这两个字段，再右键添加主键。  

向表中插入数据：   

右键选择编辑前200行即可。   


慕課網： 利用聚合函數和Unix產生報表的視頻






# 数据库功能

来自于MSDN的： `··· > 数据库引擎 > 数据库引擎功能和任务 > 数据库功能`

## 数据库

### 分离和附加操作
[数据库分离和附加 (SQL Server)](https://msdn.microsoft.com/zh-cn/library/ms190794.aspx)  

**应用场景：**如果要将数据库更改到同一计算机的不同 SQL Server 实例或要移动数据库，分离和附加数据库会很有用。

分离数据库是指将数据库从 SQL Server 实例中删除，但使数据库在其数据文件和事务日志文件中保持不变。

分离的前提和影响：

- 数据库中不存在数据库快照
- 分离**只读**数据库将会丢失有关差异备份的差异基准的信息。


附加条件：

- 必须首先分离数据库
- 所有数据文件(mdf和ldf)都必须可用。


不建议对“备份和恢复”使用分离和附加。 没有事务日志备份，并且可能会意外删除文件。


### 移动用户数据库
**应用场景：**此方法适用于在**同一 SQL Server 实例**中移动数据库文件。




## 表



## 序列号
[序列号](https://msdn.microsoft.com/zh-cn/library/ff878058.aspx)  

序列是通过使用 CREATE SEQUENCE 语句独立于表来创建的。 其选项使您可以控制增量、最大值和最小值、起始点、自动重新开始功能和缓存以便改进性能。 有关这些选项的信息，请参阅 CREATE SEQUENCE。


>标识列
>IDENTITY（属性）在表中创建一个标识列

## SQL Server 数据库的备份和还原

### 备份和还原
[SQL Server 数据库的备份和还原](https://msdn.microsoft.com/zh-cn/library/ms187048.aspx)   

SQL Server 备份和还原组件为保护存储在 SQL Server 数据库中的关键数据提供了基本安全保障。

差异备份 (differential backup)   

完整备份 (full backup)   


### 大容量导入和导出数据 (SQL Server)
[   大容量导入和导出数据 (SQL Server)](https://msdn.microsoft.com/zh-cn/library/ms175937.aspx)




## 數據庫維護

[服务器性能和活动监视](https://msdn.microsoft.com/zh-cn/library/ms191511\(v=sql.120\).aspx)   
[监视和优化性能](https://msdn.microsoft.com/zh-CN/library/ms189081\(v=sql.120\).aspx)    
[监视资源使用情况（系统监视器）](https://msdn.microsoft.com/zh-CN/library/ms191246\(v=sql.120\).aspx)  
[性能监视和优化工具](https://msdn.microsoft.com/zh-cn/library/ms179428\(v=sql.120\).aspx)   





## 用户管理

创建登录：

```sql
create login wrstanek WITH PASSWORD = 'pwd'
    
-- 更改登录名称
alter login wrstanek with name = stanekwr
-- 更改登录密码
alter login wrstanek with password = 'newPwd'
-- 强制执行密码策略的用法
alter login wrstanek check_policy=ON
```

启用、禁用和解锁登录

```sql
-- 语法
use [master]
go
alter login 'loginName' disable | enable | unlock
go
```

删除登录

```sql
drop login 'loginName'
```


为登录分配角色

使用sp_addsrvrolemember存储过程增加登录到服务器角色,sp_dropsrvrolemember用来删除。

```sql
exec sp_addsrvrolemember 'loginName', 'sysadmin'
```


管理数据库访问和角色的命令

```sql
-- 列出服务器角色成员
sp_helpsrvrolemember ['role']
```


### 一次成功的新建用户


```sql
-- 创建用户见<http://www.cnblogs.com/xwdreamer/archive/2012/06/25/2562828.html>
-- ALTER LOGIN (Transact-SQL)<https://msdn.microsoft.com/zh-sg/library/ms189828.aspx>
-- http://blog.csdn.net/zhouquan2009/article/details/7010387

-- 一定要先切换到数据库 BalloonShop
use BalloonShop
go
-- 创建登录账号（用于连接登录）
create login balloonshop with password='Ecommerce2', default_database=BalloonShop;

-- 创建数据库用户（用于操作数据库），并与登录账号进行映射
create user balloonshop for login balloonshop with default_schema=dbo


-- 添加db_owner角色,则可全权管理BalloonShop数据库
exec sp_addrolemember 'db_owner','balloonshop'

-- 查看db_owner中是否有用户 balloonshop
exec sp_helprolemember db_owner

-- 一定记得提交
commit;
```
