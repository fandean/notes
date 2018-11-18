---
layout: post
title: "Servlet《Tomcat与Java Web开发技术详解(第2版)》"
description: "Servlet学习"
date: 2017-02-21
tags: [Servlet,JavaEE]
category: JavaEE
last_updated: 2017-08-04
comments: true
chare: true
---

* Kramdown table of contents
{:toc .toc}




# Servlet


Servlet 是 Server Applet 的缩写，也称为服务端小程序。


Java EE 以前称为 J2EE

[Servlet 教程](http://www.runoob.com/servlet/servlet-tutorial.html)     

[Java Tutorials](https://www.tutorialspoint.com/java_technology_tutorials.htm)

菜鸟教程网站的一些教程是翻译了tutorialspoint网站的相关教程。比如Servlet、JSP两篇。

JSP: 

JSP标准标记库: JSP Standard Tag Library, **JSTL**      
表达式语言：Expression Language, EL

> JavaEE学习路径：
>
> 1. ~~《从零开始学Java Web开发》入门~~；《Head First Servlet JSP》详细【可选】
> 2. 《Tomcat与Java Web开发技术详解》[必看]：Log4J、Velocity模板语言。《轻量级Java EE企业应用实战》
> 3. 《JavaEE核心框架实战》
> 4. 《深入分析Java Web技术内幕》




[Tomcat与Java Web开发技术详解（第2版）源码](http://vdisk.weibo.com/s/cGsKxlqPHcM)

## Eclipse开发Web项目

"New Project" -> "Dynamic Web Project" -> "Next" ->"Project Name"(项目名称) -> "Next" -> "Next" -> "Context Root"应该是指"Web应用的名称";Content directory:应该是指该Web应用包含的内容文件在Eclipse中对应的文件夹  -> 勾选"Generate web.xml deployment descriptor" 即为该Web应用创建web.xml配置文件 -> 

右键选择WebContent文件夹 -> 新建index.jsp 
右键选择Java Resources下的src 选择 -> 新建一个 package -> 然后新建一个class(作为servlet)


> 如果Eclipse中的Web项目是自动部署到Tomcat的，则src源文件下的class，最终会放入该web应用的WEB-INF目录下的classes目录下。（使其符合Tomcat所要求的Web应用的目录结构）


编译运行部署Web应用：选择"Run As" -> "Run on Server" -> ... -> "Next" -> Configured列表中的Web应用为要运行的应用 

### Eclipse中的Web项目自动部署到Tomcat

[Eclipse中的Web项目自动部署到Tomcat](http://blog.csdn.net/qh_java/article/details/46844567)

[Eclipse中web项目部署至Tomcat步骤](http://www.cnblogs.com/cxtczzy/archive/2013/03/30/2991096.html)






## Servlet 生命周期

[Servlet生命周期与工作原理](https://my.oschina.net/xianggao/blog/395327) ：入门



[Servlet 工作原理解析](https://www.ibm.com/developerworks/cn/java/j-lo-servlet/)  ：进阶


Servlet 与 Servlet容器（Tomcat）的关系。

Tomcat 的容器等级中，Context 容器是直接管理 Servlet 在容器中的包装类 Wrapper，所以 Context 容器如何运行将直接影响 Servlet 的工作方式。

> 提高Java和Java Web技术的参考书籍《深入分析Java Web技术内幕》


采用Http协议通信的HttpServlet类

在Servlet接口和GenericServlet类中是没有doGet,doPost等等这些方法的，HttpServlet中定义了这些方法，但是都是返回error信息，所以，我们每次定义一个Servlet的时候，都必须实现doGet()或doPost()等这些方法。

对于Servlet容器(**Tomcat**)与**HttpServlet**是怎样进行交互。


Web 应用程序开发人员通常编写 Servlet 来扩展 javax.servlet.http.HttpServlet，并实现 Servlet 接口的抽象类专门用来处理 HTTP 请求。


> 以下两节主要来自：《Tomcat与Java Web开发技术详解》



## Servlet视频学习

传智播客Java Web视频教程：“05-Servlet开发的一些重要细节.avi” 

#### Servlet的一些细节(1)

- 由于客户端是通过URL地址访问Web服务器中的资源，所以Servlet程序若想被外界访问，必须把Servlet程序映射到一个URL地址上，这个工作在`web.xml`（在servlet 3.0以上版本，只需使用注解即可）文件中使用`<servlet>`元素和`<servlet-mapping>`元素完成
- `<servlet>`元素用于注册Servlet，它包含两个主要的子元素：`<servlet-name>`和`<servlet-class>`，分别用于设置Servlet的注册名称和Servlet的完整类名。
- 一个`<servlet-mapping>`元素用于映射一个已注册的Servlet的一个对外访问路径，它包含有两个子元素：`<servlet-name>`和`<url-pattern>`，分别用于指定Servlet的注册名称和Servlet的对外访问路径。例如：


```xml
<web-app>
    <servlet>
        <servlet-name>AnyName</servlet-name>
        <servlet-class>HelloServlet</servlet-class>
    </servlet>
    
    <servlet-mapping>
        <servlet-name>AnyName</servlet-name>
        <!--对外访问路径1： /demo/hello.html，这是一种伪静态(即你在浏览器地址栏上看到的是访问一个静态html文件，实际上是一个servlet)-->
        <url-pattern>/demo/hello.html</url-pattern>
    </servlet-mapping>
    
    <servlet-mapping>
        <servlet-name>AnyName</servlet-name>
        <!--对外访问路径2： /hello -->
        <url-pattern>/hello</url-pattern>
    </servlet-mapping>
</web-app>
```


#### Servlet的一些细节(2)

- 同一个Servlet可以被映射到多个URL上，即多个`servlet-mapping>`元素的`<servlet-naem>`子元素的设置值可以是同一个Servlet的注册名。
- 在Servlet映射到的URL中也可使用 `*` 通配符，但是只能有两种固定的格式：一种格式是`*.扩展名`(比如`*.html`)，另一种格式是以正斜杠(/)开头并以`/*`结尾（比如: `/demo/*` 表示匹配该路径下的所有Servlet）。

#### Servlet的一些细节(3)

使用通配符后的优先级问题；若同时存在以下配置，分析在给出的URL地址中使用那个Servlet进行响应处理。

- Servlet1映射到 `/abc/*`
- Servlet2映射到 `/*`
- Servlet3映射到 `/abc`
- Servlet4映射到 `*.do`   通配符`*`在前面优先级最低

问题：

- 请求的URL为`/abc/a.html`，1,2都匹配，但此时1优先级要高
- 请求的URL为`/abc`，1,3都匹配，但此时3优先级要高
- 请求的URL为`/abc/a.do`，1,4都匹配，但此时1优先级要高
- 请求的URL为`/a.do`，2,4都匹配，但此时2优先级要高
- 请求的URL为`/xxx/yyy/a.do`，2,4都匹配，但此时2优先级要高




#### Servlet的一些细节(4)

- Servlet不能独立运行，它的运行完全由Servlet引擎来控制和调度
- 针对客户端的Servlet请求，通常，服务器只会创建一个Servlet实例对象，也就是说Servlet实例对象一旦创建，它就会驻留在内存中，为后续的其他请求服务，直至Web容器退出，Servlet实例才会销毁。
- 在Servlet的整个生命周期内，Servlet的init方法只被调用一次。而对于一个Servlet的每次访问请求都导致Servlet引擎调用一次Servlet的service方法。对于每次访问请求，Servlet引擎都会创建一个新的HttpServletRequest请求对象和一个HttpServletResponse响应对象，然后将这两个对象作为参数传递给service方法，service方法再根据请求方式分别调用doXXX方法。


> 70个人每人向服务器发送10次请求，会调用service()方法700次，会分别创建和销毁700次请求对象和响应对象（这些对象每次存在的时间非常短，对于大型网站每天的上亿次请求，只要不是同时并发性的亿次请求，就不会消耗尽服务器内存）



#### Servlet的一些细节(5)

- 如果在`<servlet>`元素中配置了一个`<load-on-startup>`元素，那么Web应用程序在启动时，就会装载并创建servlet的实例对象、以及调用Servlet实例对象的init()方法。
- 用途：为web应用写一个InitServlet，这个Servlet配置为启动时装载，为整个web应用创建必要的数据库表和数据。

```xml
    <servlet>
        <servlet-name>invoker</servlet-name>
        <servlet-class>org.apache.catalina.servlets.InvokerServlet</servlet-class>
        <load-on-startup>2</load-on-startup> <!--数字越小越优先启动-->
    </servlet>
```

#### Servlet的一些细节(6)

- 如果某个Servlet的映射路径仅仅为一个正斜杠(/)，那么这个Servlet就成为当前Web应用程序的缺省Servlet。
- 凡是在web.xml文件中找不到匹配的`<servlet-mapping>`元素的URL，它们的访问请求都将交个缺省Servlet处理，也就是说，缺省的Servlet用于处理所有其他Servlet都不处理的访问请求。
- 在`<tomcat的安装目录>/conf/web.xml`文件中，注册了一个名称为org.apache.catalina.servlets.DefaultServlet的Servlet，并将这个Servlet设置为了缺省Servlet。
- 当访问Tomcat服务器中的某个静态HTML文件和图片时，实际上是在访问这个缺省的Servlet。（由该缺省Servlet将静态HTML文件输出，由它返回404等错误页面...）


#### Servlet的一些细节(7)

Servlet线程安全问题：

> 线程安全问题只有在操作共享资源时才会出现。

见06、07两个视频教程：“Servlet的线程安全问题.avi”；其中再次讲解了何为线程安全问题和发生线程安全问题的情况展示。




## Servlet技术上

Servlet最常用到的对象：

- 请求对象（ServletRequest和HTTPServletRequest）
- 响应对象（ServletResponse和HTTPServletResponse）
- Servlet配置对象（ServletConfig）：当容器初始化一个Servlet对象时，会向Servlet提供一个ServletConfig对象，Servlet通过ServletConfig对象来获取初始化参数信息及ServletContext对象。
- Servlet上下文对象（ServletContext）：Servlet通过该对象来访问容器为当前Web应用提供的各种资源。


### Servlet API

Servlet API中的主要接口与类的类框架图： 

![enter image description here](https://i.imgur.com/conUBha.png)


Servlet接口中定义了5个方法，其中3个方法都**由Servlet容器来调用**，容器会在Servlet的生命周期的不同阶段调用特定的方法。

- init(ServletConfig config)方法
- service(ServletRequest req, ServletResponse res)方法：负责响应客户的请求，为客户提供相应服务。当容器接收到客户端要求访问特定Servlet对象的请求时，就会调用该Servlet对象的service()方法。
- destroy()方法：

Servlet接口还定义了两个返回Servlet的相关信息的方法：

- getServletConfig():返回一个ServletConfig对象
- getServletInfo():返回一个字符串，在该字符串中包含了Servlet的创建者、版本和版权信息。


**GenericServlet抽象类**实现了Servlet接口和ServletConfig接口；所以GenericServlet类的子类可以直接调用在ServletConfig接口中定义的getServletContext()、getInitParameter()和getInitParameterNames()等方法。


HTTPServlet抽象类：针对每一种请求方式都提供了相应的服务方法，如doGet()、doPost()等。
在HttpServlet类中的service()方法中通过调用getMethod()方法来提取传入的客户端请求中的方法类型，再判断该方法类型来调用相应的方法（比如doGet()）。见源码。


对于HttpServlet类的**具体子类**，一般会针对客户端的特定请求方式，来覆盖HttpServlet父类中的相应doXXX()方法。为了使doXXX()方法能被Servlet容器访问，应该将其访问权限设置public。


**ServletRequest接口：**

- getInputStream()：返回用于读取请求正文的输入流
- getLocalAddr()：返回服务器端的IP地址
- getLocalPort()：返回服务器的FTP端口号
- getRemoteAddr()：... 返回客户端的IP地址（该方法在服务器端执行，所以客户端就是Remote远程）
- 。。。



**HttpServletRequest接口：**


**ServletResponse接口：**

刷新缓冲区的几种方式。通过该接口的isCommitted()方法来判断缓冲区数据是否已经提交给客户。

设置相应正文的MIME类型和字符编码会有几个步骤。


**HttpServletResponse接口：**
该接口提供了与HTTP协议相关的一些方法。可以通过它来设置HTTP响应头或向客户端写Cookie


**ServletConfig接口：**

- getServletContext()

在Servlet对象中可以通过getServletConfig()方法获得ServletConfig对象。

ServletConfig对象在开发中的应用场景：
在实际开发中，有一些东西不适合在Servlet程序中写死，这类数据就可以通过配置方式配给Servlet。例如：Servlet采用哪个码表，Servlet连接哪个数据库，Servlet读取另外的哪个配置文件。（见视频教程）



#### ServletContext接口(重要)

ServletContext是Servlet与Servlet容器直接直接通信的接口。Servlet容器在启动一个Web应用时，会为它创建一个ServletContext对象。每个**Web应用**都有唯一的ServletContext对象，同一个Web应用中的所有Servlet对象都共享一个总管家，Servlet对象们可以通过这个总管家来访问容器中的各种资源。

ServletContext接口提供的方法可以分为以下几种类型：

1. 用于在Web应用范围内存取共享数据的方法（Web范围见4.4节）。
2. 访问当前Web应用的资源
3. 访问Servlet容器中的其他Web应用
4. 访问Servlet容器的相关信息
5. 访问服务器端的文件系统资源
6. 输出日志


> 有助于理解Android中的Context


#### ServletContext方法的应用

- 由于一个Web应用中的所有Servlet共享同一个ServletContext对象，所以多个Servlet通过ServletContext对象实现数据共享。ServletContext对象通常也被称之为Context域对象（还有request、session、page三个域对象，这4个域是Web开发的难点）
- 获取Web应用的初始化参数
- 实现Servlet的**转发**：把请求转发给其他的Servlet处理。【转发给JSP时，如果要附加数据，不能通过Context域，而要通过request域】(见视频10)
- 获取资源文件：1.得到文件路径 2.读取资源文件的三种方式 3..properties文件（属性文件）


> 配置文件常见的两种类型： .xml文件和.properties文件；如果数据之间是存在关系的则使用.xml文件进行配置。


> 转发与重定向的区别：
> 转发：你向我借钱我说没有，我帮你去找另一个有钱的人。（用得多）
> 重定向：是你向我借钱我说没有，然后叫你自己去找另一个有钱的人。



#### 操作资源文件

```java
//获取资源文件db.properties方式 1
InputStream in = this.getServletContext().getResourceAsStream("/db.properties");
Properties props = new Properties();  //实际为map
//再利用props.getProperty()获取配置文件中的值

//获取资源文件db.properties方式 2
//获取资源文件的绝对路径
String path = this.getServletContext().getRealPath("/WEB-INF/classes/db.properties");

FileInputStream in = new FileInputStream(path);
Properties props = new Properties();  //map
props.load(in);
//再利用props.getProperty()获取配置文件中的值

//方式1：只能获得资源的流
//方式2：可得到资源的名称（通过截取实际路径的方式得到）比如：有时读取哪个资源文件是由客户机带过来的，

//在使用MVC模式开发时一般不在Servlet中读取配置文件，在非Servlet中可以通过类加载的方式先获得配置文件路径，再通过流读取配置文件
```

> 视频 12-WEB应用中的普通Java程序如何读取资源文件.avi



### JavaWeb应用的生命周期

JavaWeb应用的生命周期是由Servlet容器来控制的。它包含3个阶段：

- 启动阶段：加载Web应用的有关数据，创建ServletContext对象，对Filter(过滤器)和一些Servlet进行初始化。
- 运行时阶段：为客户端提供服务
- 终止阶段：释放Web应用所占用的各种资源


#### 同Tomcat的管理平台管理Web应用的生命周期

Tomcat还提供了一个管理平台，通过该平台，用户可以在tomcat运行时，手工管理单个Web应用的生命周期。

**默认情况下**，当一个Web应用处于运行状态时，如果他的web.xml文件做了修改，这种修改不会立即生效，必须重新启动Web应用才能生效。

- 方式一：重新启动Tomcat
- 方式二：通过Tomcat管理平台的Reload功能

可以通过配置Tomcat的Context元素的reloadable属性，可以使得档Web应用的相关文件发生改动时tomcat就会自动重新启动Web应用。（用于开发阶段）



### Servlet的生命周期(重要)

JavaWeb应用的生命周期由Servlet容器来控制，而Servlet作为JavaWeb应用的最核心的组件，其生命周期也由Servlet容器来控制。

- 初始化阶段：加载类，创建ServletConfig对象(此外Servlet容器还会使得ServletConfig对象与当前Web应用的ServletContext对象关联)，创建Servlet对象，调用其init(ServletConfig config)方法（init()方法只被调用一次）。（几种进入初始化阶段的情况）
- 运行阶段：在service()方法给出响应后，会销毁ServletRequest对象和ServletResponse对象。.... (每接收到一个Servlet请求时，容器会产生一个新的线程并调用服务；Servlet 容器处理由多个线程产生的多个请求，每个线程执行一个单一的 Servlet 实例的 service() 方法。)
- 销毁阶段：Web应用被终止时，容器先调用destroy()方法，再销毁这些Servlet对象。


> 各阶段的详细情况见书籍。



### ServletContext与Web应用范围

Web应用范围具有两层含义：

- 表示由Web应用的生命周期构成的时间段
- 表示在Web应用的生命周期内所有Web组件的集合


存放在Web应用范围内的共享数据具有以下特点：

- 共享数据的生命周期位于Web应用的生命周期中的一个时间片段内
- 共享数据可以被Web应用中的所有Web组件共享


### 使用ServletContextListener监听器


### Servlet的服务方法抛出异常

Servlet的service()方法抛出的异常由Servlet容器捕获，Servlet容器在捕获到异常后，会向客户端发送相应的错误信息。


### 防止页面被客户端缓存

浏览器的缓存技术适用于保存服务器端的静态网页，以及不包含敏感数据的网页。

```java
//通过设置响应头来禁止客户端缓存网页
response.addHeader("Pragma","no-cache"); //适用于采用http 1.0的浏览器
response.setHeader("Cache-Control","no-cache"); //适用于 http 1.1
response.setHeader("Expires","0"); //设置网页的过期时间；适用于http 1.0 和 1.1
```



## Servlet技术下

### 下载文件

把响应正文的MIME类型设置为`application/force-download`，当浏览器收到这种MIME类型的响应正文时，会以下载的方式来处理响应正文。


### 上传文件

设置请求正文采用"multipart/form-data"数据类型，在页面中使用表单并指定文件于

当请求正文为"multipart/form-data"数据类型时，Servlet直接从HttpServletRequest对象中解析出复合表单的每个子部分仍然是一项非常复杂的工作。可以利用Apache开源软件组织提供的两个软件包来实现文件上传。

- [fileupload](https://commons.apache.org/proper/commons-fileupload/) 软件包：负责文件上传的软件包
- [io](http://commons.apache.org/proper/commons-io/) 软件包：负责输入输出的软件包

Servlet主要利用fileupload软件包中的接口和类来实现文件上传，而fileupload软件包本身依赖io软件包。



### ImageServlet类

Servlet不仅能动态生成HTML文档，还能动态生成图像。

### Cookie

服务器可以根据Cookie来跟踪客户状态，这对于需要区别客户的场合特别有用。

当客户端首次请求访问服务器时，服务器先在客户端存放包含该客户的相关信息的Cookie，以后客户端每次请求访问服务器时，都会在HTTP请求数据中包含Cookie，服务器解析HTTP请求中的Cookie，就可获得关于客户的相关信息。

通过Cookie类的setMaxAge(int expiry)方法来设置Cookie的有效期。


### 工作目录

每个Web应用都有一个工作目录，Servlet容器会把这个Web相关的临时文件保存在工作目录下。

```
    /work/[enginename]/[hostname]/[contextpath]
```

该工作目录不仅可以被Servlet容器访问，还可被Web应用的Servlet访问。

Servlet获取工作目录：
```java
File workDir = (File)context.getAttribute("javax.servlet.context.tempdir");
```

### 转发和包含

经管一个Servlet对象无法直接调用另一个Servlet对象的service()方法，但Servlet规范为Web组件之间的协作提供了两种途径。

- 请求转发(forward)：Servlet（源组件）先对客户请求做一些预处理操作，然后把请求转发给其他Web组件（目标组件）来完成包括生成响应结果在内的后续操作。
- 包含(include)：Servlet（源组件）把其他Web组件（目标组件）生成的响应结果包含到自身的响应结果中。

> 转发与包含都共享同一个ServletRequest对象和ServletResponse对象

RequestDispatcher接口：表示请求分发器，它包含了forward()方法和include()方法。

Servlet可通过ServletContext和ServletRequest的getReqestDispatcher(String path)方法获得ReqestDispatcher对象。


#### 请求范围（重要）

请求范围是指服务器端响应一次客户请求的过程，从Servlet容器接收到一个客户请求开始，到返回响应结果结束。请求访问与ServletRequest对象和ServletResponse对象的生命周期对应。

ServletRequest接口中也提供了get/setAttribute()方法，因此请求范围内的共享数据可作为ServletRequest对象的属性存在。

在转发和包含中，源组件和目标组件能共享请求范围内的共享数据。





### 重定向

重定向的运作流程：

- 访问某Web组件
- 返回302响应结果，并包含另一个Web组件的URL
- 接收结果，自动访问另一个组件
- 接收另一个组件的结果

HTTPServletResponse接口的sendRedirect(String location)方法用于重定向。


### 访问容器内的其他Web应用

不建议

### 避免并发问题

合理决定在Servlet中定义的变量的作用域类型





> 更多Servlet技术见 传智播客方老师的JavaWeb视频教程
> 比如中文编码问题...










