Java 相关和Android相关软件的安装
=================================

这些工具都可以使用 umake 直接安装，请上网搜索或查看帮助



1.JDK
----------------------

1.1 方法一： 添加ppa的方式(下载慢)

sudo

1.2 方法二：直接官网下载压缩包

下载后解压，设置PATH 即可




2.Eclipse
----------------------
上官网，找到下载页面，随便选择一个，如：Eclipse IDE for Java EE Developers，点击文字连接
进去看详细信息，然后点击左边的 All Releases 再选择最新的Eclipse for Android Developer发布版下载。
移动到 /opt/eclipse/eclipse-android-××  目录下。

配置启动器参考[eclipse](http://ubuntuhandbook.org/index.php/2016/01/how-to-install-the-latest-eclipse-in-ubuntu-16-04-15-10/)

`vim .local/share/applications/eclipse.desktop`






3.Android Studio
----------------------

略，忘了
直接安装即可吧

[Android Studio 界面的简单配置](http://ask.android-studio.org/?/article/14)

更新SDK时勾选需要安装的平台和工具，其中Android文档、SDK Platform必须安装。
另外在Extras下的Android Support Repository 和 Android Support Library必须选择安装。
在Tools中选择Android SDK Tools、Android SDK Platform-tools、Android SDK Build-tools它们有几个版本，各选择安装一两个即可（或各安装一个最新的）


###问题1
若没有选择Android Support Repository 在使用时可能gradle出现如下类似错误:
[参考1](http://stackoverflow.com/questions/18045712/gradle-build-android-project-could-not-resolve-all-dependencies-error-but-i-t)
[参考2](http://www.android-studio.org/index.php/84-study)
```
Could not find any matches for com.android.support:appcompat-v7:21.+ as no versions of com.android.support:appcompat-v7 are available.
```

###问题2
`Cannot resolve symbol 'R'`  

是很容易出现的问题: 找不到R文件。  
1.多半是xml文件有问题，标签不匹配等，需仔细检查，或者通过点击图标`Sync project with gradle`查看输出信息查找问题所在。解决问题时可以一个一个解决，有时后面的问题是由前面的问题引起。
或者通过Build->Clean Project找出问题。

[参考](http://stackoverflow.com/questions/17054000/cannot-resolve-symbol-r-in-android-studio)


3.相关构建工具
----------------------


### 3.1 .gradle

Android Studio自带不用安装

忘了是如何安装的。
gradle是Android Studio采用的构建工具，也是如今非常流行的构建工具。
gradle之前常用的构建工具是ant，然后发展到Maven。  

Gradle的构建脚本采用Groovy语言进行书写。
Gradle是一个基于JVM的开源构建工具。
Gradle也有相应的Gradle API（一个编程框架），我们编写的构建脚本，其实
玩的就是Gradle的API。
Gradle是一个框架，作为框架，它负责定义流程和规则。而具体的编译工作则是通过插件的方式来完成。

**安装先决条件**：需要1.5或更高版本的JDK。
Gradle自带了Groovy库，所以不需要安装Groovy；它会忽略以安装的Groovy。
安装方法：直接到官网下载Gradle最新发行包解压，设置PATH即可(见.bashrc)
发行包中有用户手册和API手册等；发行包不区分操作系统。



### 3.2 Groovy

了解一下这种语言即可，无需安装

groovy，为了了解Gradle可以先了解一下Groovy语言。
Groovy是一种动态语言，运行于java虚拟机。
sudo apt-get install groovy groovy-doc -y




### 3.3 Ant

Eclipse 自带把

ant 另一个构建工具
sudo apt-get install ant ant-doc -y
