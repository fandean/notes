# Activity

标签（空格分隔）： Android 抄袭

---

>此篇文章大多数为抄袭，少量自己总结。

必看的参考页面：  
[Activities](http://www.android-doc.com/guide/components/activities.html)  
[android面试题-关于Activity](http://www.iwfu.me/2016/07/17/%E5%AE%89%E5%8D%93%E9%9D%A2%E8%AF%95%E9%A2%98%EF%BC%9A1-%E5%85%B3%E4%BA%8Eactivity/)



Android为关闭Activity准备了如下两个方法：



- finish()：介绍当前Activity
- finishActivity(int requestCode)：结束以startActivityForResult(Intent i, int requestCode)方法启动的Activity。



## Activity生命周期

![参考别处画的图](https://i.imgur.com/ZzORjrC.png "图片是自己参照别人的画的，如见不到图则需翻墙")

[图片备份地址](https://mega.nz/#!10BQQJ5B!SeTHh1epCvEM8Ceclq78Jj83YuyiTrVe0H8wJmUDdrM)

## A activity跳转到B activity时生命周期顺序
A先调用onPause，此时A变成不可交互但任然可见状态，调用onPause后变为不可见状态，然后B调用onCreate-onStart-onResume到可见可交互状态，然后A再调用onStop，完全变为不可见不可交互状态，即将被销毁。

这样是为了方便A activity有足够的时间关闭自己的资源。因为是先调用onPause,所以在onPause里只能执行一些 简单的存储资源，停止动画等。在onStop中做稍微重量级一些的回收工作，但不能太耗时。另一方面我想是为了保证A启动B时intent可以确保到达。


## Activity异常销毁重启时的生命周期和数据的保存
当Activity由于系统配置等发生改变，会导致Activity被杀死而重新创建。即会调用onDestroy销毁Activity,再重新onCreate开启新Activity，系统通过调用onSaveInstanceState和onRestoreInstanceState分别保存和恢复视图(View)状态。


onSaveInstanceState在onStop之前调用，但不一定在onPause之前或者之后。onRestoreInstanceState在onStart之后调用

需要注意的是，onSaveInstanceState方法只会在Activity被异常终止，在Activity即将被销毁且有机会重新显示的情况下才会调用


总而言之，onSaveInstanceState的调用遵循一个重要原则，即当系统“未经你许可”时销毁了你的activity，则onSaveInstanceState会被系统调用，这是系统的责任，因为它必须要提供一个机会让你保存你的数据（当然你不保存那就随便你了）



如果Activity是由用户关闭的（按下Back按钮），或是通过在代码中调用finish关闭，那么下次创建Activity时，**实例状态Bundle不会被传递给onCreate或onRestoreInstanceState。(竟然是不会传递！不会传递！不会传递！)**应该使用 Shared Preference存储应在用户会话之间持久化的数据。《Android 4 高级编程》第7章