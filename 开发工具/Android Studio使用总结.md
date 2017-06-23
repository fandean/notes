# Android Studio使用总结

标签（空格分隔）： 开发工具

---

[视频地址](http://www.maiziedu.com/course/68/)


Android Studio安装/学习可参考 [CodePath Android Cliffnotes](http://guides.codepath.com/android)  

安装部分包含：  

- Installing Android Studio
- Installing Android SDK
- Configure Line Numbers
- Configure Imports
- Android emulator(模拟器)
- Version control with Git 




常用快捷键
------------------------------

>Android Studio  默认的 Keymap (即 **Default for XWin** 的快捷键定义方式)

| 快捷键                     | 说明                                 |
| ----------------------- | ---------------------------------- |
| Ctrl + J                | 用于在忘记时，调出Live Template(列表)         |
| Ctrl + Q                | 快速查看方法... 对应的 doc                  |
| Ctrl + space            | 自动补全代码，显示输入建议                      |
| Ctrl + shift + Enter    | 自动填充表达式如if,while,for,switch等       |
| Ctrl + F12              | 浏览当前类的成员函数与成员变量                    |
| Ctrl + H                | 显示当前类的继承层次                         |
| Ctrl + D                | 复制光标所在行到下一行                        |
| Ctrl + Y                | 删除光标所在行                            |
| Ctrl + X                | 剪切光标所在行                            |
| Ctrl + Delete/Backspace | 删除单词至词尾/词首                         |
| Ctrl + /                | 使用`//`注释所选行或光标所在行                  |
| Ctrl + Shift + /        | 使用`/* */`注释所选行或为当前行添加注释            |
| ctrl + shift + V        | 从剪贴板中选择要粘贴的内容                      |
| Alt + `insert`          | 根据代码风格设置选择自动为类创建getter/setter、构造器等 |
| Alt + Enter             | Issue quick fix                    |
| Ctrl + P                | 参数提示。显示方法参数信息(类型)                  |
| `Ctrl + Shift + I`      | 以弹出式窗口的形式显示光标处类/方法的定义              |
| Ctrl + B                | 跳转到光标所在类或方法的定义处                    |
| ` Ctrl + 鼠标悬浮 / 鼠标点击`   | 显示光标下元素信息 / 跳转到其定义处                |
| **Ctrl + W**            | 选中代码，连续按可选择不同区域（常用于选中当前单词）要会用      |
| Ctrl + N                | 弹出用于查找类的搜索框，搜索到之后可打开该类文件           |
| Ctrl + E                | 查看最近打开的文档                          |
| Ctrl + O                | 选择要 `@Override`的方法, 另一个技巧见下文       |
| Ctrl + Shift + ↑ 或 ↓    | 将当前选中行的代码直接上下移动位置                  |
| 双击Shift                 | 弹出搜索框                              |
| Alt + Q                 | 查看上下文。按一次可以查看当前光标所在方法，按两次...所在类    |
| CTRL + B                | Go to declaration 声明处              |
| CTRL + ALT + B          | Go to implementation               |
| F4                      | Go to source                       |
| CTRL + U                | Go to super Class                  |
| Ctrl + Alt + V          | 提取局部变量                             |
| Ctrl + Alt + F          | 提取全局变量                             |
| Ctrl + Alt + M          | 提取方法                               |
| Ctrl + Alt + L          | 格式化代码                              |



> Live Template中有大量的模板，比如输入fbc回车生成`() findViewById(R.id.);`。设置路径: Setting --> Editor --> Live Templates。
> 关于自定义Live Template参见；[Android 项目代码质量保证实践](https://www.zybuluo.com/zyl06/note/618862)








更多快捷键参考：  
官方文档 [Keymap Reference](https://www.jetbrains.com/help/idea/2016.2/keymap-reference.html "或直接搜索 IntelliJIDEA_ReferenceCard.pdf ")

[Android Studio 快捷键](http://gityuan.com/2015/08/08/android-studio-shortcut/)   
[Android Studio 小技巧/快捷键 合集](http://jaeger.itscoder.com/android/2016/02/14/android-studio-tips.html)

<http://blog.csdn.net/altair86/article/details/8972178>
<http://blog.csdn.net/hyr83960944/article/details/37911735>



### 鼠标悬停显示 doc
显示当前鼠标下的类/方法的 Doc （显示函数用法）, 

**需勾选如下设置：**

`File --> Settings --> Editor --> General  |  Other `

- [x] Show quick doc on mouse move Delay (ms) `1500`

>不建议这样做，还是使用快捷键 Ctrl + Q 来代替


### 代码补全
参考:    [Code Completion](https://www.jetbrains.com/help/idea/2016.1/code-completion-2.html)    


代码提示：  在 Editor标签中选择Code Completion选项，在"Code Sensitive completion"后的下拉列表中选择"None"，即提示不区分大小写。


### 更新SDK
翻墙代理的IP和端口，可以在AndroidDevTools网站上找到最新的镜像地址和端口，然后勾选"Force https:..."选项（它意为使用http代替https请求）

Android Studio也可在AndroidDevTools下载。


### 手动导入jar包
将视图切换到Project视图，将jar包拖入到`app/libs`中，再点击sync图标进行同步。




### 使用建议
参考：[Using Suggestion List](https://www.jetbrains.com/help/idea/2016.1/using-suggestion-list.html#sort_order)


**更多详细用法及设置尽在：** [**Meet IntelliJ IDEA**](https://www.jetbrains.com/help/idea/2016.1/meet-intellij-idea.html)


- 由于屏幕太小，可以设置取消勾选工具栏下的导航栏： `View --> Navigation Bar`。
- 设置自动换行；（只对当前文件自动换行`View --> Active Edit --> User Soft Wraps`）

-----------------------------------

## 一些使用技巧

- 在xml中的输入元素属性值时的技巧。如：直接输入`id`而非`android:id`再根据提示进行选择。
- 在输入Override方法时，直接输入方法的名字再进行选择，而不要一步步输入。如：直接输入`onCreate`而非从`@Override`一步一步输入。



强烈推荐：  
<http://stormzhang.com/devtools/2015/06/17/android-studio-all/>



#### 使用Enter和Tab进行代码补全的差别
（Enter vs Tab for Code Completion）

*描述* ：代码补全时，可以使用Enter或Tab来进行补全操作，但是两者是有差别的。

- 使用Enter时：从光标处插入补全的代码，对原来的代码不做任何操作。
- 使用Tab时：从光标处插入补全的代码，并删除后面的代码，直到遇到点号、圆括号、分号或空格为止。


#### 重启Android Studio

    File --> Invalidata Caches/Restart...  --> Just Restart
_________________________________________________




## 主题设置




1. 设置代码字体（主要字体：推荐 [mononoki](https://madmalik.github.io/mononoki/)，候选字体推荐收费字体"方正稚艺简体"）
        `File --> Settings --> Editor --> Colors & Fonts --> Font`

>**默认是不可改变字体的，要想自定义字体需另存一份Scheme（方案）**，点击`Sava As`然后就可在此基础上修改字体（其它一些自定义设置与此类似）。  其中 Show only monospaced fonts 表示只列出等宽字体；Secondary font表示备用字体，可通过它来设置代码中中文的显示字体。

2. 设置AS程序界面字体   
  `Setting --> Appearance & Behavior --> Appearance --> UI Options` 勾选 `Override default fonts by...` 然后即可设置字体。(建议字体 "Arial Unicode MS" Size:12)


Android Studio整体主题的设置:  
`Setting --> Appearance & Behavior --> Appearance --> UI Options --> Theme`



| AS主题     | Editor主题       |
| -------- | -------------- |
| Darcula  | 对应放Editor的暗色主题 |
| IntelliJ | 对应放Editor的浅色主题 |






### Material Theme

后面介绍的插件中有一个主题可供选择 [Material Theme UI](https://plugins.jetbrains.com/plugin/8006?pr= "网站被墙, 主题")。  
但该主题会导致AS程序界面上的字体不可改变，只能是默认字体。  

>**小技巧**是这样：安装好该主题后，通过 `File --> Settings --> Editor --> Colors & Fonts --> Font` 此处另存一份配置文件。然后再 `Setting --> Plugins` 处取消勾选该插件，重启AS，之后再选择之前保存的配置即可再次实现该主题的效果。



### Editor的主题

 >**接下来主要指配置Editor的主题 （就是导入 Editor 的颜色配置方案）**  
 > 下载的主题文件一般都是 `.jar`包，配置的方式是通过导入设置来进行的即 `import settings --> 再选择 .jar包`

#### 安装 Solarized 主题

>感觉这家伙的配置不太纯正，不建议导入，还是在 [此处找一个](http://color-themes.com/?view=index) Solarized主题安装

[Solarized Colorscheme for IntelliJ IDEA](https://github.com/jkaving/intellij-colors-solarized) 


直接下载文件，再参考安装方法，至于第二步： Option 2: Manual installation (这一步不用也可以)
中的目录改为：     
`~/.AndroidStudio-xx/config/colors`






#### 各种主题下载
[themes](http://color-themes.com/?view=index)


#### 配置LogCat输出的颜色

在Android Studio 菜单栏 打开 Preferences －> Editer －> Colors & Fonts －> Android Logcat；然后取消勾选"Use inherited attributes 'Console->Standard output'"。

各项配色如下：
```
Type Color:  
verbose: #BBB
debug: #33B5E5
info: #9C0
assert: #A6C
error: #F44
warning: #FB3
```




#### Markdown编辑界面的主题配置
可以单独配置markdown语言在编辑器中的主题。在我的Android Studio中的markdown中的 code，table等显示时的Background为`ECECEC`灰白色的，看起来非常不爽。用的插件是Markdown Navigator，主题是...。

> 它的配置和markdown插件和Android Studio主题都有关系。对于markdown插件，尝试了几种还是Markdown Navigator效果最好；有的连表格都不支持，有的插件大小居然有230M。


`File --> Settings --> Editor --> Colors & Fonts --> Markdown `  
在此界面，手动更改每个显示为白色背景的配置。

这里的配置还与你下载的 Markdown 插件相关；如果更换了 markdown插件，具体**可配置的项目**就会改变。


针对插件Markdown Navigator的具体配置：
```
#404040   代码块
#444444    Wike text
#757575		HTML block、 Inline HTML
#3B514D      Horizontal rule
#3C3F41   Hard break spaces颜色.（设置其效果为 Underscored）
#4c174d   Escaped character
去掉Link、Wike page reference、的背景。 

表格的配置：
                                                                            | 背景色
| Header Row 1 Cell 1 #383838 | Header Row 1 Cell 2 #454500 |               #3b3b3b
| Header Row 2 Cell 1 #003838 | Header Row 2 Cell 2 #004500 |               #003b3b
| Header Row 2 Cell 1 #383838 | Header Row 2 Cell 2 #454500 |               #3b3b3b
|:--------------------#404040 |:-------------------:前#9b53cf 背#525134|      #404040
| Row 1 Cell 1        无	      |    Row 1 Cell 2     #404000| 
| Row 2 Cell 1        #003333 |    Row 2 Cell 2     #003300|  #003b3b
| Row 2 Cell 1        无      |    Row 2 Cell 2     #404000 |
[Table Caption #354013]
```




### 高亮匹配的括号...
>Automatic Brace Matching

高亮匹配的各种配对符号的设置路径：  

`Setting --> Editor --> Colors & Fonts --> General --> Code --> Matched brace`
​    
推荐勾选 Effects --> Bordered 效果， 一个矩形框框，再为其选择一个颜色。还有就是设置背景色，也可不弄，自己摸索。
>我的一个设置是 : 
>勾选Bold；勾选Foreground，颜色为 #ffef28；勾选Effects，颜色为 #b39613，通过下拉选项选择效果为 Bordered。




## getter和setter

自动插入的快捷键：

**Android Studio & OSx :**

Press `cmd + n` > Generate > Getter and Setter

**Android Studio & Windows & Linux :**

Press `Alt + Insert` > Generate > Getter and Setter


**自定义getter和setter的风格：**

Go to File->Settings and expand Code Style, selectJava, and add your prefixes/suffixes under the Code Generation tab

>设置方法参考《Android 编程权威指南》第2章



## 遇到的问题

### 运行时无法找到设备
在没有安装genymotion之前是没有问题的，安装之后就无法找到设备（不管是虚拟设备还是真机）

解决方法：设置genymotion让其使用Android Studio的SDK，在genymotion中设置`setting-> ADB --> Use custom Adndroid Sdk tools`选择路径。

> 安装genymotion步骤：   
>
1. 官网注册下载genymotion
2. 安装时需要Vbox的支持，也就是需事先安装Vbox
3. 在Android Studio中安装插件
4. 设置genymotion，`setting-> ADB --> Use custom Adndroid Sdk tools`

### 在64bit系统中编译时无法找到相关文件
复制异常消息网上查询。原因是sdk中的 *tools 只支持32bit的系统，对于64bit需安装相关文件才行，不然无法识别。


## 插件
参考：[Android Studio插件整理](https://ydmmocoo.github.io/2016/06/28/Android-Studio%E6%8F%92%E4%BB%B6%E6%95%B4%E7%90%86/)  

原装插件与自己安装插件的图标细节不同

1. [CodeGlance](http://plugins.jetbrains.com/plugin/7275?pr=androidstudio "在右边预览代码，实现快速定位")  
2. [findBugs-IDEA](http://plugins.jetbrains.com/plugin/3847?pr=androidstudio "查找bug的插件，Android Studio也提供了代码审查的功能（Analyze-Inspect Code…）")
3. [Android Drawable Importer](http://plugins.jetbrains.com/plugin/7658?pr=androidstudio "未安装，太大")，非常强大的图片导入插件，批量/多源导入。
4. [Material Theme UI](https://plugins.jetbrains.com/plugin/8006?pr= "网站被墙, 主题")
5. [CheckStyle-IDEA](https://plugins.jetbrains.com/plugin/1065?pr= "检查编码风格")
6. [TranslationPlugin](https://github.com/YiiGuxing/TranslationPlugin "翻译")
7. [jimu Mirror](http://www.codeceo.com/article/8-android-studio-plugins.html "动态预览布局")
8. **GsonFormat** 快速将json字符串转换成一个Java Bean
9. **Key promoter** 提示你这个功能快捷键是什么
10. **Save Actions**保存修改的时候自动导入、格式化代码
11. **LiveEdit** 更新浏览器里的网页
12. [Android Parcelable code generator](https://plugins.jetbrains.com/plugin/7332-android-parcelable-code-generator) JavaBean序列化，快速实现Parcelable接口
13. **Markdown Navigator：**用于支持markdown。该插件的增强版(Enhanced)需要付费，使用基础版(Basic)即可。与其它markdown插件一同启用可能会导致该插件出现错误，比如AsciiDoc插件。（尝试过的最好的Markdown插件） 
14. **ADB WIFI：** 使用wifi无线调试你的app，无需root权限。使用方法：先连上数据线，再在`Tools->android->ADB WiFi`处，先重启ADB Wifi，再选择另个一。
15. **LayoutFormatter：**格式化 XML 布局文件，使其更加优雅
16. **ADB-idea：** 可以一键清理缓存并重启APP
17. **idea-vim：**[IdeaVim插件使用技巧](http://kidneyball.iteye.com/blog/1828427)，[IdezVim Reference Manual](http://ideavim.sourceforge.net/vim/index.html)；为了避免冲突，可以考虑将IdeaVim的开关键设置为 Ctrl + ;。手动关闭IdeaVim：在菜单`Tools --> Vim Emulator`
18. **.ignore :**  用法见




[Android 项目代码质量保证实践](https://www.zybuluo.com/zyl06/note/618862)中讲解了几个插件的使用方法。



**Vysor:**  
Vysor是一个Chrome插件, 他可以把android手机屏幕投影到电脑上方便操作，免费版需要USB连接线，付费版可以直接通过WiFi连接控制。  
这里只讲一下一些配置问题：要Vysor能够操作手机，需要在开发者模型下开启“USB调试（安全设置）”。另可以调节显示画面的清晰度。









## Git with Android Studio 



在Android Studio中使用GPG对提交进行签名，见 [Signed commits · Wiki · akwizgran / briar · GitLab](https://code.briarproject.org/akwizgran/briar/wikis/signed-commits "Signed commits · Wiki · akwizgran / briar · GitLab")



Android Studio中文件的颜色代表的含义：

- Red – File is not added to git
- Green – File is added but not committed yet
- Blue – New changes is added to a file that is committed to git already




Unversioned Files：指该项目已修改但还未添加到Git 仓库的文件，即“UNversioned Files”.



.ignore 插件的用法:   

这里介绍了如何通过该插件新建一个.ignore文件（在project视图下）。  

![.ignore support plugin for IntelliJ IDEA](https://camo.githubusercontent.com/c6c6d625729d8d33b34ffbe8c907ebfb38944515/687474703a2f2f67697469676e6f72652e68737a2e6d6f62692f75736167652d312e676966)



直接在Android Studio外部为项目添加版本控制，在AS的Event Log中会有如下信息，来提示你需在设置中进行注册：  

```
Unregistered VCS root detected
					The directory /home/fan/workspace/AndroidStudioProjects/Test/ZhihuDaily is under Git, but is not registered in the Settings.
					Add root  Configure  Ignore
```



> [开发准备--Android Studio中的版本管理git - 简书](http://www.jianshu.com/p/53d02cf04694 "开发准备--Android Studio中的版本管理git - 简书")









## 图片导入

1. 导入如下文件夹中的图片：  
```
drawable-hdpi
drawable-mdpi
drawable-xhdpi
drawable-xxhdpi
drawable-xxxhdpi
```
直接复制这些文件夹，然后在AS项目中的res目录下粘贴即可。
2. 利用Android Drawable Importer插件的scale功能，将一张或一套图片快速生成不同尺寸的图片资源。
  用法：右击res文件夹 --> New --> Multisource-Drawable




> Android Drawable Importer 该插件它支持：
> Icon Pack Drawable Importer（图标包导入） 和 Vector Drawable Importer（矢量图导入） 构成第一个特征，Batch Drawable Import（批处理图导入） 作为第二特征，Multisource-Drawable（多源图导入） 作为第三特征。

> 另还有个Android Material Design Icon Generator Plugin插件，用于Material Design Icon.




## 将某开源库设置为Library Project
You can also clone the Volley repository and set it as a library project:

Git clone the repository by typing the following at the command line:
```
git clone https://github.com/google/volley
```

Import the downloaded source into your app project as an Android library module as described in [Create an Android Library](https://developer.android.com/studio/projects/android-library.html).



## Android Studio添加Assets目录
右键 "app" --> New --> Folder --> Assets Folder




## 英语单词解释

| English         | 中文   |
| --------------- | ---- |
| Code Completion | 代码补全 |
| Autopopup       | 自动弹出 |
| lookup list     | 查找列表 |
| pop-up window   | 弹出窗口 |
| Scheme          | 方案   |







