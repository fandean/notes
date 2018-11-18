# Gradle
[第一次使用Android Studio时你应该知道的一切配置（三）：gradle项目构建](http://www.cnblogs.com/smyhvae/p/4456420.html)


## Gradle介绍

[Gradle起步](https://lippiouyang.gitbooks.io/gradle-in-action-cn/content/gradle/start-with-gradle.html "Gradle起步")

这种“任务”的概念与用法与Ant及其相似。Ant任务是Gradle世界的第一公民，Gradle对Ant做了很好的集成。

我们知道依赖管理、仓库、约定优于配置等概念是Maven的核心内容，Gradle也实现了这些优秀概念。

**在Gradle中配置使用Maven本地仓库、中央仓库、以及自定义地址仓库。**（见依赖管理）

实际构建项目的时候,下载后的文件被存储在 `USER_HOME/.gradle/cache/` 目录下供项目使用，这种实现的方法与Maven类似。构建后的 build目录，包含了所有的输出，包含class文件，测试报告，打包的jar文件，以及一些用来归档的临时文件。

Gradle项目使用Maven项目生成的资源已经不是个问题了，接着需要反过来考虑，Maven用户是否能够使用 Gradle生成的资源呢？或者更简单点问，Gradle项目生成的构件是否可以发布到Maven仓库中供人使用呢？  
使用Gradle的Maven Plugin，用户就可以轻松地将项目构件上传到Maven仓库中. 



[Gradle for Android 第一篇( 从 Gradle 和 AS 开始 ) - neu - SegmentFault](https://segmentfault.com/a/1190000004229002 "Gradle for Android 第一篇( 从 Gradle 和 AS 开始 ) - neu - SegmentFault")

构建脚本，这个文件通常称之为build.grade

gradle会为我们提供很多默认的配置以及通常的默认值，而这极大的简化了我们的工作



## 安装

参考官方文档： [Gradle - Installation](https://gradle.org/install/ "Gradle - Installation")

windows建议使用scoop：

```
scoop install gradle
```

使用scoop安装好gradle后自动就可以在命令行执行gradle。



更改gradle本地仓库默认存储位置：

```
GRADLE_USER_HOME=D:\Portable Software\gradle-repo
```

> [更改gradle本地仓库默认存储位置 - CSDN博客](https://blog.csdn.net/sinat_22840937/article/details/78275215 "更改gradle本地仓库默认存储位置 - CSDN博客")





> 三个用于gradle命令的环境变量：
> ```
> GRADLE_OPTS
> ```
>
> Specifies [command-line arguments](https://docs.gradle.org/current/userguide/command_line_interface.html) to use when starting the Gradle client. This can be useful for setting the properties to use when running Gradle.
>
> ```
> GRADLE_USER_HOME
> ```
>
> Specifies the Gradle user home directory (which defaults to `$USER_HOME/.gradle` if not set).
>
> ```
> JAVA_HOME
> ```
>
> Specifies the JDK installation directory to use.（JDK版本必须 ≥ 1.8）
>
> [Build Environment - Gradle User Manual](https://docs.gradle.org/current/userguide/build_environment.html "Build Environment - Gradle User Manual")






## project和tasks

在gradle中的两大重要的概念: project和tasks


每一个build.grade文件代表着一个project

插件（plugin）用于扩展gradle脚本的能力，在一个项目中使用插件，**这样该项目的构建脚本就可以定义该插件定义好的属性和使用它的tasks**。


一个android工程下的 build.gradle 文件内容： `指定仓库地址 + 添加插件`

```java
buildscript {
   repositories {
	   // 仓库地址JCenter。JCenter类似maven库
        jcenter()	
   }

   dependencies {
	   // The following line adds Android Plugin for Gradle version 2.3.3 as a classpath dependency.
       classpath 'com.android.tools.build:gradle:1.2.3'
 } 
}

```
一个Android构建工具，这个就是Android plugin的来源之处。Android plugin提供了所有需要去构建和测试的应用。

应用插件：
```java
// 下面的语句中 apply是一个方法，给它传递了一个参数plugin，plugin 的值是'com.android.application'；
// 如果有多个参数，则以逗号隔开
// 将Gradle的Android插件应用于此构建
apply plugin: 'com.android.application'



// 当使用Android 插件的时候，之后就可以使用`android`标签： 
android {
       compileSdkVersion 22
       buildToolsVersion "22.0.1"
}
```



settings.gradle文件：

settings.gradle 文件位于项目根目录，用于指示 Gradle 在构建应用时应将哪些模块包括在内。
```java
// app就是项目包含的一个module，如果有多个module，可以在为 include 方法添加多个参数。
include':app'
```



当初始化构建进程，gradle会基于build文件，集合所有的project和tasks


构建的生命周期:

* 初始化阶段：project实例在这儿创建，如果有多个模块，即有多个build.gradle文件，多个project将会被创建。
* 配置阶段：在该阶段，build.gradle脚本将会执行，为每个project创建和配置所有的tasks。
* 执行阶段：这一阶段，gradle会决定哪一个tasks会被执行，哪一个tasks会被执行完全依赖开始构建时传入的参数和当前所在的文件夹位置有关。





## 依赖管理



[Gradle学习笔记 依赖管理 - CSDN博客](https://blog.csdn.net/u011054333/article/details/54024060 "Gradle学习笔记 依赖管理 - CSDN博客")








## 使用Gradle Wrapper

[**Gradle包装器**](https://lippiouyang.gitbooks.io/gradle-in-action-cn/content/first-project/gradle-wrapper.html "Gradle包装器") 必看。




使用Gradle Wrapper将会是一个好的选择去避免由于gradle版本更新导致的问题。Gradle Wrapper提供了一个windows的batch文件和其他系统的shell文件，*当你使用这些脚本的时候，当前gradle版本将会被下载，并且会被自动用在项目的构建*，所以每个开发者在构建自己app的时候只需要使用Wrapper。所以开发者不需要为你的电脑安装任何gradle版本。


```
   TestActivity/		# 一个 Android Studio工程目录			
   |	
   ├── app
   ├── build
   ├── build.gradle
   └── gradle/wrapper/
   |   ├── gradle-wrapper.jar
   |   └── gradle-wrapper.properties	# gradle-wrapper属性文件。
   ├── gradle.properties
   ├── gradlew			# gradlew 所在
   ├── gradlew.bat
   ├── local.properties
   ├── settings.gradle
   └── TestActivity.iml
```


上图中gradle-wrapper.properties属性文件中有如下语句：
```java
// 改变该url即可改变你的gradle版本
distributionUrl=https\://services.gradle.org/distributions/gradle-3.3-all.zip
```

在一个 Android Studio工程目录，利用命令行`./gradlew -v`来查看当前gradle版本

> 使用 Gradle Wrapper安装 Gradle： 如果你想使用gradle命令，你需要预先安装gradle以及设置环境变量，而如果本机没有安装gradle，你下载了gradle项目，你可以直接运行`./gradlew build`等命令，其会**自动为你安装gradle** 



gradlew的用法跟gradle一模一样，比如执行构建gradle build命令，你可以用gradlew build。gradlew即gradle wrapper的缩写。




```shell
# ~/.gradle  : Gradle home 目录
[fan 13:44:21]~/.gradle/wrapper/dists$ ls
gradle-2.10-all  gradle-2.14.1-all  gradle-2.2.1-all  gradle-2.4-all  gradle-3.3-all
gradle-2.11-all  gradle-2.14-all    gradle-2.2-all    gradle-2.8-all
```



Gradle Wrapper会自动为我们下载合适的Gradle版本。默认情况下，下载位置是`$USER_HOME/.gradle/wrapper/dists`，如果设置了`GRADLE_USER_HOME`环境变量，那么就会下载到`GRADLE_USER_HOME/wrapper/dists`下。






## Android

[配置构建 - Android Studio](https://developer.android.com/studio/build/index.html#build-config "配置构建 - Android Studio")


![](https://developer.android.com/images/tools/studio/project-structure_2x.png)

在AS中运行Gradle tasks的方法：

1. 打开Gradle projects tool window
![](https://www.jetbrains.com/help/img/idea/2017.2/gradle_run_config_task_save.png) 
可右键选择运行、添加任务。
2.打开AS中的终端，通过命令运行

[Gradle - Help - IntelliJ IDEA](https://www.jetbrains.com/help/idea/gradle.html "Gradle - Help - IntelliJ IDEA")



```
./gradlew build
./gradlew assemble
./gradlew assembleInnderDebug
```


### 签名打包

方法一：   
![](http://images.cnitblog.com/blog/641601/201504/251915427037792.png)

方式二：通过命令行的方式
先通过图形界面，或直编辑Gradle配置文件，配置好签名。再在终端执行`./gradlew assembleRelease`，生成realease版本的apk.









## 在IDEA中使用Gradle构建Java Web项目

