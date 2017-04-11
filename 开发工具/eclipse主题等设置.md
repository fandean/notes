eclipse相关使用介绍
======================

[TOC]


1.保存自定义配置
-------------

通常情况下，新解压出来的eclipse的默认配置是不能够满足我们的使用的，需要在新建的workspace中修改各种配置，
比如编辑器的背景颜色、字体设置和字符集设置等，但是当我们新建了一个workspace或者新解压了一个eclipse后，
原来的配置就没有了，重新设置一遍很是费时。现从网上找到两种办法来保存eclipse的配置信息。

1. 方法一：直接保存一个已经配置好但没建项目的空workspace（推荐）
   配置就保存在workspace中，把一个已配置好但没建工程的空workspace保存起来(如压缩一个副本) ，
   以后不要新建workspace,解压一下,改个新名字，启动Eclipse时指向新workspace就行。

2. 方法二：使用eclipse的导出功能（不推荐，很多东西设置不能导出）
   在菜单栏选择File -> Export... -> General -> Preferences，导出来即可！







2.字体，背景色修改
------------------

**字体设置：**   

`Window` --> `Preferences` -->  `General` --> `Appearance` --> `Colors and Fonts` -->   
`Basic` --> `Text Font` --> `Edit` --> `修改字体` --> `Apply`  


**背景色配置**   

`Window` --> `Preferences` -->  `General` --> `Editors` --> `Text Editors` -->     
`TestEditor` --> `background color` --> `设置颜色`  

背景色推荐：  

绿豆沙色能有效减轻长时间用电脑的用眼疲劳！其配置为：   

```
------------+-----+------------+-----+-------+-------+
色调		| 85  |  饱和度    | 123 | 亮度  | 205   |
------------+-----+------------+-----+-------+-------+
RGB颜色  红 | 199 |    绿      | 237 | 蓝    | 204   |
------------+-----+------------+-----+-------+-------+
十六进制颜色：  #C7EDCC  或用 #CCE8CF                |
------------+-----+------------+-----+-------+-------+
```

**其他几种电脑窗口视力保护色**

|颜色   |   十六进制    | RGB颜色  |
|-------|---------------|----------|
|银河白 | #FFFFFF		| 255, 255, 255 |
|杏仁黄 | #FAF9DE		| 250, 249, 222 |
|秋叶褐 |   #FFF2E2		|  255, 242, 226|
|胭脂红 |   #FDE6E0		|  253, 230, 224|
|青草绿 |   #E3EDCD		|  227, 237, 205|
|海天蓝 |   #DCE2F1		|  220, 226, 241|
|葛巾紫 |   #E9EBFE		|  233, 235, 254|
|极光灰 |   #EAEAEF		|  234, 234, 239|





3.设置编译运行时的命令行参数
------------------------------

`Run As` --> `Run configurations` --> `Arguments` --> `用空白符隔开各参数` --> `Apply` --> `Run`

此法可用性不知,Java程序应该可以。 



4.Eclipse运行C++问题  Launch failed,Binary not found 
-----------------------------------------------------

参考：<http://blog.csdn.net/iaiti/article/details/39344895> 该参考还包含 安装即其后的配置问题, Windows中的问题。  

我在Ubuntu中，刚开始使用c/c++ eclips时直接点击 `run` 即可编译运行程序；
但后来可能修改了配置，直接点击`run`时不能够运行，而是出现 `Launch failed.Binary not found.`
在网上一查，原来是要先编译后运行，真是傻B 了。     

`Build` --> `Run`

`Build`的图标是一个`锤子`   

可以在`Project`选项上选择`Build Automatically`，后以后直接点击`Run`即可。   


5. 添加离线插件
---------------------------------

###方法一：    
和在线安装一样 `help` -->`Install New Software` --> `add`      
填写好名字，在 Location 一行点击`Archive` 选择离线的插件包（格式*.jar;*.zip）   

取消选项"Contact all update sites during install to find required softwar" 安装速度更快。   



###方法二： 

直接解压离线插件包,将文件夹`features` 和 `plugins` 文件夹复制到 eclipse 安装目录下对应文件夹，
重启eclipse。  

>之前先安装了eclipse C/C++ 版，后来解压 eclipse Java 版，也是将相关文件复制进相关文件夹，就
可以用与Java了。  



6. eclipse ADT安装
-------------------------

在网站 <http://tools.android-studio.org> 下载ADT离线包，  
另可参考大神<://github.com/inferjay/AndroidDevTools/wiki/Eclipse中离线安装ADT插件>  




7. 常用快捷键
---------------------

<http://www.cnblogs.com/ifaithu/archive/2013/02/19/2917263.html>

###1.几个最重要的快捷键

代码助手:Ctrl+Space（简体中文操作系统是Alt+/）
快速修正：Ctrl+1
单词补全：Alt+/
打开外部Java文档：Shift+F2

显示搜索对话框：Ctrl+H
快速Outline：Ctrl+O
打开资源：Ctrl+Shift+R
打开类型：Ctrl+Shift+T
显示重构菜单：Alt+Shift+T

上一个/下一个光标的位置：Alt+Left/Right 
上一个/下一个成员（成员对象或成员函数）：Ctrl+Shift+Up/Down
选中闭合元素：Alt+Shift+Up/Down/Left/Right
删除行：Ctrl+D
在当前行上插入一行：Ctrl+Shift+Enter
在当前行下插入一行： Shift+Enter
上下移动选中的行：Alt+Up/Down


组织导入：Ctrl+Shift+O

 

  

###2 定位 

2.1行内定位 
行末/行首：End/Home
前一个/后一个单词：Ctrl+Right/Left

2.2文件内定位 
跳到某行：Ctrl+L
上下滚屏：Ctrl+Up/Down
上一个/下一个成员（成员对象或成员函数）：Ctrl+Shift+Up/Down
快速Outline：Ctrl+O 

2.3跨文件定位 
打开声明：F3
打开资源：Ctrl+Shift+R
打开类型：Ctrl+Shift+T
在workspace中搜索选中元素的声明：Ctrl+G
在workspace中搜索选中的文本：Ctrl+Alt+G
在workspace中搜索选中元素的引用：Ctrl+Shift+G
打开调用层次结构：Ctrl+Alt+H
快速层次结构：Ctrl+T
反悔：Ctrl+Z

2.4其它 
上一个/下一个光标所在位置：Alt+Left/Right
上一个编辑的位置：Ctrl+Q 

   

###3 选中 

3.1行内选中 
选中到行末/行首：Shift+End/Home
选中上一个/下一个单词：Ctrl+Shift+Left/Right

3.2文件内选中 
选中闭合元素：Alt+Shift+Up
恢复到上一个选中：Alt+Shift+Down
选中下一个/上一个元素：Alt+Shift+Right/Left 

    

###4 定位/选中/操作同时 

删除行：Ctrl+D
删除下一个/上一个单词：Ctrl+Delete/Backspace
删除到行末：Ctrl+Shift+Delete
在当前行上插入一行：Ctrl+Shift+Enter
在当前行下插入一行： Shift+Enter
上下移动选中的行：Alt+Up/Down
拷贝选中的行：Ctrl+Alt+Up/Down 

	 

###5.其它的代码编辑类快捷键 

保存：Ctrl+S
保存所有：Ctrl+Shift+S
下一个命中的项（搜索之后）：Ctrl+.
注释：Ctrl+/
添加导入：Ctrl+Shift+M
显示快捷键帮助：Ctrl+Shift+L
变为大/小写：Ctrl+Shift+X/Y

	  

###6 重构 

显示重构菜单：Alt+Shift+T
重构-改变方法签名：Alt+Shift+C
重构-移动：Alt+Shift+V
重构-重命名：Alt+Shift+R 


###7 编辑器、视图、透视图切换 

下一个编辑器：Ctrl+F6
下一个视图：Ctrl+F7
下一个透视图：Ctrl+F8
最大化当前视图或编辑器：Ctrl+M
激活编辑器：F12 


###8 Debug 

F5：Step Into（debug）
F6：Step over（debug）
F7：Step return（debug）
F8：Resume（debug）
F11：debug上一个应用（debug） 

		 

###9 Up/Down/Right/Left类快捷键 

Ctrl
前一个/后一个单词：Ctrl+Right/Left
上下滚屏：Ctrl+Up/Down
Alt
上一个/下一个光标的位置：Alt+Left/Right
上下移动选中的行：Alt+Up/Down
Shift
选中上一个/下一个字符：Shift+Left/Right
选中上一行/下一行（从当前光标位置开始）：Shift+Up/Down
Ctrl+Shift
上一个/下一个成员（成员对象或成员函数）：Ctrl+Shift+Up/Down
选中上一个/下一个单词：Ctrl+Shift+Left/Right
Alt+Shift
选中闭合元素：Alt+Shift+Up
恢复到上一个选中：Alt+Shift+Down
选中下一个/上一个元素：Alt+Shift+Right/Left
拷贝选中的行：Ctrl+Alt+Up/Down
Ctrl+Alt
拷贝选中的行：Ctrl+Alt+Up/Down 


###10 F类快捷键 

F2：显示提示/重命名
F3：打开选中元素的声明
F4：打开选中元素的类型继承结构
F5：刷新
F5：Step Into（debug）
F6：Step over（debug）
F7：Step return（debug）
F8：Resume（debug）
F11：debug上一个应用（debug）
F12：激活编辑器

