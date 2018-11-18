---
layout: post
title: "〔译〕Android-MVP架构必要知识：第3部分"
description: "〔译〕Android-MVP架构必要知识：第3部分"
date: 2017-08-04
tags: [MVP,Android,译文]
category: Android
last_updated: 2017-08-05
comments: true
chare: true
---

* Kramdown table of contents
{:toc .toc}






## 【译】Android MVP 架构必要知识：第3部分（Dialog，ViewPager，RecyclerView和Adapters）

> **相关文章：**
>
> 译文： 
>
> - [【译】Android MVP 架构必要知识：第一部分](https://zhuanlan.zhihu.com/p/25272412 "推荐")   
> - [【译】Android MVP 架构必要知识：第二部分](https://github.com/xitu/gold-miner/blob/master/TODO/essential-guide-for-designing-your-android-app-architecture-mvp-part-2.md)
>
>
> 原文：
>
> - [Essential Guide For Designing Your Android App Architecture: MVP: Part 1](https://blog.mindorks.com/essential-guide-for-designing-your-android-app-architecture-mvp-part-1-74efaf1cda40)
> - [Essential Guide For Designing Your Android App Architecture: MVP: Part 2](https://blog.mindorks.com/essential-guide-for-designing-your-android-app-architecture-mvp-part-2-b2ac6f3f9637)
> - [Essential Guide For Designing Your Android App Architecture: MVP: Part 3 (Dialog, ViewPager…](https://blog.mindorks.com/essential-guide-for-designing-your-android-app-architecture-mvp-part-3-dialog-viewpager-and-7bdfab86aabb)
> - [Android MVP Architecture Extension with Interactors and Repositories](https://blog.mindorks.com/android-mvp-architecture-extension-with-interactors-and-repositories-bd4b51972339) 这看起来又像一篇不错的文章。
>
> 项目主页：[**android-mvp-architecture**: This repository contains a detailed sample app that implements MVP architecture using Dagger2, GreenDao, RxJava2, FastAndroidNetworking and PlaceholderView](https://github.com/MindorksOpenSource/android-mvp-architecture)


> 翻译的比较差，部分句子还没翻译出来。




让我非常高兴的是，本系列文章的第一部分和第二部分创建的基于MVP架构的项目非常受欢迎，在Github上获得了很多人的关注。

在这此期间，很多人寻求在这个架构中实现对话框和适配器的所需的基本视图。所以，我写了这篇文章来介绍它们。

如果你没有阅读过前两篇文章那么我强烈建议你去阅读。下面是它们的链接：

- [Essential Guide For Designing Your Android App Architecture: MVP: Part 1](https://blog.mindorks.com/essential-guide-for-designing-your-android-app-architecture-mvp-part-1-74efaf1cda40 "https://blog.mindorks.com/essential-guide-for-designing-your-android-app-architecture-mvp-part-1-74efaf1cda40")
- [Essential Guide For Designing Your Android App Architecture: MVP: Part 2](https://blog.mindorks.com/essential-guide-for-designing-your-android-app-architecture-mvp-part-2-b2ac6f3f9637 "https://blog.mindorks.com/essential-guide-for-designing-your-android-app-architecture-mvp-part-2-b2ac6f3f9637")
- 这是项目地址：[MindorksOpenSource/android-mvp-architectureandroid-mvp-architecture](https://github.com/MindorksOpenSource/android-mvp-architecture)


在本文中，我们将通过添加 rating dialog 和 feed Activity来扩展架构。


> Beauty lies in precision.

让我们先列出其所有特性和用例： 



<p align="center">
  <img src="https://janishar.github.io/images/mvp-app-pics/mvp-drawer.png" width="200">
  <img src="https://janishar.github.io/images/mvp-app-pics/mvp-rating.png" width="200">
  <img src="https://janishar.github.io/images/mvp-app-pics/mvp-feed.png" width="200">
  <img src="https://janishar.github.io/images/mvp-app-pics/mvp-empty-state.png" width="200">
</p>




### 评分对话框

1. 评分对话框将展示5颗星以供用户选择他的应用体验。
2. 如果 stars < 5，对话框中将会出现一个反馈表单来向用户询问改进之处。
3. 如果 stars = 5，对话框中将会显示Google Play商店的评分选项，让用户在那里添加评论。
4. 评级信息将发送到应用的后台服务器中。



注意：评分对话框在这里并不是用户需要的，但从开发者的角度来看是非常有价值的。所以，应用程序非常微妙地利用了评分这个需求。



>  I recommend using large spaced intervals between two consecutive programmatically rating dialog display.



### feed Activity

1. 此活动将显示两个标签页
2. 标签1：博客信息标签页
3. 标签2：开源信息标签页



### 博客信息标签页

1. 它将从服务器API获取博客数据。
2. 博客数据将以卡片的形式填充到RecyclerView中。



### 开源信息标签页

1. 它将从服务器API获取开源仓库数据。
2. 仓库数据将以卡片的形式填充到RecyclerView中。



现在我们已经定义了我们的功能列表和用例，接下来我们来绘制它们的实现架构。



> 我不会在这里添加整个类代码片段，因为它太长阻碍了视野。我们可以这样做，在浏览器的另一个选项卡中打开该[MVP项目](https://github.com/MindorksOpenSource/android-mvp-architecture) 然后在它们之间切换。



草图：

我们将添加下面这些基类

（见[项目](https://github.com/MindorksOpenSource/android-mvp-architecture)中的 `com.mindorks.framework.mvp.ui.base ` package）

1. **BaseDialog**：这可以处理大多数样板，并为实际的对话框添加常用功能。
2. **DialogMvpView**：该界面定义了Presenter类与对话框进行交互的API。
3. **BaseViewHolder**：它定义了RecyclerView绑定的框架，并在ViewHolder被回收时自动清除视图。

```java
public abstract class BaseDialog extends DialogFragment implements DialogMvpView
```



架构的注意事项：

> 所有相关功能都应该分组在一起使它们彼此独立，我称之为*封装功能*。



### [RateUs对话框](https://github.com/MindorksOpenSource/android-mvp-architecture/tree/master/app/src/main/java/com/mindorks/framework/mvp/ui/main/rating)：

1. 可以通过抽屉导航打开对话框。
2. 它的实现和[本系列的第2篇文章](https://blog.mindorks.com/essential-guide-for-designing-your-android-app-architecture-mvp-part-2-b2ac6f3f9637)中看到的任何MVP视图组件都类似。



**切换到浏览器的下一个标签页，并彻底研究它在[项目](https://github.com/MindorksOpenSource/android-mvp-architecture/tree/master/app/src/main/java/com/mindorks/framework/mvp/ui/main/rating)中的实现。**



对话框的注意事项：

> 有时可能会出现许多小型对话框的情况，那么我们可以为它们创建一个通用的mvpview，mvppresenter和Presenter。



### [Feed：](https://github.com/MindorksOpenSource/android-mvp-architecture/tree/master/app/src/main/java/com/mindorks/framework/mvp/ui/feed)

1. 该package包含FeedActivity和它的MVP组件，FeedPagerAdapter；还有blog 和 opensource 两个子package。
2. **blog**：这个package包含了BlogFragment和它的MVP组件，还有用于RecyclerView的BlogAdapter。
3. **opensource**：此package包含OpenSourceFragment和它的MVP组件，还有用于RecyclerView的OpenSourceAdapter。
4. FragmentStatePagerAdapter是用于BlogFragment和OpenSourceFragment。



>  不要在任何适配器中实例化任何类，否则使用`new`操作符而不是通过模块作为依赖来提供它们。
>
>  Never instantiate any class in any Adapter or else where using `new` operator instead provide them through modules as a dependency.



OpenSourceAdapter和BlogAdapter实现了`RecyclerView.Adapter<BaseViewHolder>`。在没有数据可用的情况下，将显示一个空视图，来强制用户重试，直到获取到数据才被移除。



> API数据分页和网络状态处理将作为一个练习。



**现在是研究该项目代码时候了，请专注于代码中的该部分内容的编码方式以及如何在XML中定义视图。**



如果您发现任何困难或需要任何解释或改进，请加入mindorks社区并在此提出问题：[**点击此处**](https://mindorks.com/join-community) 成为Mindorks的Android社区的一部分，并相互学习。


[在这里查看所有的Mindorks最好的文章。](https://mindorks.com/blogs)





