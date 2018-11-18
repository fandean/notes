


## Android MVP架构



## MVP

The Model-View-Presenter Pattern 

- Model - 数据层。负责处理与网络和数据库层的**业务逻辑**和**通信**。
- View - UI层。显示数据并向Presenter传递用户操作。
- Presenter - 从模型中检索数据，实现UI逻辑并管理视图的状态，决定视图的显示内容和对用户的交互作出反应。


![](https://faner.gitlab.io/assets/images/post-images/2017-08-05-model-view-presenter-mvp.png)



由于View和Presenter紧密合作，所以他们需要相互参照。为了使Presenter单元可以使用JUnit进行测试，View被抽象化并使用了一个接口。Presenter与其对应的View之间的关系在`Contract`接口类中定义，使代码更易于阅读，两者之间的连接更容易理解。

>  这里需要参考：[Android官方MVP架构示例项目解析](http://www.infoq.com/cn/articles/android-official-mvp-architecture-sample-project-analysis)  中对它的解析。相比于其它地方见到的 MVP实现这里多了个 `＊Contract()`接口〔单词Contrach：合同，契约〕，见图中的 `TaskDetailContract`：
>
>  ![](https://faner.gitlab.io/assets/images/post-images/2017-08-05-taskDetail-mvp.png)
>
>   图中箭头画反了
>
>  另见：[（新瓶旧酒）谷歌官方MVP项目学习--浅入源码 - 简书](http://www.jianshu.com/p/4f24a42b58f5 "（新瓶旧酒）谷歌官方MVP项目学习--浅入源码 - 简书")




### 模型

该模型与远程和本地数据源一起使用以获取和保存数据。这是处理业务逻辑的地方。

例如，当请求Tasks 的列表时，模型将尝试从本地数据源检索它们。如果为空，它将查询网络，将响应保存在本地数据源中，然后返回列表。

RxJava用于移除主线程并能够处理异步操作。



### 视图

该视图与Presenter一起显示数据，并通知Presenter用户的操作。在MVP活动中，片段和自定义Android视图可以是Views。我们的选择是使用片段。

所有视图实现相同的BaseView界面，允许设置Presenter。

```java
public interface BaseView<T> {
    void setPresenter(T presenter);

}
```

### Presenter 

The Presenter and its corresponding View are created by the Activity.



演示者及其相应视图由活动创建。



在[模型-视图-控制器模式](https://upday.github.io/blog/model-view-controller/)有两个主要的缺点：首先，查看具有对控制器和模型两者的引用; 其次，它不会将UI逻辑的处理限制在单个类中，这个责任在Controller和View或Model之间共享。Model-View-Presenter模式解决了这两个问题，即断开View与Model的连接，并只创建**一个类来处理**与**View的呈现**相关**的**一切- Presenter：一个易于单元化的类测试。



另一位大神说明：

![](https://cdn-images-1.medium.com/max/800/1*1P4n9JkHChEUVr5umQx4Zw.png)

视图表示UI组件。因此，仅负责显示从演示者接收的数据。这也将模型转换为UI。

**演示者负责代表视图处理所有UI事件。**这通过View接收用户的输入，然后在Model的帮助下处理用户的数据，并将结果传回给View。与视图和控制器不同，视图和演示者完全脱离对方，并通过界面相互通信。



### MVP模式的要点

- 用户与视图进行交互。
- View和Presenter之间**存在一对一的关系**，意味着一个View仅映射到一个Presenter。
- View具有对Presenter的引用，但View没有引用Model。
- 提供View和Presenter之间的**双向**通信。




#### View

view（Activities、Fragments等）

例如，如果你有一个username/password的表单和一个提交按钮，你不需要在view中写验证逻辑而是将它写在presenter中。你的view只管接受用户名和密码的输入然后将他们传递给presenter即可。

#### Presenter

view接口是要被Activity或者Fragment实现的。presenter必须依赖于view接口而不是直接依赖于Activity：通过这种方式，你可以将presenter从视图实现解耦，遵循SOLID原则的D：“依赖抽象，不要依赖具体实现）。

确保presenter不能依赖Android类文件。presenter用纯java代码实现。

> 如果我需要在Presenter中用到 Context呢？
>
> 在这种情况下，你应该问一下自己为什么需要context呢。我猜你可能想要存储数据或者获取资源。但是你不需要在presenter中做这些：你可以在view中获取资源，在model中存储数据；所以不需要用到 Context。



#### View和Presenter之间的交互

写一个contract类来描述View和Presenter之间的交互，与Google的做法一致。
contract描述了view和presenter之间的交互，它帮助你以更干净的方式设计交互。

如果有多对 View 和 Presenter 则创建多个 Contract 。



> View接口中的方法是提供给Presenter调用的。







### 如何实施

时刻记住一点： View 与 Model之间不能直接通信。







### 考虑Android特性

在Android上使用MVP还需要考虑Android的一些细节；特别是Android的生命周期问题：在任何时刻销毁或创建Activity/Fragment对象。



Android中的模型视图和演示者(MVP) 第一部分





## MVP实现流程


1. 设计App界面（大概的轮廓）
2. 在xml文件中实现大致布局
3. 按功能创建package实现大致的工程结构
4. 选择需要使用的第三方开源库
5. 创建各顶级接口：IView、IPresenter 和数据相关的 DbHelper, PreferencesHelper, ApiHelper以及继承它们的DataManager接口。之后再补充各接口中需要添加的方法。
6. 再一个界面一个界面的实现





## 参考

引用某位大侠说的，“看再多文章也没有，动手实现才是最快最实际的方法”。


### 系列文章一

Google某员工提供的三篇文章

- [Android Architecture Patterns Part 1: Model-View-Controller — upday tech blog](https://upday.github.io/blog/model-view-controller/ )
- [Android Architecture Patterns Part 2: Model-View-Presenter — upday tech blog](https://upday.github.io/blog/model-view-presenter/ )
- [Android Architecture Patterns Part 3:Model-View-ViewModel — upday tech blog](https://upday.github.io/blog/model-view-viewmodel/ ) 
- [MVVM — It’s All In The (Implementation) Details – upday devs – Medium](https://medium.com/upday-devs/mvvm-its-all-in-the-implementation-details-40ed24871a02)

并结合的了Google的提供的示例项目 googlesamples/android-architecture 

作者提供的小示例：

[florina-muntenescu/MVPvsMVVM: Model-View-Presenter vs Model-View-ViewModel in a "Hello, World!" project](https://github.com/florina-muntenescu/MVPvsMVVM )

[florina-muntenescu/DroidconMVVM: "Hello, World!" example of the Model-View-ViewModel pattern](https://github.com/florina-muntenescu/DroidconMVVM )


[Android官方MVP架构示例项目解析](http://www.infoq.com/cn/articles/android-official-mvp-architecture-sample-project-analysis)

纸飞机： [重构！将Google MVP应用于已有项目 - Tonny's Blog](https://tonnyl.github.io/2016/09/27/%E9%87%8D%E6%9E%84%EF%BC%81%E5%B0%86Google-MVP%E5%BA%94%E7%94%A8%E4%BA%8E%E5%B7%B2%E6%9C%89%E9%A1%B9%E7%9B%AE/ "重构！将Google MVP应用于已有项目 - Tonny's Blog") 这里应用的是 todo-mvp。




这里介绍了几个架构的关键点：

[Android Architecture – AndroidPub](https://android.jlelse.eu/android-architecture-2f12e1c7d4db "Android Architecture – AndroidPub")





### 系列文章二

最终看到此篇文章时，我都快激动的落泪了 :cry: (当前处境不好) 。

- [Android中的Model View Presenter MVP，第1部分](http://www.tinmegali.com/en/model-view-presenter-android-part-1/ "Android中的Model View Presenter MVP，第1部分")  译文有两篇：[【译】Android中的MVP设计模式（一） - 简书](http://www.jianshu.com/p/a308eacd5979)   [【译】Android中的Model View Presenter(MVP), Part 1 - 简书](http://www.jianshu.com/p/6874c306cda0)   
- [Android中的Model View Presenter，第2部分](http://www.tinmegali.com/en/model-view-presenter-mvp-in-android-part-2/ "Android中的Model View Presenter，第2部分")
- [Model View Presenter (MVP) in Android, part 3](http://www.tinmegali.com/en/model-view-presenter-mvp-in-android-part-3/ "Model View Presenter (MVP) in Android, part 3")



### 系列文章三：必看


[【译】Model-View-Presenter:Android 指南 - 马飞](http://mafei.me/2017/03/10/Model-View-Presenter:Android%E6%8C%87%E5%8D%97/ "Model-View-Presenter:Android 指南 - 马飞的博客")  这篇文章不错哦。
[「原」Model-View-Presenter: Android guidelines – Medium](https://medium.com/@cervonefrancesco/model-view-presenter-android-guidelines-94970b430ddf "Model-View-Presenter: Android guidelines – Medium")


### 系列文章四

- [【译】Android MVP 架构必要知识：第一部分](https://zhuanlan.zhihu.com/p/25272412 "推荐")   
- [【译】Android MVP 架构必要知识：第二部分](https://github.com/xitu/gold-miner/blob/master/TODO/essential-guide-for-designing-your-android-app-architecture-mvp-part-2.md)

自己已经翻译


原文：

- [Essential Guide For Designing Your Android App Architecture: MVP: Part 1](https://blog.mindorks.com/essential-guide-for-designing-your-android-app-architecture-mvp-part-1-74efaf1cda40)
- [Essential Guide For Designing Your Android App Architecture: MVP: Part 2](https://blog.mindorks.com/essential-guide-for-designing-your-android-app-architecture-mvp-part-2-b2ac6f3f9637)
- [Essential Guide For Designing Your Android App Architecture: MVP: Part 3 (Dialog, ViewPager…](https://blog.mindorks.com/essential-guide-for-designing-your-android-app-architecture-mvp-part-3-dialog-viewpager-and-7bdfab86aabb)
- [Android MVP Architecture Extension with Interactors and Repositories](https://blog.mindorks.com/android-mvp-architecture-extension-with-interactors-and-repositories-bd4b51972339) 这看起来又像一篇好文。

项目主页：[**android-mvp-architecture**: This repository contains a detailed sample app that implements MVP architecture using Dagger2, GreenDao, RxJava2, FastAndroidNetworking and PlaceholderView](https://github.com/MindorksOpenSource/android-mvp-architecture)





这个项目看起来不错：[MinimalistWeather](https://github.com/BaronZ88/MinimalistWeather "BaronZ88/MinimalistWeather: Android 平台开源天气 App，采用 MVP、RxJava、Retrofit2、OKHttp3、Dagger2、RetroLambda 等开源库来实现。") 下面是它的设计图

![](https://raw.githubusercontent.com/BaronZ88/MinimalistWeather/master/framework_minimalist_weather.png)





[GitHub上star超过2k的安卓MVP架构指南](http://www.suqishuo.cn/android-architecture-guideline-for-mvp/ "GitHub上star超过2k的安卓MVP架构指南 - Ernest的Blog") 看到下面各种 Observables 就有点激动：

- **DatabaseHelper**: 它处理插入，更新，以及获取来自本地SQLite数据库的数据。它的方法返回 Rx Observables ，发射(译者注：Rx术语)简单java对象 (models)。
- **PreferencesHelper**: 它保存以及获取来自 `SharedPreferences` 的数据，他可以返回 Observables 或者直接返回简单java对象。
- **Retrofit services** : [Retrofit](http://square.github.io/retrofit) 接口 使用Restful API 通信，每个不同的API拥有自己的 Retrofit 服务. 它们返回 Rx Observables.


- **Data Manager (Model)**: 这是MVP架构的关键部分。它持有每一个工具类的引用，使用这些工具类满足来自Presenter的请求。 它的方法广泛的使用 Rx 操作符来组合，转换或过滤来自工具类的输出，以便生成Presenter想要的输出。它返回发射数据模型（data models）的 observables。
- **Presenters**: 订阅由 `DataManager` 提供的observables，处理这些数据以便调用View中合适的方法。
- **Activities, Fragments, ViewGroups (View)**: 实现了一组Presenter可以调用的方法的标准安卓组件。它们也处理用户的交互如点击等，然后调用Presenter中合适的方法来采取相应的行动。这些控件也实现框架相关的任务，如管理安卓生命周期，渲染视图（Views）等。
- **Event Bus**: 它使得View控件得到发生在Model的特定事件通知。通常 `DataManager` 发出事件，然后这些事件可以被Activities 和 Fragments 订阅。 event bus **仅仅** 用于非常特别的动作——这些事件不是仅与一个界面相关的，要通知多方，如：用户已经退出登录。  Event Bus 存在的原因。

![](http://www.suqishuo.cn/images/mvp_architecture_diagram.png)






1. [Android官方MVP架构示例项目解析](http://www.infoq.com/cn/articles/android-official-mvp-architecture-sample-project-analysis)，官方的github项目仓库中用多个分支进行了演示。   
2. [Android开发中的MVP架构](http://www.jianshu.com/p/7567ed0d1853)  
3. [【译】Android MVP 架构必要知识：第一部分](https://zhuanlan.zhihu.com/p/25272412 "推荐")  
4. [Model-View-Presenter Architecture in Android Applications](http://macoscope.com/blog/model-view-presenter-architecture-in-android-applications/)  
5. [MODEL VIEW PRESENTER (MVP) IN ANDROID, PART 2](http://www.tinmegali.com/en/model-view-presenter-mvp-in-android-part-2/)  
6. [MVP for Android: how to organize the presentation layer](https://antonioleiva.com/mvp-android/)  
7. [Model-View-Presenter: Android guidelines](https://medium.com/@cervonefrancesco/model-view-presenter-android-guidelines-94970b430ddf)
8. [一步一步实现Android的MVP框架](https://dev.qq.com/topic/5799d7844bef22a823b3ad44)   
9. [Android MVP模式 简单易懂的介绍方式](https://segmentfault.com/a/1190000003927200)  
10. [Android框架模式（1）-MVP入门 - 远古大钟 - CSDN博客](http://blog.csdn.net/duo2005duo/article/details/50594757 "Android框架模式（1）-MVP入门 - 远古大钟 - CSDN博客")




