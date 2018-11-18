---
layout: post
title: "Spring MVC入门笔记"
description: "Spring-MVC入门笔记"
date: 2017-03-22
tags: [Spring-MVC]
category: JavaEE
last_updated: 2017-08-04
comments: true
chare: true
---

* Kramdown table of contents
{:toc .toc}




# Spring MVC入门笔记



> 学习资料：
> 前提是学习了《Tomcat与Java Web开发技术详解(第2版)》.(孙卫琴)
> 《Spring MVC学习指南》Spring MVC: A Tutorial：[该书源码下载](http://books.brainysoftware.com/9780980839654;jsessionid=D5C7DBA593B2D996521BEB4F7B632493) 第一版
> 《Spring入门经典》
> [网站：tutorialslibrary](https://www.tutorialspoint.com/tutorialslibrary.htm)

> [极客学院：Spring入门](http://www.jikexueyuan.com/course/665.html)
> 慕课网：Spring 。  慕课网的Java课程优于极客学院的免费课程。


## Spring和Spring MVC

Spring framework 

Spring MVC framework

Spring是一个开源的企业应用开发框架，作为一个轻量级的解决方案，其包含了20多个不同的模块。比如 Spring MVC模块。


## Spring简介

Spring是一个轻量级**控制反转(IoC)**和**面向切面(AOP)**的容器框架，它主要是为了解决企业应用开发的复杂性而诞生。

- 目的：解决企业应用开发的复杂性
- 功能：使用基本的JavaBean代替EJB
- 范围：任何Java应用
- 核心：控制反转和面向切面


### Spring的源码是经典学习范例

Spring的源码设计很精妙，结果清晰，处处体现大师对Java设计模式的灵活运用和对Java技术的高深造诣。
如果想短时间内提高你的Java技术，研究Spring源码会带给你意想不到的收获。


### Spring核心模块

Spring是一个分层架构，它由7个定义良好的模块组成。Spring的模块公用在核心容器Spring Core之上。每个模块和组件都可以单独存在。

![Spring入门.png](https://ooo.0o0.ooo/2017/02/25/58b0f59ba2338.png)


### 浅谈IOC

IoC（Inversion of Control，控制反转）是Spring的核心，贯穿始终。所谓IoC，对于Spring框架来说，就是由Spring来负责控制对象的生命周期和对象间的关系。

- 传统开发模式：对象之间相互依赖
- IoC开发模式：IoC容器安排对象之间的的依赖


## Spring 之 IoC

### IoC理论的背景

![IOC理论的背景.png](https://ooo.0o0.ooo/2017/02/25/58b0f713737f1.png)


- 软件系统没有引入IoC之前：，如图1所示。对象A依赖于对象B..，那么对象A在初始化或运行到某一点的时候，自己必须去主动的创建对象B，或者使用已经创建的对象B，无论是创建还是使用对象B控制权全部在自己手上。
- 软件系统没引入IoC后：如图2所示。由于IoC容器的加入，对象A和对象B之间失去了直接的联系，所以当对象A运行到需要对象B的时候，**IoC容器会主动的创建一个对象B注入到对象A所需要的地方**。

通过前后的对比，对象A获得对象B的过程由主动行为到被动行为，控制权颠倒过来了，这就叫**控制反转**


### 依赖注入（DI）

另一位大神看到了同一个问题。既然IoC是控制反转，那么到底是哪些方面的控制被反转了呢？他经过反复分析和论证，得出获得依赖对象的过程被反转了。于是它给控制反转起了一个更合适的名字：依赖注入。（给出了IoC的实现方法）

IoC的另一个名字叫依赖注入（Dependency Injection），所谓的依赖注入，就是由IoC容器在运行期间，动态的将某种依赖关系注入到对象之中。
所以，依赖注入（DI）和控制反转（IoC）是从不同的角度描述同一件事情，就是指通过引入IoC容器，利用依赖注入的方式，实现对象之间的解耦。


![依赖注入 比方.png](https://ooo.0o0.ooo/2017/02/25/58b0fba73c692.png)

IoC容器就是一个对象制造工厂，你需要什么它就制造一个给你，你直接使用即可，不需要关心它是如何制作和如何销毁的。

在传统的实现中，由程序内部的代码来控制组件之间的关系，我们经常使用new关键字来实现两个组件之间关系的组合，这种实现方式会造成组件之间的耦合。IoC很好的解决了这种问题，它将实现组件间的关系从程序内部提炼到了外部容器，也就是说由容器将组件在运行期间组件间的某种依赖关系动态的注入到组件当中。


### IoC的好处

IoC在编程过程中不会对业务对象构成很强的侵入性，使用IoC之后，对象具有更好的可实行性，可重用性和可扩展性：

- 降低组件间的耦合度（体现在可维护性，便于进行单元测试，诊断故障）
- 提高开发效率和产品质量（分工明确，生产USB设备的厂商和生产电脑主机的厂商可以是两个互不相关的两个人）
- 统一标准，提高模块的复用性（USB设备可以使用在任何遵循USB协议的设备上）
- 模块具有热插拔特性（IoC生成对象的方式转为外置方式，也就是把对象生成放置在了配置文件里进行定义；这样当我们更换一个实现子类将会变得非常简单，只需修改配置文件即可）


### IoC通俗的理解

- IoC控制反转：说的是创建对象实例的控制权从代码控制剥离到IoC容器控制，(实际就是你在XML文件中进行控制)，侧重于原理。
- DI依赖注入：说的是创建对象实例时，为这个对象注入属性值或其他对象实例，侧重于实现。



> 以上内容来源于[极客学院：Spring 之 IOC](http://www.jikexueyuan.com/course/665_2.html?ss=2)


## Spring 之 AOP

略