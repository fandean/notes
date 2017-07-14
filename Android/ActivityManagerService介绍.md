# ActivityManagerService

> 摘抄：
> [Android 插件化原理解析——Hook机制之AMS&PMS - Weishu's Notes](http://weishu.me/2016/03/07/understand-plugin-framework-ams-pms-hook/ "Android 插件化原理解析——Hook机制之AMS&PMS  Weishu's Notes")
>
> [Android 插件化原理解析——Activity生命周期管理  Weishu's Notes](http://weishu.me/2016/03/21/understand-plugin-framework-activity-management/ "Android 插件化原理解析——Activity生命周期管理  Weishu's Notes")



转载，抄袭



## 介绍

ActivityManagerServiche以及PackageManagerService（以下简称AMS，PMS）。

> `ActivityManager`，`ActivityManagerService`以及`ActivityManagerNative`之间的关系

ActivityManagerService对于FrameWork层的重要性不言而喻，Android的四大组件无一不与它打交道：

1. `startActivity`最终调用了AMS的`startActivity`系列方法，实现了Activity的启动；Activity的生命周期回调，也在AMS中完成；
2. `startService,bindService`最终调用到AMS的startService和bindService方法；
3. 动态广播的注册和接收在`AMS`中完成（静态广播在`PMS`中完成）
4. `getContentResolver`最终从`AMS`的`getContentProvider`获取到ContentProvider

而`PMS`则完成了诸如权限校捡(`checkPermission,checkUidPermission`)，Apk meta信息获取(`getApplicationInfo`等)，四大组件信息获取(`query`系列方法)等重要功能。

我们知道`AMS`和`PMS`就是以Binder方式提供给应用程序使用的系统服务。









## 理解Context.StartActivity()



> 好吧这里，最初我是想了解，这里的intent是被发送到哪里去了，是有广播接收器接收了吗? Intent是如何被处理。



### Activity启动过程

在Android系统中，有两种操作会引发Activity的启动，一种用户点击应用程序图标时，Launcher会为我们启动应用程序的主Activity；应用程序的默认Activity启动起来后，它又可以在内部通过调用startActvity接口启动新的Activity，依此类推，每一个Activity都可以在内部启动新的Activity。

启动Activity非常简单，一个`startActivity`就完事了；那么在这个简单调用的背后发生了什么呢？Look the fucking source code！

> [Android应用程序的Activity启动过程简要介绍和学习计划 - 老罗的Android之旅 - CSDN博客](http://blog.csdn.net/luoshengyang/article/details/6685853 "Android应用程序的Activity启动过程简要介绍和学习计划 - 老罗的Android之旅 - CSDN博客")  详见此处，下面是复制的内容。

 无论是通过点击应用程序图标来启动Activity，还是通过Activity内部调用startActivity接口来启动新的Activity，都要借助于应用程序框架层的ActivityManagerService服务进程。在前面一篇文章[Android系统在新进程中启动自定义服务过程（startService）的原理分析](http://blog.csdn.net/luoshengyang/article/details/6677029)中，我们已经看到，Service也是由ActivityManagerService进程来启动的。在Android应用程序框架层中，ActivityManagerService是一个非常重要的接口，它不但负责启动Activity和Service，还负责管理Activity和Service。

Android应用程序框架层中的ActivityManagerService启动Activity的过程大致如下图所示：

![](http://hi.csdn.net/attachment/201108/14/0_1313305334OkCc.gif)



不论读者是否知道，我们使用`startActivity`有两种形式：

1. 直接调用`Context`类的`startActivity`方法；这种方式启动的Activity没有Activity栈，因此不能以standard方式启动，必须加上`FLAG_ACTIVITY_NEW_TASK`这个Flag。
2. 调用被`Activity`类重载过的`startActivity`方法，通常在我们的Activity中直接调用这个方法就是这种形式；

其实`startActivity`最终通过`ActivityManagerNative`这个方法远程调用了`AMS`的`startActivity`方法。那么这个`ActivityManagerNative`是什么呢？

ActivityManagerNative实际上就是`ActivityManagerService`这个远程对象的Binder代理对象；每次需要与AMS打交道的时候，需要借助这个代理对象通过驱动进而完成IPC调用。