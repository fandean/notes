---
layout: post
title: "理解BroadCast"
description: "理解BroadCast"
date: 2017-07-15
tags: [Android]
category: Android
last_updated: 2017-07-18
comments: true
chare: true
---

* Kramdown table of contents
{:toc .toc}



# 理解BroadCast

> [Broadcasts - Android Developers](https://developer.android.com/guide/components/broadcasts.html "Broadcasts - Android Developers")

广播是一种跨进程的通信方式，当然它也可以用于不跨进程的情形。


## broadcast Intent

使用`sendBroadcast()`、`sendOrderedBroadcast()`、`sendStickyBroadcast()`等方法发送的Intent，就是broadcast Intent

> 注意这些方法属于Context类

## BroadCast Reciver

一般情况下，Broadcast Receiver将会更新内容、启动Service、更新Activity UI，或者使用Notification Manager来通知用户。


### 静态注册

在manifest文件中注册（此时称为 manifest reciver）。

对于包含 manifest接收器的应用程序，在匹配的broadcast Intent被广播出去的时候，应用程序不一定要处于运行状态就能接收，此时如果该应用程序没有运行则他会被自动启动。



### 动态注册
在代码中注册。第一次见四大组件中有对象可以不在manifest文件中注册（恕我孤陋寡闻）




> Androidmanifest文件作用之一：描述应用的各个组件，包括构成应用的 Activity、服务、广播接收器和内容提供程序。它还为实现每个组件的类命名并发布其功能，例如它们可以处理的 Intent 消息。这些声明向 Android 系统告知有关组件以及可以启动这些组件的条件的信息。



### 本地广播

本地广播机制，使用这个机制发出的广播只能够在应用程序的内部进行传递，并且广播接收器也只能接收来自本应用程序发出的广播。

**将全局广播改造为本地广播：**

1. 条件1：只在应用程序的内部使用。  
2. 条件2：Intent只能被应用程序的特定广播接收器接收。   
3. 条件3：广播接收器只能接收本应用程序发出的Intent。   

条件1：使用动态注册广播接收器即可。     
条件2和3：可以通过创建自定义的权限，然后应用于Intent和广播接收器。   


#### LocalBroadCastManager
为了更方便的使用本地广播，Android为我们提供了 LocalBroadCastManager 来管理广播。

LocalBroadCastManager优点：

- 效率高
- 安全
- 数据私有

LocalBroadCastManager缺点：

- 不支持有序广播；虽然它有个sendBroadcastSync()方法，但是不灵。
- sendBroadcastSync()方法不支持在独立线程上发送和接收广播。（sendBroadcast()应该就没有此限制）
  ）

看 LocalBroadCastManager 一般常用于发送标准的本地广播；比如可以用来代替Handler更新UI。  
如果需要发送有序广播就需要使用将全局广播改造为本地广播的方法。


> **事件总线 Event Bus**  
> 本地事件  
> 如果仅需应用内的消息**事件**广播，可以使用事件总线。

> **使用Rxjava:**  
> Rxjaye也可以用来实现事件广播机制。





### 有序广播

主要介绍下面这个方法：

```java
/*
 * Version of sendBroadcast(Intent) that allows you to receive data back from the broadcast. This is accomplished 
 * by  supplying your own BroadcastReceiver when calling, which will be treated as a final receiver at the end of 
 * the broadcast -- its onReceive(Context, Intent) method will be called with the result values collected from the 
 * other receivers. The broadcast will be serialized in the same way as calling sendOrderedBroadcast(Intent, String).
 * 
 * Like sendBroadcast(Intent), this method is asynchronous; it will return before resultReceiver.onReceive() is called.
 */
void sendOrderedBroadcast (
        //The Intent to broadcast
        Intent intent,     
        //接收者必须拥有的权限，有此权限才能接收广播。如果为null，则不需要权限。
        String receiverPermission,    
        //您自己的BroadcastReceiver将会作为最终的一个接收器来接收信息。（一般就称为resultReceiver）
        BroadcastReceiver resultReceiver, 
        // 自定义的一个handler，来处理resultReceiver的回调，
        // 其实就是设置运行resultReceiver的线程，如果为null，则在主线程中处理。
        Handler scheduler,            
        //Result Code的初始值；经常传递 Activity.RESULT_OK
        int initialCode,              
        //result data的初始值；经常传递 null
        String initialData,           
        //result extras的初始值；经常传递 null
        Bundle initialExtras)         
```

使用场景：

比如：《Android编程权威指南》中的，用于过滤前台通知消息，见[AndroidDemo/PhotoGallery](https://github.com/FanDean/AndroidDemo/tree/master/PhotoGallery)



> 参考：[Android - sendOrderedBroadcast也可以这么用](http://blog.csdn.net/u014470702/article/details/47723955 "Android - sendOrderedBroadcast也可以这么用")


## Manifest Receiver
Manifest Receiver就是在manifest文件中静态注册的Receiver。

可以使用Package Manager的setComponentEnabledSetting方法，在运行时启用和禁用应用程序的manifest Receiver。可以使用这种技术启用和禁用任何应用程序组件（包括Activity和Service）。尤其适用于启用和禁用manifest Receiver。


当应用程序不需要接收某些系统广播时，可以禁用对应的manifest Receiver，这样可以减少应用程序的开销。  



## 注意事项

### onReceiv方法
不要在onReceive()方法中添加过多的逻辑或者进行任何的耗时操作，因为在广播接收器中是不允许开启线程的，当onReceive()方法运行了较长时间而没有结束程序就会报错。

一般而言onReceive()方法是在主线程中运行的（没有调用goAsync()方法）。

作为一般规则，广播接收器允许运行长达10秒钟，然后系统会将其视为无响应和ANR应用程序。如果onReceive()方法在主线程上执行，那么它还受到在主线程中运行不得超过5秒的限制。

**在onReceive()方法中运行长时间的任务：**

1. 将任务交给Service去处理，然后通过broadcast intent启动服务。（首推方式）可以**通过Intent启动Service**来完成。**但不能绑定Service**。特别是，您可能无法从一个BroadcastReceiver中显示一个对话框，或绑定到服务。对于前者，则应该使用NotificationManager的API。对于后者，你可以使用Context.startService()来启动一个Service。
2. 使用BroadcastReceiver.goAsync()方法。（Async异步）该方法的优点是可以设置有序广播的结果；缺点是限制多。


### BroadcastReceiver对进程状态的影响


见


> 对进程状态的影响 [Broadcasts - Android Developers](https://developer.android.com/guide/components/broadcasts.html#effects_on_process_state "Broadcasts - Android Developers")   
> goAsync()方法：<https://developer.android.com/reference/android/content/BroadcastReceiver.html#goAsync()>


## 广播进阶

广播机制存在一个**注册中心**，它是由**ActivityManagerService**来担当的，广播**接收者订阅消息**的表现形式就是**将自己注册到ActivieyManagerService中**，并且指定要接收的广播的类型，当**广播发送者**向广播接收者**发送一个广播**时，这个**广播首先发送到ActivityManagerService**，然后ActivityManagerService可根据这个类型找到相应的**广播接收者**，最后将这个广播发送给它们处理。

**广播的生命周期**，从对象调用它开始，到onReceiver方法执行完成之后结束。

**推荐阅读：**  
> [DroidPlugin/插件占坑，四大组件动态注册前奏（三） 系统BroadCast的注册发送流程.md ](https://github.com/DroidPluginTeam/DroidPlugin/blob/master/DOC/hejunlin/插件占坑，四大组件动态注册前奏（三）%20系统BroadCast的注册发送流程.md )
>
> 或见原文：[插件占坑，四大组件动态注册前奏（三） 系统BroadCast的注册发送流程 - 逆流的鱼yuiop - CSDN博客](http://blog.csdn.net/hejjunlin/article/details/52204143 "插件占坑，四大组件动态注册前奏（三） 系统BroadCast的注册发送流程 - 逆流的鱼yuiop - CSDN博客")


