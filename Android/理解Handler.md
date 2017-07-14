# 简单理解 Handler

配套的Handler、Looper和Message queue都位于同一个线程中，只是在其他线程中引用Handler。

Handler中存在一个Looper引用， Message中存在一个Handler引用。
然后下面是关键（心中要有此概念，有助于理解后面的操作）：一个Looper可以被多个Handler引用，一个Handler也可以被多个Message引用。
然后就是在Handler创建时就会自动关联对应的Looper。

Message对象需要定义的三个变量：

- What：用来描述消息（区分该类消息）
- obj：随消息发送的用户指定对象。
- target：处理消息的Handler。Message的目标是一个Handler的实例。


Handler不仅仅是处理Message的目标（target）也是创建和发布Message的接口。也就是说Handler不仅处理Message，也可以创建Message和
发布Message。


## 主线程需要后台线程为其下载图片的方法和步骤

方法：

向后台线程发送消息，说我要叫你下载图片。发送消息之前肯定要先创建Message；可以new一个message，再设置该message实例至少需要
设置的3个变量。其中what用来区分消息；obj包含下载图片需要的相关信息，比如url；target就需要引用后台线程中的Handler实例。然后还要调用
引用的Handler的sendToTarget()方法发送该消息(发送消息也是Handler的事情)。
然后在后台线程中处理该消息。


在主线程中的操作步骤：

- 那么先引用该后台线程的Handler，
- 然后调用Handler用来创建Message的方法来创建Message；使用该方法可以不用手动new一个message，再去分别设置；这样就比较方便，而且性能更好。
- 调用Handler的发送消息的方法来发送该消息。


后台线程中下载图片：

- 后台线程中需要实现了Handler的handleMessage(Message msg)方法
- 分析what，what表示了消息的种类，如果该消息是要求我下载图片，就执行handleMessage()方法中下载图片的代码片段。



## 后台线程通知主线程图片已经下好，请更新视图的消息

方法：与之前一样，只是反过来了。这次需要后台线程获取主线程中Handler的引用，并向主线程发送消息。然后主线程接收到消息后会调用
自己的Handler对象的handleMessage()方法，来更新UI。


> 这里主线程和后台线程都各自有一套：Handler、Looper和Message queue。
> 并且后台线程的实现方式为单独创建一个类，并且继承了HandlerThread。这样它就会自动拥有Looper和Message Queue；
> 但是Handler还是需要自己创建，因为你要为其实现handleMessage()方法；但是你只需要创建Handler即可，创建时Handler中的相关
> 代码自动会关联该类的Looper。该类还会自动创建子线程并在线程中调用相关方法比如handleMessage()方法；但也不是所有方法都在子线程中
> 调用，比如你在该类自定义的方法就不会。



## 后台线程的实现(创建)

- 单独创建一个类，并且继承HandlerThread
- 也可以直接在主线程中通过`Thead(Runnable run)`的方式开启一个普通的子线程，并传入一个Runnable对象。
  并以内部类的形式实现Runnable类（这是关键），这样就可以在Runnable类的run()方法中直接访问主线程中的handler对象，并且能够直接访问执行下载动作时需要的数据。
  这样就无需主线程发送消息给子线程，并附带下载动作所需的信息了。



## Handler相关方法

相关方法的理解：
```java
//该方法属于
runOnUiThread(new Runnable() {
        @Override
        public void run() {
            //显示天气信息，在UI线程中
            showWeather();
        }
    });
```

```java
//View的post()方法，一般在Activity的onCreate()方法中使用
mRefreshLayout.post(new Runnable() {
    @Override
    public void run() {
        mRefreshLayout.setRefreshing(true);
        fetchLatestZhihuNews();
    }
});
```

handler.post()等方法： 线程在自己的消息队列中发送一个消息。
```java
//在onRefresh()中使用如下方法进行延时。
//延迟处理程序  a post delayed handler
@Override public void onRefresh() {
    //下拉刷新是的延迟
    new Handler().postDelayed(new Runnable() {
        @Override public void run() {
            swipeLayout.setRefreshing(false);
        }
    }, 5000);
```


当用户离开当前应用，进程就会停止，Handler消息也会随之消亡。



现在看《Android开发艺术探索》第10章：Android的消息机制；就容易理解很多了。

