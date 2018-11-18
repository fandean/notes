# Spring data

单词释义：

- Persistence : 持久化

```
必须导入 javax.persistence 包下的注解
persistence layer意为持久层
配置主键的生成策略 （strategy：策略）
```





先来介绍几个概念：ORM、JPA、hibernate 、Spring Data JPA、Spring Data



- ORM：对象关系映射（Object Relational Mapping，简称 ORM），主要实现程序对象到关系
  数据库数据的映射。 ORM是一套规范。
- JPA：JPA 的全称是 Java Persistence API， 即 Java 持久化 API，是 SUN 公司推出的一套
  基于 ORM 的规范，内部是由一系列的**接口和抽象类**构成。JPA也是一套规范。
-  hibernate 是实现 JPA 规范的框架 ；Hibernate 是一个开放源代码的对象关系映射框架，它对 JDBC 进行了非常轻量级的对象封装，它将 POJO 与数据库表建立映射关系，是一个全自动的 orm 框架，hibernate 可以自动生成SQL 语句，自动执行，使得 Java 程序员可以随心所欲的使用对象编程思维来操纵数据库。
- Spring Data JPA  ：Spring Data JPA 继续封装 JPA





Spring Data包含多个子项目：

- Spring Data JPA：减少数据访问层的开发量
- Spring Data Mongo DB：基于分布式的数据存储的数据库
- Spring Data Redis：key-value的非关系型数据库
- Spring Data Solr：基于Lucene的全文搜索服务器



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181025174854.png)







![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181025175041.png)





![](https://raw.githubusercontent.com/fandean/images/master/PicGo/%E5%9B%BE%E7%89%8707.png)



## JPA





### persistence.xml配置文件





### 实体类和数据库表的映射配置



注意：配置主键的生成策略的选取与特定数据库有关，需要数据库的支持。比如Oracle没有主键自增策略。





### 简单的增删改查（调用EntityManager的方法）



调用 EntityManager的方法完成增删改查：



- getTransaction : 获取事务对象
- persist ： 保存操作
- merge ： 更新操作
- remove ： 删除操作
- find/getReference ： 根据**id**查询 （注意：primaryKey 需要跟实体类中主键id类型保持一致）



> 注意：使用 getReference 时需要进行事务管理 ，否则会报错。



#### **根据主键查询时，find和getReference的区别**

（通过调试查看两者的返回值Customer，会发现find返回一个 Customer类型的对象，而 getRefrence 返回的是一个动态代理对象，而且该对象的属性并没有值）。

- find ：立即加载数据 调用find方法后就执行查询数据
- getReference ：延迟加载数据 使用此数据的时候才会发起查询操作



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181025165423.png)



> 这里也能窥探到懒加载的实现方式与动态代理有关



```
// 延迟加载策略的方法：
/**
* 查询一个： 使用延迟加载策略
* 根据 id 查询客户
* 使用 getReference 方法
* 1.获取的对象是一个动态代理对象
* 2.调用 getReference 方法不会立即发送 sql 语句查询数据库
* * 当调用查询结果对象的时候，才会发送查询的 sql 语句：什么时候用，什么
发送 sql 语句查询数据库
*
* 延迟加载（懒加载）
* * 得到的是一个动态代理对象
* * 什么时候用，什么使用才会查询
* 根据 id 查询客户
* 使用 find 方法查询：
* 1.查询的对象就是当前客户对象本身
* 2.在调用 find 方法的时候，就会发送 sql 语句查询数据库
*
* 立即加载
```





### 复杂查询（使用JPQL）

Java Persistence Query Language java持久化查询语言。

向对象的查询语句（跟进实体类以及属性进行查询）



> 相比来说简单的 查询使用 EntityManager 提供的方法更方便，当然使用 JPQL也是可以的。
>
> 网上查询使用方法。



相比SQL语句，JPQL的优点：

- 方便移植，与特定数据库无关。



对比sql语法：

- sql 是 `from 表名称`
- jpql 是 `select 实体类名称2 from 实体类名称1`，如果 实体类名称1 和 实体类名称2 相同则可以省略 `select 实体类名称2`





复杂查询：

- 分页查询
- 条件查询
- 排序查询
- 统计查询





## Spring Data JPA



Spring Data JPA 让我们解脱了 DAO 层的操作，基本上所有 CRUD 都可以依赖于它来实现,在实
际的工作工程中，推荐使用 Spring Data JPA + ORM（如：hibernate）完成操作（即下面配置的 `org.hibernate.jpa.HibernatePersistenceProvider`），这样在切换不
同的 ORM 框架时提供了极大的方便，同时也使数据库层操作更加简单，方便解耦。



> 这里又涉及到 Spring Data JPA 和 Hibernate 的关系



Spring 与 Spring Data JPA 整合配置：applicationContext.xml 

在该文件中主要配置：

- dataSource : 数据源配置
- spring与spring data jpa整合配置 （同样要用到 `org.hibernate.jpa.HibernatePersistenceProvider`）

- spring 声明式事务配置

- 配置扫描dao层接口；该配置与spring与mybatis整合时的作用类似（涉及动态代理）。





### Spring Data JPA 使用方式



- 使用Spring Data JPA中接口定义的方法进行查询（**除了它之外**，下面的三种方式都需要在接口中添加自定义的抽象方法）

- 使用JPQL的方式查询
- 使用SQL语句查询
- 方法命名规则查询



#### 使用Spring Data JPA中接口定义的方法进行查询

在使用 Spring Data JPA 时，一般实现 `JpaRepository`和`JpaSpecificationExecutor`接口，这样就可以使用这些接口中定义的方法。

**这里有两个接口，这里先介绍 JpaRepository 接口。**JpaSpecificationExecutor`接口的内容单独放在一个章节。



我们发现*em就是EntityManager对象*，而他是JPA原生的实现方式，**所以我们得到结论Spring Data JPA只是对标准JPA操作进行了进一步封装，简化了Dao层代码的开发**



JpaRepository 接口（和其父接口）提供的方法：

- findOne:  立即加载数据 （在spring data jpa 2之后**已经没有** findOne() 方法，取而代之的有 findById(id).orElse() 等方法 ）

- getOne：延迟加载数据  **要有事务支持** 加上事务注解 （与getReference 类似），原因**大概**是如果该方法不受事务管理，由于懒加载的原因，当真正查询时相关资源已经关闭。

  如果没有加事务支持，会报下面的错误：`org.hibernate.LazyInitializationException: could not initialize proxy - no Session`

- save：保存和更新

- deletexxx：删除

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181026145559.png)



```
*    PagingAndSortingRepository
*        带排序条件查询所有数据
*        带分页查询所有数据
*
*    CrudRepository
*       基础CRUD操作
*
*
*    JpaSpecificationExecutor包含复杂操作
*        带条件查询单个对象
*        带条件查询集合
*        分页
*        排序
*        count
```



spring data jpa 2 之后的 findById() 方法 位于 CrudRepository 接口中：

```java
Optional<T> findById(ID id);
```

其返回值为一个 Optional ，那么我们需要了解一下如何使用 Optional：



> A container object which may or may not contain a non-null value. If a value is present, isPresent() will return true and get() will return the value.
>
> Additional methods that depend on the presence or absence of a contained value are provided, such as orElse() (return a default value if value not present) and ifPresent() (execute a block of code if the value is present).
>
> 翻译：
>
> 容器对象，可能包含也可能不包含非null值。如果存在值，`isPresent()` 将返回true，`get()` 将返回该值。提供依赖于是否存在包含值的其他方法，例如 `orElse()`（如果值不存在则返回默认值）和 `ifPresent()`（如果值存在则执行代码块）



貌似有下面这些改动：

```
findOne(…) -> findById(…)
save(Iterable) -> saveAll(Iterable)
findAll(Iterable<ID>) -> findAllById(…)
delete(ID) -> deleteById(ID)
delete(Iterable<T>) -> deleteAll(Iterable<T>)
exists() -> existsById(…)
```







#### 使用JPQL的方式查询





#### 使用SQL语句查询







#### 方法命名规则查询

```
只是针对查询
```





### JpaSpecificationExecutor接口用于动态复杂查询



JpaRepository接口中的方法虽然也可以进行排序和分页比如：

- findAll(Sort)
- findAll(Pageable)

但是**它却不能在分页的同时添加其它条件查询**。



这时我们可以使用 JpaSpecificationExecutor 接口提供的方法。





### JPA中的一对多



#### mappedBy和@JoinColumn



- 第一个概念：只有双向关联的时候会使用mappedBy
- 第二个概念：中间表的产生。使用JPA的时候，如果A B两个实体间是一对多，多对一的关系，如果不在@OneToMany里加入mappedBy属性(相当于inverse=”true”)会导致自动生成一个多余的中间表
- 双边都加@JoinColumn注解, 但是不加@mappedBy, 在级联保存时会多执行update操作，性能有损耗。



1.只有OneToOne,OneToMany,ManyToMany上才有mappedBy属性，ManyToOne不存在该属性；

2.@OneToMany(mapped=“由One的一方指向Many的一方，并且，这个属性应该等于Many的一方中含有One类的属性的对象名，**否则会出错**”)

3.关系的拥有方(即Many的一方)负责关系的维护，在拥有方建立外键。所以用到@JoinColumn

4.mappedBy跟JoinColumn/JoinTable总是处于互斥的一方



> @OneToMany用来配置一对多关联映射，但通常情况下，一对多关联映射都由多的一方来维护关联关系，例如学生和班级，应该在学生类中添加班级属性来维持学生和班级的关联关系（在数据库中是由学生表中的外键班级编号来维护学生表和班级表的多对一关系），如果要使用**双向关联**，在班级类中添加一个容器属性来存放学生，并使用@OneToMany注解进行映射，此时mappedBy属性就非常重要。如果使用XML进行配置，可以用`<set>`标签的inverse="true"设置来达到同样的效果。
> 





> [Hibernate中，mappedBy和注解@JoinColumn的对比 - q944324153的博客 - CSDN博客](https://blog.csdn.net/q944324153/article/details/77623033 "Hibernate中，mappedBy和注解@JoinColumn的对比 - q944324153的博客 - CSDN博客")
>
> [JoinColumn和mappedBy (一) - abcde - CSDN博客](https://blog.csdn.net/asdfsadfasdfsa/article/details/79609531 "JoinColumn和mappedBy (一) - abcde - CSDN博客") 有4篇文章，推荐。
>
> [Hibernate初探之一对多映射-慕课网](http://www.imooc.com/learn/334 "Hibernate初探之一对多映射-慕课网") 如果需要更深入一点了解，可以看这里的视频（还有多对多映射，在收藏中）





**@OneToMany 和 @ManyToOne 都用于建立关系映射:**

targetEntity 和 mappedBy 的区别：

- targetEntity 指定另一方类的字节码
- mappedBy 只在 @OneToMany 一端出现，用于指定从表实体类中引用主表对象的名称。

两边同时添加 targetEntity 产生的问题：





@JoinColumn 用于定义主键字段和外键字段的对应关系；可以同时在 one 端和 many 端都添加该注解，why？











### JPA中的多对多





