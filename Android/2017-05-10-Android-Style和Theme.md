---
layout: post
title: "Android Style和Theme"
description: "Android Style和Theme"
date: 2017-05-10
tags: [Android]
category: Android
comments: true
share: true
---


* Kramdown table of contents
{:toc .toc}


# Style and Theme



样式Style、主题Theme和属性： 

主题实际就是一种样式，但是...

属性包含了，样式属性和主题属性；这也是区别样式和主题的一种方法。



## 样式Style
样式Style: 是一套能够用于View组件的 **属性Attr**。

添加新样式:  
```xml
<resources>
...
<style name="BeatBoxButton">		<!-- 样式  -->
	<item name="android:backgroud">@color/dark_bule</item>  <!-- 该样式所包含的属性和值  -->
	<item name="android:textSize">10sp</item>
	<item>...</item>
</style>
...
</resources>
```

将该样式应用于某个按钮：  
```xml
<Button
	android:id="@+id/button1"
	style="@style/BeatBoxButton"
	android:layout_width="match_parent"
	android:layout_height="wrap_content"/>


<Button
	android:id="@+id/button2"
	android:backgroud="@color/dark_bule"
	android:textSize="10sp"
	android:layout_width="match_parent"
	android:layout_height="wrap_content"/>
```

上面button1和button2显示效果一样，使用一个style相当于同时设置了backgroud和textSize两个属性。


样式继承：一个样式能 **继承** 并 **覆盖** 其他样式的属性。

使用`.`表示继承：继承我们自定义的Style时常用`.`来表示。  
或使用`parent="父Style"` 来指定父Style，常用于继承系统自带的样式。  

> 深入样式(主题)继承: 需要遵循的一条规定是，在跨库继承时必须使用`parent`属性。

```xml
<!-- 使用 . 表示继承-->
<style name="BeatBoxButton.Strong">
	<item name="android:textStyle">bold</item>
</style>

<!-- 使用parent 进行指定父style -->
<style name="StrongBeatBoxButton" parent="@style/BeatBoxButton">
	<item name="android:textStyle">bold</item>
</style>
```

### 样式的优缺点

样式的应用场景： styles.xml文件为公共文件；在该文件中可以为所有组件定义一套样式属性共用，（定义**公共样式属性**）。

样式的缺点： 样式在实际应用时，需要逐个为所有组件添加它们要用到的样式；组件一多就比较麻烦。


为解决样式的缺点则有了主题。


## 主题Theme

定义一套公共主题Theme，样式需要逐个添加，而**主题属性**会自动应用于整个应用。

**主题属性**：它能引用颜色这样的外部资源，也能引用 **其他样式**。

使用主题，可以简单的说：“所有按钮都使用这个样式”。再也不用找每个按钮，直接告诉它们要用那个主题就好了。


主题是在AndroidManifest.xml文件中声明。

AppCompat库自带的三大主题：  

- Theme.AppCompat : 深色主题
- Theme.AppCompat.Light : 浅色主题
- Theme.AppCompat.Light.DarkActionBar : 带深色工具栏的浅色主题

```xml
<!-- 为AppTheme主题添加三个自定义属性  -->
<style name="AppTheme" parent="Theme.AppCompat">
	<item name="colorPrimary">@color/red</item>
	<item name="colorPrimaryDark">@color/dark_red</item>
	<item name="colorAccent">@color/gray</item>
</style>
```

注意： 从上面的三个主题属性中可以看出其与样式属性的**属性名**不同。其次其应用范围也不一样。


> 主题实际就是一种样式，但是...
>
> 属性包含了，样式属性和主题属性；这也是区别样式和主题的一种方法。


### 深入学习：引用主题属性

在主题中定义好属性后，可以在XML代码中直接使用它们。

之前在xml文件中引用具体值时，我们使用`@`符号。比如`@color/gray`指向某个特定资源。

引用主题属性时，我们使用`?`；例如：为按钮添加背景色  

```
android:background="?attr/colorAccent"
```

### 覆盖主题属性
哪些主题属性可用？哪些主题属性可以覆盖？该主题属性有什么作用？

比如我要更改应用的背景色。是把应用中所有控件、fragment和Activity的背景色一一进行改变？还是直接覆盖主题的背景色？这个主题的背景色对应的主题属性名称又是什么（究竟要覆盖哪个属性)？  

查找该属性名称的方法见书。


### 修改应用中所有按钮的某些属性

见书



## ThemeOverlay

5.0 level 21之后，可以给view单独设置theme属性了。Android预定义了一组叫做ThemeOverlay的style，现在多用在action bar上，它可以覆盖父类定义的theme的部分属性。

作为 Application Theme 的 parent 主题，Theme.AppCompat 提供了诸多属性设置 App 全局 Views 样式。但是有时候，我们还是需要单独给某个或者某些 View 设置与全局样式不一样的样式。这种情况下，ThemeOverlay.AppCompat 就派上用场啦。


给view单独设置一个theme的主要用在ToolBar上；比如当前使用白色主题但想用黑色的ToolBar，只需在ToolBar的xml文件中添加
`android:theme="@android:style/ThemeOverlay.Material.Dark.ActionBar"`即可。


> ToolBar中 PopupTheme属性是用来控制弹出菜单的样式。

如果你在某View上见到如下示例，`android:theme="@style/AppTheme.Secondary"` 那么主题`AppTheme.Secandary`继承了`ThemeOverlay.AppCompat`。



## 参考：
Style and Theme参考：

> - 《Android编程权威指南 2》第20章 样式与主题  
> - [**Attr、Style和Theme详解**](http://www.jianshu.com/p/dd79220b47dd)  
> - [Android开发之Theme、Style探索及源码浅析](http://blog.csdn.net/yanbober/article/details/51015630)  
> - [(译) 深度讲解 Android 主题层级](https://juejin.im/entry/576b9f912e958a005715c7a0)  

ThemeOverlay参考：  
> - [正确使用 Android 的 Theme 和 Style](http://blog.chengyunfeng.com/?p=684)  
> - [Android Theme.AppCompat 中，你应该熟悉的颜色属性](http://www.jianshu.com/p/15c6397685a0)  
> - [Material适配2 - 高级篇](http://www.cnblogs.com/ct2011/p/4493439.html)  



