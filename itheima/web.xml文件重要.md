

## Servlet生命周期

创建 Servlet 实例有两个时机：

- 客户端第一次请求某个 Servlet时，Web容器创建该Servlet的实例
- Web应用启动时立即创建Servlet实例，即 `load-on-startup` Servlet



每个Servlet的运行都遵循如下生命周期：

1. 创建Servlet实例
2. Web容器调用Servlet的`init`方法，对 Servlet 进行初始化。
3. Servlet初始化后，将一直存在于容器中，用于响应客户端请求。如果客户端发送Get请求，容器将调用Servlet的doGet方法，(Post类似)；或者统一使用 service() 方法处理来响应用户请求。
4. Web容器决定销毁 Servlet 时，先调用 Servlet 的 destroy 方法，通常在关闭 Web 应用之时销毁Servlet。



### load-on-startup Servlet

应用启动时就创建 Servlet ，通常是用于某些后台访问的 Servlet，或者需要拦截很多请求的 Servlet；这种 Servlet 通常作为应用的基础 Servlet 使用，提供重要的后台访问。

配置 load-on-startup 的 Servlet 有两种方式：

- 在 web.xml 文件中通过 `<servlet.../>`元素的 `<load-on-startup ../>子元素进行配置`
- 通过 `@WebServlet `  Annotation的loadOnStartup属性指定。



数值越小越先创建



### 访问 Servlet 的配置参数

配置 Servlet 时，还可以增加额外的配置参数；为 Servlet 配置参数有两种方式：

- 通过 `WebServlet`的 initParams 属性来指定
- 通过在 web.xml 文件的 `<servlet>`元素中添加 `<init-param>`子元素来指定



访问当前 Servlet 配置参数通过 ServletConfig 对象完成（类似的 ServletContext是获取整个Web应用的配置参数）





## Filter 过滤器

Filter可以任务是 Servlet 的一种加强版，是一个典型的处理链。

使用Filter完整流程是：Filter 对用户请求进行预处理，接着将请求交给Servlet进行处理并生成响应，最后Filter再对服务器响应进行后处理。



`url-pattern` 为 `/*`表示该Filter会拦截所有用户请求。



## Listener 监听器

Servlet API提供了大量Listener 来对Web容器内的事件进行监听，从而当对应的事件发生时回调事件监听器内的方法。

使用Listener只需要两个步骤：

- 定义 Listener 实现类
- 通过注解或在 web.xml文件中配置 Listerner。





常用的Web事件监听器**接口**：

- `ServletContextListener`：用于监听Web应用的启动和关闭
- `ServletContextAttributeListener`： 用于监听 ServletContext 范围(application)内属性的改变。



`ServletContextListener`的作用有点类似于 load-on-startup Servlet，用来启动某些后台程序，这些后台程序负责为系统提供支持。

比如下面的Spring实现的监听器：



web.xml：

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd"
    version="4.0">

    <!-- 配置前端控制器 -->
    <servlet>
        <servlet-name>dispatcherServlet</servlet-name>
        <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
        <init-param>
            <param-name>contextConfigLocation</param-name>
            <param-value>classpath:springmvc.xml</param-value>
        </init-param>
        <load-on-startup>1</load-on-startup>
    </servlet>

    <servlet-mapping>
        <servlet-name>dispatcherServlet</servlet-name>
        <url-pattern>/</url-pattern>
    </servlet-mapping>

    <!-- 过滤器：使用spring mvc的过滤器，解决请求数据乱码问题（貌似不能解决响应乱码） -->
    <filter>
        <filter-name>characterEncodingFilter</filter-name>
        <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
        <init-param>
            <param-name>encoding</param-name>
            <param-value>UTF-8</param-value>
        </init-param>
    </filter>
    <filter-mapping>
        <filter-name>characterEncodingFilter</filter-name>
        <!-- TODO：/* 与 / 的区别？ -->
        <url-pattern>/*</url-pattern>
    </filter-mapping>

    <!-- 可以直接在 spring**.xml 文件中 import，而无需配置监听器 -->
    <!-- 配置Spring的监听器： 用于加载applicationContext.xml文 -->
    <!-- 该监听器默认加载 WEB-INF 下的 applicationContext.xml文件 ，如果需要自定义文件路径需要通过context-param来传递参数 -->
    <listener>
        <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
    </listener>

    <context-param>
        <!-- 传递 applicationContext.xml文件的路径 -->
        <param-name>contextConfigLocation</param-name>
        <param-value>classpath:applicationContext.xml</param-value>
    </context-param>
    
</web-app>
```





```java
/**
 * Bootstrap listener to start up and shut down Spring's root {@link WebApplicationContext}.
 * Simply delegates to {@link ContextLoader} as well as to {@link ContextCleanupListener}.
 *
 * <p>As of Spring 3.1, {@code ContextLoaderListener} supports injecting the root web
 * application context via the {@link #ContextLoaderListener(WebApplicationContext)}
 * constructor, allowing for programmatic configuration in Servlet 3.0+ environments.
 * See {@link org.springframework.web.WebApplicationInitializer} for usage examples.
 *
 * @author Juergen Hoeller
 * @author Chris Beams
 * @since 17.02.2003
 * @see #setContextInitializers
 * @see org.springframework.web.WebApplicationInitializer
 */
public class ContextLoaderListener extends ContextLoader implements ServletContextListener {
    
}

```









## web.xml文件

web.xml被称为配置描述符，



一般的web工程中都会用到web.xml，web.xml主要用来配置，可以方便的开发web工程。web.xml主要用来配置Filter、Listener、Servlet等。但是要说明的是web.xml并不是必须的，一个web工程可以没有web.xml文件。

当启动一个WEB项目时，容器包括（JBoss、Tomcat等）首先会读取项目web.xml配置文件里的配置。



web.xml加载过程如下：

1. 启动一个WEB项目的时候，WEB容器会去读取它的配置文件web.xml，读取`<listener>`和`<context-param>`两个结点。 
2. 接着，容创建一个`ServletContext`（**servlet上下文**），这个web项目的所有部分都将共享这个上下文。 
3. 容器将`<context-param>`转换为键值对，并交给servletContext。 
4. 容器创建`<listener>`中的类实例，创建监听器。



`<context-param>` 用于指定`ServletContext`的初始化参数。什么时候使用`<context-param>` ?







## JSP中内置的9个对象





### application : javax.servletContext

application : javax.servletContext实例，该实例代表JSP所属的Web应用本身，用于在servlet之间交换信息。



Web应用里面的servlet都将由Web服务器来调用，那么Servlet之间通常不会相互调用，这就产生了一个问题： JSP、Servlet之间如何交换数据？

为了解决这个问题，几乎所有web服务器都会提供4个类似Map的结构，分别是 application、session、request、page，并允许servlet向这4个类似Map的结构中存取数据。



application 对象代表 web 应用本身，因此使用 application 来操作 web 应用相关数据。application对象通常有如下两个作用：

- 在整个应用的多个 servlet 之间共享数据
- 访问web应用的配置参数



application的`getInitParameter(String paramName)`可以获取Web应用的配置参数，这些配置参数应该在web.xml文件中使用 `context-param`元素配置，每个`<context-param.../>`元素配置一个参数，该元素有如下两个子元素：

- `param-name` ：配置Web参数名
- `param-value`：配置Web参数值







- [Web.xml详解 - CSDN博客](https://blog.csdn.net/believejava/article/details/43229361 "Web.xml详解 - CSDN博客") 
- [web.xml文件详解 - OpenFire_ - 博客园](http://www.cnblogs.com/hellojava/archive/2012/12/28/2835730.html "web.xml文件详解 - OpenFire_ - 博客园")
- [web.xml文件的作用及基本配置 - 简书](https://www.jianshu.com/p/285ad45f60d1 "web.xml文件的作用及基本配置 - 简书")











## Spring









