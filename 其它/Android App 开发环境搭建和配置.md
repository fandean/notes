Android App 开发环境搭建和配置 
=================================================

> **Android App 开发环境的历史:**    
> 最初：JDK + Android SDK + ADT插件 + Eclipse     
> 之后：JDK + ADT Bundle （其中ADT Bundle包含SDK，ADT插件，Eclipse）
> 最后： Android Studio 现已成为 Android 的官方 IDE,集成了其它所需程序， 只需另外下载安装 JDK 即可


1.JDK的安装
-------------------

进入官网 --> [oracle](http://www.oracle.com/) --> Downloads --> Java SE --> 如果要下载旧版本进入最底部的 “Java Archive” --> 选择“Java SE Development Kit”的一个版本

但是下载旧版本要注册有 oracle 的帐号，直接下新版本则不用。






>如果要在命令行下使用Java的相关命令则需配置环境变量；如果直接使用eclipse等IDE，则它们具有足够的智能而无需配置。


**环境变量配置：** （新建3个环境变量）    

| 环境变量名     | 描述                  | 值                                        |
| --------- | ------------------- | ---------------------------------------- |
| JAVA_HOME | 指定JDK安装的根目录         | 略                                        |
| PATH      | 指定JDK安装目录下的bin目录,   | %JAVA_HOME%\bin                          |
| CLASSPATH | 指定从什么位置取查找 class 文件 | .;%JAVA_HOME%\lib\tools.jar;%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib |

配置好环境变量后需重新启动一个cmd，并在里面测试配置是否正确。





2.Android Studio安装
--------------------------

**国内下载:** [android studio 中文组](http://tools.android-studio.org/)



windows 64 版本下载  2016.4

<https://dl.google.com/dl/android/studio/install/1.5.1.0/android-studio-bundle-141.2456560-windows.exe>


Linux

https://dl.google.com/dl/android/studio/ide-zips/1.5.1.0/android-studio-ide-141.2456560-linux.zip





 
