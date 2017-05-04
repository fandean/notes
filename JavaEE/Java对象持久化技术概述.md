# Java对象持久化技术概述

标签（空格分隔）： JavaEE

---

第二章：Java对象持久化技术概述

对象持久化的几种模式：

- 在业务逻辑层直接通过JDBC API来持久化实体域对象，业务逻辑和数据访问耦合
- 主动域对象模式
- ORM模式
- JDO模式
- CMP模式


## 直接通过JDBC API来持久化实体域对象
java.sql包提供了JDBC API。

示例：
一般可自行提供如下一系列的负责持久化Customer对象的一系列方法：

- saveCustomer()
- updateCustomer()
- deleteCustomer()
- loadCustomer():根据特定的OID，把一个Customer对象从数据库加载到内存中
- findCustomerByName()：根据特定的客户姓名，把符合查询条件的Customer域对象从数据库加载到内存中


使用JDBC API的缺点之一：

- 在程序代码中嵌入面向关系的SQL语句，使开发人员不能完全运用面向对象的思维来编写程序。例如：当开发人员把一个Customer对象及关联的两个Order对象保存到数据库中时，必须了解存放Customer和Order对象的表分别为Customer表和Orders表，此外还要了解表的具体结构及参照。



## ORM简介
对象-关系映射（ORM，即Object-Relation Mapping）模式指在单个组件中负责所有实体域对象的持久化，封装数据访问细节。

ORM提供了实现持久化层的另一种模式，它采用映射元数据（Mapping Meta Data）来描述对象-关系的映射细节，使得ORM中间件能在任何一个Java应用的业务逻辑层和数据库层之间充当桥梁。

![ORM充当业务逻辑层和数据库层之间的桥梁.png](https://ooo.0o0.ooo/2017/02/26/58b2f3c894014.png)


对象-关系的基本映射：

| 面向对象概念 | 面向关系概念 |
|-------------- |---------------- |
|类 | 表|
|对象|表的行（即记录）|
|属性|表的列（即字段）|


但是域模型与关系数据模型之间还存在许多不匹配之处。比如有时需要将多个类都映射到同一个表中。
此外，域模型中类之间的多对多关联关系和继承关系都不能直接在关系数据模型中找到对应的等价物。
在关系数据模型中，表之间只存在外键参照关系，有点类似域模型中多对一或一对一的映射关系。



**ORM中间件的基本使用方法**

如果希望把ORM软件集成到自己的Java应用中，用户首先要提供对象-关系映射文件（元数据）。不同的ORM软件的元数据的语法不一样。


在JavaEE 5.0中也引入了ORM框架，它以**JPA**（Java Persistence API，Java持久化接口）作为ORM框架的标准API。


> JavaEE 5.0版废除了J2EE 1.4中的重量级的实体EJB，允许应用通过JPA直接对轻量级的基于JavaBean形式的实体域对象进行持久化。

> 把基于JavaBean形式的实体域对象称为POJO。POJO（Plain Old Java Object）的意思是又普通又古老的Java对象，之所以称它古老，是因为**相对于基于CMP的实体EJB**显得很古老。
随着各种ORM映射工具的成熟，POJO又重现光彩，它和基于CMP的实体EJB相比，既简单，又有很高的可移植性；因此联合使用ORM映射工具和POJO，已经成为非常受欢迎的并且可用于取代CMP的持久化方案。
>
所以在使用Hibernate时的持久化类为JavaBean形式。



## 实体域对象的其他持久化模式

- 主动域对象：它是实体域对象的一种形式，在它的实现中封装了关系数据模型和数据访问细节。
- JDO模式（Java Data Object）：它支持把对象持久化到任意一种存储系统中。
- CMP模式(Container-managed Persistence(持久化))：由EJB容器管理实体EJB的持久化。



## Hibernate API简介
见书



