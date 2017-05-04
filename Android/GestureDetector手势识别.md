# GestureDetector手势识别

参考：(按顺序查看)  

1. [Android 触摸及手势操作GestureDetector](http://blog.csdn.net/xyz_lmn/article/details/16826669)
2. [Android手势监听类GestureDetector的使用](http://www.cnblogs.com/sw926/p/3208158.html)
3. [用户手势检测-GestureDetector使用详解](http://blog.csdn.net/harvic880925/article/details/39520901 "推荐")


## GestureDetector类
GestureDetector类：

使用提供的MotionEvents检测各种手势和事件。 GestureDetector.OnGestureListener回调将在特定运动事件发生时通知用户。 该类只能用于通过触摸报告的MotionEvents（不要用于轨迹球事件）。

该类主要是通过它的onTouchEvent()方法完成了不同**手势的识别**，但是不同的手势要如何处理是由程序员实现。



使用该类的注意事项和方法：  

- 为你的View创建一个GestureDetector实例
- 确保调用该类的`onTouchEvent(MotionEvent)`，回调中定义的方法将在事件发生时执行。

几个内部成员和方法的介绍：  

1. `boolean onTouchEvent(MotionEvent ev)`方法：  
Analyzes the given motion event and if applicable(可适用) triggers(触发) the appropriate(适当的) callbacks(回调) on the GestureDetector.OnGestureListener supplied(提供的).(分析事件，如果适用则调用相关回调方法)
2. 内部类（接口）`GestureDetector.OnGestureListener`: The listener that is used to notify(通知) when gestures occur(当产生手势时). 
3. 静态内部类`GestureDetector.SimpleOnGestureListener`: 该类直接继承了GestureDetector类中的所有接口，并实现了所有接口中的所有方法，但是在实现的方法中只是简单的返回false。如果你只想监听手势的一个子集，则只需简单的继承该类即可。


因此实现手势识别有两种方法，一种实现OnGestureListener接口，另一种是使用SimpleOnGestureListener类。



