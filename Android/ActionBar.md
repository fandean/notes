# Action Bar 活动条

> 除了Fragment android3还引入了Action Bar  
> 《疯狂Android讲义》  

Action Bar代替了传统的位于设备屏幕顶部的标题栏，它显示应用程序的图标和活动的名称。
Action Bar的右侧还可以有可选的动作项，即活动项(Action Item)。

归纳起来，Action Bar提供了如下功能：   

- 显示选项菜单的菜单项（将菜单项显示成Action Item）
- 提供互交式View作为Action View
- 使用程序图标作为返回Home主屏或向上的导航操作
- 提供基于Tab的导航方式，可用于切换多个Fragment
- 提供基于下拉的导航方式


## 1.显示、隐藏ActionBar

目标SDK>=17的版本即默认启用了ActionBar。

如果希望关闭ActionBar，则可在`manifest`中设置应用的主题为 Xxx.NoAciontBar 即可。

但是一般推荐在代码中控制其显示，使用ActionBar的：    

- show():  显示
- hide(): 隐藏

在Activity中可以通过 getActionBar()方法直接取得一个ActionBar实例


## 2.使用ActionBar显示选项菜单项
现在的手机大多都没有Menu按键，如果使用直接使用`选项菜单`可能导致用户无法打开选项菜单。为此Android已经提供了
ActionBar作为解决方案，ActionBar可以将`选项菜单`显示成`Action Item`


### 2.1 MenuItem新增了如下方法  

	setShowAsAction(int actionEnum)

该方法设置是否将该菜单项显示在ActionBar上，作为Action Item。  

该方法支持如下参数值：   

- SHOW_AS_ACTION_ALWAYS：总是将该MenuItem显示在ActionBar上
- SHOW_AS_ACTION_COLLAPSE_ACTION_VIEW: 将该Action View折叠成普通菜单项
- SHOW_AS_ACTION_IF_ROOM:
- SHOW_AS_ACTION_NEVER:
- SHOW_AS_ACTION_WITH_TEXT:


### 2.2 xml中定义菜单

可为 item 元素指定如下属性：  

`android:showAsAction`：与上一个方法作用类似，并且其属性也类似。


## 3.启用程序图标导航
效果是：将应用程序图标设置成为可点击的，并且在图标上添加一个向左的箭头；至于点击之后的动作自定义。

可以使用的ActionBar方法： 

- setDisplayHomeAsUpEnabled(boolean showHomeAsUp): 是否将图标变为可点击，并带左箭头
- setDisplayOptions(int options)：
- setDisplayShowHomeEnabled(boolean showHome)：设置是否显示应用程序图标
- setHomeButtonEnabled(boolean enabled)：设置是否将图标变成可点击的按钮


## 4.添加Action View
ActionBar上除可以显示普通的Action Item之外，还可显示普通的UI组件。



## 5.使用ActionBar实现Tab导航


> Android Studio为ActionBar的Tab导航提供了支持，在选择Activity时。



ActionBar与Fragment的结合使用


