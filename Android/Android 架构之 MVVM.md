




## MVVM

[MVC，MVP 和 MVVM 的图示](http://www.ruanyifeng.com/blog/2015/02/mvcmvp_mvvm.html)





## MVVM



一个基于事件的架构

MVVM代表Model-View-ViewModel。此模式支持视图和视图模式之间的双向数据绑定。这样可以在View视图模式下自动传播更改。通常，视图模型使用观察者模式来通知视图模型中的变化来建模。

![](https://cdn-images-1.medium.com/max/800/1*fpTUAtCz8iiWU90WM7Pj4w.png)



ViewModel负责公开方法，命令和其他属性，有助于维护视图的状态，操作模型作为视图上的操作的结果，并触发视图本身中的事件。



MVVM模式的要点:

- 用户与视图进行交互。
- View与ViewModel之间存在**多对一**关系，意味着许多View可以映射到一个ViewModel。
- View具有对ViewModel的引用，但ViewModel没有关于View的信息。
- 支持View和ViewModel之间的双向数据绑定。






## 参考


Google员工提供的三篇文章：  

- [Android Architecture Patterns Part 1: Model-View-Controller — upday tech blog](https://upday.github.io/blog/model-view-controller/ )
- [Android Architecture Patterns Part 2: Model-View-Presenter — upday tech blog](https://upday.github.io/blog/model-view-presenter/ )
- [Android Architecture Patterns Part 3:Model-View-ViewModel — upday tech blog](https://upday.github.io/blog/model-view-viewmodel/ ) 
- [MVVM — It’s All In The (Implementation) Details – upday devs – Medium](https://medium.com/upday-devs/mvvm-its-all-in-the-implementation-details-40ed24871a02)

并结合的了Google的提供的示例项目 googlesamples/android-architecture 

作者提供的小示例：

[florina-muntenescu/MVPvsMVVM: Model-View-Presenter vs Model-View-ViewModel in a "Hello, World!" project](https://github.com/florina-muntenescu/MVPvsMVVM )

[florina-muntenescu/DroidconMVVM: "Hello, World!" example of the Model-View-ViewModel pattern](https://github.com/florina-muntenescu/DroidconMVVM )



这里介绍了几个架构的关键点：

[Android Architecture – AndroidPub](https://android.jlelse.eu/android-architecture-2f12e1c7d4db "Android Architecture – AndroidPub")
