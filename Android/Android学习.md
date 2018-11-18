[Android学习进阶路线导航线路(Android源码分享) - qinjuning、lets go - CSDN博客](http://blog.csdn.net/qinjuning/article/details/7416208 "Android学习进阶路线导航线路(Android源码分享) - qinjuning、lets go - CSDN博客")

 一、 基础篇
         需要掌握的技能如下：
               1、熟练掌握基本控件以及容器控件的使用 ；
                         常用的基本控件有：Button 、TextView、EditText、ListView等
                         常用的容器控件有：FrameLayout、LinearLayout、RelativeLayout等
               2、熟练掌握相关监听器的注册和使用：
                         常用监听器有： OnClickListener、OnLongClickListener、OnItemClickListener等
               3、掌握Log的使用以及分析方法 ；
               4、掌握Activity、Service的生命周期和使用方法 ；
               5、掌握BroadcastReceiver(广播)的接受和使用   ；
               6、掌握Intent以及IntentFilter的使用   ；
               7、基本掌握数据库方面知识，包括SQLiteDatabase以及ContentProvider的使用方法


二、 提高篇
        需要掌握的技能如下：
                 1、掌握Canvas类的使用-- 如何绘图
                 2、掌握消息通信机制---Handler相关类的使用以及原理
                 3、掌握Context类以及实现原理
                 4、掌握View树的绘制流程  。 View绘制流程很重要，掌握它就基本上掌握了Android核心之一了。
                         4.1、掌握触摸事件的分发流程--- onInterceptTouchEvent以及onTouchEvent方法流程
                         4.2、掌握相关监听器的调用机制。例如OnClickListener监听时怎么调用的？
                         4.3、能够编写自定义View以及ViewGroup
                 5、理解Binder机制----Binder机制很重要，Android的进程间通信都是靠它完成的。掌握它，才能够好的完成接下
                    来的学习。
                 6、基本掌握ActivityManagerService类的使用，主要掌握的知识点包括如下：
                          6.1、startActivity()流程，即启动一个Activity的流程  ;
                          6.2、startService()流程，即启动一个Service的流程 ;
                 7、基本掌握PackageManagerService类的使用，主要掌握的知识点包括如下：
                          7.1、开机时如何解析所有已安装应用程序的Apk包的信息
                          7.2、Intent以及IntentFilter的匹配规则以及解析过程
                 8、基本掌握View添加至窗口的过程---即WindowManagerIml 、WindowManagerService类的用法
    知识渠道：
                      网上相关大牛的博客。 (我这一亩三分地也有点货咯。(*^__^*) )
    
                      必备书籍: <Android内核剖析>
                      
                      
前面说的博客，在此推荐两个我常去的吧：

        1、   应用方面，主要是魏祝林的csdn博客 ：http://blog.csdn.net/Android_Tutor 。 但他的博客主要是以代码为主，
            需要自己结合源代码揣摩 。
        2、   框架方面，主要是老罗的csdn博客 ： http://blog.csdn.net/Luoshengyang/ 。  但他的博客主要是以流程分析
            为主，  而对 流程 需要的前期准备知识介绍不足，初步看起来比较难以理解，因此，买本《Android内核剖析》是必须
            的，可以参考源代码仔细领悟， 强烈推荐该书籍。                      
