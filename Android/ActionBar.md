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





# Toolbar

toolbar位置可以随便放。



## Toolbar显示问题
使用下面的标签，Toolbar的字体颜色显示在深色主题下仍然显示为深色
```
    <android.support.v7.widget.Toolbar
        android:id="@+id/collection_toolbar"
        android:layout_width="match_parent"
        android:background="?attr/colorPrimary"
        android:layout_height="?attr/actionBarSize"/>
```

将上面的 Toolbar 改为下面的形式，即可解决在application设置为`android:theme="@style/AppTheme.NoActionBar"`
时，Toolbar的字体颜色显示正常。

> 或者将 application 的主题设置为`android:theme="@style/AppTheme"` ，包含ActionBar。

```
    <android.support.design.widget.AppBarLayout
        android:id="@+id/app_bar"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:fitsSystemWindows="true"
        android:theme="@style/AppTheme.AppBarOverlay">  <!-- 该主题含有 深色的 actionbar -->

            <android.support.v7.widget.Toolbar
                android:id="@+id/collection_toolbar"
                android:layout_width="match_parent"
                android:layout_height="?attr/actionBarSize"
                app:popupTheme="@style/AppTheme.PopupOverlay"/>
    </android.support.design.widget.AppBarLayout>
```

最后经过总结，测试得出：  

一个能正常显示的单独使用的Toolbar示例： 单独使用时要想显示正确，只需将Toolbar的主题和背景色设置正确即可。

[android - No ActionBar in PreferenceActivity after upgrade to Support Library v21 - Stack Overflow](https://stackoverflow.com/questions/26509180/no-actionbar-in-preferenceactivity-after-upgrade-to-support-library-v21)
```xml
<?xml version="1.0" encoding="utf-8"?>
<android.support.v7.widget.Toolbar
    android:id="@+id/toolbar"
    xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:background="?attr/colorPrimary"
    android:minHeight="?attr/actionBarSize"
    android:theme="@style/AppTheme.AppBarOverlay"
    app:navigationContentDescription="@string/abc_action_bar_up_description"
    app:navigationIcon="?attr/homeAsUpIndicator"
    app:title="@string/action_settings">

</android.support.v7.widget.Toolbar>
```

在代码中的处理：
```
//标题的设置必须在替换Action Bar之前设置
mToolbar.setTitle("设置");
//替换Action Bar，对toolbar的设置需在调用此方法之前弄好
setSupportActionBar(mToolbar);
if (getSupportActionBar() != null){
	getSupportActionBar().setDisplayHomeAsUpEnabled(true);
}
//在这之后才有效
toolbar.setNavigationOnClickListener(new View.OnClickListener() {
	@Override
	public void onClick(View v) {
		//可以这样finish掉？？
		finish();
	}
});
```

简化版：

```xml
    <android.support.v7.widget.Toolbar
        android:id="@+id/collection_toolbar"
        android:layout_width="match_parent"
        android:layout_height="?attr/actionBarSize"
        android:background="?attr/colorPrimary"
        android:theme="@style/AppTheme.AppBarOverlay"
        app:popupTheme="@style/AppTheme.PopupOverlay"/>
```

```java
Toolbar mToolbar = (Toolbar)findViewById(R.id.toolbar);
//然后对toolbar做一些设置
mToolbar.setTitle("标题");
setSupportActionBar(mToolbar);
if (getSupportActionBar() != null) {
		getSupportActionBar().setDisplayHomeAsUpEnabled(true);
}
```