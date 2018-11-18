---
layout: post
title: "「转」(译)Android MVP架构必要知识：第1部分"
description: "「转」(译)Android MVP架构必要知识：第1部分"
date: 2017-08-04
tags: [MVP,Android,译文]
category: Android
last_updated: 2017-08-05
comments: true
chare: true
---

* Kramdown table of contents
{:toc .toc}




本文转载自 [掘金翻译计划](http://link.zhihu.com/?target=https%3A//github.com/xitu/gold-miner) 中的 [(译) Android MVP 架构必要知识：第一部分 - 知乎专栏](https://zhuanlan.zhihu.com/p/25272412)


> 译文：  
> - [【译】Android MVP 架构必要知识：第一部分](https://zhuanlan.zhihu.com/p/25272412 "推荐")   
> - [【译】Android MVP 架构必要知识：第二部分](https://github.com/xitu/gold-miner/blob/master/TODO/essential-guide-for-designing-your-android-app-architecture-mvp-part-2.md)
>
> 原文：  
>
> - [Essential Guide For Designing Your Android App Architecture: MVP: Part 1](https://blog.mindorks.com/essential-guide-for-designing-your-android-app-architecture-mvp-part-1-74efaf1cda40)
> - [Essential Guide For Designing Your Android App Architecture: MVP: Part 2](https://blog.mindorks.com/essential-guide-for-designing-your-android-app-architecture-mvp-part-2-b2ac6f3f9637)
> - [Essential Guide For Designing Your Android App Architecture: MVP: Part 3 (Dialog, ViewPager…](https://blog.mindorks.com/essential-guide-for-designing-your-android-app-architecture-mvp-part-3-dialog-viewpager-and-7bdfab86aabb)
> - [Android MVP Architecture Extension with Interactors and Repositories](https://blog.mindorks.com/android-mvp-architecture-extension-with-interactors-and-repositories-bd4b51972339) 这看起来又像一篇好文。
>
> 项目主页：[**android-mvp-architecture**: This repository contains a detailed sample app that implements MVP architecture using Dagger2, GreenDao, RxJava2, FastAndroidNetworking and PlaceholderView](https://github.com/MindorksOpenSource/android-mvp-architecture)



**MVP 是什么，我们又为什么要学习它**

让我们开始这一部分。我们中的大多数都是从 Activity 来创建一个 Android 工程的，在这个过程中我们会思考如何去获取数据。Activity 的代码量随着时间不断的增长，直至成为一个没法重用的组件的集合。然后我们开始将这些组件打包，Activity 便可以通过这些组件暴露的接口使用它们。我们甚至对此感到引以为傲并开始将这些代码尽可能的细分。然后我们就会发现自己陷没在组件的海洋里，它们互相依赖，难以使用。之后我们又要考虑可测试性，发现原来的代码写测试还安全点。我们感到这些错综复杂的代码已经紧紧的和 Android API 结合在了一起，这阻碍了我们去进行 JVM 测试和设计简单的测试用例。这就是传统的 MVC 模式中将 Activity 或 Fragment 当做 Controller 来用时的情况。

所以，我们定了一些规定，如果你认真遵守就可以解决上面提到的大多数问题。这些原则，我们叫它 MVP(Model-View-Presenter) 设计模式。



**MVP 设计模式是什么**

MVP 设计模式是为了解耦代码以实现重用性和可测试性。它依据职责划分应用的组件，我们称之为关注点分离。



**MVP 将一个应用分成了三个基础部分。**

1. **Model**：负责处理应用的数据部分。
2. **View**：负责将带有数据的视图显示在屏幕上。
3. **Presenter**：连接 Model 和 View 的桥梁，它也负责操控 View。




**MVP的基础规程：**

1. View 的唯一职责就是根据 Presenter 的指示绘制 UI。它在这个程序里应该是“哑”的。

2. View 将所有的用户交互委派给它的 Presenter。

3. View 永远不与 Model 直接交互。

4. Presenter 负责接受 View 对 Model 的请求，并且在特定的情况下控制 View。

5. Model 负责从服务器、数据库和文件系统获取数据。




**MVP应用原则：**

1. Activity，Fragment 和 自定义视图是应用的 View 部分。
2. 每一个 View 都有一个单独的 Presenter。
3. View 通过一个接口与 Presenter 通信，反之亦然。
4. Model 被分为几类：ApiHelper, PreferenceHelper, DatabaseHelper 和 FileHelper。这些都是用来帮助实现用来连接各种 model 的 DataManager 的。
5. Presenter 通过接口和 DataManager 交互。
6. DataManager 只在被调用的时候提供服务。
7. Presenter 不访问任何 Android API。

MVP 在单 Activity 的例子中看起来很简单。但是当我们尝试将一个应用的所有组件联系起来时就有些困难了。

**简单的架构蓝图：**

![](https://pic1.zhimg.com/v2-da300ec7d04e1398558f3d1451d019c8_r.png)

![](https://faner.gitlab.io/assets/images/post-images/2017-08-05-Android-mvp-01.png)




**让我们理解这个架构草图的每一部分：**

- **View**：绘制 UI 并接受用户的操作。Activity，Fragment和自定义视图属于这一部分。
- **MvpView**：一种接口，被 View 实现。它包括暴露给 Presenter 的方法。


- **Presenter**：它是决定 View 行为的纯 Java 类（不访问任何 Android API）。它接受从 View 传来的用户操作，并根据业务逻辑进行响应，最终指挥 View 进行特定的行为。它也从 DataManager 获取必要的数据。
- **MvpPresenter**：被 Presenter 实现的接口。它包括提供给 View 的方法。


- **AppDbHelper**：数据库管理类，负责所有和数据库有关的操作。
- **DbHelper**：被 AppDbHelper 实现的接口，包括提供给应用的方法。这一层对 DbHelper 的任何特定实现进行了解耦，这使得 AppDbHelper 成为了一个即插即用的单元。


- **AppPreferenceHelper**：类似于 AppDbHelper，只不过提供的是对于 SharedPreferences 的读写操作。
- **PreferenceHelper**：类似于 DbHelper 的接口，被 AppPreferenceHelper 实现。


- **AppApiHelper**：管理网络 API 请求及其数据处理。
- **ApiHelper**：类似于 DbHelper 的接口，被 AppApiHelper 实现。


- **DataManager**：被 AppDataManager 实现的接口。包括所有数据处理操作。理想情况下，它负责委派所有 Helper 的服务。所以 DataManager 继承 DbHelper，PreferenceHelper 和 ApiHelper。
- **AppDataManager**：它是应用中所有数据操作的结合点。DbHelper，PreferenceHelper 和 ApiHelper 只为 DataManager 提供服务。它负责委派任务给指定的 Helper。




**现在我们对于各种组件和它们的职责都熟悉了，我们马上将制定组件间的交互规则：**

- Application 类实例化 AppDbHelper（通过 DbHelper 引用），AppPreferenceHelper（通过 PreferenceHelper 引用），AppApiHelper（通过 ApiHelper 引用）以及最终的 AppDataManager（通过 DataManager 引用）。
- View 组件实例化它的 Presenter 并通过 MvpPresenter 引用。
- Presenter 通过参数接受 View 组件，并用 MvpView 引用，Presenter 也接受 DataManager。
- DataManager 是单例。

**这些是在应用中实现 MVP 的基础引导。**

就像一个外科医生在实际动手之前是没法完全掌握手术流程的。我们也不能完全理解这些想法和方案直到我们真正去实现它。

在下一部分，我们将探索一个真实的应用例子，希望能够很好地理解和掌握这些概念。
