# Android异步消息处理机制

参考：  

- 《第一行代码——Android》服务相关章节  
- [Android 异步消息处理机制（Handler 、 Looper 、MessageQueue）源码解析](http://blog.csdn.net/amazing7/article/details/51424038)  
- [Android 消息处理机制（Looper、Handler、MessageQueue,Message）](http://www.jianshu.com/p/02962454adf7)  
  ​


## 与服务的关系
服务（Service）是Android中实现程序后台运行的解决方案，它适合执行那些不需要用户交互而且需要长时间运行的任务。

注意：

- 服务并不是运行在一个独立的**进程**中，而是依赖于创建服务时所在的应用程序中。
- 实际上，服务并不会自动开启**线程**，所有的代码都是默认运行在主线程当中，（需要在服务内部手动创建子线程）。
  -


> 以上牵涉到了 多线程 问题


于其他GUI库一样，Android的UI操作并不是线程安全的。所有UI操作必须在主线程（UI线程）中进行。

> 这里需要考虑到将其他子线程中的处理结果返回给主线程的问题



为了应对上面的问题；Android提供了一套**异步消息处理机制**，用来解决**在子线程中进行UI操作的问题**。


## 异步消息处理机制

Android异步消息处理主要由四个部分组成，Message、Handler、MessageQueue和Looper。




## Android消息机制

> 《Android开发艺术探索》第10章：Android消息机制

从开发的角度来说，Handler是Android消息机制的上层接口，这使得在开发过程中只需要和Handler交互即可。**通过它可以轻松的将一个任务切换到Handler所在的线程中去执行**。

从本质上来说，Handler并不是专门用于更新UI的，它只是常被开发者用来更新UI。

Android的消息机制主要是指Handler的运行机制，Handler的运行需要底层的MessageQueue和Looper的支持。


MessageQueue：只是个消息的存储单元  
Looper：以无线循环的形式去查找是否有新消息，如果有就处理消息，否则一直等待。


Looper中还有个特殊的概念：ThreadLocal。  

ThreadLocal并不是线程，它的作用是可以在每个线程中存储数据。




## AsyncTask

《Android权威编程指南》第23章




> AsyncTask可能导致内存泄露的原因：[SafeAsyncTask](https://github.com/peerless2012/SafeAsyncTask)  


## 异步装载器Loader

[Android应用Loaders全面详解及源码浅析 - 工匠若水 - CSDN博客](http://blog.csdn.net/yanbober/article/details/48861457 "Android应用Loaders全面详解及源码浅析 - 工匠若水 - CSDN博客")

[Android 深入理解Loader机制 让APP轻装上阵 - 简书](http://www.jianshu.com/p/385327e35711 "Android 深入理解Loader机制 让APP轻装上阵 - 简书")


[Android 异步加载神器Loader全解析 - 希尔瓦娜斯女神 - 博客园](http://www.cnblogs.com/punkisnotdead/p/4861376.html "Android 异步加载神器Loader全解析 - 希尔瓦娜斯女神 - 博客园")




> 官网文档：
> http://developer.android.com/intl/zh-cn/reference/android/app/LoaderManager.html   
> http://developer.android.com/intl/zh-cn/reference/android/content/AsyncTaskLoader.html   
> http://developer.android.com/intl/zh-cn/guide/components/loaders.html   





##  JobScheduler和JobService

为了更好的实现后台服务、Android引入了一个叫作JobScheduler的权限API。除了实现常规后台服务之外，JobScheduler还支持按场景、按条件运行后台服务。

自Android 5.0发布以来，JobScheduler已成为执行后台工作的首选方式。





> 《Android权威编程指南》









## Android IPC机制

> Linux系统所支持的主要进程间通信信机制：  
> 同一主机：无/有名管道、信号、信号量、消息队列和共享内存。
> 不同主机：RPC和Socket

> 无名管道：多用于亲缘关系进程间通信，它是单向的，多进程间使用统一管道会导致交叉读写的问题。
> 消息队列：任意多进程间通信，但存放的数据量有限，用于少量的数据传递。
> 共享内存：进程间大量数据通信，存在竞争问题。
> 信号量：同主机进程间**同步机制**。
> 信号：同主机进程间异步机制。

 而对于Android来说，它的进程间通信方式并**不完全继承子Linux**；它有自己的进程间通信方式。其最有特色的进程间通信机制方式就是Binder；通过Binder可以轻松的实现进程间通信。

 说到IPC的使用场景就必须提到**多进程**，只有面对多进程这种场景，才需要考虑进程间通信。（使用ContentProvider去查询数据的时候，也是一种进程间通信） 《Android开发艺术探索》


> 《Android开发艺术探索》第2章：IPC机制











### Android中的多进程模式

> 《Android开发艺术探索》第2章：IPC机制

正常情况下，Android中多进程指一个应用中存在多个进程的情况，所以这里不讨论两个应用之间的多进程情况。

首先，在Android中使用多进程只有一种方法，就是给四大组件（Activity、Service、Receiver、ContentProvider）在AndroidMenifest中指定`android:process`属性。（通过给四大组件指定android:process属性来开启多进程模式，该属性值表示进程的名称）。入口Activity，没有为它指定process属性，那么它运行在默认进程中，默认进程的进程名就是包名。

> 还有一种特殊方法：通过JNI在native层去fork一个新的进程。

当应用开启了多进程后，就会出现各种奇怪的现象。


一般来说，使用多进程会造成如下几个方面问题：  

- 静态成员和单例模式完全失效
- 线程同步机制完全失效
- SharedPrefrences的可靠性下降
- Application会多次创建


Androi为每个应用分配了一个独立的虚拟机，或者说为每个进程都分配一个独立的虚拟机。




> 这里是多进程，而非多线程。


