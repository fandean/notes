# Spring 



如果觉得现有Spring教程太老可以看一下国外的一下示例：

- [Spring Tutorial](https://www.logicbig.com/tutorials/spring-framework.html "Spring Tutorial")
- [Spring 快速上手](http://greycode.github.io/2016/01/spring-fast/ "Spring 快速上手")

[Spring 教程_w3cschool](https://www.w3cschool.cn/wkspring/ "Spring 教程_w3cschool") 



[Spring核心技术原理-（1）-通过Web开发演进过程了解一下为什么要有Spring? - 徐刘根的博客 - CSDN博客](https://blog.csdn.net/xlgen157387/article/details/78884005 "Spring核心技术原理-（1）-通过Web开发演进过程了解一下为什么要有Spring? - 徐刘根的博客 - CSDN博客")





## 介绍

Spring 增强了简单老式Java对象（Plain Old Java object，POJO）的功能，



虽然Spring用bean或者JavaBean来表示应用组件，但并不意味着Spring组件必须要遵循JavaBean规范。一个Spring组件可以是任何形式的POJO。在本书中，我采用JavaBean的广泛定义，即POJO的同义词。



为了降低Java开发的复杂性，Spring采取了以下4种关键策略：

- 基于POJO的轻量级和最小侵入性编程；
- 通过依赖注入和面向接口实现松耦合；
- 基于切面和惯例进行声明式编程；
- 通过切面和模板减少样板式代码。



Spring的非侵入编程模型：

Spring竭力避免因自身的API而弄乱你的应用代码。Spring不会强迫你实现Spring规范的接口或继承Spring规范的类，相反，在基于Spring构建的应用中，它的类通常没有任何痕迹表明你使用了Spring。最坏的场景是，一个类或许会使用Spring注解，但它依旧是POJO。

> 所以Spring不会更改你创建的类









**依赖注入：**

DI 的作用： 

通过DI，**对象** 的依赖关系将由系统中负责协调各对象的第三方组件 **在创建对象的时候** 进行设定。对象无需自行创建或管理它们的依赖关系。



注入方式：

- 构造器注入
- set 注入 



为什么使用接口？ 

如果一个对象**只通过接口**（而不是具体实现或初始化过程）**来表明依赖关系**，那么这种依赖就能够在对象本身毫不知情的情况下，用不同的具体实现进行替换。



创建应用组件之间协作的行为通常称为装配（wiring）。Spring有多种**装配bean的方式**，采用XML是很常见的一种装配方式。



装配方式：

- 使用xml**显式**配置
- 使用Java**显式**配置（JavaConfig）
- **隐式**的bean发现机制和自动装配



**注意：** 如果想要将第三方库中的组件装配到你的应用中，由于没法在其代码上添加注解，所以必须采取显示装配的方式。JavaConfig比xml更加强大。



**Spring通过应用上下文（Application Context）**装载bean的定义并把它们组装起来。Spring应用上下文全权负责对象的创建和组装。







> 耦合具有两面性（two-headed beast）。一方面，紧密耦合的代码难以测试、难以复用、难以理解，并且典型地表现出“打地鼠”式的bug特性（修复一个bug，将会出现一个或者更多新的bug）。另一方面，一定程度的耦合又是必须的——完全没有耦合的代码什么也做不了。为了完成有实际意义的功能，不同的类必须以适当的方式进行交互。







## 装配Bean

创建应用对象之间协作关系的行为通常称为装配（wiring），这也是依赖注入（DI）的本质。



bean装载到spring应用上下文中的典型生命周期：

![](assets/bean装载到spring应用上下文中的典型生命过程.png)







另可见：Spring Bean生命周期，Spring Bean后置处理器。



### 自动化装配bean

Spring从两个角度来实现自动化装配：

- 组件扫描(component scanning)：Spring会自动应用上下文中所创建的bean
- 自动装配(autowiring)：Spring自动满足bean之间的依赖。

组件扫描和自动装配组合在一起就能发挥出强大的威力，它们能够将你的显 式配置降低到最少。  



1. 创建可被发现的bean：

   - `@Component`：作为**组件**类，并为其创建bean
   - `@ComponentScan`：扫描某个包的**组件**，即扫描包下的``@Component``。将`@ComponentScan`放在 javaConfig类（配置类）上使用。

2. 实现自动装配

   使用`@Autowired`，用于方法之上；或使用`@Inject`。自动装配就是让Spring**自动满足bean依赖**的一种方法，在满足依赖 的过程中，会在Spring应用上下文中寻找**匹配某个bean需求的其他bean**  











### 通过Java代码装配bean



**创建配置类：** 

```java
@Configuration 	//表明该类是配置类
//@ComponentScan  	//移除后表明只使用显示装配，而不使用自动装配
public class CDPlayerConfig{
    
}
```



**声明bean：**

要在JavaConfig中声明bean ，我们需要编写一个方法，这个方法会创建所需类型的实例，然后给这个方法添加 注解。  

声明`CompactDisc`类型的bean：

```java
@Bean
public CompactDisc sgtPeppers(){//默认bean的id与方法名一样
    return new SgtPeppers();
}
```



**装配bean：** 

`CDPlayer`依赖`CompactDisc`（一个bean依赖另一个bean）；

```java
@Bean  //先声明一个CDPlayer类型的bean
public CDPlayer cdPlayer(){
    //创建时将CompactDisc类型的bean传入
    return new CDPlayer(sgtPeppers());
}
```

看起来，CompactDisc 是通过调用 `sgtPeppers()`得到的，但情况并非完全如此。因为  `sgtPeppers()`方法上添加了`@Bean` 注解，Spring将会拦截所有对它的调用，并确保 ***直接*** 返回该方法所创建的bean，而**不是**每次都对其进行实际的调用（**那么每次得到的就是同一个bean**）；默认情况下，Spring中的bean都是单例的，（注意之前的测试，在每个bean的构造方法中添加一条输出语句，那么在程序启动后的可以看到只要时单例的bean**都会**被创建）



更简单的装配方式（推荐）：

```java
@Bean
public CDPlayer cdplayer(CompactDisc compactDisc){//会自动传递一个CompactDisc类型的bean过来
    return new CDPlayer(compactDisc);
}
```

优势：不必要求两个bean的声明在同一个配置类中；被依赖的bean甚至可以在xml文件中，或是自动扫描和装配的bean。





### 通过xml装配bean



Idea创建Spring的xml配置文件的方法：

`New > XML Configuration File > Spring Config`





### 导入和混合配置







**代码清单3-32　使用XML配置POJO——spring-other.xml**

```xml
<beans xmlns="http://www.springframework.org/schema/beans"    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"    xsi:schemaLocation="http://www.springframework.org/schema/beans        http://www.springframework.org/schema/beans/spring-beans.xsd">   
    
    <bean id="squirrel" class="com.springboot.other.pojo.Squirrel"/>
</beans>
```

这样我们就定义了一个Bean，然后在Java配置文件中就可以直接载入它，如代码清单3-33所示。

**代码清单3-33　装配XML定义的Bean**

```java
package com.springboot.chapter3.config;
/******* imports ********/
@Configuration
@ComponentScan(basePackages = "com.springboot.chapter3.*")
@ImportResource(value = {"classpath:spring-other.xml"})
public class AppConfig {
......
}
```

这样就可以引入对应的XML，从而将XML定义的Bean也装配到IoC容器中。





## 高级装配









## 面向切面的Spring







## 原理解析相关文章

系列1：

- [Spring核心技术原理-（1）-通过Web开发演进过程了解一下为什么要有Spring? - 徐刘根的博客 - CSDN博客](https://blog.csdn.net/xlgen157387/article/details/78884005 "Spring核心技术原理-（1）-通过Web开发演进过程了解一下为什么要有Spring? - 徐刘根的博客 - CSDN博客")  单例，工厂模式来管理程序中使用的对象（Bean）
- [Spring核心技术原理-（2）-通过Web开发演进过程了解一下为什么要有Spring AOP? - 徐刘根的博客 - CSDN博客](https://blog.csdn.net/xlgen157387/article/details/78892509 "Spring核心技术原理-（2）-通过Web开发演进过程了解一下为什么要有Spring AOP? - 徐刘根的博客 - CSDN博客")， 动态代理
- [Spring核心技术原理-（3）-Spring历史版本变迁和如今的生态帝国 - 徐刘根的博客 - CSDN博客](https://blog.csdn.net/xlgen157387/article/details/78910985 "Spring核心技术原理-（3）-Spring历史版本变迁和如今的生态帝国 - 徐刘根的博客 - CSDN博客")
- [Spring核心技术原理-（4）-三条路线告诉你如何掌握Spring IoC容器的核心原理 - 徐刘根的博客 - CSDN博客](https://blog.csdn.net/xlgen157387/article/details/78970515 "Spring核心技术原理-（4）-三条路线告诉你如何掌握Spring IoC容器的核心原理 - 徐刘根的博客 - CSDN博客")







> ###  Spring工作原理
>
> 内部最核心的就是IOC了，  
>
> 动态注入，让一个对象的创建不用new了，可以自动的生产，这其实就是利用java里的反射  
>
> 反射其实就是在运行时动态的去创建、调用对象，Spring就是在运行时，跟xml Spring的配置  
>
> 文件来动态的创建对象，和调用对象里的方法的 。  
>
>   Spring还有一个核心就是AOP这个就是面向切面编程，可以为某一类对象 进行监督和控制（也就是  
>
> 在调用这类对象的具体方法的前后去调用你指定的 模块）从而达到对一个模块扩充的功能。这些都是通过  
>
> 配置类达到的。  
>
>   Spring目的：就是让对象与对象（模块与模块）之间的关系没有通过代码来关联，都是通过配置类说明 
>
> 管理的（Spring根据这些配置 内部通过反射去动态的组装对象） 
>
>   要记住：Spring是一个容器，凡是在容器里的对象才会有Spring所提供的这些服务和功能。  
>
> Spring里用的最经典的一个设计模式就是：模板方法模式。（这里我都不介绍了，是一个很常用的设计模式）  
>
>   Spring里的配置是很多的，很难都记住，但是Spring里的精华也无非就是以上的两点，把以上两点跟理解了 也就基本上掌握了Spring.
>
> Spring AOP与IOC
> 一、 IoC(Inversion of control): 控制反转  
>
> 1、IoC：  
>
> 概念：控制权由对象本身转向容器；由容器根据配置文件去创建实例并创建各个实例之间的依赖关系  
>
> 核心：bean工厂；在Spring中，bean工厂创建的各个实例称作bean  
>
> 二、AOP(Aspect-Oriented Programming): 面向方面编程  
>
> 1、 代理的两种方式：  
>
> 静态代理：  
>
> - 针对每个具体类分别编写代理类；  
>
> - 针对一个接口编写一个代理类；  
>
> 动态代理：  
>
> 针对一个方面编写一个InvocationHandler，然后借用JDK反射包中的Proxy类为各种接口动态生成相应的代理类



## Spring Task

[Spring任务调度之Spring-Task - 独具匠心 - 博客园](https://www.cnblogs.com/hongwz/p/5642497.html "Spring任务调度之Spring-Task - 独具匠心 - 博客园")











补充：

## AspectJ：面向切面的Java扩展

[AspectJ：面向切面的Java扩展 - 资源 - 伯乐在线](http://hao.jobbole.com/aspectj/ "AspectJ：面向切面的Java扩展 - 资源 - 伯乐在线")







