# C sharp 4.0图解教程

标签（空格分隔）： C#

《C# 4.0图解教程》是非常好的一本书。

---

[C# Random 生成不重复随机数](http://www.cnblogs.com/huangfr/archive/2012/03/27/2420464.html)

[C#里面的三种Timer](http://blog.csdn.net/zhu2695/article/details/38582679)
[C# Timer用法及实例详解](http://www.cnblogs.com/xcsn/archive/2013/05/10/3070485.html)
[C#如何使用定时器\[Timer\]](http://jingyan.baidu.com/article/f96699bbae8bcd894f3c1b5e.html)
<http://www.jb51.net/article/42286.htm>

Timer控件
一个Tick事件在前一个Tick事件被处理完毕前不会被触发。你可以直接在Tick事件处理代码中更新控件，


- Main程序的起点。
- C#语言并不能孤立的使用，而必须和.NET Framework一起考虑。C#编译器专门用于.NET，这表示用C#编写的所有代码总是在.NET Framework中运行

.NET Framework的核心是其运行库执行环境，称为公共语言运行库(CLR)或.NET运行库。通常
将在CLR控制下运行的代码称为托管代码 （managed code）。

在CLR执行编写好的源代码之前，需要编译它们。在.NET中，编译分为两个阶段：

1. 把源代码编译为Microsoft中间语言(IL)
2. CLR把IL编译为平台专用的代码。

Microsoft中间语言与Java字节码共享一种理念。它们都是低级语言 ,语法很简单，可以非常快速地转换为本地机器码。对于代码 ,这种精心设计的通用语法有很重要的优点 :平台无关性、**提高性能**和**语言的互操作性**。


**提高性能**

IL总是即时编译的(JIT编译),而Java字节码常常是解释性的。JIT编译器并不是把整个应用程序一次编译完，而是只编译它调用的那部分代码。代码编译过一次后，得到的本地可执行程序就存储起来，直到退出该应用程序为止，这样下次运行这部分代码时，就不需要重新编译了。


**语言的互操作性**
简而言之 ,就是能将任何一种语言编译为中间语言 ,编译为中间语言的代码可以与从其他语言编译过来的代码进行交互操作。


以上来自《C#高级编程》

-----


C#中的数组实现为System.Array 类的实例，它们只是集合类(Collection Classes)中的一种类型。

集合类一般用于处理对象列表，其功能比简单数组要多，功能大多是通过实现System.Collections 名称空间中的接口而获得的。

Systems.Collections 名称空间中的类System.Collections.ArrayList 也实现了IList、ICollection 和 IEnumerable接口，但实现方式比System.Array更复杂。数组的大小是固定的(不能增加或删除元素)，而这个类可以用于表示大小可变的项列表


Animal[] animalArray = new Animal[2];
ArrayList animalArrayList = new ArrayList();


因为数组是引用类型(例如，Animal 和Animal 派生的对象)，所以用一个长度初始化数组并没有
初始化它所包含的项。要使用一个指定的项，该项还需要初始化，即需要给这个项赋予初始化了的
对象：

使用foreach 结构迭代一个数组。这是可以的，因为System.Array 类实现了
IEnumerable 接口，这个接口的唯一方法GetEnumerator()可以迭代集合中的各项。

使用数组的Length 属性，在屏幕上输出数组中元素的个数
也可以使用ArrayList 集合得到相同的结果，但要使用Count属性，该属性是ICollection 接口的一部分

ArrayList 集合是System.Object 对象的集合(通过多态性赋给Animal 对象)，

ArrayList 集合可以用AddRange()方法一次添加好几个项。这个方法接受带有ICollection 接口的
任何对象，包括前面的代码所创建的animalArray 数，而該方法是ArrayList特有的方法。

这个类还提供了其他有
趣的方法，如InsertRange()，它可以把数组对象插入到列表中的任何位置，还有用于排序和重新排
序数组的方法。


最后，再回头来看看对同一个对象进行多个引用。使用IList 接口中的IndexOf()方法可以看出，
myCow1(最初添加到animalArray 中的一个对象)现在是animalArrayList 集合的一部分


### 深複製

淺複製：示例使用受保護的方法System.Object.MemberwiseClone()進行淺複製(shallow copy)。

```c#
public class Cloner
{
    public int Val;
    
    public Cloner(int newVal)
    {
        Val = newVal;
    }
    
    public object GetCopy()
    {
        return MemberwiseClone();
    }
}
```

深複製：修改上面的GetCopy()方法就可，但最好使用標準方式：實現ICloneable接口，該接口有一個`object Clone(){}`方法。

```c#
public class Content
{
    public int Val;
}

public class Cloner: ICloneable
{
    public Content MyContent = new Content();
    
    public Cloner(int newVal)
    {
        MyContent.Val = newVal; //該字段是值類型，不需要深複製
    }
    
    public object Clone()
    {
        Cloner clonedCloner = new Cloner(MyContent.Val);
        return clonedCloner;
    }
    
}
```


这次包含的对象是独立的。注意有时在比较复杂的对象系统中，调用Clone()是一个递归过程。
例如，如果Cloner 类的MyContent 字段也需要深复制，就要使用下面的代码：

```C#
public class Cloner:ICloneable
{
    public Content MyContent = new Content();
    //...
    
    public object Clone()
    {
        Cloner clonedCloner = new Cloner();
        clonedCloner.MyContent = MyContent.Clone();
        return clonedCloner;
    }
}

```





---

## 注意
C\#的不同之處：

- 文件名可以不與類名相同
- Object類型，裝箱：是指值类型与对象类型(Object)类型之间的转换。在装箱后，有两份值：原始值类型和副本的引用类型，每一个都可以独立操作。


《C# 4.0图解教程》

第2章： C\#编程概述

- 命名约定
- 格式字符串
- 多重标记和值
- 文档注释


- Main程序的起点。
- C#语言并不能孤立的使用，而必须和.NET Framework一起考虑。C#编译器专门用于.NET，这表示用C#编写的所有代码总是在.NET Framework中运行

.NET Framework的核心是其运行库执行环境，称为公共语言运行库(CLR)或.NET运行库。通常
将在CLR控制下运行的代码称为托管代码 （managed code）。

在CLR执行编写好的源代码之前，需要编译它们。在.NET中，编译分为两个阶段：

1. 把源代码编译为Microsoft中间语言(IL)
2. CLR把IL编译为平台专用的代码。

Microsoft中间语言与Java字节码共享一种理念。它们都是低级语言 ,语法很简单，可以非常快速地转换为本地机器码。对于代码 ,这种精心设计的通用语法有很重要的优点 :平台无关性、**提高性能**和**语言的互操作性**。


**提高性能**

IL总是即时编译的(JIT编译),而Java字节码常常是解释性的。JIT编译器并不是把整个应用程序一次编译完，而是只编译它调用的那部分代码。代码编译过一次后，得到的本地可执行程序就存储起来，直到退出该应用程序为止，这样下次运行这部分代码时，就不需要重新编译了。


**语言的互操作性**
简而言之 ,就是能将任何一种语言编译为中间语言 ,编译为中间语言的代码可以与从其他语言编译过来的代码进行交互操作。


以上来自《C#高级编程》


## 第3章：类型、存储和变量
如果广泛的描述C和C++程序源代码的特征，可以说C程序是一组函数和数据类型，C++程序是一组函数和类，然而C#程序是一组类型声明。


### 类型是一种模板
既然C#程序就是一组类型声明，那么学习C#就是学习如何创建和使用类型。可以把类型想象成一个用来创建数据结构的模板。模板本身不是数据结构，但它详细说明了由该模板构造的对象的特征。

### 预定义类型
C#提供了16种预定义类型(名称都是由全小写的字母组成)，包括13种简单类型和3种非简单类型。

decimal 高精度小数类型。与float和double不同，decimal类型可以准确的表示分数。decimal类型常用于货币的计算。

一种Unicode字符类型char。

布尔类型bool，bool类型表示布尔值并且必须为true或false中的一个。


**3种非简单类型：**
string ， 是一个Unicode字符数组。
object， 所有其它类型的基类。
dynamic，使用动态语言编写的程序集时使用。


所有的预定义类型都直接映射到底层的.NET类型。C#的类型名称就是.NET类型的别名。


### 静态类型和dynamic关键字
变量的类型在编译的时候确定并且不能在运行时修改。这叫做静态类型。


dynamic关键字代表一个特定的、实际的C#类型，它知道如何在运行时解析自身。也就是说，它是动态化的静态类型。（类型在运行时才会被解析）


### 可空类型
在某些情况下，特别是使用数据库的时候，你希望表示变量目前未保存有效的值。对于引用类型，这很简单，可以把变量设置为null。但定义值类型的变量时，不管其内容是否有有效的意义，其内存都会进行分配。

对于这种情况，你可能会使用一个布尔指示器来和变量关联，如果值有效，这设置为true，否则就设置为false。

可空类型允许创建可以标记为有效或无效的值类型，这样就可以在使用它之前确定值的有效性。普通的值类型称为非可空类型。


#### 创建可空类型
可空类型总是基于另一个已声明类型，这个类型称为底层类型。

- 你可以从任何值类型创建可空类型，包括预定义的简单类型。
- 不可以从引用类型或其它可空类型创建可空类型。
- 不需要在代码中显式声明可空类型。只需声明其变量即可，编译器会自动为你隐式创建可空类型。
- 创建可空类型的变量，只需在变量声明中在底层类型的名字后增加一个问号。如： int? myNInt = 28;
- 读取可空类型变量时需保证变量不是null。要检查可空类型是否包含值，只需要和null比较。
- 在非可空类型和其非可空版本之间存在隐式转换。
- 在可空类型和其非可空版本之间存在显示转换。
- 可为可空类型的变量赋3中类型的值：底层类型的值，相同可空类型的值，null值。




## 第5章：方法

### 本地变量
即局部变量。

对比实例变量和本地变量： 

|           |             实例字段        |                  本地变量             |
| -----     | --------------------------- | ------------------------------------- |
| 生存期    | 从实例被创建时开始到实例不在被访问时结束| 在被声明开始，到代码块结束 |
| 隐式初始化 | 初始化成该类型的默认值     | 没有隐式初始化 |
| 存储区域 | 类的字段都存储在堆里         | 值类型： 存储在栈里。 引用类型：引用存储在栈里，数据存储在堆里|


### 类型推断和var关键字
```
static void Main(){
  int total = 15;
  MyExcellentClass mec = new MyExcellentClass();
  。。。
}
```

观察上面的代码，但在声明的开始部分提供类型名时，你提供的是编译器能从初始化语句的右边推断出来的信息。

- 在第一个变量声明中，编译器能 推断出15时int类型。
- 在第二个声明中，右手边的对象创建表达式返回了一个MyExcellentClass类型的对象。

所以在这两种情况中，在声明的开始部分包括显示的类型名是**多余的**。


可以在变量声明的开始部分的显示类型名的位置使用新的关键字var，如： 
```
static void Main(){
  var total = 15;
  var mec = new MyExcellentClass();
  。。。
}
```

var关键字并不是某种特别类型的符号；它只是句法上的速记，表示任何可以从初始化的右边推断出的类型。

使用var关键字的条件：

- 只能用于本地变量，不能用于字段；
- 只能在变量声明中包含初始化时使用；
- 一旦编译器推断出变量的类型，它就是固定且不能更改的。



### 本地常量

- 本地常量在声明时必须初始化。初始化值必须在编译期决定(不能是对象的引用，因为它是在运行时决定的)
- 常量在声明后不能改变
- const






## 第6章： 

### 成员常量
用于初始化成员常量的值在编译期必须是可计算的，而且通常是一个预定义的简单类型或由它们组成的表达式。

> C#中没有全局常量。每个常量都必须声明在类型内。


**常量就像静态量**
成员常量比本地常量更有趣，它们表现得就像静态变量。它们对类的每个实例都是“可见的”，而且即使没有类的实例它们也可以使用。


```
class X {
  public const double PI = 3.1416;
}

class Program{
  static void Main(){
    Console.WriteLine("pi={0}", X.PI);  //直接使用 PI 
  }
}

```

成员常量没有自己的存储位置，而是在编译时被编译器替换。这种方式类似于C++中的#define值。虽然常量成员表现像一个静态量，但不能声明一个常量为static。




### 属性
属性是代表类的实例或类中的一个数据项的成员。使用属性看起来非常像写入或读取一个字段，语法是相同的。

然而属性与字段的不同之处是，属性是一个函数成员。

- 它不为数据存储分配内存。
- 它执行代码。

属性是指定的一组两个匹配的、称为访问器的方法。

- set 访问器用于为属性赋值
- get 访问器用于从属性获取值

访问器不能被直接调用。











## 第9章：语句

### using语句

--------------------

以上为最初的笔记

------------------



#### 文件IO
FileStream(string path, FileMode mode)
mode由FileMode枚举定义的值指定。

字节

#### 基于字符的文件IO操作
基于字符的数据流。字符数据流的优势在于它们可以直接操作Unicode字符。
一般来说，要执行基于字符的文件操作，必须把FileStream类包装在StreamReader类或StreamWriter类中。这样，这些类就可以自动将字节数据转换为字符数据流，反之也许。

StreamWriter(Stream stream)
如果stream指定的数据流未打开以进行输出，或为空都会抛出异常。

关闭StreamWriter时也会关闭底层系统。

也可直接用StreamWriter打开文件:
StreamWriter(string path)
StreamWriter(string path, bool append)
如果文件不存在，则创建文件。


MemoryStream类：从数组中读取输入或把输出写入一个数组。



## LINQ

保存在類對象或結構中的數據和保存在數據庫中的數據差異很大。然而使用LINQ可以很輕鬆的查詢對象集合。

- LINQ（發音為link）代表語言集成查詢（Language Integrated Query）
- LINQ是.NET框架的擴展，它允許我們使用SQL查詢數據庫的方式來查詢數據集合。
- 使用LINQ，你可以從數據庫、程序對象的集合以及xml文檔中查詢數據。


對於每一種數據源類型，在其背後一定有根據該數據源類型實現LINQ查詢的代碼模塊。這些代碼模塊叫做LINQ提供程序(provider)
如： LINQ to Objects、LINQ to XML、BLINQ(ASP.NET)...


### 匿名類型
匿名類型經常用於LINQ查詢的結果中。

一般的對象創建表達式由三部份組成：new關鍵字、類名或構造函數、對象初始化語句(對象初始化語句在一組大括號內包含了以逗號分隔的成員初始化列表)。

創建匿名類型的變量使用相同的形式，但沒有類名和構造函數。匿名類型的**對象**創建表達式：

    new {FiledProp = InitExpr, FiledProp = InitExpr, ...}

創建和使用匿名類型的示例：

    static void Main()
    {
        var student = new {Name="Mary Jones",Age=19,Major="History"};
    }

- 匿名類型只能和局部變量配合使用，不能用於類成員
- 由於匿名類型沒有名字，我們必須使用var關鍵字作為變量類型
- 不能設置匿名類型對象的屬性(它是只讀的)。
- ...


### 方法語句和查詢語句
可以使用兩種LINQ查詢語法：查詢語法和方法語法。

- 方法語法(method syntax)使用標準的方法調用。這些方法是一組叫做標準查詢運算符的方法。它是命令式的，它指明了查詢方法調用的順序。
- 查詢語法(query syntax)看上去和SQL語法很相似。他是聲明式的，查詢描述的是你想返回的東西，但並沒有指明如何執行這個查詢。編譯器會將使用查詢語法表示的查詢翻譯為方法調用的形式。推薦使用查詢語法。


### 查詢變量
LINQ查詢可以返回兩種類型的結果：；

- 枚舉，它滿足查詢參數的項列表。可以顯示定義查詢變量的類型（IEnumerable<T>和T的類型），也可以使用var關鍵字。
- 標量(單一值)

查詢變量的用法（區別在與查詢執行的時間）：

- 如果查詢表達式返回枚舉，查詢一直到處理枚舉時才會執行。
- 如果枚舉被處理多次，查詢就會執行多次。
- 如果在進行遍歷之後，查詢執行之前數據有變動，則查詢會使用新的數據。
- 如果查詢表達式返回標量，查詢立即執行，并把結果保存在查詢變量中。


### 查詢表達式的結構

- 子句必須按照一定的順序出現
- form子句和select ... group 子句是必須的。

from子句指定作為數據源使用的數據集合。它還引入了迭代變量，迭代變量逐個表示數據源的每一個元素。

LINQ的from子句和fereach語句非常相似，但主要的不同點如下：

- foreach語句在遇到代碼時就執行其主體，而from子句什麼也不執行。它創建一個用於保存查詢變量的可枚舉對象。查詢本身會在之後的代碼中被執行或不被執行。
- foreach語句明確指定集合中的項需要按照次序，從第一個到最後一個。而from子句只是聲明性的規定了必須考慮集合中的每一項，不規定其順序。

>from子句： from Type Item in Items
join子句： join Identifier in Collection2 on Field1 equals Field2
聯結：Student類和CourseSrudent類這兩個類的對象中都有學號字段。這兩個類的數組就可以通過學號進行聯結。

查詢主體中的from...let...where片段：
```
let Identifier = Expression  //賦值
where BooleanExpression
from Type Identifier in Expression JoinClause
```

orderby子句： 可通過ascending和descending關鍵字顯式的設置元素的排序。

select ... group 子句：
select子句和group...by子句。

查詢延續：into
```
var someInts = from a in groupA
                join b in groupB on a equals b
                into groupAandB         //查詢繼續
                from c in groupAandB
                select c;
```


### 標準查詢運算符
標準查詢運算符由一系列叫做API的方法組成，它能讓我們查詢任何.NET數組或集合。

- 被查詢的集合對象叫做序列，它必須實現IEnumerable<T>接口
- 標準查詢運算符使用方法語法
- 一些運算符返回IEnumerable對象，而其他的一些運算符返回標量。（返回標量的運算符立即執行，返回替代可枚舉對象的值會被延遲迭代）。

Sum和Count運算符： numbers.Sum(); numbers.Count();

47個標準查詢運算符可以分成14個不同的分類。

運算符還有查詢表達式形式不能提供的附加功能。例如聚合。
然而，查詢表達式和方法語法這兩種表達式也可以組合。


#### 標準查詢運算符的籤名
System.Linq.Enumerable類聲明了標準查詢運算符方法。然而，這些方法不僅僅只是一些方法，它們是擴展了IEnumerable<T>泛型的**擴展方法**(7、19章介紹了擴展方法)。

Count、First、Where運算


>LINQ to DataSet 
参考：《ADO.NET 4从入门到精通》
System.Data.DataSetExtensions

ADO.NET包含的max()函数可以作用与字符串

窗口函数


## 第16章 转换

### is运算符
强制转换可能会失败抛出异常；可以用is运算符来检查转换是否会成功完成，从而避免盲目尝试转换。

is只能用于引用转换、拆箱转换和装箱转换。

### as运算符
as运算符和强制转换运算符类似，只是它不抛出异常。如果转换失败，它返回null而不是抛出异常。

as只能用于引用转换和装箱转换。


## 第29章 其它主题

### string字符串
C#预定义的string类型代表了.NET的System.String类。

- 字符串是Unicode字符串数组
- 字符串是不可变的(immutable)

对于一个string，任何“改变”都会分配一个新的恒定字符串。

Split()方法的使用示例：

```C#
string s1 = "hi there! this, is: a string.";
char[] delimiters = {' ' , '!', ',', ':', '.'};
string[] words = s1.Split(delimiters, StringSplitOptions.RemoveEmptyEntries);
```



#### 检测是否为空或null
使用string的IsNullOrEmpty()静态方法

string.Empty ： string自帶的Empty屬性

#### 字符串集合
StringCollection类

#### StringBuilder类：
它可以帮助你动态、有效的产生字符串，并且避免创建许多副本。（带有一个缓冲区，在其快用完时会分配更大的缓冲区）

#### 把字符串解析为数据值
所有预定义的简单类型都有一个叫**Parse的静态方法**，它接受一个表示这个类型的字符串值，并且把它转换为类型的实际值。Parse不是一个方法，而是目标类型实现的很多个方法。

```C#
    double d1 = double.Parse("25.87");
```

Parse方法的缺点是如果不能把string成功转换为目标类型就会抛出异常。TryParse方法可以避免。TryParse方法的注意事项：

。。。

將其他類型值轉換為string可以嘗試 `"" + intValue`

### 文档注释

### 嵌套类型(内部类)



## 文件系统数据

```C#
/* 字符串的前缀@表示这个字符串应该逐个字符的解释，及把"\"解释为"\"
 * 而不解释为转义符。
 * 如果没有前缀@，就需要使用"\\"代替"\"
 */
FileInfo aFile = new FileInfo(@"C:\Log.txt");
```

File和Directory都为**静态类**，包含大量静态方法。（少许操作）

FileInfo和DirectoryInfo不是静态方法。（适用于大量操作时）

以上四个两两对应的类大多数方法的作用相同。


FileStream操作字节和**字节数组**。 FileMode枚举值。

StreamReader或StreamWriter操作字符数据。

File和FileInfo类都提供了OpenRead()和OpenWrite()方法，更易于创建FileStream对象。

FileStream类维护内部文件指针。Seek()方法；SeekOrigin枚举表示3个位置。


```C#
static void Main(string[] args)
{
    byte[] byData = new byte[200];
    char[] charData = new Char[200];
    
    try
    {
        //为什么这里是用斜杠 / 而非 \
        FileStream aFile new FileStream("../../Program.cs", FileMode.Open);
        //从开始位置向前移动113个字节（随机访问文件）
        aFile.Seek(113,SeekOrigin.Begin);
        //将接下来的200个字节读入到byData中
        aFile.Read(byData, 0, 200);
    }
    catch(IOException e)
    { 
        Console.WriteLine(e.ToString());
        //等待一个按键
        Console.ReadKey();
        return; 
    }
    
    //基于UTF-8编码方式创建了Decoder对象
    Decoder d = Encoding.UTF8.GetDecoder();
    //提取字节数组，将它转换为字符数组。
    d.GetChars(byData, 0 , byData.Length, charData, 0);
    
    //写入数据时可以使用对应的Encoder对象的GetBytes()将其转换为字节数组
    
    Console.WriteLine(charData);
    Console.ReadKey();
}
```


可以把FileStream对象包装在StreamWriter或StreamReader中，由它们处理字符，它们处理底层的转换，向FileStream对象读写数据。

```C#
//利用现有FileStream对象创建
FileStream aFile = new FileStream("Log.txt", FileMode.CreateNew);
StreamWriter sw = new StreamWriter(aFile);

//直接从文件中创建。注意参数true 类似 Open；false 类似 Create
StreamWriter sw = new StreamWriter("Log.txt", true);
```

创建StreamWriter对象时根本没有指定FileMode的参数，而且没有设置FileAccess属性的选项。如果需要指定这些参数，必须先在FileStream构造函数中指定，然后再进行包装。



### StreamReader读取用分隔符分隔的文件
最常见的分隔符是逗号","，例如Excel、Access数据库、Sql Server数据库中的数据都可以导出为用逗号分隔的值(CSV)文件。

下面这段代码可以直接拿来处理用逗号分割的值：

```c#
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace CommaValues
{
    class Program
    {
        private static List<Dictionary<string, string>> GetData(
   out List<string> columns)
        {
            string line;
            string[] stringArray;
            char[] charArray = new char[] { ',' };
            List<Dictionary<string, string>> data =
               new List<Dictionary<string, string>>();
            columns = new List<string>();

            try
            {
                FileStream aFile = new FileStream(@"..\..\SomeData.txt", FileMode.Open);
                StreamReader sr = new StreamReader(aFile);

                // Obtain the columns from the first line.
                // Split row of data into string array
                line = sr.ReadLine();
                stringArray = line.Split(charArray);

                for (int x = 0; x <= stringArray.GetUpperBound(0); x++)
                {
                    columns.Add(stringArray[x]);
                }

                line = sr.ReadLine();
                while (line != null)
                {
                    // Split row of data into string array
                    stringArray = line.Split(charArray);
                    Dictionary<string, string> dataRow = new Dictionary<string, string>();

                    for (int x = 0; x <= stringArray.GetUpperBound(0); x++)
                    {
                        dataRow.Add(columns[x], stringArray[x]);
                    }

                    data.Add(dataRow);

                    line = sr.ReadLine();
                }

                sr.Close();
                return data;
            }
            catch (IOException ex)
            {
                Console.WriteLine("An IO exception has been thrown!");
                Console.WriteLine(ex.ToString());
                Console.ReadLine();
                return data;
            }
        }

        static void Main(string[] args)
        {
            List<string> columns;
            List<Dictionary<string, string>> myData = GetData(out columns);

            foreach (string column in columns)
            {
                Console.Write("{0,-20}", column);
            }
            Console.WriteLine();

            foreach (Dictionary<string, string> row in myData)
            {
                foreach (string column in columns)
                {
                    Console.Write("{0,-20}", row[column]);
                }
                Console.WriteLine();
            }
            Console.ReadKey();
        }
    }
}

```
