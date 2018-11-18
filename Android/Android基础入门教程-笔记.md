Android基础入门教程-笔记
=================
私自摘抄：未经作者同意  
[Android基础入门教程](http://www.kancloud.cn/kancloud/android-tutorial)

第一章：环境搭建和开发相关
--------------------------------------

### 1. 相关术语解析

- Dalvik： Android特有的虚拟机,和JVM不同,Dalvik虚拟机非常适合在移动终端上使用!
- AVD： (android virtual machine):安卓虚拟设备,就是安卓的模拟器
- ADT： (android development tools)安卓开发工具
- SDK：(software development kit)软件开发工具包,就是安卓系统,平台架构等的工具集合,如adb.exe
- DDMS：(dalvik debug monitor service)安卓调试工具
- ADB：安卓调试桥,在sdk的platform-tools目录下,功能很多,命令行必备
- DX工具：将.class转换成.dex文件
- AAPT：(android asset packing tool),安卓资源打包工具
- R.java文件：由aapt工具根据App中的资源文件自动生成,可以理解为资源字典
- AndroidManifest.xml：app包名 + 组件声明 + 程序兼容的最低版本 + 所需权限等程序的配置文件

###  2. APP程序打包与安装的流程

![enter image description here](http://box.kancloud.cn/2015-12-01_565da5a244b6a.jpg)


### 3. APP的安装过程
![](http://box.kancloud.cn/2015-12-01_565da5a26b649.jpg)


### 4. Android Studio 界面分析
![](http://box.kancloud.cn/2015-12-01_565da5a9e3f6d.jpg)

### 5. SDK无法更新的解决方法

- 修改Hosts文件，[hosts下载地址1](https://github.com/racaljk/hosts/blob/master/hosts)  [hosts下载地址2](http://www.360kb.com/kb/2_150.html)
- 使用国内镜像服务器 [AndroidDevTools](http://www.androiddevtools.cn/)

### 6. Genymotion模拟器问题

①不喜欢原生的系统,想用标准sdk中的系统版本  
②老登录不了?或者获取不了手机列表  
③觉得模拟器占屏幕太大了  
④运行程序，直接拖拉APK到模拟器上出现下述问题  
⑤因程序需要，要查看模拟器的sdk目录：  
之前的话我们在Eclipse上是通过mmt/sdcard找到sd卡目录的; 但是genymotion却不是在这个路径下:而是在下面这个路径下: /mnt/shell/emulated/0/ 可以根据后面的Info慢慢找出来



### 7. Git教程 略
[Git教程](http://www.kancloud.cn/kancloud/android-tutorial/87288)
![enter image description here](http://box.kancloud.cn/2015-12-01_565da5c5a3008.jpg)

Git 在保存和对待各种信息的时候与其它版本控制系统有很大差异，尽管操作起来的命令形式非常相近，理解这些差异将有助于防止你使用中的困惑。

学习git这一篇必须看[Git 基础](http://www.kancloud.cn/kancloud/progit/70167)

### 8.  9（九妹）图片怎么玩
1. 什么是.9图片？ 
答：图片后缀名前有.9的图片,如pic1.9.png这样的图片

2. .9图片能干嘛？ 答： 在图片拉伸的时候特定的区域不会发生图片失真，而不失真的区域可以由我们自己绘制3. .9图片用什么做？ 答：工欲善其事，必先利其器，做.9图片的工具有：

①Android SDK自带：draw9patch.bat
②NinePatchEditor：支持批量操作，而且界面看起来美观一点
③NinePng九图神器，手机版的.9处理工具
④PhotoShop，这就显得比较夸张了

**制作方法：** 

>核心要点：左上拉伸，右下内容

draw9patch.bat界面：  
![](http://box.kancloud.cn/2015-12-01_565da5cd683e1.jpg "点击查看原图")
右面的预览区域分别是：纵向拉伸，横向拉伸，横纵都拉伸的预览。

黑色线是一条条点出来的,如果想消除点的话:按住shift点即可！

>**看下别人如何做.9图**  
> <http://www.miued.com/2074>
>  <http://blog.csdn.net/lizzy115/article/details/7950959>


### 9. 界面原型设计

两个国产的界面原型设计工具：Mockplus(摩客)和墨刀，两者都不支持Linux系统。其中摩客有一个在线免费的[Chainco UI设计师的交互演示利器](https://www.chainco.cn/)


### 10.工程相关解析（文件，资源）

>说到这个res目录，另外还有提下这个assets目录，虽然这里没有，但是我们可以自己创建，两者的区别在于是否前者下所有的资源文件都会在R.java文件下生成对应的资源id，而后者并不会；前者我们可以直接通过资源id访问到对应的资源；而后者则需要我们通过AssetManager以二进制流的形式来读取！对了，这个R文件可以理解为字典，res下每个资源都都会在这里生成一个唯一的id！

**values目录**  
- demens.xml：定义尺寸资源
- string.xml：定义字符串资源
- styles.xml：定义样式资源
- colors.xml：定义颜色资源
- arrays.xml：定义数组资源
- attrs.xml：自定义控件时用的较多，自定义控件的属性！
- theme主题文件，和styles很相似，但是会对整个应用中的Actvitiy或指定Activity起作用，一般是改变窗口外观的！可在Java代码中通过setTheme使用，或者在Androidmanifest.xml中为添加theme的属性！ PS:你可能看到过这样的values目录：values-w820dp，values-v11等，前者w代表平板设备，820dp代表屏幕宽度；而v11这样代表在API(11)，即android 3.0后才会用到的！

**raw目录**  
raw目录： 用于存放各种原生资源(音频，视频，一些XML文件等)，我们可以通过openRawResource(int id)来获得资源的二进制流！其实和Assets差不多，不过这里面的资源会在R文件那里生成一个资源id而已。

**存放动画的目录**  
动画有两种：属性动画和补间动画：
- animator：存放属性动画的XML文件
- anim：存放补间动画的XML文件



#### 如何使用这些资源
1. Java代码中使用   
 注意`文字`和`图片`的使用方式  
```
文字：txtName.setText(getResources().getText(R.string.name)); 
图片：imgIcon.setBackgroundDrawableResource(R.drawable.icon); 
颜色：txtName.setTextColor(getResouces().getColor(R.color.red)); 
布局：setContentView(R.layout.main);
控件：txtName = (TextView)findViewById(R.id.txt_name);
 ```
2. XML中使用  
通过@xxx即可得到

#### MainActivity.java
![](http://box.kancloud.cn/2015-12-01_565da5d919ffb.jpg)

#### 布局文件：activity_main.xml
我们定义了一个LinearLayout线性布局，在xml命名空间中定义我们所需要使用的架构,来自于①  
![](http://box.kancloud.cn/2015-12-01_565da5d9372c5.jpg)


#### AndroidManifest.xml配置文件
代码：
```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="jay.com.example.firstapp" >

    <application
        android:allowBackup="true"
        android:icon="@mipmap/ic_launcher"
        android:label="@string/app_name"
        android:theme="@style/AppTheme" >
        <activity
            android:name=".MainActivity"
            android:label="@string/app_name" >
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />

                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>

</manifest>
```

代码分析：
![](http://box.kancloud.cn/2015-12-01_565da5da6dd27.jpg)

除上述内容外： 
>①如果app包含其他组件的话,都要使用类型说明语法在该文件中进行声明 Server:元素 BroadcastReceiver元素 ContentProvider元素 IntentFilter元素

>②权限的声明: 在该文件中显式地声明程序需要的权限,防止app错误地使用服务, 不恰当地访问 资源,最终提高android app的健壮性 android.permission.SEND_SMS 有这句话表示app需要使用发送信息的权限,安装的时候就会**提示用户**, 相关权限可以在sdk参考手册查找！


### 11.Android程序签名打包 略
[Android程序签名打包](http://www.kancloud.cn/kancloud/android-tutorial/87149)

### 12.反编译APK获取代码&资源
>"反编译Apk"，看上去好像好像很高端的样子，其实不然，就是通过某些反编译软件，对我们的APK进行反编译，从而获取程序的源代码，图片，XML资源等文件；不知道你有没有这样做过，看到一个别人的一个APP界面做得很精美，或者你看上别人的图片素材，简单点的，我们可以下载别人的APK，然后改下后缀名，改成xxx.zip，然后解压

>但是，这种方法，获得的只会是一些.png，或者.jpg这样的位图文件资源，如果是xml类的资源，打开我们会发现是乱码，并且假如我们想看APK程序的Java代码，也是行不通的，因为他们都打被打包到classes.dex文件中！


1. 需要的三个工具
>1. apktool：获取资源文件，提取图片文件，布局文件，还有一些XML的资源文件；[ApkTool](http://ibotpeaches.github.io/Apktool/)
>2. dex2jar：将APK反编译成Java源码(将classes.dex转化为jar文件) ；[dex2jar](https://github.com/pxb1988/dex2jar)
>3. jd-gui：查看2中转换后的jar文件，即查看Java文件；[Java Decompiler](http://jd.benow.ca/)

`:)` 

## 第二章：Android中的UI组件的详解

### 2.1 View与ViewGroup的概念

完整创建UI布局的引导，请参考[XML Layouts](http://androiddoc.qiniudn.com/guide/topics/ui/declaring-layout.html)

Android里的图形界面都是由View和ViewGroup以及他们的子类构成的： View：所有可视化控件的父类,提供组件描绘和时间处理方法 ViewGroup： View类的子类，可以拥有子控件,可以看作是容器 Android UI中的控件都是按照这种层次树的结构堆叠得，而创建UI布局的方式有两种， 自己在Java里写代码或者通过XML定义布局。更多的 时候使用它们的子类控件或容器来构建布局！


### 2.2 布局
#### LinearLayout（线性布局）
![本节学习图](http://box.kancloud.cn/2015-12-01_565da5e739a62.jpg)

**weight属性详解：**
如果我们不使用上述那种设置为`0dp`的方式,直接用`wrap_content`和`match_parent`的话, 则要接着解析`weight`属性了。

其中`match_parent`(或`fill_parent`):这个则需要计算了：

```xml
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"    
    xmlns:tools="http://schemas.android.com/tools"    
    android:id="@+id/LinearLayout1"    
    android:layout_width="match_parent"    
    android:layout_height="match_parent" >    

    <TextView    
        android:layout_weight="1"    
        android:layout_width="fill_parent"    
        android:layout_height="fill_parent"    
        android:text="one"     
        android:background="#98FB98"    
     />    
     <TextView    
        android:layout_weight="2"    
        android:layout_width="fill_parent"    
        android:layout_height="fill_parent"    
        android:text="two"     
        android:background="#FFFF00"    
     />    
     <TextView    
        android:layout_weight="3"    
        android:layout_width="fill_parent"    
        android:layout_height="fill_parent"    
        android:text="three"     
        android:background="#FF00FF"    
     />    

</LinearLayout> 
```
运行效果如图： 
![](http://box.kancloud.cn/2015-12-01_565da5e83d208.jpg)

这个时候就会有疑问了,怎么会这样,这比例是2:1吧,那么three去哪了？代码里面明明有 three的啊,还设置了3的,而1和2的比例也不对耶,1:2:3却变成了2:1:0,怎么会这样呢? 答:这里其实没那么简单的,还是需要我们计算的,网上给出的算法有几种,这里就给出笔者 觉得比较容易理解的一种: **step 1：**个个都是fill_parent,但是屏幕只有一个啦,那么`1 - 3 = - 2` fill_parent **step 2：**依次比例是1/6,2/6,3/6 **step 3：**先到先得,先分给one,计算: `1 - 2 * (1/6) = 2/3 `fill_parent 接着到two,计算: `1 - 2 * (2/6) = 1/3 `fill_parent 最后到three,计算 `1 - 2 * (3/6) = 0` fill_parent **step 4：**所以最后的结果是:one占了两份,two占了一份,three什么都木有 以上就是为什么three没有出现的原因了,或许大家看完还是有点蒙,没事,我们举多几个例子试试就知道了！

。。。

LinearLayout也是我们 用的比较多的一个布局,我们更多的时候更钟情于他的weight(权重)属性，等比例划分，对屏幕适配还是 帮助蛮大的;但是使用LinearLayout的时候也有一个问题，就是当界面比较复杂的时候，需要嵌套多层的 LinearLayout,这样就会降低UI Render的效率(渲染速度),而且如果是listview或者GridView上的 item,效率会更低,另外太多层LinearLayout嵌套会占用更多的系统资源,还有可能引发stackoverflow; 但是如果我们使用RelativeLayout的话,可能仅仅需要一层就可以完成了,以父容器或者兄弟组件参考+margin +padding就可以设置组件的显示位置,是比较方便的!当然,也不是绝对的,具体问题具体分析吧! 总结就是:尽量使用RelativeLayout + LinearLayout的weight属性搭配使用吧！


>对于为什么LinearLayout定义了orientation="vertical"后它的子控件就不能设置layout_gravity="bottom" 这类垂直方向上的值；原因是垂直方向已经由LinearLayout自己决定了，它必须用它控制所有子控件，可以通过gravity设定子控件整体的竖直方向的值（多弄几个子控件，看一看排列就 知）。


#### RelativeLayout（相对布局）

**相对布局核心属性：**  
![](http://box.kancloud.cn/2015-12-01_565da5eb6677d.jpg "点击查看原图")

**父容器定位属性示意图**
![](http://box.kancloud.cn/2015-12-01_565da5ecac8b2.jpg)

**根据兄弟组件定位**
什么是兄弟组件吧,所谓的兄弟组件就是处于同一层次容器的组件,如图
![组件1和组件2是兄弟组件](http://box.kancloud.cn/2015-12-01_565da5ee4f2ae.jpg)

图中的组件1,2就是兄弟组件了,而组件3与组件1或组件2并不是兄弟组件,所以组件3不能通过 组件1或2来进行定位,比如layout_toleftof = "组件1"这样是会报错的！

**margin与padding的区别**
内容区域周围的空间：内边距,padding
内边距的外边缘：边框,border
边框外面将元素与相邻元素隔开的不可见区域：外边距,margin



#### TableLayout（表格布局）
TableLayout表格布局继承了LinearLayout，表格布局中，列的宽度由该列中最宽的单元格决定，整个表格布局的宽度取决于父容器的宽度（默认总是占满父容器本身），**只需设置单元格的高度就可以了**。


![enter image description here](http://box.kancloud.cn/2015-12-01_565da5f116a49.jpg)

  **如何确定行数与列数**    
①如果我们直接往TableLayout中添加组件的话,那么这个组件将占满一行！！！  
②如果我们想一行上有多个组件的话,就要添加一个TableRow的容器,把组件都丢到里面！  
③tablerow中的组件个数就决定了该行有多少列,而列的宽度由该列中最宽的单元格决定  
④tablerow的layout_width属性,默认是fill_parent的,我们自己设置成其他的值也不会生效！！！ 但是layout_height默认是wrapten——content的,我们却可以自己设置大小！   
⑤整个表格布局的宽度取决于父容器的宽度(占满父容器本身)   
⑥有多少行就要自己数啦,一个tablerow一行,一个单独的组件也一行！多少列则是看tableRow中 的组件个数,组件最多的就是TableLayout的列数   

**常用属性（作用于列）**   
android:collapseColumns:设置需要被隐藏的列的序号   
android:shrinkColumns:设置允许被收缩的列的列序号   
android:stretchColumns:设置运行被拉伸的列的列序号   
拉伸和收缩能保证表格适应父容器的宽度。可以设置即收缩又拉伸吗？   

以上这三个属性的列号都是从0开始算的,比如shrinkColunmns = "2",对应的是第三列！
可以设置多个,用逗号隔开比如"0,2",如果是所有列都生效,则用"*"号即可
除了这三个常用属性,还有两个属性,分别就是跳格子以及合并单元格,这和HTML中的Table类似:

`android:layout_column="2"`:表示的就是**跳过**第二个,直接显示到第三个格子处,从1开始算的!   
`android:layout_span="4"`:表示**合并4个单元格**,也就说这个组件占4个单元格
可以通过设置单元格内控件的最小宽度来解决一些问题，例如：`android:minWidth="150dp"`


#### FrameLayout（帧布局）
帧布局由FrameLayout所代表，它直接继承至ViewGroup组件。  
帧布局容器中为**每个**加入其中的组件创建一个空白的区域（称为一帧），每个子组件占据一帧，这些帧都会根据gravity属性执行自动对齐。帧布局的效果就是把组件一个个的叠加在一起（FrameLayout不支持把下面的帧上移）。

但是FrameLayout并没有提供设置其子组件的任何定位方式。帧布局的大小有最大子控件决定。

FrameLayout必须的属性是layout_wight，layout_height。

**前景图像**：永远处于帧布局最上面,直接面对用户的图像,就是不会被覆盖的图片。   
android:foreground: 设置改帧布局容器的前景图像    
android:foregroundGravity: 设置前景图像显示的位置    

#### GridLayout（网格布局）

- 可以自己设置布局中组件的排列方式
- 可以自定义网格布局有多少行,多少列
- 可以直接设置组件位于某行某列
- 可以设置组件横跨几行或者几列

![enter image description here](http://box.kancloud.cn/2015-12-01_565da5f58c9c8.jpg)

GridLayout控件自身的 layout_gravity 属性的设置；和子控件的layout_gravity=“fill" 属性值的使用，fill代表填充，它能解决使用 match_parent属性值带来的一些问题。

如果你要让组件填满横越过的行或列的话,需要添加下面这个属性: android:layout_gravity = "fill"

用法归纳：
1. 先定义GridLayout的对齐方式，水平或竖直；多少行、列。
2. 设置子控件所在的行列（从0开始）
3. 设置子控件横跨几行或几列；然后设置layout_gravity="fill" 


#### AbsoluteLayout（绝对布局）

略


### 2.3表单
UI控件
#### TextView（文本框）
介绍几个属性：
textStyle：设置字体风格，三个可选值：normal(无效果)，bold(加粗)，italic(斜体)

**带阴影的TextView**  
涉及到的几个属性：  
- shadowColor：设置阴影颜色，需与shadowRadius一起使用
- shadowRadius：设置阴影的模糊程度，0.1成为字体颜色，建议3.0
- shadowDx：设置阴影咋水平方向上的偏移
- shadowDy：设置阴影咋竖直方向上的偏移

如果出现`Paint.setShadowLayer is not supported`问题，暂时不用管，预览不成功，但是安装到手机上一般可以正确显示。


**带边框的TextView**  
如果你想为TextView设置一个边框背景，普通矩形边框或者圆角边框！下面可能帮到你！ 另外TextView是很多其他控件的父类，比如Button，也可以设置这样的边框！ 实现原理很简单，自行编写一个ShapeDrawable的资源文件！然后TextView将blackgroung 设置为这个drawable资源即可！

>ShapeDrawable资源文件的几个节点及属性：    
>设置背景色   
>设置边框粗细和颜色   
>设置边距   
>设置圆角   
>设置渐变色，可选属性有：startColor 起始颜色、endColor、centerColor中间颜色、angle 方向角度（等于0时，从左到右`→`，然后逆时针方向旋转，angle=90度时，从下往上`↑`）、type 设置渐变的类型。   
>参考[博客ShapeDrawable](http://hubingforever.blog.163.com/blog/static/17104057920108744427780/)  
>[ShapeDrawable](https://developer.android.com/reference/android/graphics/drawable/ShapeDrawable.html) 

可测试一下在带边框的文字中设置边框内TextView的padding属性和layout_margin属性，特别是layout_margin。思考：        android:background="@drawable/shape_drawable_1" 它是作为背景引入的。

**带图片(drawableXxx)的TextView**
如：
![enter image description here](http://box.kancloud.cn/2015-12-01_565da5fc0d869.jpg)

通过设置TextView的drawableXxx属性就可：
drawableXxx ; 可以设置四个方向的图片: drawableTop(上) , drawableButtom(下), drawableLeft(左), drawableRight(右)  另外,你也可以使用drawablePadding 来设置图片与文字间的间距！
但是这样在XML文件中是无法设置大小等，需要在java源代码中进行设置。  



**使用autoLink属性识别链接类型**  
通过设置autoLink属性；当我们点击 文字中对应部分的文字，即可跳转至某默认APP，比如一串号码，点击后跳转至拨号界面

**TextView玩转HTML**
如题，除了显示普通文本外，TextView还预定义了**一些**类似于HTML的标签，通过这些标签，我们可以使 TextView显示不同的字体颜色，大小，字体，甚至是显示图片，或者链接等！我们只要使用HTML中的一些 标签，加上**android.text.HTML类**的支持，即可完成上述功能！

如果直接setText的话是没作用的，我们需要调用Html.fromHtml()方法将字符串转换为CharSequence接口， 然后再进行设置，如果我们需要相应设置，需要为TextView进行设置，调用下述方法：调用 TextView实例的该方法setMovementMethod(LinkMovementMethod.getInstance())

```java
TextView t1 = (TextView)findViewById(R.id.txtOne);
        String s1 = "<font color='blue'><b>百度一下，你就知道~：</b></font><br>";
        s1 += "<a href = 'http://www.baidu.com'>百度</a>";
        t1.setText(Html.fromHtml(s1));
        t1.setMovementMethod(LinkMovementMethod.getInstance());
```

**测试src标签，插入图片：**  
略，代码没将清除

**SpannableString&SpannableStringBuilder定制文本**  

还可以使用SpannableString和SpannableStringBuilder两个类来完成，两者区别：前者针对的是不可变文本，而后者则是针对可变文本。并提供了相关方法用于在源代码中调用。  
如设置下滑线、删除线、图片、文本颜色、**文本可点击**、修饰效果、文本超链接。

使用方式：  
```java
	SpannableString span = new SpannableString("要进行设置的字体");
	//使用 span 调用其重载的setSpan方法，进行设置
	span.setSpan(不同类型的对象，0，2，常量);
	//然后将 span 对象传入TextView 组件的一个实例
	t1.setText(span);
```





