# Spring MVC



 [Spring Annotations - DZone - Refcardz ](https://dzone.com/refcardz/spring-annotations "Spring Annotations - DZone - Refcardz") 



MVC： 处理请求先到达控制器（Controller），控制器的作用是进行请求分发，这样它会根据请求的内容去访问模型层（Model）；在现今互联网系统中，数据主要从数据库和NoSQL中来，而且对于数据库而言往往还存在事务的机制，为了适应这样的变化，设计者会把模型层再细分为两层，即服务层（Service）和数据访问层（DAO）；当控制器获取到由模型层返回的数据后，就将数据渲染到视图中，这样就能够展现给用户了。





Spring将请求在调 度Servlet、处理器映射（handler mapping）、控制器以及视图解析器（view resolver）之间移动 。



Spring MVC 本质是 Servlet



## 跟踪Spring MVC的请求













子容器可以访问父容器的对象，父容器不可以访问子容器的对象：



- Spring 容器 由监听器产生 ContextLoaderListener （父）
  - Spring MVC 容器由 Servlet （DispacherServlet）产生  （子）









## 异常



错误1： No bean named 'cacheManager' available

```
org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named 'cacheManager' available
```



[No bean named 'cacheManager' is defined - 简书](https://www.jianshu.com/p/5a964f49ec26 "No bean named 'cacheManager' is defined - 简书")

修改的部分：

```xml
<beans xmlns="http://www.springframework.org/schema/beans"
       
       xmlns:mvc="http://www.springframework.org/schema/mvc"
       
       xsi:schemaLocation="http://www.springframework.org/schema/beans
                           
       http://www.springframework.org/schema/mvc
       http://www.springframework.org/schema/mvc/spring-mvc.xsd">
```







## Spring MVC 和 web.xml文件





### web.xml文件

一般的web工程中都会用到web.xml，web.xml主要用来配置，可以方便的开发web工程。web.xml主要用来配置Filter、Listener、Servlet等。但是要说明的是web.xml并不是必须的，一个web工程可以没有web.xml文件。

当启动一个WEB项目时，容器包括（JBoss、Tomcat等）首先会读取项目web.xml配置文件里的配置。



web.xml加载过程如下：

1. 启动一个WEB项目的时候，WEB容器会去读取它的配置文件web.xml，读取`<listener>`和`<context-param>`两个结点。 
2. 接着，容创建一个`ServletContext`（**servlet上下文**），这个web项目的所有部分都将共享这个上下文。 
3. 容器将`<context-param>`转换为键值对，并交给servletContext。 
4. 容器创建`<listener>`中的类实例，创建监听器。



`<context-param>` 用于指定`ServletContext`的初始化参数。什么时候使用`<context-param>` ?





- [Web.xml详解 - CSDN博客](https://blog.csdn.net/believejava/article/details/43229361 "Web.xml详解 - CSDN博客") 
- [web.xml文件详解 - OpenFire_ - 博客园](http://www.cnblogs.com/hellojava/archive/2012/12/28/2835730.html "web.xml文件详解 - OpenFire_ - 博客园")
- [web.xml文件的作用及基本配置 - 简书](https://www.jianshu.com/p/285ad45f60d1 "web.xml文件的作用及基本配置 - 简书")



