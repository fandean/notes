---
layout: post
title: "JSP访问JavaBean-《Tomcat与Java Web开发技术详解(第2版)》"
description: "JSP访问JavaBean"
date: 2017-02-16
tags: [JSP]
category: JavaEE
last_updated: 2017-08-04
comments: true
chare: true
---

* Kramdown table of contents
{:toc .toc}





# JSP访问JavaBean



> 《Tomcat与Java Web开发技术详解(第2版)》.(孙卫琴)


把Java程序代码放到JavaBean中，然后在JSP文件中通过简洁的JSP标签来访问JavaBean，这是简化JSP代码的重要手段。



## JavaBean简介

- 有用户界面(UI)的JavaBean
- 没有用户界面的，主要负责表示业务数据或处理事务的JavaBean


一个标准的JavaBean有以下几个特性：

- JavaBean是一个公共(public)的类
- 有一个不带参数的构造方法
- 通过`set/get`方法`设置/获取`属性；且这两个方法的名称为`get属性名()`、`set属性名()`这种形式
- 如果希望JavaBean被持久化，那么可以使它实现java.io.Serializable接口

> JavaBean中除了get、set方法，也可有其他方法。


## JSP访问JavaBean的语法

在**JSP网页**中，既可通过**程序代码**来访问JavaBean，也可通过特定的**JSP标签**来访问JavaBean。
采用JSP标签，可以减少JSP网页中的程序代码，**使它更接近于HTML页面**。

下面介绍访问JavaBean的JSP标签：

- 1.导入JavaBean类：`<%@ page import>`
- 2.声明JavaBean对象：`<jsp:useBean id='局部变量名，且必须在所有范围内唯一' class='' scope='' />`，它表示声明一个局部变量，并尝试通过**设置属性的方式**将其添加到某范围内。(必须先声明才能进行后续操作)
- 3.访问JavaBean属性：`<jsp:getProperty name='' property='' />`调用该bean的get方法获取该属性(无需指定范围，因为id是唯一的)，再打印。
- 4.给JavaBean的某个属性赋值，可以使用`<jsp:setProperty name='' property='' value='' />`


> 开发人员创建的JavaBean类严格遵守JavaBean的规范，才能保证JSP中的访问JavaBean的标签能正确运行。
> 另使用EL语言能够更加简洁的完成上面的功能。


## JavaBean的范围

JavaBean的scope属性决定了JavaBean对象存在的范围。scope的可选值包括以下几种：

- page：表示页面范围，默认值
- request：表示请求范围。
- session：表示会话范围
- application：表示Web应用范围

> 隐含对象PageContext的使用

### JavaBean在页面(page)范围内
页面(page)范围对应的时间段： 从客户请求访问一个JSP文件开始，到这个JSP文件执行结束。

> 看起来就像是仅在本页面中创建的变量


页面范围内的一个请求转发**示例：**(后面几个示例仍使用此示例)

pageCounter1.jsp和pageCounter2.jsp都使用了
```
<jsp:useBean id="myPageBean" scope="page" class="mypack.CounterBean" />
```
在pageCounter1.jsp的最后使用`<jsp:forward page="pageCounter2.jsp" />`进行转发，两边的类CounterBean的对象都是独立的。




### JavaBean在请求(request)范围内

请求范围对应的时间段为：从客户请求访问一个JSP文件开始，到这个JSP文件返回响应结果结束；**如果**这个JSP文件把**请求转发**给其他Web组件，那么直到其他Web组件返回响应结果结束。
```
<jsp:useBean id="myPageBean" scope="request" class="mypack.CounterBean" />
```

requestCounter1.jsp文件中声明的CounterBean对象，它**可以被以下Web组件共享：**

- requestCounter1.jsp文件本身
- 和requestCounter1.jsp文件共享同一个客户请求（即HttpServletRequest对象）的Web组件，包括requestCounter1.jsp文件通过`<%@ include>`指令或`<jsp:include>`标记包含的其他Web组件，以及通过`<jsp:forward>`标记转发的其他目标Web组件。

请求范围内的JavaBean对象实际上是作为属性保存在HttpServletRequest对象中的，其属性名为 JavaBean的ID，属性值为JavaBean对象，因此也可通过HttpServletRequest.getAttribute()方法读取请求范围内的JavaBean对象。
```
CounterBean obj = (CounterBean) request.getAttribute("myRequestBean");
```



### JavaBean在会话(session)范围内
会话范围对应整个会话的生存周期，处于同一个会话中的Web组件共享这个会话范围内的JavaBean对象。

会话范围内的JavaBean对象实际上是作为属性保存在HttpSession对象中的，其属性名为JavaBean的ID，属性值为JavaBean对象，因此也可使用 HttpSession.getAttribute()方法读取会话范围内的JavaBean对象。

```
CounterBean obj = (CounterBean) session.getAttributer("mySessionBean");
```






### JavaBean在Web应用(application)范围内
Web应用范围内的JavaBean对象实际上是作为属性保存在ServletContext对象中，其属性名为JavaBean的ID，属性值为JavaBean对象，因此也可通过ServletContext.getAttribute()方法读取Web应用范围内的JavaBean对象。

再打开一个新的浏览器，多次访问applicationCounter.jsp，会看到count属性的值在第一个浏览器显示的数值的基础上递增。











