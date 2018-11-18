# 疯狂Android讲义-笔记

## 第一章：Android应用和开发环境

### 1.1 Android发展和简介

Android系统主要由5部分组成。

#### 1.应用程序层
系统自带或编写的Android应用程序。

#### 2.应用程序框架
开发Android应用程序时，就是面向底层的应用程序框架进行的。应用程序框架提供了大量API供开发者使用。

#### 3.函数库
Android包含一套被不同组件所使用的C/C++库的集合。一般应用开发者不能直接调用这套函数库，但可以间接通过应用程序框架来调用这些库。   
这些核心库包含：   

- 系统C库
- 媒体库
- Surface Manager
- LibWebCore
- SGL
- 3D libraries
- Free Type
- SQLite

#### 4.Android运行时
它由两部分组成：Android核心库和ART。  
其中核心库提供了Java语言核心库所能使用的绝大部分功能，而虚拟机则负责运行Android应用程序。   
Android 5.0以前的Android运行时由Dalvik虚拟机和Android核心库组成，但由于Dalvik虚拟机采用JIT（Just-in-time）的解释器进行动态编译并执行，因此导致Android App运行时比较慢；而ART模式则是在用户安装App时进行动态编译（Ahead-of-time，简称AOT），将原本在程序运行时的编译动作提前到应用安装时，这样使得程序在运行时可以减少动态编译的开销，从而提升Android App的运行效率。
反过来，由于ART需要在安装App时进行AOT处理，因此ART需要占用更多的存储空间，应用安装和系统启动时间较长。

#### 5.Linux内核
Android系统建立在Linux 2.6之上。Linux内核提供了...等系统服务。 ...  

### 1.2搭建Android开发环境
Android Studio不再基于Eclipse，而是基于IntelliJ IDEA的开发环境。  

Android Studio中Project的概念与Eclipse的Project概念不同，它相当于Eclipse中的Workspace；Android Studio的Module（模块）才相当于Eclipse的Project。  

Android Studio的项目相当于一个工作空间，一个工作空间可以包含多个模块，每个模块对应一个Android项目。   
Android Studio的项目可以包含多个Android项目（模块）。  

#### Android SDK
虽然Android Studio已经附带了Android SDk，但它附带的并不是最新版，因此可能还需要下载最新版Android SDK。

**中间略过部分重要内容**


### 1.4开始第一个Android应用
Android Studio会为我们自动完成许多工作。使用其开发应用的大致步骤如下：  

1. 创建一个Android项目或Android模块。  
2. 在XML布局中定义应用程序的用户界面。  
3. 在Java代码中编写业务实现。  

>XML文档的根元素是RelativeLayout，它代表一个相对布局，在其界面布局中可以包含UI控件，如TextView、Button。
 界面布局元素 ---- UI组件

 >UI组件的几个通用属性：  
 android:id 指定该控件的唯一标识，在java中可以通过findViewById("id")来获取相应界面组件。   
 android:layout_width: 指定该界面组件的宽度。如果属性值为match_parent,则该组件与其父容器具有相同宽度；属性值若为wrap_content，则说明该组件的宽度取决于它的内容。


### 1.5Android应用结构分析
脱离IDE，使用命令行生成的工程；命令如下：
`android create project -n HelloWorld -t android-21 -p HelloWorld -k com.fandean.helloworld -a HelloWorld`
```
/tmp/test/HelloWorld/
├── AndroidManifest.xml			(该文件是Android项目的系统清单文件，还可控制各种属性，配置四大组件)
├── ant.properties
├── bin
├── build.xml
├── libs
├── local.properties
├── proguard-project.txt
├── project.properties
├── res							(存放Android项目的各种资源文件)
│   ├── drawable-hdpi					(drawable-相关文件夹存放不同分辨率的图片文件)
│   │   └── ic_launcher.png
│   ├── drawable-ldpi
│   │   └── ic_launcher.png
│   ├── drawable-mdpi
│   │   └── ic_launcher.png
│   ├── drawable-xhdpi
│   │   └── ic_launcher.png
│   ├── layout							(存放布局文件)
│   │   └── main.xml
│   └── values							(字符串资源文件)
│       └── strings.xml
└── src							(保存Java源文件)
    └── com
        └── fandean
            └── helloworld
                └── HelloWorld.java

13 directories, 13 files
```
与Android Studio生成的有区别。   


在Android Studio 的Projects中生成的R.java类位于
/home/xxx/workspace/AndroidStudioProjects/MyApplication/Test/HelloWorld/app/build/generated/source/r/debug/com/xxx/helloworld/R.java

R是Android项目自动生成的一个java类。   
`public final class R{...}`

#### 1.5.2自动生成的R.java
R.java文件是由AAPT工具根据应用中的资源文件自动生成，因此可以把R.java理解成Android应用的资源宝典。

AAPT生成R.java文件的规则主要是如下两条：   

- 每类资源都对应于R类的一个内部类。比如所有界面布局资源对应于layout内部类；所有标识符资源对应于id内部类。
- 每个具体的资源项都对应于内部类的一个public static final int类型的Field。

#### 1.5.3 res目录说明
按照约定将不同资源放在不同的文件夹内，这样可以方便的让AAPT工具来扫描这些资源，并为其生成对应的资源清单类：R.java。   
以/res/value/strings.xml文件来说，它定义了一个个的字符串常量，如下：   
```xml
...
<resources>
	<string name="app_name">HelloWorld</string>
</resources>
```

它定义了字符串常量app_name，其值为HelloWorld。  
一旦定义了这份资源文件后，就可以在别处使用其中的字符串资源。  

**1.在java代码中使用资源**  
上面的字符串对应于R.java里的如下内容：   
```java
//对应一份资源
public static final class string{
	//对应于一个资源项
	public static final int app_name=0x7f040000;
}
```

在java中可以通过R.string.app_name引用到"HelloWorld"字符串常量。

**2.在XML中使用资源**   
只要按如下格式来访问即可：   
`@<资源对应的内部类的类名>/<资源项的名称>`   
例如：`@string/app_name`  

但有一种情况例外：一些标识符无须使用专门的资源进行定义，直接在XML文档中按如下格式**分配标识符**即可：  
`android:id="@+id/ok"`  
它为该组件分配了一个标识符，然后就可以在程序中引用该组件。  
如果希望在java中获取该组件，通过调用Activity的findViewById()方法即可实现。   
在其它XML文件中获取该组件，可以通过资源引用的方法，语法如下：  
`@id/<标识符代号>`  

#### 1.5.4Android应用的清单文件：AndroidManifest.xml
>manifest：清单  

清单文件是每个Android项目所必需的。它通常包含如下信息：  

- 应用程序的包名。  
- 应用程序所包含的组件。  
- 应用程序兼容的最低版本。  
- 应用程序使用系统所需的权限声明。  
- 其它程序访问该程序所需的权限声明。  

#### 1.5.6应用程序权限说明
**1.声明运行该应用本身所需要的权限（调用Android系统功能）**   
通过为`<manifest .../>`元素添加`<uses-permission .../>`子元素即可为程序本身声明权限。  
`<uses-permission android:name="android.permission.CALL_PHONE"/>`  

**2.声明(其它应用)调用该应用所需的权限**  
为应用的各组件元素，添加`<uses-permission.../>`子元素即可声明调用该程序所需的权限。   

提供的权限都位于Manifest.permission类中。（见书表格)  



### 1.6 Android应用的基本组件介绍
Android应用通常由一个或多个基本组件组成。  
四大基本组件：  Activity、Service、BroadcastReceiver、ContentProvider

#### 1.6.1 Activity和View
Activity是android应用中负责与用户交互的组件。Activity只能通过setContentView(View)来显示指定组件。  

View组件是所有UI控件、容器控件的**基类**，View组件就是Android应用中用户实实在在看到的部分。但View组件
需要放到容器组件中，或使用Activity将它显示出来。  


Activity为Android应用提供了可视化用户界面，如果该Android应用需要多个用户界面，那么可包含多个Activity，它组成了Activity栈，当前活动的Activity位于栈顶。  

Activity包含setTheme(int resid)方法来设置其窗口的风格。  


#### 1.6.2 Service
Service组件通常用于为其他组件提供后台服务或监控其他组件的运行状态。  

。。。

#### 1.6.3 BroadcastReceiver
它代表广播消息接收器。从代码实现角度来看，它类似于事件监听器。而BoradcastReceiver监听的事件源是Android应用中的其他组件。  


#### 1.6.4 ContentProvider
>provider:提供者
 content:内容  

用于Android应用之间的实时数据交换、多应用程序之间进行数据交换。如读取联系人。  


#### 1.6.5 Intent和IntentFilter
Intent并非应用组件，它是**应用内部不同组件**之间通信的载体。

Activity、Service、BroadcastReceiver三种组件之间的通信都是以Intent作为载体，只是不同组件使用Intent的机制略有区别。  

Intent封装了当前组件需要启动或触发的目标组件的信息。

- **显式Intent**: 明确指定需要启动或者触发的组件的类名。  
- **隐式Intent**：只是指定需要启动或者触发的组件应满足的条件，系统还需对其进行解析。

系统判断组件是否满足隐式Intent需要靠IntentFilter来实现。  


### 1.7 签名Android应用程序
**Android项目**以它的包名作为唯一标识。如果在同一台手机上安装两个包名相同的应用，后面安装的应用就可以覆盖前面安装的应用。为避免此事发生，Android要求对作为**产品发布**的应用进行签名。

签名主要作用：  
- 确定发布者的身份
- 确保应用的完整性。签名会对应用包中的每个文件进行处理，从而保证程序包中的文件不被替换。  

>应用开发、调试阶段，相关工具会自动生成调试证书对应用签名。
发布应用时，必须使用合适的数字证书来给应用进行签名。  

用Android Studio对Android应用签名的步骤见书P35

apk包： ... 




## 第2章：Android应用的界面编程

### 2.1 界面编程与视图(View)组件

#### 2.1.1视图组件与容器组件
绝大部分UI组件都位于 android.widget 包及其子包、android.view包及其子包中。   
所有UI组件都继承了View类，View组件代表一个空白的矩形区域。  

View类还有一个重要的子类ViewGroup，但ViewGroup通常作为其他组件的容器使用。
Android的所有UI组件都是建立在View、ViewGroup基础之上。   

Android采用了“组合器”设计模式来设计View和ViewGroup：  
ViewGroup可以当做View使用。对于图形界面来说，ViewGroup除了可以包含普通View组件之外，还可在此包含ViewGroup组件。   


>**Android文档的使用：**   
在SDK管理器中选择Documentation for Android SDK，将Android文档安装到本地磁盘。
在SDK安装目录下找到docs子目录，打开index.html页面，并单击该页面上方的“Develop”→“API Guides”(开发指南)。  
其中"Reference"标签页，所见就是Android的API文档。  


所有组件都提供了两种方式来控制组件的行为：  

- 在XML布局文件中通过XML属性进行控制。 
- 在Java程序代码中通过调用方法进行控制。  

大部分情况，控制UI组件的XML属性还有对应的java方法。  

View类的XML属性、相关方法即说明，表格见书P41  


ViewGroup是一个抽象类，因此实际使用中通常总是使用ViewGroup的子类来作为容器，例如各种布局管理器。  
ViewGroup容器控制其子组件的分布依赖于ViewGroup.LayouParams、ViewGroup.MarginLayoutParams两个内部类。这两个
内部类都提供了一些XML属性。

**可能对布局高度与布局宽度感到疑惑：为组件指定了高度与宽度不就行了吗？为何还要设置布局高度与宽度呢？**   
>这是由于Android的布局机制决定的，Android组件的大小不仅受它实际的宽度、高度控制，还受它的布局高度和宽度控制。比如设置一个组件的宽度为30pt，如果将它的布局宽度设为match_parent，那么该组件的宽度将被“拉宽”到占满它所在的符容器...

ViewGroup.MarginLayoutParams用于控制子组件周围的页边距(Margin)，它支持的XML属性见书P63页。


#### 2.1.3 在代码中控制UI界面
Android允许开发者向开发Swing应用一样，完全在Java代码中控制UI界面。此时所有的UI组件都将通过new创建。但不建议。  

查看书中代码，对于理解UI有一定帮助。

>由代码可知：无论创建哪种UI组件，都需要传入一个this参数，这是由于创建UI组件时传入一个Context参数，Context代表访问Android应用环境的全局信息的API。让UI组件持有一个Context参数，可以让这些UI组件通过该Context参数来获取Android应用环境的全局信息。   
Context本身是一个抽象类，Activity、Service都继承了Context，因此可以传入this作为参数。


**略过若干页 。。**


### 2.2第一组UI组件：布局管理器

布局管理器本身就是一个UI组件，类图见书或dia图

#### 2.2.1 线性布局 LinearLayout
它们将容器里的组件一个挨着一个排列起来（横向/纵向）

#### 2.2.2 表格布局TableLayout
TableLayout继承了LinearLayout。表格布局采用行列的形式来管理UI组件。通过添加TableRow、其它组件来控制表格的行数和列数。TableRow也是一个容器，它代表一个表格行，向TableRow内每添加一个子组件表格就增加一列。
如果直接在TableLayout中添加组件，则每一个组件直接占用一行。  

#### 2.2.3帧布局FrameLayout
类似于AWT中的卡片布局，但是它没有将底部的帧向上移动的方法。


#### 2.2.4相对布局RelativeLayout
相对布局容器中的子组件的位置总是相对兄弟组件、父容器来决定。

#### 2.2.5网格布局GridLayout
Android4.0新增。它把整个容器划分成rows × columns个网格，每个网格可以放置一个组件，一个组件也可占用多个网格。

#### 2.2.6绝对布局AbsoluteLayout
。。。

### 2.3第2组UI组件：TextView及其子类

#### 2.3.1文本框(TextView)与编辑框(EditText)的功能和用法
TextView直接继承了View，同时它还是EditText和Button两个UI组件的父类。TextView作用就是在界面上显示文本，从功能上看，它是一个文本编辑器(Android关闭了它的文字编辑功能)。


略

### 2.4第3组UI组件：ImageView及其子类
ImageView继承自View组件，主要功能是显示Drawable对象（包括图片）


### 2.5第4组UI组件：AdapterView及其子类
AdapterView本身是一个抽象类，它继承自ViewGroup；需使用其子类。Adapter（适配器）。  


### 2.6第5组UI组件：ProgreessBar及其子类
ProgressBar本身代表进度条组件。


### 2.7第6组UI组件：ViewAnimator及其子类


### 2.8各种杂项组件

#### 2.8.1使用Toast显示提示信息框


#### 2.8.2日历视图（CalendarView）组件的功能和用法


#### 2.8.3日期、时间选择器（DatePicker和TimePicker）的功能和用法


#### 2.8.4数值选择器（NumberPicker）的功能与用法


#### 2.8.5搜索框（SearchView）的功能与用法


#### 2.8.6选项卡（TabHost）的功能与用法



#### 2.8.7滚动视图（Scrollview）的功能与用法


#### 2.8.8 Notification的功能与用法
Notification是显示在手机状态栏的通知（手机状态栏位于手机屏幕的最上方）



## 第3章 android的事件处理

2016.6.19  

Adroid提供了两种方式的事件处理：基于回调的事件处理和基于监听的事件处理。

### 3.1 Android事件处理概述
对于Android基于监听的事件处理而言，主要做法是为Android界面组件绑定特定的事件监听器。  

>Android还允许在界面布局文件中为组件的`android:onClic`属性指定事件监听方法，通过这种方式指定事件
监听方法时，开发者需要在Activity中定义该事件监听方法（该方法必须有一个View类型的形参，
该形参代表被单击的UI组件），当用户单击该UI组件时，系统会激发`android:onClick`属性所指定的方法。  

对于Android基于回调的事件处理，主要做法是重写Android组件特定的回调方法，或者重写Activity的回调方法。
Android为绝大部分界面组件提供了事件响应的回调方法，开发者只要重写它们即可。   

一般来说，基于回调的事件处理可用于处理一些具有通用性的事件，基于回调的事件处理代码会显得比较简洁。
但对于某些特定的事件，无法使用基于回调的事件处理，只能采用基于监听的事件处理。




### 3.2基于监听的事件处理
#### 3.2.1监听的处理模型
主要涉及如下三类对象：  

- Event Source（事件源）：事件发生的场所，通常就是各个组件。  
- Event（事件）：事件封装了界面组件上发生的特定事情，如果 程序需要获得界面组件上所发生事件的相关信息，
一般通过Event对象来取得。  
- Event Listener（事件监听器）：负责监听事件源所发生的事件，并对各种事件做出相应的响应。

事件监听器的核心就是它所包含的方法——这些方法也被称为事件处理器（Event Handler）。


#### 3.2.2 事件和事件监听器
当外部动作在Android组件上执行操作时，系统会自动生成事件对象，这个事件对象会作为参数传给事件源上注册的事件监听器。事件的产生无需程序员关心，它是系统自动产生的。  
（书中有一个示例）在上面的程序中，我们并未发现事件的踪迹。原因是Android对事件监听模型做了进一步简化：如果事件源触发的事件足够简单，事件里封装的信息比较有限，那就无须封装事件对象，将事件对象传入事件监听器。  
但对于键盘事件、触摸屏事件等，此时程序需要获取事件发生的详细信息。对于这种包含更多信息的事件，Android同样会将事件信息封装成XxxEvent对象，并把该对象作为参数传入事件处理器（由程序员分析事件对象包含的信息并做出相应的处理）  


在程序中实现事件监听器，通常有如下几种形式：   

- 内部类形式：将事件监听器类定义成当前类的内部类。(优势：可以在当前类中复用该监听器；内部类可以自由访问外部类的所有界面组件)
- 外部类形式：将事件监听器类定义成一个外部类。(很少用)
- Activity本身作为事件监听器类：让Activity本身实现监听器接口，并实现事件处理方法。(有两个缺点)
- 匿名内部类形式：使用匿名内部类创建事件监听器对象(使用最广泛)。  

>匿名内部类《疯狂Java讲义 3 》   
定义匿名内部类的格式如下：  
```
new 实现接口() | 父类构造器（实参列表）
{
	//匿名内部类的类体部分
}
```

>匿名内部类必须继承一个父类，或实现一个接口（或适配器），但最多只能继承一个父类，或实现一个接口。

>匿名类有如下两条规则：  
- 匿名内部类不能是抽象类，因为在创建匿名内部类时，会立即创建匿名内部类的对象，且这个类定义立即消失。  
- 匿名内部类不能定义构造器。由于匿名内部类没有类名；但可以定义初始化块。

`new 监听器接口`  或  `new 事件适配器`的形式...   


#### 3.2.7 直接绑定到标签
Android还有一种更简单的绑定事件监听器的方式，那就是直接在界面布局文件中为指定标签(XML中)绑定**事件处理方法**。

对于很多Android界面组件标签而言，它们都支持onClick属性，该属性的值就是一个形如`xxx(View source)`方法的方法名。例如：   
```xml
...
	<EditText
		android:id="@+id/show"
		... />

	<Button
		...
		android:onClick="clickHandler" />
	

...
```

这段代码用于在界面布局文件中为Button按钮绑定一个事件处理方法：`clickHandler`，此需在该界面布局对应的Activity中定义一个`void clickHandler(View source)`方法，这个方法会负责处理该按钮上的单击事件。部分代码示例如下：  
```java
public class MainActivity extends Activity{

	public void onCreate(Bundle savedInstanceState)
	{
		//略
	}

	//定义一个事件处理方法
	//其中source参数代表事件源
	public void clickHandler(View source)
	{
		EditText show = (EditText) findViewById(R.id.show);
		show.setText("bn按钮被单击了");
	}
}
```


### 3.3基于回调的事件处理
从代码实现的角度看，基于回调的事件处理模型更加简单。  

对于基于回调的事件处理模型来说，事件源与事件监听器是统一的，或者说事件监听器完全消失了。当用户在GUI组件上激发某个事件时，组件自己特定的方法将会负责处理该事件。

>《疯狂Java讲义》**闭包（Closure）和回调**：   
闭包是一种能被调用的对象，它保存了创建它的作用域的信息。  
Java并不能显示的支持闭包，但对于非静态内部类而言，它不仅记录了其外部类的详细信息，还保留了一个创建非静态内部类对象的引用，并且可以直接调用外部类的private成员，因此可以把**非静态内部类当成**面向对象领域的**闭包**。  
通过这种仿**闭包**的非静态内部类，可以很方便的**实现回调功能**，回调就是某个方法一旦获得了内部类对象的引用后，就可以在适合的时候反过来调用外部类实例的方法。所谓**回调就是**允许客户类通过内部类引用来调用其外部类的**方法**。

>闭包是对象，回调是方法（功能）。利用闭包实现回调。

>详见书中代码（必看）


#### 3.3.1回调机制与监听机制

为了使用回调机制类处理GUI组件上所发生的事件，我们需要为该组件提供对应的事件处理方法——然而Java又是一种静态语言，我们无法为某个对象动态的添加方法，因此只能继承GUI组件类，并重写该类的事件处理方法来实现。  

为了实现回调机制的事件处理，Android为所有GUI组件都提供了一些事件处理的回调方法，以View为例，该类包含如下方法：  

- boolean onKeyDown(int keyCode,KeyEvent event):当用户在该组件按下某个按键时触发该方法。  
- boolean onKeyLongPress(int keyCode,KeyEvent event): ... 长按 ...  
- boolean onKeyShortcut(int keyCode,KeyEvent event): ...当一个键盘快捷键发生时 ...   
- boolean onKeyUp(int keyCode,KeyEvent event): ... 松开某个按键时 ...  
- boolean onTouchEvent(MotionEvent event): ... 触发触摸屏事件时...  
- boolean onTrackballEvent(MotionEvent event): ... 触发轨迹球事件时...  



基于回调的事件处理机制可以通过自定义View来实现，自定义View时重写该View的事件处理方法即可。

示例代码:

```java
public class MyButton extends Button{
	public MyButton(Context context, AttributeSet set){
		super(context, set);
	}

	//在实际运行时却没有反应??? 而覆盖onTouchEvent方法可以打印Log
	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event){
		super.onKeyDown(keyCode, event);
		Log.v("-crazyit.org", "the oKeyDown in MyButton");
		//返回true，表面该事件不会再向外扩张（表明已经消费了该事件）
		return true;
		//在下一个示例中，将其改为false；这里不再重复代码。
	}
}
```

然后在某布局文件中加入如下标签：  

```xml
<package.MyButton
	android:layout_width="match_parent"
	android:layout_beight="wrap_content"
	android:text="单击我" />
```

接下来在java程序中无须为该按钮绑定事件监听器；因为该按钮自己重写了onKeyDown()方法，这意味着它自己处理相应事件。

```
基于监听的事件模型  --->   事件交给监听器处理。  
基于回调的事件模型 ---->   事件源和事件监听器是统一的，事件由事件源自己处理。
```


> **所以：**基于回调的事件模型只在实现该事件源时进行覆盖。而基于事件监听器的模型可以在其他类中为其实现事件处理器。




#### 3.3.2 基于回调的事件传播

> 原来Android中的事件传递机制针对的是基于回调的事件模型。  
> 更详细的事件传递机制见《Android群英传》


几乎所有基于回调的事件处理方法都有一个boolean类型的返回值，该返回值用于标识该处理方法是否能完全处理该事件。  

- 如果处理事件的回调方法返回true，表明该处理方法已经完全处理该事件，该事件不会传播出去。   
- 如果返回false，表明该处理方法并未完全处理该事件，该事件会传播出去。  



对于基于回调的事件传播而言，某组件上所发生的事件不仅会激发该组件上的回调方法，**也会触发该组件所在Activity的回调方法——只要事件能传播到该Activity**。



示例代码,同时使用事件监听和回调，略

```java
public class MainActivity extends Activity{
	@Override
	public void onCreate(Bundle savedInstanceState){
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);
		Button bn = (Button)findViewById(R.id.my_button);

		//为自定义的button绑定事件监听器
		bn.setOnkeyListener(new OnKeListener()
			@Override
			public boolean onKey(View source, int keyCode, keyEvent event){
				//只处理按下键的事件
				if(event.getAction() == KeyEvent.ACTION_DOWN){
					Log.d("-Listener-", "the onKeyDown in Listener");
				}
				//返回false,表明让事件继续向外传播
				return false;
			});
	}

	//重写Activity的onKeyDown方法,该方法可以监听它所包含的所有组件的按键被按下事件
	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event){
		super.onKeyDown(keyCode, event);
		Log.d("-Activity-","the onKeyDown in Activity");
		//返回false,表明让事件继续向外传播
		return false;
	}
}
```

同时更改MyButton中的onKeyDown方法，让其返回false。  

正常情况下，其打印的Log顺序如下：
```
the onKeyDown in Listener
the oKeyDown in MyButton
the onKeyDown in Activity
```

当组件上发生某个按键被按下的事件时，Android系统最先触发的应该是该按键上绑定的事件监听器，然后才触发该组件提供的事件回调方法，最后还会传播到该组件在的Activity。


> 重写onTouchEvent方法响应触摸屏幕事件


对比Android提供的两种事件处理模型，不难发现基于监听的事件处理模型具有更大的优势。   

- 基于监听的事件处理模型分工明确，事件源、事件监听器由两个类分开实现，因此具有更好的可维护性。  
- android的事件处理机制保证基于监听的事件监听器会被优先触发。

另通过为View提供事件处理的回调方法，可以很好的把事件处方法封装在该View内部，从而提高程序的内聚性，即更适合应付那种事件处理逻辑比较固定的View。



### 3.4 响应系统设置的事件

让程序监听系统设置的更改。

#### 3.4.1 Configuration类简介

Configuration类用于描述手机设备上的配置信息，这些配置信息既包括用户特定的配置项，也包括系统的动态设备配置。

调用Activity的如下方法可以获取到系统的Configuration对象：  

```java
Configuration cfg = getResources().getConfiguration();
```


#### 3.4.2 重写onConfigurationChanged方法响应系统设置更改

如果要监听系统设置的更改，则可以考虑重写**Activity**的onConfigurationChanged(Configuration newConfig)方法(一个基于回调的方法)。





