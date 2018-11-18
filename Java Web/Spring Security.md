

两个主流的框架  

- Spring-Security
- Shiro 



## 入门示例

创建一个maven web工程（存在一个index.html即可），pom中添加依赖

```xml
    <!--SpringSecurity-->
    <dependency>
      <groupId>org.springframework.security</groupId>
      <artifactId>spring-security-web</artifactId>
      <version>5.0.1.RELEASE</version>
    </dependency>
    <dependency>
      <groupId>org.springframework.security</groupId>
      <artifactId>spring-security-config</artifactId>
      <version>5.0.1.RELEASE</version>
    </dependency>
```



配置 web.xml

```xml
  <!--通过 context-param 把它指定为 Spring 的初始配置文件-->
  <context-param>
    <param-name>contextConfigLocation</param-name>
    <param-value>classpath:spring-security.xml</param-value>
  </context-param>
  
  <listener>
    <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
  </listener>
  
  <filter>
    <!--filterName必须为springSecurityFilterChain， 不能修改，
      把拦截到的请求交springIOC容器中真正的处理类来处理
    -->
    <filter-name>springSecurityFilterChain</filter-name>
    <filter-class>org.springframework.web.filter.DelegatingFilterProxy</filter-class>
  </filter>
  <filter-mapping>
    <filter-name>springSecurityFilterChain</filter-name>
    <url-pattern>/*</url-pattern>
  </filter-mapping>
```

配置 spring-security.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:security="http://www.springframework.org/schema/security"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
    http://www.springframework.org/schema/beans/spring-beans.xsd
    http://www.springframework.org/schema/security
    http://www.springframework.org/schema/security/spring-security.xsd">


    <!--auto-config:自动配置 （这里必须开启）
        use-expressions: 是否使用spring spel表达式
    -->
    <security:http auto-config="true" use-expressions="false">
        <!--拦截所有的url请求，都必须有ROLE_USER这个角色才可以访问-->
        <security:intercept-url pattern="/**" access="ROLE_USER" />
        <!--关闭跨域安全控制-->
        <security:csrf disabled="true"/>
    </security:http>

    <!--认证与授权相关的配置-->
    <security:authentication-manager>
        <!--提供认证信息者-->
        <security:authentication-provider>
            <security:user-service>
                <!--写死了让security创建一个用户，用户名为admin，密码为admin, 且拥有ROLE_USER的角色
                {noop} 加密的方法,他表示不加密
                -->
                <security:user name="admin" password="{noop}admin" authorities="ROLE_USER" />
                <user name="sunwukong" password="dasheng" authorities="ROLE_ADMIN" />
            </security:user-service>
        </security:authentication-provider>
    </security:authentication-manager>
</beans>
```



>  角色必须以 `ROLE_`开头



启动web服务器，后会发现自动会跳转到 security 为我们提供的 login 页面；这是因为我们使用了 `auto-config:true` ，它相当于同时配置了：

```xml
   <security:http>
      <security:form-login/>
      <security:http-basic/>
       
      <security:logout/>
   </security:http>
```

这些元素负责建立表单登录、基本的认证和**登出处理**。



这里需要讨论的是 `<security:logout/>`  



## 可能出现的问题



注：重启Tomcat有时候并不会使Session失效，在测试的时候可能会出现，明明重启了Tomcat可以访问资源时却没有跳到登录页面。所以需要重启浏览器再重试就可以了。



如果出现：`HTTP Status 404 - /favicon.ico` 错误，可尝试在 index.html 中添加下面的任意一个标签；

```xml
<link rel="shortcut icon" href="">
<link rel="shortcut icon" href="#" />
<link rel="shortcut icon" href="favicon.ico">
```

如果不行还可尝试在 `spring-security.xml`中添加

```xml
    <!-- 允许匿名访问 favicon.ico -->
    <security:intercept-url pattern="/favicon.ico" access="IS_AUTHENTICATED_ANONYMOUSLY"/>

  	<!-- 或者 -->
    <security:http pattern="/*.ico" security="none"/>

```





> [Apache Shiro - Simple Java Security](https://shiro.apache.org/)



## 日期处理



跨站请求伪造（cross-site request forgery，CSRF） 



跨域：只要协议、IP、端口三者有一个不同，就属于跨域。





## 配置 spring-security 

观察 UserController，其并未包含处理 类似`/user/login/`的控制器，

且UserService继承了 spring security 提供的接口

配置 Spring-Security.xml

相当于在配置相关 Controller 的逻辑

从而无需手动配置 Controller



拦截器



跨域请求伪造，另外还可以通过在反向代理服务器中配置。

并且在 html 中 不好配置。



## form-login

http 元素下的 form-login 元素是用来定义表单登录信息的。当我们什么属性都不指定的时候 Spring Security 会为我们生成一个默认的登录页面。如果不想使用默认的登录页面，我们可以指定自己的登录页面。



默认情况下，我们在登录成功后会返回到原本受限制的页面。但如果用户是直接请求登录页面，登录成功后应该跳转到哪里呢？默认情况下它会跳转到当前应用的根路径，即欢迎页面。



```xml
    <!-- 认证的相关配置
        login-page:用户没有登陆时跳转到登陆的页面
        login-processing-url: 处理登陆的url
        default-target-url:登陆成功后跳转的页面
        always-use-default-target: 登陆成功都跳转到成功的页面
        authentication-failure-url:登陆失败跳转的页面
    -->
    <security:form-login
            login-page="/login.jsp"
            login-processing-url="/login"
            default-target-url="/index.jsp"
            authentication-failure-url="/failer.jsp"
    />
```







## 页面授权控制



 页面权限控制，只需在`spring-secrity`中修改：

```
设置 use-expressions="true"，
access修改：access="hasAnyRole('ROLE_USER','ROLE_ADMIN')"  
```



```xml
<security:http auto-config="true" use-expressions="true">
    <!-- 配置拦截的请求地址，任何请求地址都必须有ROLE_USER的权限 -->
    <security:intercept-url pattern="/index.jsp" access="ROLE_USER" /> <!-- 可以共存 -->
    <!-- 注意下面的格式 -->
    <security:intercept-url pattern="/**" access="hasAnyRole('ROLE_USER','ROLE_ADMIN')" />
    
	//略....
</security:http>
```



然后在页面使用 security:authorize 标签

```xml
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
```



```xml
<security:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
```



**用户只是页面看不到菜单按钮，但仍然能访问原来地址**，我们需要做后台权限控制。







## 后台数据校验



使用sple表达式



- jsr250 提供的**注解**
- security 自带注解
- 还有一种注解  pre-ano...







JSRs: Java Specification Requests   ： Java规范请求   

JSR 269: Pluggable Annotation Processing API   

[The Java Community Process(SM) Program - JSRs: Java Specification Requests - detail JSR# 269](https://www.jcp.org/en/jsr/detail?id=269 "The Java Community Process(SM) Program - JSRs: Java Specification Requests - detail JSR# 269")

该JSR将为J2SE和J2EE平台中的通用语义概念开发注释，这些注释适用于各种单独的技术。





## 设置加密方式



注册  ---  登录  







**用户注册** 时进行密码加密：

```java
	/**
	 * 增加
	 * @param seller
	 * @return
	 */
	@RequestMapping("/add")
	public Result add(@RequestBody TbSeller seller){
		try {
			//对密码加密 （这里可以改为使用spring进行依赖注入）
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			String password = passwordEncoder.encode(seller.getPassword());
			seller.setPassword(password);
			sellerService.add(seller);
			return new Result(true, "增加成功");
		} catch (Exception e) {
			e.printStackTrace();
			return new Result(false, "增加失败");
		}
	}
```





**用户登录**，需要改变登录方式：

这里需要修改Springsecurity的授权认证方式（指定为userDetailServiceImpl），指定加密对象(password-encoder)，并修改自定义认证类（修改userDetailServiceImpl）。在spring-security.xml中注入加密对象(bean)。



```xml
	<!-- 认证管理器 -->
	<authentication-manager>
		<!--认证提供者-->
		<authentication-provider user-service-ref="userDetailServiceImpl">
			<password-encoder ref="passwordEncoder"></password-encoder>
		</authentication-provider>
	</authentication-manager>

	<!--指定加密方式-->
	<beans:bean id="passwordEncoder" class="org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder"></beans:bean>

```



去掉自定义认证类中的`{noop}` ，从这里可以看出，`{noop}`并没有明确的作用，只要在 认证管理器 中静态指定的密码不带 `{noop}` 前缀，那么这里也并不需要添加 `{noop}`。

```
修改前：
	User user = new User(username, "{noop}"+sysUser.getPassword(), authorities) ;

需改后：
	User user = new User(username, sysUser.getPassword(), authorities) ;
```





## 日志



目标，对所有 Controller  的方法的调用进行记录



在日志中保存用户 id ： 通过监听器 将request放入spring 的 ioc容器









动态菜单：



main.jsp 不在 pages目录下，所以没有由视图解析器管理，所以不会经过 Spring的拦截器。







## spring security之匿名访问



空指针异常出现时security的配置：

```xml
<http pattern="/cart.html" security="none"/>
<http pattern="/cart/*.do" security="none"/>
```

我们的思路是，用户不登录也能访问购物车页面，并对购物车进行操作，但是我们需要在后台获取用户名，我们使用下面的代码：

```java
//获取用户名
String userName = SecurityContextHolder.getContext().getAuthentication().getName();
```

当执行`/cart/*.do`的相关操作时，会出现空指针的异常。

原因是：`/cart/*.do`已经在配置文件中配置为被排除在security的管理之外，但是我们却又对应的后端controller中使用SecurityContextHolder，就会出现异常。

解决方法：修改配置文件

```xml
<http pattern="/cart.html" security="none"/>
<!--<http pattern="/cart/*.do" security="none"/>-->

<http use-expressions="false" entry-point-ref="casProcessingFilterEntryPoint">
    <!--IS_AUTHENTICATED_ANONYMOUSLY 匿名用户可以访问 anonymousUser-->
    <intercept-url pattern="/cart/*.do" access="IS_AUTHENTICATED_ANONYMOUSLY"/>
    <!-- 必须放在 /cart/*.do 下面，如果它在第一个位置就会先拦截所有，那么它下面的拦截器起不到作用 -->
    <intercept-url pattern="/**" access="ROLE_USER"/>
    
	略 ...
</http>
```

我们需要让security管理 `/cart/*.do` （也就是让security拦截`/cart/*.do`），但又让未登录用户能够访问；我们可以在 intercept-url 中配置 `/cart/*.do` 为匿名用户可以访问，这样如果是未登录用户进行访问，security也会先自动为其分配一个名为`anonymousUser` 用户名称。



需要注意：一定要将其放在 `<intercept-url pattern="/**" access="ROLE_USER"/>` 这条拦截器之前。









## 教程





- [初识 Spring Security-极客学院Wiki](http://wiki.jikexueyuan.com/project/spring-security/ "初识 Spring Security-极客学院Wiki")
- [社区 Spring Security 从入门到进阶系列教程 | Spring For All](http://www.spring4all.com/article/428 "社区 Spring Security 从入门到进阶系列教程 | Spring For All")
- [网上的一篇spring security详解教程，觉得不错，转过来了 - leesama的个人空间 - 开源中国](https://my.oschina.net/u/865921/blog/159849 "网上的一篇spring security详解教程，觉得不错，转过来了 - leesama的个人空间 - 开源中国")
- [Spring Security](http://www.mossle.com/docs/auth/html/index.html "Spring Security") 完整教程
- [Spring Security 参考手册|Spring Security中文版](https://springcloud.cc/spring-security-zhcn.html "Spring Security 参考手册|Spring Security中文版")

