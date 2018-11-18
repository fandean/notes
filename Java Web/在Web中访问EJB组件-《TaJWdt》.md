# 在Web中访问EJB组件-《Tomcat与Java Web开发技术详解(第2版)》



> 《Tomcat与Java Web开发技术详解(第2版)》.(孙卫琴)




## JavaEE体系结构简介
JavaEE：Java Platform,Enterprise Edition技术**提供了**以组件为基础来设计、开发、组装和发布企业应用的**方法**，它能够有效降低开发软件的成本，并且提高开发速度。JavaEE平台提供了多层次的分布式的应用模型，其应用逻辑根据不同的功能由不同的组件来实现。一个JavaEE应用由多种组件组合而成，并且这些组件安装在不同的机器上。



JavaEE 是一种多层次的分布式的软件体系结构，其业务逻辑由EJB组件来实现。

> JavaEE最初叫J2EE，后来SUN公司将它更名为JavaEE





一个多层次的JavaEE应用结构，包含如下4个层次：

- 客户层:运行在客户机器上。客户层可以是**普通的应用程序**，直接访问业务层的EJB组件；也可是**浏览器程序**，访问Web层的JSP和Servlet组件。
- Web层：运行在JavaEE服务器上。**Web层的组件主要包含JSP和Servlet**，用于生成HTML页面。Web层的组件会访问业务层的EJB组件。
- 业务层: 运行在JavaEE服务器上。主要组件为EJB，负责实现业务逻辑
- Enterprise Information System(EIS)层：运行在数据库服务器上，用于存储业务数据




> [JavaEE体系结构](http://blog.csdn.net/l2show/article/details/7358282) JavaEE只是一组以服务器为中心的企业级应用的一个规范，用于规范化和标准化以Java为开发语言的企业级软件的开发，部署，管理等。

>JavaEE的规范结构： ![](http://hi.csdn.net/attachment/201203/15/0_1331810827AhcE.gif)

> With the Java Platform, Enterprise Edition (Java EE), development of Java enterprise applications has never been easier or faster. The aim of the Java EE platform is to provide developers with a powerful set of APIs while shortening development time, reducing application complexity, and improving application performance.

> The Java EE platform is developed through the Java Community Process (JCP), which is responsible for all Java technologies. Expert groups, composed of interested parties, have created Java Specification Requests (JSRs) to define the various Java EE technologies. The work of the Java Community under the JCP program helps to ensure Java technology’s standard of stability and cross-platform compatibility.



JavaEE服务器也称为应用服务器。
Enterprise Java Bean（简称EJB）


EJB组件分为两种类型：

- 会话Bean：实现会话中的业务逻辑
> - 有状态会话Bean：该Bean实例始终与一个特定的客户关联，它的实例变量可以代表特定客户的状态。
> - 无状态会话Bean：

- 实体Bean：实现一个业务实体


