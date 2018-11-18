# android应用的资源

>《疯狂Android讲义》第6章：Android应用的资源


## 1. 颜色资源

/res/values/colors.xml  



Android中的颜色值是通过红(Red)、绿(Green)、蓝(Bule）三原色，以及一个透明度(Alpha)值来表示的。颜色值总是以 `#` 号开头的十六进制值。



**三原色的原理：**   

白光大致可分解为 红、绿、蓝 三种光。当 红 绿 蓝 都是最大值时，三种光合并就变成白色光；当三种光的值相等，但不是最大值

时，三种光将会合并成灰色光；如果其中一种光或两种光的值更亮，那么三种光合并就产生彩色光。



    #FFF  白

    #000  黑

    #F00  红

    #0F0  绿

    #00F  蓝



至少明白上面的几种颜色是表示的原理



## 2.数组资源(Array)



```xml

<array.../> 子元素：定义普通类型的数组，例如Drawable数组。

<string-array.../>子元素：定义整形数组。

<integer-array.../>子元素：定义整型数组。

```



Resources类提供了如下方法访问数组：  

- TypedArray obtainTypedArray(int d)

- String[] getStringArray(int id)

- int[] getIntArray(int d)



TypdArray 代表一个通用类型的数组，使用时进行替换，如array。该类提供了 getXxx(int index)方法获取指定位置的数组元素。



## 3.使用Drawable资源

### 3.1 图片资源

Android要求图片资源的文件名必须符合Java标识符的命名规则，否则SDK无法为其生成资源索引。


### 3.2 StateListDrawable资源
State：状态

StateListDrawable用于组织多个Drawable对象。当使用StateListDrawable作为目标组件的背景、前景图片时，
StateListDrawable 对象所显示的 Drawable 对象会随目标组件状态的改变而自动切换。  

定义StateListDrawable对象的XML文件的根元素为 `<selector.../>`，该元素可以包含对个`<item.../>`元素，
该元素可指定如下属性：   

- android:color 或 android:drawable：指定颜色或Drawable对象。
- android:state_xxx：指定一个特定状态。


示例：  
```xml
my_image.xml文件
<selector xmlns:android="http://schemas.android.com/apk/res/android">
	<item android:state_focused="true"
		android:color="#f44"/>
	<item android:state_focused="false"
		android:color="#ccf"/>
</selector>
```
在定义EditText组件时使用该资源：  
```xml
activity_main.xml文件
...

<EditText
	android: ...
	android:textColor="@drawable/my_image"/>

	...
```



### 3.3 LayerDrawable资源
Layer：层，分层


### 3.4 ShapeDrawable资源
Shape：形状

### 3.5 ClipDrawable资源
ClipDrawable代表从其他位图上截取的一个“图片片段”。

实例：徐徐展开的风景  
ClipDrawable对象可以调用setLevel(int level)控制截取图片的部分，因此只要设置一个定时器，让程序不断调用setLevel()即可实现图片的展开。

### 3.6 AnimationDrawable资源
AndroidDrawable代表一个动画。

- 逐帧动画：一张张图片切换  
- 补间动画：支持通过平移、变换计算出来。定义补间动画的思路：设置一张图片的开始状态（透明度、位置、缩放比、旋转度），并设置该图片的结束状态，在设置动画的持续时间即可。




## 4 属性动画
属性动画（Property Animation）资源。Animator代表一个属性动画，但它是一个抽象类，通常使用它的子类。

从某种角度看，属性动画是增强版的补间动画。




## 5 使用原始XML资源

## 6 使用布局(Layout)资源

## 7 使用菜单(Menu)资源

## 8 样式(Style)和主题(Theme)

### 8.1 样式(Style)
样式也包含一组格式，为一个组件设置使用某个样式时，该样式所包含的全部格式将会应用于该组件。
其它UI组件通过style属性来指定样式，这就相当于把该样式包含的所有格式同时应用与该UI组件。

根元素为 `resources`可包含多个 `style`子元素，每个`style`子元素定义一个样式。
`style`元素指定如下两个属性：  

- name: 指定样式的名称
- parent：指定该样式所继承的父样式。当继承某个父样式时会继承其全部格式，也可覆盖父样式指定的格式。


`style`元素内可包含多个`item`子元素，每个子元素定义一个格式项。

```xml
<resources>
	<style name="xxx" parent="xx">
		<item name="android:background">#ee6</item>
		<item name="android:textSize">20sp</item>
		...
	</style>
	<style name=" ">
	...
	</style>
	...
</resources>
```

### 8.2 主题
主题的定义形式与样式一样。

主题与样式的区别是：  

- 主题不能作用与单个的View组件，主题应该对整个应用中的所有Activity起作用，或对指定的Activity起作用。
- 主题定义的格式应该是改变窗口外观的格式，例如窗口标题、窗口边框等


## 9 属性(Attribute)资源

## 10 使用原始资源










