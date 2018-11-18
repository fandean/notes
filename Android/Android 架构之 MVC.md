---
layout: post
title: "Android 架构之 MVC"
description: "Android MVC架构"
date: 2017-08-01
tags: [Android,MVC]
category: Android
last_updated: 2017-08-02
comments: true
chare: true
---

* Kramdown table of contents
{:toc .toc}


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





## MVC架构

**模型**  - 数据层，负责管理业务逻辑和处理网络或数据库API。该模型表示一组描述业务逻辑的类，即业务模型以及数据访问操作，即数据模型。它还定义数据的业务规则意味着数据如何被更改和操纵。

**视图**  - UI层 - 来自Model的数据的可视化。仅负责显示从控制器接收到的数据。

**控制器**  - 逻辑层，被通知用户的行为，并根据需要更新模型。控制器负责处理传入的请求。它通过View接收用户的输入，然后在Model的帮助下处理用户的数据，并将结果传回给View。通常，它作为View和Model之间的协调器。

这意味着Controller和View都依赖于Model：Controller来更新数据，View可以获取数据。

> 早期，询问“如何在Android中应用MVC”等问题，最受欢迎的答案就是说，在Android中，Activity是View和Controller。在这一点上，主要的重点是使模型可测试。通常View和Controller的实现选择依赖平台。


## MVC应该如何应用于Android

现在，把**Activities**, **Fragments** 和 **Views** 作为视图， 控制器应该是不扩展或使用任何Android类的单独类，对于模型也是一样。


[Android体系结构模式第1部分：模型 - 视图 - 控制器](https://medium.com/upday-devs/android-architecture-patterns-part-1-model-view-controller-3baecef5f2b6 "Android体系结构模式第1部分：模型 - 视图 - 控制器")


将Controller连接到View时会出现一个问题，因为Controller需要告诉View更新。在被动型MVC架构中，Controller需要持有对View的引用。最简单的方法是在集中测试的同时，拥有一个BaseView接口，即Activity / Fragment / View将会扩展。所以，Controller会引用BaseView。


### 优点

模型 - 视图 - 控制器模式高度支持关注点的分离。这个优点不仅增加了代码的可测试性，而且还使得扩展更加容易，从而允许相当容易地实现新功能。

Model类没有任何对Android类的引用，因此直接进行单元测试。控制器不扩展或实现任何Android类，并且应该引用View的接口类。这样，控制器的单元测试也是可能的。

如果View遵循单一责任原则，那么他们的角色只是为每个用户事件更新控制器，并只显示模型中的数据，而不会实现任何业务逻辑。在这种情况下，UI测试应该足以覆盖View的功能。

### 缺点

#### View 取决于控制器和模型

视图对模型的依赖随着视图的复杂开始成为了缺点。为了最小化View中的逻辑，模型应该能够为要显示的每个元素提供可测试的方法。在一个有效的模型实现中，由于需要每种数据类型的观察者，因此这会以指数方式增加类和方法的数量。

鉴于View取决于Controller和Model，UI逻辑的变化可能需要在几个类中进行更新，从而降低了模式的灵活性。


#### 谁处理UI逻辑

According to the MVC pattern, the Controller updates the Model and the View gets the data to be displayed from the Model. 

但谁决定如何显示数据？ Is it the Model or the View? 

值得一看。


如果模型的作用是提供“原始”数据，则意味着视图中的代码将是：

```
String firstName = userModel.getFirstName();
String lastName = userModel.getLastName();
nameTextView.setText(lastName + ", " + firstName)
```
所以这意味着**View将负责处理UI逻辑**。但是这使得UI逻辑不可能进行单元测试。


另一种方法是使模型仅显示需要显示的数据，从视图中隐藏任何业务逻辑。
但是，我们最终得到了**处理业务**和**UI逻辑**的**模型**。它将是单位可测试的，但是模型最终会隐含地依赖于View。
```
String name = userModel.getDisplayName();
nameTextView.setText(name);
```



另一位大侠介绍的MVC：

![](https://cdn-images-1.medium.com/max/800/1*U6JRenliQAVEsdD7YZuv1g.png)



视图：  视图表示UI组件。因此，**仅负责显示**从控制器接收到的数据。这也将模型转换为UI。

控制器：控制器负责**处理传入的请求**。它通过View接收用户的输入，然后在Model的帮助下处理用户的数据，并将结果传回给View。通常，它作为View和Model之间的协调器。

**注意：**观察上图 用户与控制器的关系。

















