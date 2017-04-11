# C#笔记

标签： C#

打开程序：Program.cs中的main方法中创建Main对象， Main.cs文件内的 Main:Form 的默认构造函数被调用，
从而调用Main.Designer.cs中的Main类的 InitializeComponent()方法对组件进行初始化。
当Main被加载时，会触发Main_Load()方法被调用。




//初始化组件的方法
InitializeComponent(){

初始化对象：        
private System.Windows.Forms.ToolStripMenuItem mI客退追朔ToolStripMenuItem;


调用AddRange(
mI客退追朔ToolStripMenuItem，
...
)
}



两个组件： menuStrip 和 StatusStrip 

MenuStrip 中包含 ToolStripMenuItem

StatusStrip 中包含3个 ToolStripStatusLabel



### 单词
barcode 条码
two-dimensional barcode  二维码
defect缺陷



### 品质不良录入

命令空间：namespace MITVBarcode

品质不良录入：对应的类 MIDEFECT ，点击事件处理函数 MIDEFECT(object sender, EventArgs e)
该类位于：RMADEF.cs文件中。



## 第8章：委托、Lambda表达式

### 委托 

### Lambda表达式 

### 事件



## 第11章：LINQ


## 第16章：Visual Studio 2010



## 30章: 核心ADO.NET

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
|DataAdapter| 用数据源填充DataSet并解析更新 | 					




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


#### DataSet和DataAdapter对象的使用方法






### System.Data.SqlClient 名稱空間  
使用ADO.NET訪問C#中的數據

System.Data 名稱空間中定義的標準接口:

SqlConnection連接數據庫
SqlCommand用作SQL語句或存儲過程調用的包裝器
SqlDataReader用作只向前的連接數據讀取器.


ADO.NET类最重要的功能是:它们是以断开连接的方式工作,这在目前以Web为中心的环境
中非常重要。我们常常把服务(例如在线书店)构建为连接到一个服务器,检索一些数据,再在客户
端上处理这些数据,之后重新连接服务器,并把数据传递回去,进行处理。ADO.NET的断开连接
的本质就可以启用这种操作。(他們都脫機處理數據庫)

使用 SqlConnection類連接數據庫. 




#### 高效的使用連接
在.NET中使用"稀缺"的資源時,最好確保每個資源在使用完成后立即釋放.


1. 使用using子句確保在退出塊后立即釋放實現IDisposable接口的對象.

using (SqlConnection conn = new SqlConnection(source)){
	conn.Open();
	//Do Something useful
}

無論塊是如何退出的,using子句都會確保不關閉數據庫連接.

但是,应确保像这样的任何资源尽可能早地释放。因为在块的其余部分可能有更多的
代码,而没有必要锁定资源。


另外,如果在using块中出现了异常,

2. 使用try...catch...finally語句塊.

#### 命令
命令就是一個要在數據庫上執行的包含SQL語句的文本字符串.

把SQL子句作為一個參數傳遞給Command類的構造函數,就是一條命令.


sql Connection conn = new SqlConnection(source);
conn.Open();
sqlCommand cmd = new SqlCommand(select,conn);


#### 執行命令
SqlDataReader reader = cmd.ExecuteReader(); //執行命令,返回一個類型化的IDataReader 
while(reader.Read()){}


这个方法执行命令,并根据使用的提供程序返回一个类型化的DataReader对象,返回的对象可
以用于遍历返回的记录






EXecuteNonQuery()方法:执行命令,但不返回任何结果. 这个方法一般用于update、 insert和delete语句,
其中唯一的返回值是受影响的记录个数.



### 管理數據和關係: DataSet類

DataSet类是数据的脱机容器。它不包含数据库连接的概念,实际上存储在Dadet类中的数据
不一定来源于数据库,它可以是来自CsV文件、XML文件的记录,或是从测量设备中读取的点


DataSet类由一组数据表组成,每个表都有一组数据列和数据行,除了定义数
据外,还可以在DataSet类中定义表之间的链接.



重点是记住,DataSet类基本上是内存中的数据库,其中包含了所有表、关系和约束


數據表: DataTable對象

數據列: DataColumn

數據行: DataRow


SqlDataAdapter类,它用于把数据置入DataSet中.

SqlDataAdapter类,用於存儲select,insert,update和delete命令的類,因此可以用於填充DataSet和更新數據庫.





datareader对象提供只读单向数据的快速传递，
单向:您只能依次读取下一条数据;只读:DataReader中的数据是只读的,不能修改;
相对地,DataSet中的数据可以任意读取和修改




### CombBox
Items 設置, 在屬性窗口中點擊Items值處,在彈出的字符串集合編輯器中每行一個Item進行輸入.



### 屬性編輯器



### 控制台輸出
Console.WriteLine(“格式”,对象1，对象2);


{0，-8}   输出第一个参数，且值占8个字符宽度，且为左对齐

{1，8}    输出第二个参数，且值占8个字符宽度，且为右对齐














































