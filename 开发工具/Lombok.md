百度云》慕课Java企业级电商项目架构演进之路 Tomcat集群与Redis分布式》第2章 Lombok框架集成及原理。

另见 简书收藏 [☆十分钟搞懂Lombok使用与原理 - 简书](https://www.jianshu.com/p/63038c7c515a "☆十分钟搞懂Lombok使用与原理 - 简书")。

官网 [Project Lombok](https://projectlombok.org/ "Project Lombok")



## Lombok 注解原理



使用反射之外的技术 JSR 269

> 反射和JSR 269的区别：反射的方法局限性较大。**首先，它必须定义@Retention为RetentionPolicy.RUNTIME，只能在运行时通过反射来获取注解值，使得运行时代码效率降低**。其次，如果想在编译阶段利用注解来进行一些检查，对用户的某些不合理代码给出错误报告，反射的使用方法就无能为力了。**而 JSR 269 之后我们可以在 Javac的编译期利用注解做这些事情**。所以我们发现**核心的区分是在 运行期 还是 编译期**。
>
>  Lombok 处理流程，**在Javac 解析成抽象语法树之后(AST), Lombok 根据自己的注解处理器，动态的修改 AST，增加新的节点(所谓代码)，最终通过分析和生成字节码**。



图示：Lombok修改代码的过程（ 其中AST表示抽象源码树）

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/Lombok%E6%B3%A8%E8%A7%A3%E5%8E%9F%E7%90%8601.png)





## 使用Lombok

### 项目中引入Lombok



通过Maven引入Lombok：

```xml
<!-- https://mvnrepository.com/artifact/org.projectlombok/lombok -->
<dependency>
    <groupId>org.projectlombok</groupId>
    <artifactId>lombok</artifactId>
    <version>1.18.2</version>
    <scope>provided</scope>
</dependency>
```

provided 表示 ...



### IDE中添加对Lombok的支持



IDEA中需要安装Lombok的插件。



Eclipse中需要在官网下载一个Lombok.jar，相对麻烦一点。



## Lombok注解



### @Data

用在类上，`@Data`注解包含了

-  `@Getter` 和
-  `@Setter`
- `@ToString`
- `@EqualsAndHashCode`





### @Getter



`@Getter(AccessLevel.PROTECTED)` 设置get方法的访问权限为protected而非public的



### @Setter



`@Setter(AccessLevel.PROTECTED)`



### @NoArgsConstructor

无参构造器



### @AllArgsConstructor

全参构造器



### @ToString



`@ToString(exclude="column")` 排除 column属性





### 。。。





## 反编译Java Decompler



[Java Decompler](http://jd.benow.ca) 提供的三个工具

- JD-GUI
- JD-Eclipse
- JD-ItellJ



这里可以通过 Java Decompler反编译查看Lombok修改后的的代码。





## Lombok使用时的注意点



- 在类需要序列化、反序列化时详细控制字段时。例如：Jackson json 序列化
- 到底是使用 `@Slf4j`还是`@Log4j`需要看项目使用的日志框架，比如项目中使用 Logback 则需选择 `@Slf4j`





> 慕课网对应视频中软件下载地址: <http://learning.happymmall.com>





