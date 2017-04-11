# ASP.NET电子商务开发实践 

标签（空格分隔）： .NET

---

最终效果 <http://www.cristiandarie.ro/BalloonShop>

ASP.NET电子商务开发实践 项目跟进

Beginning ASP.NET E-Commerce in C# From Novice to Professional

2017.01.22

fan ： win+123;


balloonshop
Ecommerce2


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

-- 查看db_owner中是否有balloonshop
exec sp_helprolemember db_owner

-- 一定记得提交
commit;
```



[Source code for 'Beginning ASP.NET E-Commerce in C#' by Karli Watson and Cristian Darie]()


[用于服务器核心的 Microsoft .NET Framework 4（独立安装程序）
](https://www.microsoft.com/zh-CN/download/details.aspx?id=22833)注意：大多数用户无需执行服务器安装。 如果您不确定是否执行服务器安装，则执行基本安装即可。请去下载基本包。

- 虚拟机中的WinServer安装IIS
- WinServer中的C:\BalloonShop\文件夹放置网站，启动网站，新建一个index.html用作测试
- 更改虚拟机WinServer和主机的hosts文件，添加`127.0.0.1 www.example.com`
- 设置Vbox的端口代理（仅需添加主机端口和子系统端口即可，IP地址略；此时似乎可以同时通过127.0.0.1和192.168.56.1两个地址来访问*默认*网站的）
- 在主机中输入`www.example.com`可以访问index.html文件。（但不能通过IP地址访问，而IIS默认的网站好像是可以通过IP地址访问）
- 另可创建集成于网站中的FTP站点（Windows服务器书籍）(另添加了个用户以便于连接ftp)。


> 可以使用系统的IIS，也可以使用Visual Studio自带的Web服务器
此处FTP配置不安全。


[无法访问 IIS 元数据库。您没有足够的特权访问计算机上的 IIS 网站](http://blog.csdn.net/u011127019/article/details/50579547)
**我的解决办法是：**进入C:\Windows\System32\inetsrv文件夹，依次点击进入相关子文件夹，有些会提示“获取永久访问该文件夹权限”的对话框 ...
之后即可正常访问IIS元数据库。


- 通过VS“新建网站”|“ASP.NET空网站”|
- Web位置选择“HTTP”(这代表使用系统的IIS)，但提示无法连接到Web服务器
- Web位置可选择FTP但是地址需填写`192.168.56.1`并且去除被动模式才可以(不知为什么)，然后选择了**新建网站...**【当时可能应该先关闭IIS，然后在新建Web时选择创建新网站】
- 由于WinServer上是.NET Framework 3.5，把项目的框架改为.NET Framework 3.5 （或者尝试更新系统，或者安装.NET Framework 4）
- 点击调试，后选择了在目录中新建web.config文件
- 错误提示：若要使他人能够在远程计算机上查看此特定错误消息的详细信息，请在位于当前 Web 应用程序根目录下的“web.config”配置文件中创建一个 <customErrors> 标记。然后应将此 <customErrors> 标记的“mode”属性设置为“Off”。（创建即可）

>[Error: The web server is not configured correctly](https://docs.microsoft.com/en-us/visualstudio/debugger/error-the-web-server-is-not-configured-correctly) 略过。

>[Remote Debugging ASP.NET on a Remote IIS Computer](https://docs.microsoft.com/en-us/visualstudio/debugger/remote-debugging-aspnet-on-a-remote-iis-7-5-computer)





新建数据库：BalloonShop
新建数据库用户：Object Explorer | Security | Logins右键选择New Logins 新建用户balloonshop 密码：ecommerce
取消勾选：Enforce password policy
更改默认数据库为BalloonShop，
在User Mapping(用户映射)处选择BalloonShop，同时勾选下方的db_owner。此时该用户就是BalloonShop数据库的拥有者。

连接时Server name输入：`localhost:\SQLExpress`(不行) 或者直接`(local)`




### 商品目录的结构

2017.01.23

在网站目录添加一个文件夹Images后，在**项目**上右击选择**刷新文件夹**就能看到该文件夹。
使用母版页就需要包含从模板页继承的代码；删除原来的Default.aspx文件，再重新创建，此时勾选“选择母版页”，取消勾选“将代码放在单独的文件中”。


对商品目录的结构的思考：
一个特别重要的细节是，需要考虑一个分类是否可以存在于多个门类中，一个商品是否可以属于多个分类中。

> 专业的做法是在开始编码前编写项目需求文档时确当结构细节。

本项目的商品目录中，每个分类只能存在于一个门类中，但一个商品可以存在于多个分类中。


### 数据层处理

数据库引擎在处理数值类型的排序和查询操作时要比字符串类型快。

索引将能够提高从表中读取数据的速度，但会降低插入、删除、更新操作的速度，在实际的应用程序中，绝大多数的数据库操作都是读取操作，因此使用索引将会明显提高性能。
（插入时并不是要求很快的速度，而查询时一般要处理大量数据）


> 托管存储过程：即用.NET语言编写程序在SQL Server中执行。


存储过程是数据层的一部分，业务层将使用它。

创建一个存储过程使用：Create Proceoure ...
如果这个存储过程已经存在，只是想修改它，可以使用 alter procedure


在.NET中，使用C#代码访问数据库的技术是ADO.NET

1. 打开连接
2. 执行数据库操作，返回结果
3. 关闭数据库


```
connection.ConnectionString = "Server=(local)\SqlExpress;" +
            "User ID=balloonshop; Password=ecommerce;" +  //使用Sql Server认证。如需使用Windows认证将将其改为Integrated Security=True或Integrated Security=SSPI
            "Database=BalloonShop"; 
            
//连接字符串中的几个可以互换的同义字：
// Server  =  Data Source 或 Data Server
// Database =  Initial Catalog
// 还有很长，参考SQL Server 的在线帮助
```

SqlDataReader对象是以顺序向前且只读的形式逐个读取并返回一个包含查询的。优点从数据库读取数据最快的；缺点：操作前要一个已打开的连接，在它关闭前，无法使用同一个连接执行其它任何数据库操作。可以利用他取回数据，并把他存入DataTable中，这样可以马上关闭数据库连接。

>【**深入理解数据库连接**】


DataTable类可以存放本地结果而不需要一个打开的Sql Server连接，DataTable对象的父类是DataSet，他是一个非常强大的类，就像一个“内存中”的数据库；因此他会消耗很多内存，应避免使用。

.Net框架自带的**托管数据提供器**包括(及其命名空间)：Sql Server (System.Data.SqlClient)、Oracle(System.Data.Oracle)、OLE DB （System.Data.OleDb）、ODBC (System.Data.Odbc)

为了使应用程序尽可能和后台数据库分离，需要避免使用特定于某种数据库的类。我们将让应用程序在运行时决定使用哪个提供器，这取决于提供的连接字符串。

使用数据库无关的类，比如使用DbConnection代替SqlConnection；在执行时这些类的对象将通过多态的方法，包含特定于某数据库的不同实例。
这样即使你改变了后端数据库的类型，已编译的代码也无需修改，只要在新的数据库中**也实现那些存储过程即可**。

> 还用到了工厂模式


###4.5.4 捕获及处理异常

- 不严重，在代码中处理
- 严重，尽量减少负面影响，并将错误传递到表示层
- 意料之外的错误，最后的防线仍然在表示层，**记录错误日志**并客气的提醒访问者稍后再访问。

不管出现何种类型错误都应该通知网站管理员。可以把错误的详细信息保存到自定义数据库表或是写入Windows事物日志中，保存在文本文件中，还可以发邮件。

这里将数据访问的错误都视为严重，它会直接关闭数据库连接、记录错误日志并把它传递给表示层；这样可以将潜在的危险降低到最低。

详情见书。



### 发送电子邮件
通过电子邮件把错误报告发送给网站管理员。

如果遇到问题可以先在此网站上看一下<http://www.systemnetmail.com>


#### 编写业务层代码

- GenericDataAccess：包含通用数据库访问代码，实现基本的错误处理和日志功能
- CatalogAccess: 包含与商品目录相关的业务逻辑
- BalloonShopConfiguration ： 提供一种访问各种配置信息的简单方法（通常是从web.config中读取的配置信息），诸如数据库连接字符串等。
- Utilities：包含各种杂项功能，例如发送电子邮件。



