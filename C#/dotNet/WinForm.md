# WinForm

标签（空格分隔）： .NET

---

考虑为几个较复杂的控件做图解。

## 常见问题

1.`找不到組件 "Microsoft.ReportViewer.Common, Version=8.0.0.0, Culture=neutral, PublicKeyToken=`
原因：程序最初是使用Visual Studio 2005版建立，引用的是舊版本的PeportViewer***.dll。更新該dll的方法，在方案總管的“參考-->選中對應的dll（通常帶有感歎號）-->在屬性窗口中取消固定版本，或隨便點擊一下”。[參考](http://www.cnblogs.com/songriver/archive/2011/11/01/2231247.html)。

2.[用System.Runtime.InteropServices服务的DllImport方法引入非托管代码程序集](http://blog.163.com/yuyi_84225505@126/blog/static/36297389201271602234279/)
C#读写ini文件的类,调用kernel32.dll中的api：WritePrivateProfileString，GetPrivateProfileString
[C#如何读写和创建INI文件](http://blog.csdn.net/yysyangyangyangshan/article/details/7017523)

3.[C#使用 NPOI操作Excel001：前言](http://blog.csdn.net/yysyangyangyangshan/article/details/42614181)

4.[System.Diagnostics.Process.Start的妙用](http://www.cnblogs.com/huangqing/articles/2232985.html)

5.[C#读取和写入配置文件](http://blog.csdn.net/tjvictor/article/details/4933761) ,使用.Net2.0中的ConfigurationManager可以方便的实现对配置app.config的读取和写入。（比如數據庫連接字符串）

6.从Debug切换到Release后进行编译出现错误，可以尝试将该工程的Debug目录下的dll等文件复制到Release目录下，再进行编译。

7.確保某窗口只存在一個實例；可分為該窗口是MDI窗口、在主窗口中通過點擊產生的窗口(可通過一個全局變量在局部賦值再判斷其是否為null或者IsDisposed)、直接雙擊打開的窗口這幾種情況。[判断窗口是否已经打开](http://bbs.csdn.net/topics/340268117)；或使用高級一點的單例模式。


- [WinForm的Load & Activated & Shown & FormClosing & FormClosed 事件](http://blog.csdn.net/jk_yang/article/details/41283757)
[ C#——WinForm登录界面](http://blog.csdn.net/pipimuzi/article/details/46328975)

- 错误：`datareader.getfieldtype(6) returned null`，应该是数据类型不支持【数据库的版本问题】（安装了最新的Sql Server xNext on Linux）。比如此次查询的表Address中的spatial location列（表示空间位置）使用的数据类型是当前VS 2017RC 不支持的；所以出现了异常。当读取受支持类型的表的行是可以的，并且VS可以连接数据库，只是不能检索不受支持的数据。[DataReader.GetFieldType returned null](https://social.msdn.microsoft.com/Forums/sqlserver/en-US/eae17407-2910-455c-92eb-8c28e5dabbc5/datareadergetfieldtype-returned-null?forum=sqlnetfx)  






## 框架
[循序渐进开发WinForm项目（1) --数据库设计和项目框架的生成](http://www.cnblogs.com/wuhuacong/p/3566371.html)
[循序渐进开发WinForm项目（2)--项目代码的分析](http://www.cnblogs.com/wuhuacong/p/3566409.html)
[循序渐进开发WinForm项目（3)--Winform界面层的项目设计](http://www.cnblogs.com/wuhuacong/p/3568421.html)
[循序渐进开发WinForm项目（4)--Winform界面模块的集成使用](http://www.cnblogs.com/wuhuacong/p/3568832.html)
[]()


C#windows 服务开发
多线程
[WinForm MVC模式](http://blog.csdn.net/xiao_jun_0820/article/details/6638102)
[各种获取Resource资源的方法](http://blog.csdn.net/xiao_jun_0820/article/details/50340417)
[C#多线程异步访问winform中控件 ](http://www.cnblogs.com/yjg8116/archive/2011/12/22/2298398.html)




## 部署程序
部署：就是把应用程序安装到目标系统上的**进程**。

- 使用xcopy部署来进行安装（简单安装）。
- 使用Windows安装程序来安装应用程序（在需要选择安装路径和需要一些注册表项时），传统方法。
- 使用ClickOnce部署（大量安装）


### ClickOnce安装
ClickOnce安装可以在网站、UNC共享或文件位置(如CD)上进行。


>测试证书密码 fan123


将共享文件夹进行磁盘映射。


> 使用批处理:
[命令行创建快捷方式的批处理脚本](http://www.cnblogs.com/top5/archive/2011/08/11/2134575.html)
[cmd命令查看局域网共享](https://zhidao.baidu.com/question/423275581.html)
[打开局域网共享文件夹](https://zhidao.baidu.com/question/437117582.html);[net use](http://baike.baidu.com/view/834781.htm?wtp=tt)
`explorer \\IP地址\共享文件夹名称`



定时，每天的下午5点程序自动关闭；以方便MIS进行程序更新。Win Form每天定时执行。




## 基础
重新生成解决方案或项目

### 资源文件
[winform资源文件Resource添加、修改和删除](http://www.liangshunet.com/ca/201310/421562702.htm)

Designer文件是记录窗体的信息的，当在窗体上进行布局时，如从控件库中拖入控件等，Designer文件都会自动记录下关于该控件的信息，无需人为干预。

resource文件，即程序资源文件。Resurces文件夹下的东西是手动加入里面的资源文件及其资源。



[c# winForm 资源文件相关](http://blog.csdn.net/jglie/article/details/7480710)




### Control类最常见的属性
|属性|说明|
| ------- |--------------- |
|Anchor|指定当控件的容器大小发生改变时，该控件如何响应|
|BackColor|控件的背景色|
|Bottom|指定控件底部距窗口顶部的距离|
|Dock|使控件停靠在容器的边界上|
|Enabled|为true则可接收用户的输入|
|Height|指定控件底部到其自身顶部的距离|
|ForeColor|控件的前景色|
|Left|控件的左边界距其容器左边界的距离|
|Name|控件的名称，可在代码中用它引用该控件|
|Parent|控件的父控件|
|Right|控件的右边界距其容器左边界的距离|
|**TabIndex**|控件在容器中的标签顺序号|
|TabStop|指定是否可以用Tab键访问控件|
|Tag|该值通常不由控件自身使用，而是在控件中存储该控件的信息|
|Text|保存与该控件相关的文本|
|Top|控件顶部距其容器顶部的距离|
|Visible|指定控件是否在运行期间可见|
|Width|控件的宽度|


> 为相同类型的控件批量设置属性：按Ctrl + 点击选择要设置的同类控件，再在属性窗口中进行设置。



### 布局
有4种属性可以用来在窗体中定位控件和调整控件大小：

1. Location：以像素为单位，设置控件的X座标和Y座标
2. Size：以像素为单位，设置控件的宽度和高度
3. Anchor：把控件附着在窗体的一个或多个边框上
4. Dock：把控件和窗体的一个或多个边框**连接**起来
在一定意义上，前两者是绝对布局，后两者是相对布局。

> **Anchor 属性：**指定在用户重新设置窗口的大小时控件该如何响应。可以指定如果控件重新设置了大小，就根据控件的**边界**合理地锁定它，或者其大小不变，但根据窗口的边界来锚定它的位置。【横向大小改变需同时设置了Left和Right；纵向大小改变需同时设置了Top和Bottom；横向和纵向都变则四个都需设置】仅使用Anchor即可解决大部分的相对布局。
**Dock 属性：**指定控件应停靠在容器的边框上。如果用户重新设置了窗口的大小，该控件将继续停放在窗口的边框上。例如，如果指定控件停靠在容器的底部边界上，则无论窗口的大小如何改变，该控件都将改变大小，或移动其位置，确保总是位于屏幕的底部。【如果只设置了单边停靠，则该控件的大小只能在停靠的这一边改变大小，并随其移动】


> 在布局时同时配合最小大小MininumSize对整个窗体进行限制，比如**将MinimunSize值设置为等于Size的值**。

### 事件
低级事件与高级事件，(组合事件)。

事件及其注册：

- 事件/委托/事件参数
- btn.Click += new EventHandler(btn_Clicked)
- void btn_Cliked(objct sender, EventArgs e){...}
- 使用匿名函数及Lambda表达式

鼠标事件： MouseHover 鼠标悬停

> 为控件添加某事件的方式之一：在属性窗口中选择事件，再在某事件后双击即可自动生成事件处理函数。


|事件|说明（C#入门经典）|
| --- |------------------------- |
|Click|在单击控件时引发。在某些情况下，这个事件也会在用户按下回车键时引发 |
|DoubleClick|双击控件时引发。在处理像Button这类控件的Click事件，表示永远不会调用DoubleClick事件|
|DragDrop| 在完成拖放时触发(当对象被拖到控件上，然后用户释放鼠标按钮后引发该事件)|
|DragEnter|在被拖动的对象进入控件的边界时引发|
|DragLeave|在被拖动的对象移出控件的边界时引发|
|DragOver|在被拖动的对象放在控件上时引发|
|KeyDown|当控件有焦点时，按下一个键时引发该事件，该事件总是在KeyPress和KeyUp之前引发|
|KeyPress|当控件有焦点时，按下一个键时引发该事件。区别：KeyDown传送的是被按下的键的键盘码，KeyPress传送被按下的键的char值|
|KeyUp|当控件有焦点时，释放一个键时发生该事件。它总是在KeyDown和KeyPress之后引发|
|GotFocus|在控件接手焦点时引发。不要用这个事件执行控件的有效性验证|
|LostFocus|在控件失去焦点时引发。不要用这个事件执行控件的有效性验证|
|MouseDown|在鼠标指针指向一个控件，且鼠标按钮被按下时引发，与Click不同，因为在按钮被按下之后，且未被释放之前引发MouseDown|
|MouseMove|在鼠标滑过控件时引发|
|MouseUp|在鼠标指针位于控件上，且鼠标按钮被释放时引发|
|Paint|绘制控件时引发|
|Validated|当控件的CausesValidation属性（表示能否引发验证事件）设置为true，且该控件获得焦点时，引发该事件。它在Validating事件之后发生，表示验证已经wan'c|
|**Validating**|当控件的CausesValidation属性设置为true，且该控件获得焦点时，引发该事件。注意：被验证的控件是正在失去焦点的控件，而不是正在获得焦点的控件|
|||


有三种处理事件的基本方式：（处理事件需要两个步骤：订阅事件、添加方法签名）

- 双击控件：进入控件默认事件处理程序（自动完成两个需要的步骤）
- 在属性窗口中的事件列表中进行操作：(1)双击该事件（自动完成两个需要的步骤）(2)为事件输入方法名称，按回车，（自动订阅事件和补全方法签名）
- 自己添加**订阅**该事件的代码。VS检测到我们的工作会自动在代码中添加方法签名。

> 如果双击控件，要给处理的事件修改默认事件的方法签名，以处理另一个事件，就会失败，因为还要修改InitializeCommponent()中的事件订阅代码。

> 如果两个相同类型的控件的某事件处理的方式相同可以为其订阅同一个事件处理函数，按Ctrl选中两个控件，再在事件列表中进行操作。


### 控件
控件Control类：
Windows中控件都是， System.Windows.Forms.Control的子类。
都实现了IDisposable等接口（可以进行dispos）

## 窗体
Form类是Control类的子类。

多窗体：
打开与关闭窗体： Show()， ShowDialog()对话框（以对话框的形式显示该该窗体）。
交互信息：Static 变量，通过构造函数或属性传递变量。


### 继承窗体

- 编码实现：直接将本窗体默认继承的form改为自己已经创建好的窗体。
- 使用继承选择器来选择继承一个窗体：右键项目|添加|新建项(或Win form窗体)|继承窗体

在向窗体中添加控件时，其Modifiers属性默认为private。因此，如果继承这样的窗体，在继承窗体中，控件的属性全部为不可编辑状态。如果将基窗体中的各控件的Modifers属性改为public则可摆脱这一限制。

### MDI窗体
多文档界面。



### 菜单、工具栏、对话框
菜单栏： MenuStrip
工具栏：ToolStrip
状态栏：StatusStrip

### 用户控件
添加用户控件的方法是：右键项目名"添加"|"用户控件"

常用来组合多个控件。也可用来处理Paint等。
对外公开属性、方法、事件。

编译后，用户控件会自动出现在工具箱中，可拖放到窗体上。


### 使用COM组件
比如使用：Windows Media Player控件
添加方法，在工具栏空白处右键“选择项”|COM组件|在此选择。

### 输入法问题
输入法编辑器 (IME) 的状态
ImeMode 枚举：
Off	：
此 API 支持 产品 基础结构，不能在代码中直接使用。 IME 已关闭。此模式指示 IME 已关闭，这意味着该对象的行为方式与英语输入模式相同。此设置仅对日语、简体中文和繁体中文 IME 有效。

ImeMode設置為Off，即輸入法默認為英文輸入狀態，仍然可以按shift切換到中文狀態。

### 文本处理
环境Environment类：
MachineName . OSVersion
GetEnvironmentVariables
CurrentDirectory . SystemDirectory
...

Console类
String类
StringBuilder类

System.Text.Encoding类： 字符编码
.Default  .UTF8   
.GetEncoding：后根名字如GB2312,就可得到相应的编码对象。
.GetBytes(str)将字符变成字节;  .GetString(byte[])字节变为字符。

>一个汉字在UTF8中占三个字节，在国标编码中占两个字节。

### 正则表达式


## WinForm界面布局

>简单介绍[winform窗体（五）——布局方式](http://www.cnblogs.com/H2921306656/p/5839345.html)
[Winform程序界面设计](http://www.360doc.com/content/13/0613/11/8463843_292540140.shtml)


Dock和Anchor之间会相互覆盖。

### Dock
Dock是停靠的意思。Dock属性是DockStyle枚举；默认是None，当为Left的时候，就表示子控件停靠在父控件的左边区域，并将其填充满。
父控件在其自身的Controls集合中保存子控件；`this.Controls.Add(this.panel1);`

>Dock一般是划分区域。

### Anchor
如果想让子控件在父控件里的相对位置不随父控件的变化而变化，或者控件边缘距离父控件边缘的相对距离不发生变化就可以使用Anchor(锚定)。

Anchor的默认值是Anchor.Left | Anchor.Top，也就是子控件与父控件的左边缘和上边缘的相对位置不会变化，这也保证了在窗体最大化后子控件的位置不会发生变化：

>[在 FlowLayoutPanel 控件中锚定和停靠子控件](https://msdn.microsoft.com/zh-cn/library/ms171633(v=vs.110).aspx)
[在 TableLayoutPanel 控件中锚定和停靠子控件](https://msdn.microsoft.com/zh-cn/library/ms171691(v=vs.110).aspx)
[]()



### Padding & Margin
Padding指的是控件内部空间，Margin指的是控件之外的。

### AutoSize
有的时候我们需要控件随着里面的内容的增长而增长。
[AutoSize 属性概述](https://msdn.microsoft.com/zh-cn/library/ms171729(v=vs.110).aspx)



### 文本大纲
查看各控件之间的摆放位置。
视图|其它窗口|文本大纲|

导航控件树：
更方便的方法：ESC键。选中一个控件，然后敲ESC键就会顺着这个控件层次不断的上溯。
选中一个控件，然后点击右键，还会出现 Select …的菜单，可以选中该控件的某个父控件：


有的时候我们的程序中如果动态的修改了某些涉及布局的属性最后发现界面乱套了。

运行时的问题当然要运行时解决，给某个父控件附加Layout事件，当修改了涉及Layout的属性时会触发这个事件（也有特例，下一节介绍）。这个事件会有一个LayoutEventArgs参数，该参数有AffectedProperty属性，该属性指示的就是影响布局的罪魁祸首。


### TableLayoutPanel控件
可以通過Columns集合和Rows集合對行和列進行調整；可以控制行或列的大小為AutoSize、百分比、絕對值。
也可以利用AutoSize來讓行列的大小適應子控件的大小。



## WinForm开发框架






## WinForm公共控件
控件是通过 Controls.Add()来添加。

### Lable和LinkLable标签

- BorderStyle属性：可以指定标签边框的样式。
- FlatStyle
- Image
- TextAlign：指定文本显示在控件的什么地方
- LinkColor


### TextBox控件
C#中的TextBox控件常用于在窗体中接收用户的输入或显示文本，利用该控件可以让用户输入文本、密码等信息，同时也可以控制用户输入内容的长度、类型等

> 对于TextBox控件《C#入门经典》有很好的示例。

#### TextBox控件的常用属性：

- MaxLength: 最大字符数
- Multiline: 是否允许输入多行
- PasswordChar: 输入密码
- ReadOnly: 控制能够更改其中的文本，默认为false不可更改
- Text：用于读取或设置TextBox中的文本
- Visible：设置控件是隐藏还是显示
- WordWarp：是否自动换行(多行时)


- **CausesValidation属性：**当该属性为true时，且控件要获得焦点时，会引发两个事件: Validating和Validated。可以处理这些事件，以便验证在失去焦点的控件中数据的有效性。
- CharacterCasing：表示TextBox是否会改变输入的文本的大小写。
- ScrollBars：是否显示滚动条。
- SelectedText
- SelectionLength:
- SelectionStart:文本框中被选中文本的开头。


#### TextBox控件常用事件

四个焦点事件：

- Enter：控件获取焦点时触发
- Leave：当控件失去焦点时发生
- Validating：
- Validated：

键事件：

- KeyDown:
- KeyPress：在控件获取到焦点的前提下，用户按下并释放某个按键时发生
- keyUp:


- TextChanged：TextBox中的文本值发生改变时发生



#### TextBox控件常用方法

- AppendText()：追加文本
- Clear()：清除文本框中内容
- Copy()
- Focus():使其获得焦点
- Select()：选取文本框文本中**指定**的文本
- SelectAll()：选中全部文本
- Undo()：撤销上次对文本框的修改

### Button
对于Button而言是没有双击事件的。

Button、RadioButton和CheckBox都继承于同一父类ButtonBase。

- FlatStyle属性：改变按钮的样式。(flat:平面)
- Image属性：指定在按钮上显示的图像
- ImageAlign属性：指定按钮上的图像在什么地方显示

> 如果在按钮上单击了鼠标左键，然后把鼠标移动到其他位置，再释放鼠标，将不会引发Click事件。

> 在按钮得到焦点，且用户按下了回车键时，也会引发Click事件。

> 对于Click事件，第一个参数`object sender`包含被单击的控件。

### RadioButton单选按钮

<form>
<input type="redio" name="gender" value="male" checked>性别<br>
</form>

为用户提供多个互斥选项，将RadioButton放入GroupBox或其他一些容器中，以使组框中只能有一个按钮被选中。

- Appearance属性：RadioButton可以显示为一个标签。相应的圆点放在左边、中间或右边，或者显示为**标准按钮**。


### CheckBox复选框

- [ ] 复选框

- CheckState属性：**CheckBox有3种状态**：Checked、Indeterminate和Unchecked。其中Indeterminate（不定）表示复选框的当前值是无效的，或无法确定，或在当前环境下没有意义。
- ThreeState属性：当其为false时，则表示只存在两种状态。一些事件会受此影响。

- CheckedChanged事件:当Checked属性发生改变时引发。当ThreeState属性为True时，在复选框从Checked变为Indeterminate状态时不会改变Checked属性。
- CheckStateChanged事件:当CheckedState属性发生改变时引发。




### ComboBox下拉列表框（組合框）
ComboBox是一个下拉列表的控件，可以用在点击时，显示出所有待选择的项，然后呈现出来。




ComboBox和ListBox都派生于ListControl类。这个类提供了一些基本的列表管理功能。SelectedIndex返回一个整数值，它对应于当前选中项目的索引。从列表中获取值有点困难，在给列表控件添加条目时，不仅可以添加字符串值，还可以添加任意类型的对象。如果要添加的条目不是字符串，就必须设置另外两个属性。**第一个是DisplayMember属性，这个设置告诉ListControl在列表中显示对象的哪个属性。另一个是ValueMember属性，它是要返回值的对象属性**。例如，如果要使用Country对象，它包含两个属性CountryName和 CountryAbbreviation，就应把DisplayMember设置为CountryName属性，把ValueMember设置为CountryAbbreviation。在显示列表时，就会看到国家名称的列表，在使用**SelectedValue属性**时，控件应返回列表中所选中国家的简称。

如果访问Items属性，就可以得到Country对象。Items属性在控件上执行。在ListBox控件上，Items属性返回ListBox.ObjectCollection。这是一个可以通过索引器引用的对象集合。所以，要获取对象(不是ValueMember，而是对象本身)，就可以使用下面的代码：
```C#
obj = listBox1.Items[listBox1.SelectedIndex];
```
ComboBox的Items属性返回ComboBox.ObjectCollection。ComboBox组合了编辑控件和列表框

FindString和FindStringExact方法是列表控件的另外两个有用的方法。FindString在列表中查找以传入字符串开头的第一个字符串。FindStringExact查找与传入字符串匹配的第一个字符串。它们都返回找到的值的索引，如果没有找到，就返回–1。它们还可以将要搜索的起始索引整数作为参数。

在列表控件中，最常用的事件是SelectedIndexChanged和 SelectedValueChanged。这些事件是在用户从列表中选择新条目时发生。在列表中选择了新条目后，就可以修改窗体的其他方面，以匹配新选中的条目。例如，使用Country列表，如果用户从列表中选择了一个新国家，就可以显示该国家的地图图像。

---

向ComboBox控件添加項：

- 可以通過屬性窗口
- 可以通過`comboBox1.Items.Add();`
- 可以通過數據源綁定

```c#
private void DoBindDataSource()  
       {  
           //构造数据源（或从数据库中查询）  
           DataTable ADt = new DataTable();  
           DataColumn ADC1 = new DataColumn("F_ID", typeof(int));  
           DataColumn ADC2 = new DataColumn("F_Name", typeof(string));  
           ADt.Columns.Add(ADC1);  
           ADt.Columns.Add(ADC2);  
           for (int i = 0; i < 3; i++)  
           {  
               DataRow ADR = ADt.NewRow();  
               ADR[0] = i+1;  
               ADR[1] = "Name_" + (i+1);  
               ADt.Rows.Add(ADR);  
           }  
           //进行绑定  
           //注意：顯示的列名與值得列名可以設置為不一樣
           comboBox1.DisplayMember = "F_Name";//控件显示的列名  
           comboBox1.ValueMember = "F_ID";//控件值的列名  
           comboBox1.DataSource = ADt;  
       }  
```

其他操作和常用属性：
1）Text属性：获取当前显示的文本
2）SelectedText属性：获得当前选中的文本（控件获得光标且DropDown属性不为DropDownList）
                     注意：但应注意，所选内容会因用户交互而自动更改。如Button的Click事件中，SelectedIndexChanged 或 SelectedValueChanged 事件中，此属性会返回**空字符串**（参见[MSCN：](http://msdn.microsoft.com/zh-cn/partners/system.windows.forms.combobox.selectedtext\(VS.90\).aspx \))
3）SelectedValue属性：当前显示项对应的Value值（仅在绑定数据源时，设置了ValueMember时才可以用）
4）SelectedItem属性：控件当前选中项
5）SelectedIndex属性：当前选中项的索引


**属性值是可以通过属性窗口进行操作的。**

| 属性 | 描述 |
|------ |------ |
|ValueMember | 获取或设置一个属性，该属性将用作 ListControl 中的项的实际值。|
|Tag | 获取或设置包含有关控件的数据的对象。|
|Text  | 已重写。获取或设置与此控件关联的文本。|
|SelectedIndex | 已重写。获取或设置指定当前选定项的索引。|
|SelectedItem  | 获取或设置 ComboBox 中当前选定的项。|
|SelectedText | 获取或设置 ComboBox 的可编辑部分中选定的文本。|
|SelectedValue  | 获取或设置由 ValueMember 属性指定的成员属性的值。|
|Items | 获取一个对象，该对象表示该 ComboBox 中所包含项的集合。|
|DroppedDown | 設置控件的列表部份是否可以下拉。|
| DropDownStyle | 获取或设置指定组合框样式的值。樣式一：DropDown用戶可以編輯控件的文本框部份，下拉列表形式；樣式二：Simple可編輯，但列表部份總是可見；DropDownList不可編輯，下拉列表。|
|DropDownHeight | 获取或设置 ComboBox 下拉部分的高度|
|DataBindings | 为该控件获取数据绑定。|
|DataSource | 获取或设置此 ComboBox 的数据源。|
|SelectNextControl | 激活下一个控件。|
|Sorted | 设置为 true，则新添加项将按字母顺序插入到列表中。否则，在列表的结尾处插入项|

>其中test是表面要显示的文档，而vlaue则是我们绑定的object的数据，给大家一个好玩的想法。可以實現一个下拉的菜单，其中comboBox1中绑定的数据都是winform页面，甚至可以控制各个窗体。




要立即响应选择框的改变（即选择框一改变选项，就立刻将结果传递进去）！响应他的哪个消息比较好？


### DateTimePicker控件
[DateTimePicker控件](https://msdn.microsoft.com/zh-cn/library/system.windows.forms.datetimepicker(v=vs.90).aspx)
该控件用来让用户选择日期和时间并以指定的格式显示此日期和时间。

通过设置 MinDate 和 MaxDate 属性，可以限制可选择的日期和时间。

Format 属性设置控件的 DateTimePickerFormat。默认日期 Format 为 DateTimePickerFormat.Long。如果 Format 属性设置为 DateTimePickerFormat.Custom，可以通过设置 CustomFormat 属性并生成自定义格式字符串来创建自己的格式化样式。自定义格式字符串可以是自定义字段字符和其他字符的组合。例如，通过将 CustomFormat 属性设置为“MMMM dd, yyyy - dddd”，可以将日期显示为“June 01, 2001 - Friday”。有关更多信息，请参见日期与时间格式字符串。

若要使用数值调节钮控件（也称为 up-down 控件）调整日期/时间值，请将 ShowUpDown 属性设置为 true。日历控件被选定后将不下拉。可以通过分别选择各元素并使用向上和向下按钮更改值来调整日期和时间。

下面的代码示例创建 DateTimePicker 控件的一个新实例并将其初始化。设置控件的 CustomFormat 属性。此外，还要设置 ShowCheckBox 属性以便此控件显示 CheckBox；并设置 ShowUpDown 属性以便此控件显示为数值调节钮控件（也称为 up-down 控件）。若要运行此示例，请将以下代码粘贴到一个窗体中，并在该示例窗体的构造函数或 Load 事件处理方法中调用 CreateMyDateTimePicker 方法。
```c#
public void CreateMyDateTimePicker()
{
   // Create a new DateTimePicker control and initialize it.
   DateTimePicker dateTimePicker1 = new DateTimePicker();

   // Set the MinDate and MaxDate.
   dateTimePicker1.MinDate = new DateTime(1985, 6, 20);
   dateTimePicker1.MaxDate = DateTime.Today;

   // Set the CustomFormat string.
   dateTimePicker1.CustomFormat = "MMMM dd, yyyy - dddd";
   dateTimePicker1.Format = DateTimePickerFormat.Custom;

   // Show the CheckBox and display the control as an up-down control.
   dateTimePicker1.ShowCheckBox = true;
   dateTimePicker1.ShowUpDown = true;
}
```

---

通過將控件的Format屬性設置為Time，實現控件只顯示時間。
```
dateTimePicker.Format=DateTimePickerFormat.Time;
textBox1.Text = dateTimePicker.Text;
textBox2.Text = dateTimePicker.Value.Year.ToString();
```


#### DateTime
[DateTime 结构](https://msdn.microsoft.com/zh-cn/library/system.datetime\(v=vs.110\).aspx)

两个静态常量：
DateTime.Now:获取一个 DateTime对象，该对象设置为此计算机上的当前日期和时间，表示为本地时间。
DateTime.Today:获取当前日期。
DayOfWeek:获取此实例所表示的日期是星期几。
DayOfYear:获取此实例所表示的日期是该年中的第几天。


> System.Globalization.Calendar.GetWeekOfYear(DateTime,CalendarWeekRule,System.DayOfWeek) 


[C# DateTime详解](http://blog.csdn.net/a3676212/article/details/3836151)
[C# 中DateTime的各种使用](http://www.cnblogs.com/computer-lzy/archive/2012/07/20/2600506.html)

```c#
//计算2个日期之间的天数差
DateTime dt1 = Convert.ToDateTime("2007-8-1");    
DateTime dt2 = Convert.ToDateTime("2007-8-15");   
TimeSpan span = dt2.Subtract(dt1);              
int dayDiff = span.Days ;                    

//计算某年某月的天数
int days = DateTime.DaysInMonth(2009, 8);       
days = 31;                                      

//给日期增加一天、减少一天
DateTime dt =DateTime.Now;
dt.AddDays(1); //增加一天 dt本身并不改变
dt.AddDays(-1);//减少一天 dt本身并不改变

//与
DateTime.Today.ToString("yyyy/MM/dd", DateTimeFormatInfo.InvariantInfo);
```



#### Calendar 类
[Calendar类](https://msdn.microsoft.com/zh-cn/library/system.globalization.calendar\(v=vs.110\).aspx)

> 这里是指class而非控件；Calendar 类多与DateTime类一起使用。

System.Globalization.Calendar.GetWeekOfYear(System.DateTime,System.Globalization.CalendarWeekRule,System.DayOfWeek) 



| 名称 | 说明|
|-----|------|
| AlgorithmType | 获取一个值，指示当前日历是阳历、 阴历还是二者的组合。 |
| AddDays(DateTime, Int32) | 为DateTime添加Int32指定的天数 |
| AddWeeks(DateTime, Int32) | 为DateTime添加Int32指定的周数 |
| Clone() | 创建一个新对象的当前副本 Calendar 对象。 |
| GetDayOfMonth(DateTime) |  |
| GetDayOfWeek(DateTime) | returns the day of the week in the specified DateTime. |
| GetDayOfYear(DateTime) |  |
| GetDaysInMonth(Int32, Int32) |  |
| GetDaysInYear(Int32) |  |
| GetWeekOfYear(DateTime, CalendarWeekRule, DayOfWeek) | 返回DateTime中的日期根据CalendarWeekRule, DayOfWeek指定的规则Returns the week of the year |
| IsLeapDay(Int32, Int32, Int32) | 确定当前纪元中指定的日期是否为闰日。 |
| IsLeapMonth(Int32, Int32) | 是否为闰月 |
| IsLeapYear(Int32) | 是否为闰年 |






```C#
/// <summary>
/// 计算指定日期，为一年中的第几周
/// </summary>
private static int GetWeekOfYear(DateTime dt)
{
GregorianCalendar gc = new GregorianCalendar();
//指定每周的第一天为 Monday
//int weekOfYear = gc.GetWeekOfYear(dt,CalendarWeekRule.FirstDay, 
//                                            DayOfWeek.Monday);
//指定每周的第一天为 Sunday                                            
int weekOfYear = gc.GetWeekOfYear(dt,CalendarWeekRule.FirstDay, 
                                            DayOfWeek.Sunday);
return weekOfYear;
}


// Uses the default calendar of the InvariantCulture(特定区域).
Calendar myCal = CultureInfo.InvariantCulture.Calendar;
```




**DayOfWeek枚举：**
DayOfWeek.Sunday
DayOfWeek.Monday
...

此枚举中常数的值范围是从 DayOfWeek.Sunday 到 DayOfWeek.Saturday。 如果强制转换为一个整数，其值范围是从零 (指示 DayOfWeek.Sunday) 为 6 个 (指示 DayOfWeek.Saturday)。

成员 DayOfWeek 枚举未进行本地化。 若要返回的日期是星期几的本地化的名称，请调用 DateTime.ToString(String) 或 DateTime.ToString(String, IFormatProvider) 与"ddd"或"dddd"格式字符串的方法。 前者的格式字符串产生的缩写的星期几名称;后者生成完整的星期几名称。






### ListBox列表框
> 另还有继承于ListBox的CheckedListBox

**列表框用于显示一组字符串，可以一次从中选择一个或多个选项。**



listBox1.Items.Clear() 清除listBox中的item；
listBox1.Items.Count 获取listBox的item数目；
listBox1.Items[n] 获取listBox中的第n个item;
listBox1.Items.Add("123") 向listBox中添加一个item;

<http://blog.csdn.net/xiaobai1593/article/details/7344632>

设置可选模式为多选时设置属性为： MultiExtended

```C#
//SelectedIndexChanged事件
int a = listBox1.SelectedIndex ;//将listBox的选中值的索引给a附值 
ListBox.SelectedValue //选中的值本身
```

判斷ListBox的Items集合中是否已經包含某

```C#
ListBox.Items.Contains("比如在使用Add方法時添加的string對象");
```

取出Iterms集合中的string方法：

```
//使用string而不是object
foreach(string str in listBox.Items)
```

> 公司使用了Oracle的Express版数据库，友达提供的一个软件系统连接到该数据库，在进行出货时由于数据量超过5000条而导致异常无法查询数据；可能原因是由于数据库是免费版，使用时有限制（Oracle官网并没有说明有这方面的限制）；还有可能是友达提供的程序进行了查询限制（可能是为了避免单次查询的数据量太大）。如何解决？
查詢時間30秒限制。


### ListView列表视图

> 服务器端只配置服务器段更新的程序路径，客户端保存配置要保存的位置。

**列表视图通常用于显示数据，用户可以对这些数据和显示方式进行某些控制。用户可以对这些数据和显示方式进行某些控制。还可以把包含在控件中的数据显示为列和行(像网格那样)，或者显示为一列，或者显示为图标表示。

ListView的属性：

|属性|说明|
|---------- |--------------------- |
|Activation |控制用户在列表视图中激活选项的方式。Standard:用户为自己的计算机选择的值；OneClick：单击；TwoClick：双击。|
|Alignment |控制列表视图中选项的对齐方式。Default:如果用户拖放一个选项，它将仍位于拖动前的位置。 Left:左对齐。 Top：顶部对齐。 SnapToGrid: ListView控件包含一个不可见的网格，选项都放在网格中。|
|AllowColumnReorder||
|||
|||
|||
|||
|||



- Activation: 控制用户在列表视图中激活选项的方式。Standard:用户为自己的计算机选择的值；OneClick：单击；TwoClick：双击。
- Alignment：控制列表视图中选项的对齐方式。Default:如果用户拖放一个选项，它将仍位于拖动前的位置。Left:左对齐。Top：顶部对齐。SnapToGrid: ListView控件包含一个不可见的网格，选项都放在网格中。
- AllowColumnReorder：如果把这个属性设置为 true，就允许用户改变列表视图中列的顺序。**如果这么做，就应**确保即使改变了列的属性顺序，填充列表视图的例程也能正确插入选项







### TreeView树状视图
《在实战中成长Windows Forms开发之路》
静态树

- 直接在窗体设计器中打开TreeNode编辑器
- 在属性窗口的Nodes集合属性处打开TreeNode编辑器


ExpandAll和CollapseAll方法可以展开和折叠所有节点。



**生成动态的TreeView控件：**
动态的树。在TreeView控件中的每一个节点都是一个TreeNode对象，每个TreeNode还可以包含其它TreeNode对象的集合。向TreeView控件中添加新的节点，实际上就是将新的TreeNode对象添加到TreeView控件的Nodes集合中。TreeNode标签通过显示设置Text属性来进行设置。

> Tag属性：Tag类型为Object，它包含有关树节点的数据；但如果此属性是通过Windows窗体设计器设置，则只能指派文本。



处理TreeView事件：

|事件|说明|
|----- |-------------------- |
|AfterCheck|在选中节点复选框之后引发|
|AfterCollapse|在折叠一个节点之后引发|
|AfterExpand|在扩展一个节点之后引发|
|**AfterSelect**|在选中一个节点之后引发|
|Before***|在 之前引发|
|||


> 根据treeView1.SelectedNode来判断到底是选择了哪个节点。





## 容器
### GroupBox 组框

- 用于合理的组合一组控件，如RadioButton和CheckBox控件，显示一个框架其上有一个标题。
- 另一个作用，可以改变里面所有控件的某些属性。例如禁用组框中的所有控件。

### TabControl控件
调整标签页头的字体大小的方法： 点击TabControl控件（而非TabPage），再在属性窗口中进行编辑。





## 高级控件
### ReportViewer控件
参考：
<http://blog.csdn.net/liuci3234/article/details/8962639>  <http://www.xuebuyuan.com/511286.html>  <http://blog.csdn.net/waterxcfg304/article/details/45788639>

[示例和演练](https://msdn.microsoft.com/zh-cn/library/ms251686.aspx)
[演练：在本地处理模式下将数据库数据源与 ReportViewer Windows 窗体控件一起使用](https://msdn.microsoft.com/zh-cn/library/ms251724.aspx)

[Report Viewer 学习（二）](http://www.cnblogs.com/hwh_/archive/2010/11/25/1887268.html)
[Report Viewer 学习（三）](http://www.cnblogs.com/hwh_/archive/2010/11/26/1888923.html)

[C#报表控件ReportViewer(百度文庫)](http://wenku.baidu.com/view/97644817cc7931b765ce1526.html)


ReportViewer控件都可以配置为以本地处理模式或远程处理模式运行。“本地处理模式”是指 ReportViewer 控件在客户端应用程序中处理报表。远程处理模式指由 SQL Server 2008 或在 Reporting Services 报告服务器以上执行的报表处理。

报表定义 (.rdlc) 文件、，报表需要通过ReportViewer控件进行显示，而ReportViewer控件可以放置在Windows 窗体或 Web 窗体中。

报表定义 (.rdlc) 文件会绑定到包含您所需数据的 DataSet 对象或业务对象。

数据集： 是一个XML架构文件，默认名称为“DataSet1.xsd。新建数据集时会打开“数据集设计器”。

如果您在定义报表以后修改DataSet架构，则必须更新报表和控件中的数据绑定。

您的报表中可以有任意数量的数据集。 若要查看报表实际使用的数据集的列表，请在“视图”菜单上选择“报表数据”。 .rdlc 文件是在报表设计器中打开的，需在此标签页下“视图”菜单下才有“报表数据”。

将数据绑定到报表并且已将报表绑定到 ReportViewer 控件后，如果添加或删除数据集、修改报表中使用的数据集或者更改 .rdlc 文件，则必须在部署或运行应用程序之前更新报表和 ReportViewer 控件中的这些绑定。

[更新和重新绑定数据源引用](https://msdn.microsoft.com/zh-cn/library/ms252085.aspx)













```
SELECT         MachineType, Barcode, RecorderDate, ProductDate, Line, Users
FROM             MI_Barcodes
WHERE         (MachineType = @MachineType) AND (ProductDate BETWEEN 
                          @ProductDateB AND @ProductDateE) AND (Line = @Line) AND 
                          (Barcode LIKE @barcode)

```


在DataSet中新增適配器時，需要選取連接字符串：



使用查詢產生器產生查詢語句：
添加的篩選條件示例：
```
BETWEEN @ProductDateB AND @ProductDateE
= @MachineType
= @Line
LIKE @barcode
```

下一步選擇要產生的方法：
TableAdapter方法會在應用程序和資料庫之間載入及存儲資料。

有三種方法：
填入DataTable：建立一個接收DataTable或DataSet作為參數，并且會執行上一頁所輸入SQL語句或Select預存程序的方法。方法名稱： Fill
傳回DataTable：該方法回傳一個DataTable，并在其中填入上一頁所輸入SQL語句。方法名稱：GetData
建立方法以直接將更新傳送至資料庫。



```
    public partial class LBBindQryPrt : Form
    {
        string _dateB, _dateE, _mtype, _Line, _Barcode;
        public LBBindQryPrt(string dateB, string dateE, string mtype, string line, string Barcode)
        {
            InitializeComponent();
            _dateB = dateB;
            _dateE = dateE;
            _mtype = mtype;
            _Line = line;
            _Barcode = Barcode;
        }

        private void LBBindQryPrt_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'DataSet1.DT_HX_LBBarcodeInput' table. You can move, or remove it, as needed.
            this.DT_HX_LBBarcodeInputTableAdapter.FillLBBind(this.DataSet1.DT_HX_LBBarcodeInput, _dateB, _dateE, _mtype, _Line, _Barcode);

            //
            
            this.reportViewer1.RefreshReport();
        }
```



LBBindQryPrt窗体中添加了如下控件：

reportViewer
DataSet1
DT_HX_LBBarcodeInputBindingSource
DT_HX_LBBarcodeInputTableAdapter


VS2010连接Mysql数据库需要下载相关连接驱动：[Connector/Net]( http://dev.mysql.com/downloads/connector/net/)
<http://www.cnblogs.com/myhappylife/archive/2013/05/11/3072653.html>


## 数据控件
### DataGridView 控件
[DataGridView 控件的学习见此处的"另请参阅"部分](https://msdn.microsoft.com/zh-cn/library/system.windows.forms.datagridview\(v=vs.110\).aspx#另请参阅)

#### DataGridView 控件中的数据显示模式
[DataGridView 控件中的数据显示模式](https://msdn.microsoft.com/zh-cn/library/cd28yf6d\(v=vs.110\).aspx)

DataGridView 控件可以三种不同的模式显示数据：绑定、未绑定和虚拟。

未绑定：
你必须亲自填充该控件，通常使用DataGridViewRowCollection.Add方法。

绑定：
绑定模式适合于使用与数据存储区的自动交互来管理数据。通过设置DataSource属性，
可将 DataGridView 控件直接连接到其数据源。 当该控件绑定到数据时，无需您的主动管理即可存入和提取数据行。 当 AutoGenerateColumns 属性为 true 时，将在控件中为数据源中的每一列创建相对应的列。 如果您希望创建自己的列，则可将此属性设置为 false，并在配置列时使用 DataPropertyName 属性绑定每一列。 当您想使用的列类型不是默认生成的类型时，此功能将非常有用。 有关更多信息，请参见 Windows 窗体 DataGridView 控件中的列类型。


DataGridView控件支持的数据源：

- 任何实现IList接口的类，包括一维数组
- 实现IListSource接口的类，例如DataTable和DataSet
- IBindingList接口， 
- IBindingListView接口，例如BindingSource类

显示数组中的数据：
如果是创建一个数组，填充数据，再在DataGridView控件上设DataSource属性。但是网格中显示的是数组中定义的字符串的长度。原因在于把数组用于DataGridView控件的数据源时，网格会查找数组中对象的第一个公共属性，并显示这个值，而不会显示字符串。解决方法是在数据源代码中创建一个包装器类

如果数据源包含多个表（比如使用DataSet)，就要设置DataMenber属性。
如果DataTable是独立的，就把控件的DataSource属性设置为这个表即可。
如果在DataSet中包含DataTable，就把控件的DataSource属性设置为DataSet，DataMember属性设置为DataSet中的DataTable名。


為DataGridView重新綁定數據源的一種方法：
```c#
//為DataGridView重新綁定數據源前，先將數據源設置為null，再進行綁定。
dataGridViewBarcode.DataSource = null;
dataGridViewBarcode.DataSource = ds.Tables[0];
```





## 菜单和工具栏
> 《C#入门经典》第5版

包含Strip后缀的系列控件：ToolStrip、MenuStrip和StatusStrip

> **善用这些控件的Action窗口中的功能**，比如直接生成标准项。


### MenuStrip控件
常用来填充菜单的控件有：MenuStrip、ToolStripMenuItem(菜单中的项)、ToolStripDropDown()、ToolStripSeparator(分隔线)等


```
文档大纲
MenuStripForm  System.Windows.Forms.Form
    |___ menuStrip1 System.Windows.Forms.MenuStrip
            |_____System.Windows.Forms.ToolStripMenuItem  菜单项，可相互嵌套形成(最终显示)
                        |_____ System.Windows.Forms.ToolStripMenuItem   嵌套项
                        
```



**ToolStripMenuItem：**
其中ToolStrip、MenuStrip从纯粹的形式看它们两者实际上是相同的控件，因为MenuStrip直接派生于ToolStrip。对于一些工作它们两个一起完成会更好。

> 为菜单项设置宏字符：只需在该菜单项的Text属性的字符串中通过添加`&+字母`其中该字母即为对应的宏字符，该宏字符会显示为下划线形式；可以在一个同一个菜单中用同一快捷字符创建好几个菜单项。例如：`编辑(&E)`，此时可通过`Alt+E`来选择到`编辑`菜单项。还可这样用`&Edit`
**注意：它并不是快捷键**

> 另若直接输入一个`-`则自动会将其转换为一个分隔线。

设置快捷键：通过该菜单项的ShortcutKeys属性进行设置。

为菜单项设置Image：通过Image属性进行设置；在弹出窗口中选择"项目资源文件"--导入--可选择多个图像文件。（这样将这些图片导入项目的资源文件夹下）。

常用事件：

- Click:单击该菜单项时触发
- CheckedChanged：当该菜单项的CheckOnClick属性(当被选中时前面会有个✔)为true时触发事件。

```C#
        private void showHelpMenuToolStripMenuItem_CheckedChanged(object sender, EventArgs e)
        {
            ToolStripMenuItem item = sender as ToolStripMenuItem;
            helpToolStripMenuItem.Visible = item.Checked;
        }
```



#### ContextMenuStrip控件[右键菜单，关联菜单]

```
ContextMenuStrip右键菜单    -->  与其关联的控件
```


- 添加主体控件，添加ContextMenuStrip控件
- 通过设置主体控件的ContextMenuStrip属性与已添加的右键菜单控件关联




### ToolStrip




### StatusStrip 控件
參考[StatusStrip 控件](https://msdn.microsoft.com/zh-cn/library/ms229738\(v=vs.110\).aspx)
StatusStrip 控件上通常具有 ToolStripStatusLabel 控件（用于显示文本或图标以指示状态）或 ToolStripProgressBar（用于以图形方式显示进程的完成状态）。

#### ToolStripStatusLabel 控件








## ADO.NET
System.Data.SqlClient 名稱空間

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

示例1：
```c#
SqlConnection sqlConn = new SqlConnection(  
    ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString);//连接数据库  
  
SqlCommand sqlComm = new SqlCommand();  
sqlComm.CommandText = string.Format("insert into BulkTestTable(Id,UserName,Pwd)values(@p0,@p1,@p2)");//参数化SQL  
sqlComm.Parameters.Add("@p0", SqlDbType.Int);  
sqlComm.Parameters.Add("@p1", SqlDbType.NVarChar);  
sqlComm.Parameters.Add("@p2", SqlDbType.VarChar);  
sqlComm.CommandType = CommandType.Text;  
sqlComm.Connection = sqlConn;  
sqlConn.Open();  
```

示例2：利用表值函數進行批量插入
```c#
    SqlConnection sqlConn = new SqlConnection(  
      ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString);  
    const string TSqlStatement =  
     "insert into BulkTestTable (Id,UserName,Pwd)" +  
     " SELECT nc.Id, nc.UserName,nc.Pwd" +  
     " FROM @NewBulkTestTvp AS nc";  
    SqlCommand cmd = new SqlCommand(TSqlStatement, sqlConn);  
    SqlParameter catParam = cmd.Parameters.AddWithValue("@NewBulkTestTvp", dt);  
    catParam.SqlDbType = SqlDbType.Structured;  
    //表值参数的名字叫BulkUdt，在上面的建立测试环境的SQL中有。  
    catParam.TypeName = "dbo.BulkUdt";
     try  
    {  
      sqlConn.Open();  
      if (dt != null && dt.Rows.Count != 0)  
      {  
          cmd.ExecuteNonQuery();  
      }  
    }  
    catch (Exception ex)  
    {  
      throw ex;  
    }  
    finally  
    {  
      sqlConn.Close();  
    }
```

### 事務
[TransactionScope 类](https://msdn.microsoft.com/zh-cn/library/system.transactions.transactionscope\(v=vs.110\).aspx "參考其示例")
[C#语言中TransactionScope类的使用](http://blog.csdn.net/yuanyuanispeak/article/details/9299199 "參考其示例")
[TransactionScope类](http://www.cnblogs.com/Leo_wl/p/3305010.html "TransactionOptions枚舉")


Complete()即为提交事務
Dispose()即释放事务对象；结束事务范围。

TransactionOptions.Required：
该范围需要一个事务。 如果已经存在事务，则使用该事务。否则，在进入范围之前创建新的事务。 这是默认值。


[.NET：脏读、不可重复读和幻读测试](http://www.cnblogs.com/happyframework/p/3284154.html)
[数据库中的-脏读，幻读，不可重复读](http://blog.csdn.net/d8111/article/details/2595635)



将环境事务的隔离级别设为ReadUncommitted
```
 SqlTransaction   transaction;
 transaction =conn.BeginTransaction(System.Data.IsolationLevel .ReadUncommitted);
cmd.Transaction = transaction;
```

未授权读取（ReadUncommitted）：允许脏读取，但不允许更新丢失。如果─个事务已经开始写数据，则另外─个数据则不允许同时进行写操作，但允许其它事务读此行数据。 





## Data 

### 命令
Command 类有一个CommandType属性(枚举值)：

- Text： 默认，SQL子句
- StoredProcedure： 存储过程
- TableDirect：完整的表语句

当执行存储过程时，需要把参数传送给过程。给命令参数集合添加了AddWithValue()方法。

#### 调用存储过程
使用Command对象调用存储过程，就是定义存储过程的名称，给过程的每个参数添加参数定义后就可执行该命令。
现有一个存储过程 RegionUpdate(@RegionID integer, @RegionDescription nchar(50))接受两个参数，它是一个无返回值的存储过程。
```
SqlCommand cmd = new SqlCommand("RegionUpdate",conn);  //RegionUpdate存储过程的名称
cmd.CommandType = CommandType.StroedProcedure;   //将该command的类型指定为存储过程
cmd.Parameters.AddWithValue("@RegionID",23);    //添加参数。 也可使用SqlParameter来构造参数
cmd.Parameters.AddWithValue("@RegionDescription","something");
cmd.ExecuteNonQuery();
```

带返回值的存储过程。见书《C#高级编程》P862页。



### DataSet类
DataSet类是数据的脱机容器。它不含数据库连接的概念；它数据也不一定要来源于数据库。

DataSet类由一组数据表组成，每个表都有一组数据列和数据行。除了定义数据外，还可在DataSet类中定义表之间的链接。

DataSet类基本上是内存中的数据库。

DataSet.Clear()方法清除所有表的所有行。DataTable也有此方法。


datareader对象提供只读单向数据的快速传递，
单向:您只能依次读取下一条数据;只读:DataReader中的数据是只读的,不能修改;
相对地,DataSet中的数据可以任意读取和修改



[DataSet、DataTable 和 DataView](https://msdn.microsoft.com/zh-cn/library/ss7fbaez\(v=vs.110\).aspx)

#### DataTable
```
DataTable
    |
    ------ Columns  ---->   DataColumn
    |
    ------- Rows --------> DataRows
    |
    ...
```

Rows集合：
Columns集合：包含已经添加到表中的DataColumn实例

#### DataColumn 数据列
在创建列时，给它指定名称也很有用；否则运行库就会为该列生成一个名称，其格式为Column *n* 。
列的数据类型可以在构造函数中提供，也可通过设置DataType属性来指定。一旦把数据加载到数据表中，就不能改变列的数据类型。

```
DataColumn customerID = new ("CustomerID", typeof(int));
customerID...  //为数据列设置属性
```

#### DataRow 数据行
DataRow对象。
使用DataRow类的索引器访问数据行上的值。给定列的值可以用几个重载的索引器来检索。这样就可通过已知的列号、列名或DataColum来检索数据的值。
```
foreach(DataRow row in ds.Tables["Customers"].Rows)
    Console.WriteLine("'{0}' from {1}", row[0], row[1]);  //对于row也是可以使用下标
```

DataRow类可以接收某一特定行上指定列的各个值；版本指：Current列的当前值；Default列的默认值；Original最初从数据库中选择出的列值；Proposed对列进行修改时，可以检索到这个已经改变的值。


整个行有一个状态标识RowState。


#### DataTable.Rows 

DataTable.Rows 属性：获取属于该表的行的集合。

DataRowCollection Rows {}

包含 DataRow 对象的 DataRowCollection；否则为 null 值（如果不存在任何 DataRow 对象）。



#### DataRow.ItemArray

DataRow.ItemArray 属性：通过一个数组来获取或设置此行的所有值。

public object[] ItemArray { get; set; }


可以使用此属性通过数组设置或获取此行的值。如果使用此属性来设置值，
则使用的数组必须与列集合具有相同的大小和排序方式。
将 null 传入 ItemArray 表示未指定任何值。



### 手工编写代码为DataTable创建架构
手工编写代码为DataTable创建架构，在用相关联的DataColumns来填充。

```
DataTable products = new DataTable("Products");
products.Columns.Add(new DataColumn("ProductID",typeof(int));
productes...
ds.Tables.Add(products);
```

### 填充DataSet类
定义了数据集的架构，并准备好DataTables、DataColumns、Constrain类和一些必要内容，就可以
用这些信息来填充DataSet类。

从外部源读取数据并将其插入到DataSet类，可使用数据适配器。
    
    SqlDataAdapter da = new SqlDataAdapter(select,conn);
    da.Fill(ds,"Customers");

#### 在数据适配器上使用存储过程

先配置好SqlCommand，再将该command与适配器进行关联。将SqlDataAdapter的SelectCommand属性与command关联。然后执行Fill()方法。


### 持久化DataSet类的修改
持久化就是指将其永久保存下来。在DataSet中编辑完数据后，通常需要持久化这些变化。常见做法是将这些更新返回给数据库。

#### 通过数据适配器进行更新
SqlDataAdapter类包含SelectCommand、InsertCommand、UpdateCommand、DeleteCommand。



## Roc

## LPT
[C#通过LPT1端口控制打印机](http://www.cnblogs.com/Hdsome/archive/2012/07/31/2090294.html)
[C#控制计算机的并口LPT](http://blog.csdn.net/pengqianhe/article/details/8021072)
[C# LPT操作打印条码](http://blog.csdn.net/zh2305/article/details/2795760)


LPT端口是一种增强了的双向并行传输接口，在USB接口出现以前是扫描仪，打印机最常用的接口。最高传输速度为1.5Mbps，设备容易安装及使用，但是速度比较慢

实际上大多数的条码打印机制造商都有一套他们自己的打印指令语言，通过该语言，可以无需驱动，直接打印，并且操作也很简单，只需要将指令送入打印机中就好。









## 第三方组件
<http://m.gen88wan.com/>


### 二维码
ThoughtWorks.QRCode.dll 
[C# 利用QRCode生成二维码图片](http://blog.csdn.net/lybwwp/article/details/18444369)

QR Code for C#
QRCode实现Encode和Decode  

<https://github.com/codebude/QRCoder>



### [开源项目](http://www.oschina.net/project)

纯.NET实现的Office文件读写组件 NPOI：
NPOI 是 POI 项目的 .NET 版本。POI是一个开源的Java读写Excel、WORD等微软OLE2组件文档的项目。
使用 NPOI 你就可以在没有安装 Office 或者相应环境的机器上对 WORD/EXCEL 文档进行读写。