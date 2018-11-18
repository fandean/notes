# 深入理解Handler



## Handler介绍



 **Handler是什么？**

Handler是Android提供的一套用来更新UI的机制，也是一套消息处理机制，可以通过它发送消息，也可以通过它处理消息。    
**所有Activity生命周期回调的方法，都是通过handler机制去发送消息的**，然后根据不同的消息（message）做相应的分支处理。例如发送一个消息给 Framework，告知需要调用onCreate()或onDestory()方法。实际上在 Framework 当中，Activity的交互大部分都是用AMS（Activity Manager Service）做处理的。整个应用程序的核心的一个类就是 Activity Thread，**Activity Thread就是通过handler机制接收到 Activity Manager Service发送的有关Activity生命周期的管理的消息**（比如启动）。





**为什么要使用Handler？**

Android在设计的时候，就封装了一套消息的创建、传递、处理机制，如果不遵循这样的机制，就没有办法更新UI信息，并且会抛出异常信息。这样的机制便包含Handler机制。       
我们需要把这些耗时的操作，放在一个子线程中，因为子线程涉及到UI更新，Android主线程是线程不安全的，也就是说，更新UI只能在主线程中更新，子线程中操作是危险的。这个时候，Handler就出现了。来解决这个复杂的问题 ，由于Handler运行在主线程中(UI线程中)，它与子线程可以通过Message对象来传递数据， 这个时候，Handler就承担着接受子线程传过来的(子线程用sedMessage()方法传递)Message对象(里面包含数据），把这些消息放入主线程队列中，配合主线程进行更新UI。     
Handler主要接受子线程发送的数据，并用此数据配合主线程更新UI。      
当应用程序启动时，Android首先会开启一个主线程 (也就是UI线程) ，主线程为管理界面中的UI控件，进行事件分发，比如说， 你要是点击一个 Button ，Android会分发事件到Button上，来响应你的操作。如果此时需要一个耗时的操作，例如: 联网读取数据，或者读取本地较大的一个文件的时候，你不能把这些操作放在主线程中，如果你放在主线程中的话，界面会出现假死现象，如果5秒钟还没有完成的话，会收到Android系统的一个错误提示 "强制关闭"。        



- post(runnable)
- sendMessage(message)



## Handler的一些用法



### 移除消息

移除一个runnable或者消息

handler.removeCallbacks(runnable);



### 使用Callback创建Handler对象



```java
// 平时我们创建 handler 的方法
// 派生一个Handler的子类，并重写其handleMessage方法（@Override只在子类中出现）
private Handler handler = new Handler(){
  
  public void handleMessage(Message msg){
      //注意这个handleMessage方法的返回值为 void
  }
};
```

当我们不想派生Handler子类时，可以通过Callback来实现(改为派生Callback的子类)：

```java
private Handler hander = new Handler(new Callback(){
  @Override
  public boolean handleMessage(Message msg){
    //该方法是 Callback 的方法，用于处理消息或者截获消息
  }
});
```



使用Callback对象可以用于**截获消息**

```java
// 在派生Handler子类的同时 也使用 Callback 
private Handler handler = new Handler(new Callback(){
  @Override
  public boolean handleMessage(Message msg){
      //注意这个handleMessage方法的返回值为 boolean
    //该方法是 Callback 的方法，用于处理消息或者截获消息
    
    //返回值如果为 true；则表示已经截获消息
    //返回值为 false 表示没有截获消息
  }
  
}){

  @Override
  public void handleMessage(Message msg){
      //注意这个handleMessage方法的返回值为 void
    //该方法是 handler 对象的方法
  }
};
```





相关逻辑见 **Handler** 的`dispatchMessage()`方法的源码：

```java
// 消息分发的过程
public void dispatchMessage(Message msg){
    if(msg.callback != null){  //这里的callback实际上就是 handler.post(Runnable)传递的runnable对象
        handleCallack(msg);
    }else{
        if(mCallback!=null){	//判断是否存在 callback 
            if(mCallback.handMessage(msg)){ // 判断是否拦截消息
                return;
            }
        }
        handleMessage(msg); // Handler自身的handlerMessage()方法。
    }
}
```

其中，mCallback就是我们在创建Handler对象的时候传入的Callback()参数，如果它不为空，就判断它的 handlerMessage()返回的布尔变量，如果是true就直接retuen，不再执行 Handler本身的handlerMessage() 方法，这就是所谓的“拦截”消息。
从上述可以看出，Handler是通过 dispatchMessage() 去调用 handleMessage()，这就是为什么 Handler 在发送 Message 的时候会回调 handleMessage()方法。

总结：Handler 负责发送消息，Looper 负责接收 Handler 发送的消息，并直接把消息**回传**给 Handler 自己，MessageQueue就是一个存储消息的容器。

那么，如何**回传**？调用Looper.Looper，判断target是谁，默认就是Handler自己，调用Handler自己的dispatchMessage()方法去回调自己的 handleMessage()方法。这就是回传。



## Handler相关问题



### Android为什么要设计只能通过Handler机制更新UI呢？

**Android为什么要设计只能通过Handler机制更新UI呢？**

最根本的目的就是解决多线程并发的问题。

1. 假如在一个Activity当中，有多个线程去更新UI，并且都没有加锁机制，那么会产生什么样子的问题？  
  --> 更新界面混乱。    
2. 如果对更新UI的操作都进行加锁处理的话又会产生什么样子的问题？   
  --> 性能下降。  
  正是对以上问题的考虑，Android给我们提供了一套更新UI的机制，我们只需遵循这样的机制就可以了，根本不用去关心多线程（并发）的问题，所有的更新UI的操作，都是在主线程的消息队列中去“轮询”处理的。  






### Handler与Looper、MessageQueue的关系？



[Handler与Looper、MessageQueue的关系-慕课网](http://www.imooc.com/video/5681 "与Looper、MessageQueue的关系-慕课网")



面试经典问题：Looper、Handler、Message（或MessageQueue）三者间的关系？



**Handler：**

Handler的主要作用是将一个任务切换到某个指定的线程中去执行。就是创建Handler所在的线程。

使用 Handler 发送消息，默认都是发送消息给自己。



Handler的原理主要指：

- Handler发送消息的过程；sendMessage()方法的逻辑
- Handler分发消息的过程；dispatchMessage()方法的逻辑（指定了最终调用哪个方法来处理消息）





**Threadlocal**

作用：在线程中保存一些变量信息。创建和线程相关的对象（变量）。

在这里我们利用 Threadlocal获取当前线程的Looper （我们可能会创建多个线程，那么如何获取只与某个线程相关的Looper，就利用了Threadlocal）。Looper的作用域就是线程，且不同线程中的Looper都不一样。

Threadlocal对应有相关的setter和getter。



**Looper：**

通过 Looper.prepare()为当前线程创建一个Looper；

通过Looper.loop()来开启消息循环



补充图片和源代码





**总结：**

Handler 负责发送消息（应该还有处理消息），Looper 负责接收 Handler 发送的消息，并直接把消息回传给 Handler 自己，MessageQueue就是一个存储消息的容器。



Handler和MessageQueue的部分关系，可以通过分析 `sendMessage()`方法获得。



## HandlerThread

[Android HandlerThread 完全解析 - Hongyang - CSDN博客](http://blog.csdn.net/lmj623565791/article/details/47079737 "Android HandlerThread 完全解析 - Hongyang - CSDN博客")

[HandlerThread 源码解析 - 把编程当做一种爱](http://icodeyou.com/2015/10/11/2015-10-11-HandlerThread%E6%BA%90%E7%A0%81%E8%A7%A3%E6%9E%90/ "HandlerThread 源码解析 - 把编程当做一种爱")

HandlerThread是Android API提供的一个方便、便捷的类，使用它我们可以快速的创建一个带有Looper的线程。

并且解决了线程的同步问题，它会等到mLooper创建完成，才正确的返回，避免了在创建Handler时Looper对象还没有创建完成的情况。

`mHandlerThread.getLooper()`获取与该线程绑定的Looper实例。mLooper是在HandlerThread的`run()`方法中赋值的（也就是在子线程中），getLooper是我们在主线程中调用，该方法会**阻塞**直到mLooper赋值。



第一种用法：

```java
//创建HandlerThread的一个对象，并开启这个线程，handlerthread将通过looper来处理handler对列中的消息，也就是如果发现Handler中有消息，将在HandlerThread这个线程中进行处理。
HandlerThread ht =new HandlerThread ("handler_thread"); //线程名称为handler_thread
//启动handlerthread这个线程
ht.start();

//创建handler。创建handler时，带上looper参数，即handlerThread.getLooper()。注意必须在handlerThread启动后才能调用，否则会出错，getLooper（）会返回null，则程序异常出错
Handler handler=new Handler(ht.getLooper()){
  public void handleMessage(Message msg){

	/*这里的处理，将不在主线程中执行，而在handlerthread线程中执行，可以通过Thread.currentThread().getId()或者Thread.currentThread().getName()来确定*/ 
	} 
};

```



第2种方法，创建继承 HandlerThead的子类。参考《Android权威编程指南》

HandlerThead的onLooperPrepared()在Looper循环之前调用；所以对于HandlerThead的子类，如果需要在Looper循环之前执行一些设置，可以显式覆盖此方法。



Activity销毁的时候，调用`mHandlerThread.quit()`，退出HandlerThread的Looper循环；否则该子线程会一直执行（考虑是否需要它在后台执行）。

quit和quitSafely都是退出HandlerThread的消息循环。其分别调用Looper的quit和quitSafely方法。

quit方法会将消息队列中的所有消息移除（延迟消息和非延迟消息）。

quitSafely会将消息队列所有的延迟消息移除，非延迟消息派发出去让Handler去处理。quitSafely相比于quit方法安全之处在于清空消息之前会派发所有的非延迟消息。

HandlerThread适合处理本地IO读写操作（数据库，文件），因为本地IO操作大多数的耗时属于毫秒级别，对于单线程 + 异步队列的形式 不会产生较大的阻塞。而网络操作相对比较耗时，容易**阻塞**后面的请求，因此在这个HandlerThread中不适合加入网络操作。



HanlderThread的特点：

- HandlerThread本质上是一个线程，继承自Thread
- HandlerThread有自己的Looper对象，可以进行Looper循环，可以创建Handler
- HandlerThread可以在Handler的handlerMessage中执行异步方法
- HandlerThread优点是异步不会堵塞，减少对性能的消耗
- HandlerThread缺点是不能同时继续进行多任务处理，需要等待进行处理，处理效率较低
- HandlerThread与线程池不同，HandlerThread是一个串行队列，背后只有一个线程



## 使用Handler模拟Timer



为什么要这样做？  

[Handler vs Timer](http://androidtrainningcenter.blogspot.com/2013/12/handler-vs-timer-fixed-period-execution.html "需翻墙")

与一般的Handler的区别就是在它的 handlerMessage()方法中多了再次调用send方法，来延迟发送message。



