# Activity

标签（空格分隔）： 

---



必看的参考页面：  
[Activities](http://www.android-doc.com/guide/components/activities.html)  
[android面试题-关于Activity](http://www.iwfu.me/2016/07/17/%E5%AE%89%E5%8D%93%E9%9D%A2%E8%AF%95%E9%A2%98%EF%BC%9A1-%E5%85%B3%E4%BA%8Eactivity/)

官方文档：[Activity - Android Developers](https://developer.android.com/guide/components/activities.html "Activity  Android Developers")







Android为关闭Activity准备了如下两个方法：



- finish()：结束当前Activity
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



## Activity生命周期应用场景

1.动态广播接收器的注册和销毁




### 参考：[Activity启动中的requestCode 和 resultCode 的传递和用法（Activity 三 ）](http://www.cnblogs.com/PengLee/p/4083936.html)


#### requestCode请求码的作用

```java
startActivityForResult(Intent intent, int requestCode)
```



**请求码的值是根据业务需要由自已设定，用于标识请求来源。**一个Activity有两个按钮，点击这两个按钮都会打开同一个Activity，不管是那个按钮打开新Activity，当这个新Activity关闭后，系统都会调用前面Activity的onActivityResult(int requestCode, int resultCode, Intent data)方法。在onActivityResult()方法如果需要知道新Activity是由那个按钮打开的，并且要做出相应的业务处理，这时可以这样做。



#### resultCode结果码的作用

```java
onActivityResult(int requestCode, int resultCode, Intent data)
```



为了知道返回的数据来自于哪个子Activity；或者用resultCode判断子Activity的业务是否处理成功。





### Activity销毁但Task如果没有销毁掉，当Activity重启时这个AsyncTask该如何解决？

还是屏幕旋转这个例子，在重建Activity的时候，会回调 
`Activity.onRetainNonConfigurationInstance()`重新传递一个新的对象给AsyncTask，完成引用的更新

### Asynctask为什么要设置为只能够一次任务

考虑到线程安全问题

### 若Activity已经销毁,此时AsynTask执行完并返回结果,会报异常么?

当一个App旋转时，整个Activity会被销毁和重建。当Activity重启时，AsyncTask中对该Activity的引用是无效的，因此onPostExecute()就不会起作用，若AsynTask正在执行，折会报 view not attached to window manager 异常

同样也是生命周期的问题，在 Activity 的onDestory()方法中调用Asyntask.cancal方法，让二者的生命周期同步



### 介绍Activity 四中launchMode:

- standard
- singleTop
- singleTask
- singleInstance

我们可以在AndroidManifest.xml配置的[android](http://lib.csdn.net/base/android):launchMode属性为以上四种之一。 
1. standard standard模式是默认的启动模式，不用为配置android:launchMode属性即可，当然也可以指定值为standard。standard启动模式，不管有没有已存在的实例，都生成新的实例。 
2. singleTop 我们在上面的基础上为指定属性android:launchMode=”singleTop”，系统就会按照singleTop启动模式处理跳转行为。跳转时系统会先在栈结构中寻找是否有一个Activity实例正位于栈顶，如果有则不再生成新的，而是直接使用。如果系统发现存在有Activity实例,但不是位于栈顶，重新生成一个实例。 这就是singleTop启动模式，如果发现有对应的Activity实例正位于栈顶，则重复利用，不再生成新的实例。 
3. singleTask 如果发现有对应的Activity实例，则使此Activity实例之上的其他Activity实例统统出栈，使此Activity实例成为栈顶对象，显示到幕前。 
4. singleInstance 这种启动模式比较特殊，因为它会启用一个新的栈结构，将Acitvity放置于这个新的栈结构中，并保证不再有其他Activity实例进入。



### LaunchMode使用场景

1. singleTop适合接收通知启动的内容显示页面。 
   例如，某个新闻客户端的新闻内容页面，如果收到10个新闻推送，每次都打开一个新闻内容页面是很烦人的。
2. singleTask适合作为程序入口点。 
   例如浏览器的主界面。不管从多少个应用启动浏览器，只会启动主界面一次，其余情况都会走onNewIntent，并且会清空主界面上面的其他页面。
3. singleInstance应用场景： 
   闹铃的响铃界面。 你以前设置了一个闹铃：上午6点。在上午5点58分，你启动了闹铃设置界面，并按 Home 键回桌面；在上午5点59分时，你在微信和朋友聊天；在6点时，闹铃响了，并且弹出了一个对话框形式的 Activity(名为 AlarmAlertActivity) 提示你到6点了(这个 Activity 就是以 SingleInstance 加载模式打开的)，你按返回键，回到的是微信的聊天界面，这是因为 AlarmAlertActivity 所在的 Task 的栈只有他一个元素， 因此退出之后这个 Task 的栈空了。如果是以 SingleTask 打开 AlarmAlertActivity，那么当闹铃响了的时候，按返回键应该进入闹铃设置界面。



### 如何一次性退出所有打开的Activity

编写一个Activity作为入口，当需要关闭程序时，可以利用Activity的SingleTop模式跳转该Activity，它上面的所有Activity都会被销毁掉。然后再将该Activity关闭。
或者再跳转时，设置`intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)`;这样也能将上面的Activity销毁掉。





