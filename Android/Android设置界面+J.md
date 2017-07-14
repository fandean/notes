# Android设置界面


[设置 - Android Developers](https://developer.android.com/guide/topics/ui/settings.html "设置 - Android Developers")

《Android 4 高级编程 第3版》第7章：文件保存状态和首选项

《疯狂Android讲义 第3版》

## 介绍

设置是使用您在 XML 文件中声明的 Preference 类的各种子类构建而成，而不是使用 View 对象构建用户界面。

Preference 对象是单个设置的构建基块。每个 Preference 均作为项目显示在列表中，并提供适当的 UI 供用户修改设置。例如，
CheckBoxPreference 可创建一个列表项用于显示复选框，ListPreference 可创建一个项目用于打开包含选择列表的对话框。

您添加的每个 Preference 都有一个相应的键值对，可供系统用来将设置保存在应用设置的默认 SharedPreferences 文件中。
当用户更改设置时，系统会为您更新 SharedPreferences 文件中的相应值。您只应在需要读取值以根据用户设置确定应用的行为时，
才与关联的 SharedPreferences 文件直接交互。

一旦Activity继承了PreferenceActivity，那么该Activity完全不需要自己控制Preference的读写，PreferenceActivity会为我们处理一切。

PreferenceActivity不再使用普通的界面布局文件，而是使用选项设置的布局文件。选项设置的布局文件以PreferenceScreen作为根元素
（它表面定义一个参数设置的界面布局）。

建议使用PreferenceActivity加载选项设置**列表**的布局文件，使用PreferenceFragment加载选项设置的布局文件。


## 使用XML定义首选项

您必须将 XML 文件保存在 `res/xml/` 目录中。尽管您可以随意命名该文件，但它通常命名为 preferences.xml。 
您通常只需一个文件，因为层次结构中的分支（可打开各自的设置列表）是使用 PreferenceScreen 的嵌套实例声明的。

> 注：若要为设置创建多窗格布局，则需要为每个Fragment提供单独的 XML 文件。


## 首选项框架

- Preference Screen布局
- Preference Activity和Preference Fragment；Preference Screen包含在Preference Fragment中。
- Preference Header定义
- Shared Preference变化监听程序



## Preference Screen布局

```xml
<PreferenceScreen>
	<***Preference/>
	<***Preference/>
	<***Preference/>
</PreferenceScreen>
```


每个首选项控件`<***Preference/>`，应该至少包含下列4种属性：

- android:key   Shared Preference键，所选择的值会根据相应的键进行记录。
- android:title  用于表示首选项的显示文本。
- android:sumary  在标题文本下以更小字体显示的更长的文本描述。
- android:defaultValue  当没有为该首选项键分配首选项值时将会显示的默认值。


使用Intent在Preference Screen中导入系统首选项：

首选项层次结构还能包含来自其他应用程序的Preference Screen，包括系统首选项。

## Preference Header和Preference Fragment

> 建议使用PreferenceActivity加载选项设置**列表**的布局文件，使用PreferenceFragment加载选项设置的布局文件（使用Preference Screen为根元素的文件）。这句话的意义：  

使用Preference Header定义Preference Fragment的层次结构：

Preference Header描述了Preference Fragment在Preference Activity中如何分组和显示。
每个Preference Header都必须与一个特定的Preference Fragment关联，当选中该头时，Fragment就显示出来。

> Preference Fragment定义： 需继承PreferenceFragment类；重写onCreate方法，并调用addPreferencesFromResource方法。

在Preference Header中也可以使用Intent。

## Preference Activity

PreferenceActivity用于包含由Preference Header资源定义的Preference Fragment层次结构。（Android 3.0之前Preference Activity直接包含Preference Screen）

> 创建一个Preference Activity需继承PreferenceActivity类。
> 当使用Preference Fragment和Preference Header时，需要重写oBuildHeaders处理程序，并在其中调用loadHeadersFromResource并指定一个Preference Header资源文件。


## 找到并使用Preference Screen设置的Shared Preference

为Preference Activity中的选项记录Shared Preference值被保存在应用程序沙箱中。这使得任何应用程序组件，包括Activity、Serveice、Broadcast Receiver都能够访问。

```
PreferenceManager.getDefaultSharedPreference(context);
```


## Shared Preference Change Listener简介

每当添加、移除或修改一个特定的Shared Preference时来调用一个回调函数。

如果Activity是由用户关闭的（按下Back按钮），或是通过在代码中调用finish关闭，那么下次创建Activity时，实例状态Bundle不会被传递给onCreate或
onRestoreInstanceState。应该使用 Shared Preference存储应在用户会话之间持久化的数据。



