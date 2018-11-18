

[Mock测试框架(Mockito为例) - CSDN博客](https://blog.csdn.net/liminzhi87/article/details/80623329 "Mock测试框架(Mockito为例) - CSDN博客")

[Mockito：一个强大的开源Java模拟测试框架 - 资源 - 伯乐在线](http://hao.jobbole.com/mockito/ "Mockito：一个强大的开源Java模拟测试框架 - 资源 - 伯乐在线")

[Mockito教程 - 明-Ming - 博客园](http://www.cnblogs.com/Ming8006/p/6297333.html "Mockito教程 - 明-Ming - 博客园") 推荐



## 添加依赖



添加maven依赖：



方式一：直接使用 mockito-all，但版本在15年后停更了，但网上很多教程是基于此版本。

```xml
<!-- https://mvnrepository.com/artifact/org.mockito/mockito-all -->
<dependency>
    <groupId>org.mockito</groupId>
    <artifactId>mockito-all</artifactId>
    <version>1.10.19</version>
    <scope>test</scope>
</dependency>
```



方式二：使用Mockito Core，但有多个依赖，没有教程。

```xml
<!-- https://mvnrepository.com/artifact/org.mockito/mockito-core -->
<dependency>
    <groupId>org.mockito</groupId>
    <artifactId>mockito-core</artifactId>
    <version>2.21.0</version>
    <scope>test</scope>
</dependency>

<!-- https://mvnrepository.com/artifact/net.bytebuddy/byte-buddy -->
<dependency>
    <groupId>net.bytebuddy</groupId>
    <artifactId>byte-buddy</artifactId>
    <version>1.8.17</version>
</dependency>

<!-- https://mvnrepository.com/artifact/net.bytebuddy/byte-buddy-agent -->
<dependency>
    <groupId>net.bytebuddy</groupId>
    <artifactId>byte-buddy-agent</artifactId>
    <version>1.8.17</version>
    <scope>test</scope>
</dependency>

<!-- https://mvnrepository.com/artifact/org.objenesis/objenesis -->
<dependency>
    <groupId>org.objenesis</groupId>
    <artifactId>objenesis</artifactId>
    <version>2.6</version>
    <scope>test</scope>
</dependency>

```







> Spring实战4，里面的mockito =1.9.5 还依赖：
>
> ```xml
> <!-- https://mvnrepository.com/artifact/org.hamcrest/hamcrest-core -->
> <dependency>
>     <groupId>org.hamcrest</groupId>
>     <artifactId>hamcrest-core</artifactId>
>     <version>1.3</version>
>     <scope>test</scope>
> </dependency>
> ```
>
>







