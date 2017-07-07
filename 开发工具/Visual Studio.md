# Visual Studio

标签（空格分隔）： 开发工具

---




## Mono
[Mono for Linux is available for various distributions](http://www.mono-project.com/download/)    
**[Download](http://www.monodevelop.com/download/)**     
[Install MonoDevelop preview via FlatPak](http://www.monodevelop.com/download/linux/)    
[Flatpak](http://flatpak.org/)   



1.安装Flatpak   
On Ubuntu, Flatpak is available through a PPA. To install it, run:   

```
$ sudo add-apt-repository ppa:alexlarsson/flatpak
$ sudo apt update
$ sudo apt install flatpak
```

...


## 安装Visual Studio


[Get Started with Visual Studio](https://docs.microsoft.com/en-us/visualstudio/ide/get-started-with-visual-studio)


## 使用Visual Studio 

[Accessing data in Visual Studio](https://msdn.microsoft.com/en-us/library/wzabh8c4\(v=vs.140\).aspx)

### Visual Studio快捷键
[微软官方文档：Visual Studio 中的默认键盘快捷键](https://msdn.microsoft.com/zh-cn/library/da5kh0wa.aspx)   
[19 个必须知道的 Visual Studio 快捷键](http://www.codeceo.com/article/19-visual-studio-shortcuts.html)   



### Visual Studio 技巧

- 导航控件树：  
更方便的方法：**ESC键**。选中一个控件，然后敲ESC键就会顺着这个控件层次不断的上溯。 
选中一个控件，然后点击**右键**，还会出现 Select …的菜单，可以选中该控件的某个父控件

- 向项目中添加文本文件：
右键该项目 | 添加新项 | 选择“文本文件”。



## Visual Studio 提供了

### 文本编辑器
文本编辑器的IntelliSense功能，它是一个类似与自动补全的功能。
可以手动使用快捷键 `Ctrl + Space` 在需要的时候打开IntelliSense列表框。


### 设计视图编辑器
它可以在项目中放置用户界面和数据访问控件。此时，Visual Studio会自动在源文件中添加必要的C#代码，在项目中实例化这些控件（在.NET中，所有的控件实际上都是特定基类的实例）


### 辅助窗口
它们可以查看和修改项目的各个方面。例如这些窗口可以显示源代码中的类以及Windows窗体和Web窗体类中的可用属性（和它们的初始化值）。也可以使用这些窗口指定编译选项，如代码需要引用哪些程序集。


### 能够在环境中编译


### 集成的调试器


### 集成的MSDN帮助


### 访问其他程序
比如Sql Server，IE。


## 16.1.1 创建项目

编写项目的方式一般是先告诉Visual Studio要创建什么类型的项目，然后Visual Studio会自动生成文件也C#代码，这些文件和C#代码给出该类项目的基本架构。接着用户就可以在其中添加自己的代码了。

例如，如果要构建一个基于Windows GUI界面的应用程序（在.NET中，这称为Windows窗体），Visual Studio就会建立一个文件，其中包含的C#源代码创建了一个基本窗体。这个窗体可以与Windows通信（windows应该指操作系统），并接收事件。它还可以最大化、最小化或重新设置大小，用户只需在其中添加需要的控件和功能。

最后一步，在创建项目时，Visual Studio还设置了提供给C#编译器的编译选项——表示项目是编译为命令行应用程序、库、还是WPF应用程序。它还告诉编译器需要引用的基类库（WPF GUI应用需要引用许多与WPF相关的库）


第一次启动时显示的窗口为 Start Page。回到这一页的方法是，"视图"|"起始页"



1. 选择项目类型： File | New Project
2. 回顾新建的控制台项目：命名空间不是必要的，但不声明名称空间不是好的编程习惯；按F5键编译运行程序。
3. 查看其他项目文件：文件夹 bin和obj存储编译好的文件和中间文件，obj的子文件夹存储各种临时或中间文件，bin的子文件夹存储编译好的程序集。
还有一个包含AssemblyInfo.cs文件的Properties文件夹。assembly:组装。该文件中的C#语法看起来比较怪异。


## 16.1.2 解决方案和项目的区别
重要区别是： 

- 项目是一组要编译到单个程序集（有时是，单个模块）中的所有源代码文件和资源。
- 解决方案是构成某个软件包（应用程序）的所有项目组成的集。

可以把所有的项目看作一个解决方案。

Solution Explorer窗口中查看解决方案。

解决方案用扩展名为 .sln的文件来表示。解决方案与工作空间类似。



**一般如果要重命名任何文件，最好在Solution Explorer中进行，**因为Visual Studio会自动更新其他项目文件中对该文件的任何引用。


### 设置启动项目
如果在解决方案中有多个项目，就必须确保该解决方案在某一刻只运行一个项目。在编译解决方案时，将编译其中的所有项目。但在按F5键或选择Start菜单时，必须告诉Visual Studio先运行哪个项目。

在Solution Explorer窗口中右击该项目，在弹出的上下文菜单中选择Set as Startup Project命令。设定后它在窗口中是用粗体显示。



### 项目的浏览和编码

如果某个窗口在屏幕上不可见，就可以进入View菜单，选择合适的窗口名称。   
要显示设计视图和代码编辑器，可以在Solution Explorer窗口中右击文件名，然后从弹出的上下文菜单中选择View Designer或View Code命令，也可从


#### 可折叠的编辑器
如果不喜欢编辑器隐藏代码的方式，可以使用C#预处理指令#region和#endregion指定折叠代码块的另一种方式。


### Design View窗口
它会显示程序窗体的整体外观。Design View窗口一般与Toolbox窗口一起使用。Toolbox窗口包含许多可以拖放到程序中的.NET组件。

也可以把自己定义的组件类别添加到工具箱中，方法是右击任一类别，从弹出的上下文菜单中选择Add Tab命令。从该上下文菜单中选择Choose Items命令，就可以把其他工具放在工具箱中。


从Toolbox窗口中拖拽组件到Design View窗口中后。单击并展开Visual Studio Solution Explorer窗口中Form1.cs文件旁边的加号，会看到一个文件Form1.Designer.cs，它用于窗体及其中控件的设计。


对于使用Visual Studio，建议使用设计视图，而非手动编辑InitializeComponent()方法。具体原因见书。



### Properties窗口
属性窗口。它可以显示和编辑大多数属性的初始值。

属性窗口也可以显示事件。单击窗口顶部的闪电图标，就可以查看IDE中当前选中的事件。

属性窗口的顶部，有一个列表框，从中可以选择要查看的控件。

如果属性是从其初始值改变而来，这个属性在属性窗口的列表框中就会显示为黑体。有时双击属性窗口中的属性，会返回其初始值。


Properties窗口实现为一个System.Windows.Forms.PropertyGrid实例，该实例在内部使用反射技术，来标识要显示的属性和属性值。


### Class View窗口
打开该窗口；View | Class View



## 重构Refactoring
右键选择 `重构` 查看可用的重构功能。


## 代码段 Code Snippet
又称为 IntelliSense Code Snippet，它是在Visual Studio程序编辑器中，单击鼠标右键或快捷键就能够选择的一堆**内建的程序片段**。

VB内建了很多代码段，C#相对少很多。

右键 --> “插入代码段” --> ...

#### 下载扩充C#代码段套件


#### 扩展和更新

工具 --> 扩展管理器 --> 联机库  --> 查找扩展。

自定义编辑代码段的几种方法：

- 安装扩展"Snippet Designer"。安装后打开方法：视图-->其它窗口-->Snippet Explorer
- 单独下载第三方软件： Snippet Edit
- 下载: Snippy-Visual Studio Code Snippet Editor


##  Visual Studio 单元测试
>参考：
[ Visual Studio 单元测试系列](http://blog.csdn.net/tjvictor/article/category/782923)


## Visual Studio 个人总结

文档大纲：能够很方便的浏览窗体中各控件的层次，并能对其显示层次进行调整。
"视图"|"其它窗体"|"文档大纲"

建立数据库连接："工具"|"连接到数据库"|...|"然后可以对数据库进行各种操作"

快捷键：

- 格式化代码： Ctrl + K : Ctrl + F
- 添加/取消注释：Ctrl + K : Ctrl + C/U


双击资源管理器中的窗体的源文件，默认打开的是“窗体编辑器”(设计窗口)，可通过右键"打开方式"进行选择。

在设计窗口中双击窗口的标题栏，会自动为你创建一个Load事件函数，并且进入代码编辑窗口。

通过标签页下的两个复合框进行选择，可以快速定位到某个方法或属性的位置。

在代码编辑器中，右键"大纲显示"|"折叠到定义"/"隐藏选定代码" 等功能。


>文件UpgradeLog.XML和文件夾_UpgradeReport_files是： 
VS在读取低版本项目时对其进行升级的迁移报告“UpgradeLog.XML”，这个报告是一个XML文件，但是加载了一个XSLT文件“UpgradeReport.xslt”。这个XSLT文件除了用于逻辑计算的部分外，还包含了一些javascript代码，并引用了一个CSS文件“UpgradeReport.css”用来配置样式。



# [MSDN Visual Studio 2015](https://msdn.microsoft.com/zh-cn/library/dd831853.aspx)

来源：`MSDN Library > 开发工具和语言 > Visual Studio 2015 > `

[MSDN Library](https://msdn.microsoft.com/zh-cn/library/ms310241)


## [在 Visual Studio 中访问数据](https://msdn.microsoft.com/zh-cn/library/wzabh8c4.aspx)




### 数据访问

`··· > Visual Studio 2015 > Visual C++ > 数据访问`

[开放式数据库连接 (ODBC)](https://msdn.microsoft.com/zh-cn/library/s9ds2ktb.aspx)




### [ Visual Basic 和 Visual C# --> 访问数据](https://msdn.microsoft.com/zh-cn/library/cc437847\(v=vs.71\).aspx)




### [如何：连接到 SQL Server Express 数据库中的数据](https://msdn.microsoft.com/zh-cn/library/sxds9ett\(v=vs.90\).aspx)

连接到 SQL Server Express 数据库**文件中的数据**

>将 .mdf 或 .mdb 文件从 Windows 资源管理器拖动到解决方案资源管理器中以自动配置连接。此操作还启动“数据源配置向导”，以便您选择要在应用程序中使用的对象。


