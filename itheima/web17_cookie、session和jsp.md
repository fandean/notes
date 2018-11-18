# 会话技术





## Session



在浏览器关闭后会话才结束。会话数据可以这样理解：其数据保存在浏览器的内存中，当浏览器关闭会话结束，内存被清除，数据也就没了。





Session的默认有效时间为30分钟，若30分钟没有活动，该Session将被销毁；该时间在tomcat的配置文件中指定：

```xml
<session-config>
	<session-timeout>30</session-timeout>
</session-config>
```





ServletContext理解（数据保存）：A访问加入购物车servlet的时候将自己购买的东西存放在该servletContext中，B也同样这样做（在不同客户端），那么他们结算时会发现自己的购物车中会多多出来很多商品。



requestContex更加不适合保存加入购物车的商品。



商品购物车：

- 当用户没有登录，则可以把数据保存在cookie中
- 当用户已经登录，那么就可以把数据保存到服务端的数据库中





## cookie



cookie只能保存字符串（从其构造方法中可以看出），并且数据保存在客户端不安全。该字符串中不能包含空格。`JSESSIONID=6FDD64CD43F3AD664935E4F84D210EDD` 这就是一个cookie对象，

一个cookie对象就只有一个name和一个value（该如何理解这句话）：我这样理解，只有一个 name和对应的 value，但是还可以有其它的cookie属性。

```java
Cookie(String name, String value) 创建cookie对象
String getName() 获取cookie的名称
String getValue() 获取cookie的值
void setPath(String uri) 设置cookie的路径——浏览器根据这个路径判断那些cookie要发送给服务器
```



Cookie 包含以下几方面的信息。

- Cookie 的名字
- Cookie 的值（真正的数据写在这里面）
- 到期时间
- 所属域名（默认是当前域名）
- 生效的路径（默认是当前网址）





> Cookie的存在形式是？
>
> 在Chrome浏览器中，通过开发者工具中的 Application > Storage > Cookies 可以看到当前页面中所有的cookie （document.cookie获取的也是所有的cookie）
>
> 但是如何在文件系统中查看浏览器保存的 Cookie：[IE/Firefox/Chrome等浏览器保存Cookie的位置 - 脚本小娃子 - 博客园](https://www.cnblogs.com/shengulong/p/5718060.html "IE/Firefox/Chrome等浏览器保存Cookie的位置 - 脚本小娃子 - 博客园") 不重要。



Cookie保存在浏览器，服务器可以通过在相应头中的 Set-Cookie 字段描述一个cookie，那么浏览器就会在客户端生成一个对应的 Cookie ，之后浏览器向该服务器发起请求时就会携带该cookie。







在浏览器关闭后会话才结束。会话数据可以这样理解：其数据保存在浏览器的内存中，当浏览器关闭会话结束，内存被清除，数据也就没了。



> 设置cookie的有效时间：
>
> - 正整数：表示cookie数据保存浏览器的缓存目录（硬盘中）：数值表示保存的时间。
> - 负整数：表示cookie数据保存浏览器的内存中。浏览器关闭cookie就丢失。
> - 零：表示删除同名的cookie数据
>
> **如果不设置过期时间**，则表示这个cookie生命周期为浏览器会话期间，只要关闭浏览器窗口，cookie就消失了。
>
> 这种生命期为浏览会话期的cookie被称为**会话cookie**。会话cookie一般不保存在硬盘上而是保存在内存里。
>
> 如果设置了过期时间，浏览器就会把cookie保存到硬盘上，关闭后再次打开浏览器，这些cookie依然有效直到超过设定的过期时间。存储在硬盘上的cookie可以在不同的浏览器进程间共享，比如两个IE窗口。而对于保存在内存的cookie，不同的浏览器有不同的处理方式。
>
> cookie.setmaxage设置为0时，会马上在浏览器上删除指定的cookie
>
> cookie.setmaxage设置为-1时，代表关闭当前浏览器即失效。







- [Cookie - JavaScript 教程 - 网道](https://wangdoc.com/javascript/bom/cookie.html "Cookie - JavaScript 教程 - 网道")







## 为什么说session技术是依赖于cookie技术？

因为session的实现需要将一个JSESSIONID保存到客户端，那么就需要使用cookie来保存。

这也是为什么，获取session的方法是：

```java
HttpSession session = request.getSession();
```



session何时**创建**？  

**request.getSession方法有两个功能：**
1. 创建session对象
  - 如果客户端没有 JSESSIONID，会创建新的session对象
  - 客户端有JSESSIONID，但是服务端已经没有对应的session对象了， 会创建新的session对象；强制关闭服务器软件时，session对象会被销毁掉。
2. 获取已有的session对象 
  - 如果客户端访问时候携带了JSESSIONID，**且** 服务端有对应的session对象存在，就会获取原有的session对象。



```java
HttpSession session = request.getSession();
//结果是 false，那么这个session的作用是？
System.out.println(Objects.isNull(session));
response.getWriter().println(Objects.isNull(session));
```



通过浏览器提供的开发者工具可以看到：建议在隐身模式测试

**首次访问：** http://localhost:8080/visit

 Response Headers内容：有 set-cookie，（此时应该是创建了一个seesion）

```
HTTP/1.1 200
Set-Cookie: JSESSIONID=6FDD64CD43F3AD664935E4F84D210EDD; Path=/; HttpOnly
Content-Length: 13
Date: Sat, 21 Jul 2018 03:28:11 GMT
```

在 Request Headers中：没有携带 cookie

```
GET /visit HTTP/1.1
Host: localhost:8080
Connection: keep-alive
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36
DNT: 1
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8
Accept-Encoding: gzip, deflate, br
Accept-Language: zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,zh-TW;q=0.6
```



**再次访问：**

在 Response Headers中

```
HTTP/1.1 200
Content-Length: 13
Date: Sat, 21 Jul 2018 03:30:18 GMT
```

在 Request Headers中：携带了 cookie

```
GET /visit HTTP/1.1
Host: localhost:8080
Connection: keep-alive
Cache-Control: max-age=0
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36
DNT: 1
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8
Accept-Encoding: gzip, deflate, br
Accept-Language: zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7,zh-TW;q=0.6
Cookie: JSESSIONID=6FDD64CD43F3AD664935E4F84D210EDD
```

























