---
layout: post
title: "Http会话与管理-《Tomcat与Java Web开发技术详解(第2版)》"
description: "Http会话与管理"
date: 2017-02-13
tags: [JavaEE]
category: JavaEE
last_updated: 2017-08-04
comments: true
chare: true
---

* Kramdown table of contents
{:toc .toc}




# Http会话与管理-《Tomcat与Java Web开发技术详解(第2版)》


> 《Tomcat与Java Web开发技术详解(第2版)》.(孙卫琴).pdf

> 作者的另一本书《Java网络编程精解》

Web服务器跟踪客户的状态通常有4种方法：

- 在HTML表单中加入隐藏字段，它包含用于跟踪客户状态的数据
- 重写URL，使它包含用于跟踪客户状态的数据
- 用Cookie来传送用于跟踪客户状态的数据
- 使用会话(Session)机制



## 会话简介
Http是无状态的协议。每次当客户端请求访问Web服务器端的一个网页时，都必须与服务器建立一个FTP连接，然后发送Http请求，等收到Http响应后，本次FTP连接就被关闭。


会话指的是在一段时间段，单个客户与Web应用的一连串相关的交互过程。在一个会话中，客户能够多次请求访问Web应用的同一个网页，也有可能请求访问同一个Web应用中的多个网页。

> 实际上，会话并不是Http协议定制的，会话机制是用于跟踪客户状态的**普遍解决方案**。


几个会话示例：（见pdf书p285）


> 会话时也用到了Cookie，用Cookie保存Session ID

## HttpSession的生命周期及会话范围

使用HttpSession对象进行会话范围内的数据共享。

会开启一个会话的情况：


销毁会话的情况：

- 浏览器进程终止。（例外：浏览器进程突然关闭，且没有告知Servlet容器）
- 服务器端执行HttpSession对象的invalidate()方法
- 会话过期

会话过期是指当会话开始后，如果在一段时间(可设置)内，客户一直没有和Web应用交互，即没有请求访问Web应用中的支持会话的任意一个网页，那么servlet容器会中销毁这个会话。



### 通过重写URL来跟踪会话



### 会话的持久化
Servlet容器在某些情况下会把HttpSession对象从内存中转移到永久性存储设备中，在需要访问HttpSession信息时再把它们加载到内存中。

在持久化会话时，Servlet容器不仅会持久化HttpSession对象，还会对它的所有可序列化的属性进行持久化，从而确保存放在会话范围内的共享数据不会丢失。
比如如果购物车类ShoppingCart类不实现java.io.Serializable接口，那么当会话被重新激活后，原先存放在会话中的购物车信息丢失了。




![](https://faner.gitlab.io/assets/images/post-images/2017-08-04-16-55-00.png)


会话的持久化没有标准的接口；对于Tomcat它采用会话管理器来管理会话：

- org.apache.catalina.session.StandardManager类：标准会话管理器.
- org.apache.catalina.session.PersistentManager类：提供了更多的管理会话的功能.


临时文件夹下的store文件夹中的SESSIONS.ser文件中保存了持久化的HttpSession对象的信息。



## 会话的监听
4个监听器接口：

- HttpSessionListener接口：监听创建会话及销毁会话的事件
- HttpSessionAttributeListener接口：监听向会话中加入属性、替换属性和删除属性的事件
- HttpSessionBindingListener接口：监听会话与一个属性绑定或解除绑定的事件
- HttpSessionListener接口：监听会话被激活和被搁置的事件


统计在线用户人数：

- 利用 HttpSessionListener 统计在线用户人数
- 利用 HttpSessionBindingListener 统计在线用户人数




## token（令牌）

[基于 Token 的身份验证](https://ninghao.net/blog/2834)    

[基于Token的WEB后台认证机制](http://www.cnblogs.com/xiekeli/p/5607107.html)


Android编程：

客户端安全访问接口的方式为记录授权token模式
传统的http安全验证模式为记录session id的方式，但是这种方式的session id过期时间较短，不适合**移动设备**保持较长时间的登陆状态，所以换成记录token的方式，一旦获取token，便可以在一个较长时间内(如：1周)拥有访问服务器接口的权限。



安全验证的技术也是很多种，大家熟悉有： BaseAuth, Oauth(淘汰), Oauth2，基于Token的认证等机制。