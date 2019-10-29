# ASP.NET

标签： .NET

---



早期常用的Web应用程序的体系结构为客户端/服务器(Client/Server,简称C/S)结构。

目前，Web应用程序多采用浏览器/服务器(Browser/Server,简称B/S)

B/S结构的工作原理是：用户在客户端发出请求，要求访问Web服务器的某一页，Web服务器检查文件的扩展名是不是服务器程序要处理的网页(如ASP、JSP、ASP.NET等文件)

> ASP 与 ASP.NET的不同。asp早期采用解释型的脚本语言。asp.net是全新(2002)动态网页制作技术，采用编译型的程序语言，执行速度更快。


## 认识Web程序设计

### ASP.NET的特色

- 网页内容和程序代码分离。(而ASP、JSP、PHP是在HTML代码中直接混合程序代码)
- 多语言支持
- 执行效率高
- 面向对象的特性
- 运行于.NET平台上


### 配置Web程序的运行环境
Web应用程序需要Web服务器才能正常运行。在一个Web服务器上可能运行多个Web应用程序，如果不严格区分程序与程序之间的界限，应用程序之间有可能因互相访问而出现信息混乱、数据丢失等错误。同时，如果其中的一个应用程序崩溃，可能对其他应用程序造成影响。
为了解决这个问题，可以分别为各个应用程序添加虚拟目录，添加虚拟目录后各个应用程序就可以在同一个Web服务器上运行。

通常，IIS中一个虚拟目录下的所有文件组成一个Web应用程序。不同的虚拟目录代表着不同的Web应用程序。

虚拟目录又称为“别名”，以服务器作为根目录。默认情况下，ISS服务器安装在"C:\Inetpub\wwwroot"目录下，他是默认的用于存放应用程序的主目录，该目录对应的URL为"http://localhost"和"http//服务器域名",是将来要访问应用程序的时候要输入的URL地址的一部分。可以通过配置IIS服务器创建虚拟目录。

默认文档： 
IIS默认文档为 default.htm、default.asp、default.aspx。因此wwwroot目录下的这些文件将是使用者登入站点的第一个页面。可以通过IIS服务器改变默认文档。


>IIS 7 支持在同一个Web服务器上有多个根网站，因此我们将创建名为`http://www.example.com/`的网站，它将指向刚才我们的应用程序指定的`C:\BalloonShop\`文件夹。这样新的网站不会影响原有的`http://localhost/`。
>
首先需要在**hosts文件**中添加名为www.example.com的主机。


### 安装并检测Web程序的运行环境
安装IIS：xp系统

【开始；控制面板；添加或删除程序；添加/删除Windows组件；选中Internet 信息服务ISS】

测试：
【新建1-01.aspx文件，里面写一些html语法；保存到D:\WebBook\task1目录】
【开始；控制面板；管理工具；Internet信息服务；打开信息服务控制台；右击当前Web服务器上默认Web站点；新建；虚拟目录；...；输入别名"WebBook"；...点击浏览；找到要指定为虚拟目录的目录"D:\WebBook"；采用默认的访问权限；在浏览器上输入"http://localhost/WebBook/task1/1-01.aspx"】


### 使用VS创建欢迎页面
在VS中：【文件；新建网站；选择ASP.NET网站；语言选择Visual C#;点击浏览按钮；选择一个存放案例的文件夹"WebBook"；确定（即新建了一个名为WebBook的网站）】

【右击解决方案中的WebBook；新建文件夹"task1"】
【右击解决方案中的task1；选择添加新项；在添加新项对话框的，模板中选择，Web窗体；名称输入1-02.aspx；语言选择Visual C#；单击添加】

> VS为网页的开发提供两种视图方式：设计视图和源视图。在设计视图中，程序员可以通过鼠标操作直接设计用户界面的布局。而在源视图中，会自动生成相应的代码；你也可直接在源视图中添加代码来开发网页。

【右键解决方案管理器中的1-02.aspx；选择在浏览器中查看】
也可在解决方案中设置起始页。



### 使用Visual Studio的母版页
ASP.NET 4.0提供了强大的母版页。母版页中的内容将显示在所有的页面中。母版页类似于模板，扩展名是.master。由于这些元素的统一布局，保证了整个程序中所有页面外观的一致性。


页面以母版页为基础，在这些页面中包含除母版页外的非公共的内容部分，这部分称为**内容页**。内容页实际上就是普通的aspx页面。程序运行时，内容页和母版页内容组合在一起，由母版页中的占位符包含内容页中的内容，最后将完整的页面发送给客户端浏览器。


>繁体中： 列表示行，欄表示列


操作：
【右键解决方案管理器中的網站名稱；添加新項；選擇母版頁；更改母版頁名稱；確定】
在新建的母版頁中只有一個容納內容頁的ContentPlaceHolder控件。

在設計視圖中插入表格步驟：【菜單；表格；插入表】

修改表【將光標放在表格中；右鍵修改；拆分單元格】

將ContentPlaceHoleer控件拖入到某單元格中。

新建內容頁，勾選選擇母版頁；選擇之前新建的母版頁。



### HTML表單
表单一般用来收集用户输入的信息，它提供了用户和网站之间进行信息交互的渠道。
表单区域用`<form> </form>`表示。form标记具有action、method、target等属性，其中为了能接受浏览者所发送的数据，在Web服务器内必须有一个服务程序来接收，而action属性则可以指定接收表单数据的程序所在地址；method属性设定表单传输数据到Web服务器时的方法，包括get和post两种方法;target属性则用来指定目标窗口。

常用表单对象包含：

- 文本域：比如输入用户名或输入密码的输入框
- 复选框
- 单选框
- 列表/菜单
- 按钮
- 图像域
- 文件域
- 隐藏域


## 使用ASP.NET服务器控件创建页面

### 了解Web服务器控件

什么是控件？
控件(Control)可以看做一个类库，它把某些功能的属性、方法和实现，封装在一起形成控件。

什么是ASP.NET服务器控件？
ASP.NET服务器控件被用来设计Web页面的用户界面，并且在ASP.NET框架中工作。
一旦客户请求Web页面，ASP.NET 就将这些控件转换成HTML元素，以便在浏览器中显示。

Web控件的功能比较强，它会依Client端的状况产生一个或多个适当的HTML控件，它可自动侦测Client端浏览器的种类，并自动调整成适合浏览器的输出。

Web控件还有一个非常重要的功能，那就是支持数据绑定(Data Binding)；可以和资料源连接，用来显示或修改数据源的数据。

## 错误

### 错误 1
![ASP.Net错误](https://i.imgur.com/8S4p7jm.png "不见图，请翻墙")

解决方法参见： [Visual Studio 2013 中 NuGet 的“无法初始化 PowerShell 主机”错误](http://skydev.cc:8080/archives/817)



ADO.NET是英文ActiveX Data Object for the .NET Framework的缩写；是建立在Microsoft .NET Framework之上的，为编程人员提供数据库访问服务的一种对象模型。

数据模型访问示意图：

```
程序		|	数据访问		|	数据库  	|
------------------------------------------------
			|					|	DB2			|
			|					|	SQL Server	|		
			|					|	Oracle		|
使用C#或	|	数据访问模型	|	MySQL		|	
VB.NET编写	|					|	Access		|

```


## ADO.NET
ADO.NET的结构图：

重要（该图指明了DataAdpter的作用）



根据数据源的不同，选择不同的.NET Framework数据提供程序进行连接。
例如：适用于SQL Server .NET Framework数据库提供程序。


数据访问对象：

|   对象   |      说明		    		|		别名		| 
|--------- |--------------------------- |    ------------   |
|Connection | 建立与特定数据库的连接	| 					|
|Command	| 执行各种访问数据库的命令并返回结果 | 数据命令对象 |
|DataReader | 从数据源中读取只进且只读的记录集 | 数据库读取器 |
|DataSet 	| 支持ADO.NET 断开连接方式访问数据 | 				|
|DataAdapter| 用数据源填充DataSet并解析更新 | 					|




ADO.NET既能在与数据源连接的环境下工作，又能在断开与数据源连接的条件下工作。


ADO.NET访问数据库的途径
```
Connection ——>	Command	 ——>	DataReader ——>	Response Write 
	^			  									|
	|			  途径一(连接时)					|
	v												v
DataBasc						Memory			Browser
	^								^				^
	|			 途径二(断开时)		|				|
	v								v				|
Connection ——>	DataAdapter ——> DataSet ——>		GridView
```

ADO.NET包含对XML标准的完全支持。



要想连接到数据库，首先必须创建一个Connection对象。要连接到SQL Server数据库，需要引入 System.Data.SqlClient 命名空间，并创建一个 SqlConnection 类的实例。（最后需关闭连接）。

```C#
SqlConnection myConnection = new SqlConnection(connStr);  //连接string
myConnection.Open();


SqlCommand myConnand = new SqlCommand(queryStr, myConnection); //查询string
SqlDataReader myDataReader = myCommand.ExecuteReader();
myDataReader.Read();      	//读取一行

myDataReader.Close();		//关闭数据库读取器 ；调用其Cancel()方法可以取消执行。
myConnection.Close();		//关闭数据库连接
```


聚合函数及字符串函数、连接查询、存储过程、事物、T-SQL编程、触发器等数据库开发知识。使用ADO.Net进行增删改查，在程序中执行带参数的SQL语句，封装SQLHelper，ADO.Net连接池概念。



## ASP控件
### DropDownList下拉列表控件
它是常見的數據綁定控件之一，它往往結合其他數據綁定控件一起使用。檔DorpDownList選擇的內容變化時，其他數據綁定控件（如GridView、DataList等）的數據也隨之發生變化。



## Entity Framework
Entity Framework 作为微软 .NET Framework 平台下最知名和应用最广泛的 ORM 框架。它使程序员从繁琐的 SQL 语句操作中解脱出来，专心于程序的逻辑业务等。

极客学院