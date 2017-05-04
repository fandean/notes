# Android事件处理和拦截

## Android事件处理

> 来自《疯狂Android讲义》第3章 android的事件处理


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







## 触摸事件

> 参考《Android群英传》第3.8节：事件拦截机制分析

**触摸事件**：捕获触摸屏幕后产生的事件。Android为触摸事件封装了一个类 MotionEvent，它保存了动作类型和坐标。

当点击一个按钮(触屏)时，会产生两个或者三个事件(三个基本事件)：  

- 事件一：按钮按下,down
- 事件二：不小心滑动了一下,move
- 事件三：手抬起,up



>平时与手机交互时最多的就是触摸屏幕和点击实体按键。通过对三个基本事件的监听，判断用户执行了何种操作。一个标准的触屏操作一般都是一系列基本事件的组合。通过onTouchEvent()【回调】、onTouch()【监听】方法获取基本的触屏事件，而像点击事件onClick已经是一系列基本事件的组合。
>
> 比如，发生了Down事件，在Up事件之前没有发生move事件，或者move的范围很小，并且down事件和up事件的间隔很短；这就是一个click或singelTop事件。



## Android事件拦截机制

> 参考《Android群英传》第3.8节：事件拦截机制分析

> 原来Android中的事件传递机制针对的是基于回调的事件模型。 

