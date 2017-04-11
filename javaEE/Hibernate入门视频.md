# Hibernate入门视频

标签（空格分隔）： JavaEE

---

Hibernate [haibe neite]：冬眠


下载： [Hibernate ORM](http://hibernate.org/orm/downloads/),Idiomatic persistence for Java and relational databases. 【Red Hat】可能已经集成在JBoss中

入门视频：[慕课网：Hibernate](http://www.imooc.com/learn/396)
百度云上有 传智播客_Hibernate教程 可直接在线播放。
进阶： 《精通Hibernate：Java对象持久化技术详解》

**Tutorialspoint**上Hibernate教程的翻译版：[极客学院：Hibernate教程](http://wiki.jikexueyuan.com/project/hibernate/)


慕课网：[Hibernate初探之单表映射：笔记](http://www.imooc.com/u/3979387/course/396/notes)



> 对于学习一门完全陌生的技术，可以先借助网上的视频来进行入门


## Hibernate简介


。。。


主流的ORM框架技术：

- Hibernate
- MyBatis：前身就是著名的iBatis
- Toplink：后被Oracle收购，并重新包装为Oracle As TopLink
- EJB：本身是JavaEE的规范（复杂）


**Hibernate Tools for Eclipse Plugins**：Hibernate Tools是由JBoss推出的一个Eclipse综合开发工具插件，该插件可以简化ORM框架Hibernate，以及JBoss Seam，EJB3等的开发工作。
该插件已经包含在**JBoss Tools**下，在此选择下载[JBoss Tools](http://tools.jboss.org/downloads/)，选择对应的版本后，在相关页面有3种在Eclipse上的安装方式介绍，分别为“Eclipse Marketplace” “Update Site” “Artifacts”。其中“Artifacts”表示离线安装方式，由于安装包比较大，建议使用Update Site的方式选择需要的部分安装。安装时选中JBoss Data Services Development即可，它包含了 Hibernate Tools。



### 编写第一个Hibernate例子：
步骤：

1. 创建Hibernate的配置文件
2. 创建持久化类
3. 创建对象-关系映射文件
4. 通过Hibernate API编写访问数据库的代码

需要的jar包：

- 导入Hibernate必须的jar包(hibernate-core；核心包)： `hibernate-release-4.2.4.Final/lib/required`
- mysql的JDBC
- JUint4.jar（Eclipse可能自带）


**1.新建一个普通的Java项目**

**2.**为了方便每次导入我们需要的jar包，在Eclipse中新建3个用户**自定义的类库**：

1. Window 
2. Preferences
3. Java
4. Build Path
5. User Libraries 
6. 点击 New 为该Lib命名，比如 hibernate-core
7. 再选中该lib
8. 再点击“Add External JARs...”，选中所有要添加的Hibernate相关的Jar包；
9. 重复 6~8，完成另外两个jar包的导入


选中该工程右击选中"Properties" --> "Java Build Path" --> "Libraries" --> "Add Library..." --> "User Library" --> 选择之前创建的Library即可。

> 另可以通过在该项目中添加一个lib文件夹，将所需的jar包放入该目录，在将该目录中的jar包添加到构建路径中（选中文件夹下的所有jar包，右键选择添加到构建路径）。这样这些jar包应该可以随程序一起吧。




**3.创建Hibernate的配置文件:**

该配置文件可以利用之前安装的插件自动生成。如果文档生成之后，用Eclipse编辑该文档时没有出现代码提示功能，则需要还需要在Eclipse当中导入相关.dtd文档；该文档的位置：
hibernate-release-×.×.×/project/hibernate-core/src/main/resources/org/hibernate/hibernate-mapping-×.×.dtd

新建配置文件： 右击该工程选择"New"-->"Other" --> "Hibernate" --> "Hibernate Configuration File"--> "Next" --> "Next"  选择对应Hibernate版本，其他暂时不填。
```
hibernate.cfg.xml 文件
```


**4.创建持久化类**
遵循JavaBean的创建原则：

- 公有的类
- 提供公有的不带参数的默认的构造方法
- 属性私有
- 属性setter/getter封装








**5.创建关系映射文件**
右击该工程选择"New"-->"Other" --> "Hibernate" --> "Hibernate XML Mapping  File" 选择要映射的类为上一步创建的久化类。

类名 -->  表名
属性 --> 表中字段

之后还要在Hibernate配置文档中添加相应映射标签。



你需要将映射文档以`<classname>.hbm.xml`的格式保存在一个文件中








## 映射类型
映射文件中type类型为，Hibernate 映射类型**或Java类型(带包名)**。
`      <property name="类属性" column="数据表_列" type="映射类型或Java类型(带包名)"/>`

```
Java 数据类型   Hibernate 映射类型     SQL 数据库类型
------------------------------------------------------
源代码              映射文件                数据库
```


|映射类型|	Java 类型|	ANSI SQL 类型|描述|
|-----------|--------|------------|---------|
|date |	java.util.Date 或 java.sql.Date|	DATE|代表日期：yyyy-MM-dd|
|time|	java.util.Date 或 java.sql.Time	|TIME|代表时间： hh:mi:ss|
|timestamp|	java.util.Date 或 java.sql.Timestamp|	TIMESTAMP|时间撮：yyyymmddhhmiss|
|calendar	|java.util.Calendar|	TIMESTAMP|同上|
|calendar_date|	java.util.Calendar|	DATE|代表日期：yyyy-MM-dd|

>只要日期时可以在映射文件中的类型使用date而非java.util.Date即可。



## 集合的映射

|集合类型|	映射和描述|
|--------|-------------------|
|java.util.Set	|它和 `<set> `元素匹配并且用 java.util.HashSet 初化。|
|java.util.SortedSt|	它和 `<set>` 元素匹配并且用 java.util.TreeSet 初始化。sort 属性可以设置成比较器或者自然排序。|
|java.util.List|	它和 `<list>` 元素匹配并且用 java.util.ArrayList 初始。|
|java.util.Collection|	它和 `<bag>` 或者 \<ibag> 元素匹配以及用 java.util.ArrayList 初始化。|
|java.util.Map|	它和 `<map>` 元素匹配并且用 java.util.HashMap 初始化。|
|java.util.SortedMap")|	它和 `<map>` 元素匹配并且用 java.util.TreeMap 初始化。sort 属性可以设置成比较器或者 自然排序。|
| 基本类型数组 | `<primitive-array>`|
| 其它类型数组 | `<array>` |




## 实体类之间的关联映射
实体类之间的关联映射以及表之间的关系。关联映射可以是单向的也可以是双向的。
关联映射可以是单向的也可以是双向的。





|映射类型 |	描述|
|---------|------------|
|Many-to-One|	使用 Hibernate 映射多对一关系|
|One-to-One|	使用 Hibernate 映射一对一关系|
|One-to-Many|	使用 Hibernate 映射一对多关系|
|Many-to-Many|	使用 Hibernate 映射多对多关系|





## 组件映射
实体类中的某个属性属于用户自定义的类的对象。

比如：自定义的类Address
```
<component name="address" class="Address">
    <property name="postcode" column="POSTCODE"></property>
    <property name="address" column="ADDRESS"></property>
</component>
```


## 注解
Hibernate 注解是无需使用 XML 文件来定义映射的最新方法。

Hibernate 注释是一种强大的来给对象和关系映射表提供元数据的方法。所有的元数据被添加到 POJO java 文件代码中，这有利于用户在开发时更好的理解表的结构和 POJO。


Hibernate 注释的环境设置：

- JDK 5.0以上
- 安装Hibernate注解包


```java
@Entity
@Table(name = "EMPLOYEE")
public class Employee {
   @Id @GeneratedValue
   @Column(name = "id")
   private int id;

   @Column(name = "first_name")
   private String firstName;

   @Column(name = "last_name")
   private String lastName;

   @Column(name = "salary")
   private int salary;  

   public Employee() {}
   public int getId() {
      return id;
   }
   public void setId( int id ) {
      this.id = id;
   }
   public String getFirstName() {
      return firstName;
   }
   public void setFirstName( String first_name ) {
      this.firstName = first_name;
   }
   public String getLastName() {
      return lastName;
   }
   public void setLastName( String last_name ) {
      this.lastName = last_name;
   }
   public int getSalary() {
      return salary;
   }
   public void setSalary( int salary ) {
      this.salary = salary;
   }
}
```




## 查询语言

Hibernate 查询语言（HQL）是一种**面向对象**的查询语言；面向对象和它们的属性。

在 HQL 中一些关键字比如 SELECT ，FROM 和 WHERE 等，是不区分大小写的，但是一些属性比如表名和列名是区分大小写的。

几个示例：

```
//FROM、SELECT、WHERE、ORDER BY示例
String hql = "SELECT E.firstName From Employee E WHERE E.id >10 ORDER BY E.salary DESC,E.firstName DESC";
Query query = session.createQuery(hql);
List results = query.list();
```
值得注意的是 Employee.firstName 是 Employee 对象的属性，而不是一个 EMPLOYEE 表的字段。


```
//GROUP BY语句
String hql = "SELECT SUM(E.salary), E.firtName FROM Employee E " +
             "GROUP BY E.firstName";
Query query = session.createQuery(hql);
List results = query.list();
```


**使用命名参数：**
Hibernate 的 HQL 查询功能支持命名参数。这使得 HQL 查询功能既能接受来自用户的简单输入，又无需防御 SQL 注入攻击。

```
//命名参数
String hql = "FROM Employee E WHERE E.id = :employee_id";
Query query = session.createQuery(hql);
query.setParameter("employee_id",10);
List results = query.list();
```


UPDATE、DELETE、INSERT语句：
```
String hql = "UPDATE Employee set salary = :salary "  +  //两个命名参数
             "WHERE id = :employee_id";
Query query = session.createQuery(hql);
query.setParameter("salary", 1000);
query.setParameter("employee_id", 10);
int result = query.executeUpdate();
System.out.println("Rows affected: " + result);

// DELETE、INSERT略
```

**聚合方法：**
HQL 类似于 SQL，支持一系列的聚合方法,它们以同样的方式在 HQL 和 SQL 中工作。


**使用分页查询**
两个方法：

|S.N.|	方法&描述|
|-------|--------------|
|1|	Query setFirstResult(int startPosition) <br>该方法以一个整数表示结果中的第一行,从 0 行开始。|
|2|	Query setMaxResults(int maxResult) <br>这个方法告诉 Hibernate 来检索固定数量，即 maxResults 个对象。|



```
String hql = "FROM Employee";
Query query = session.createQuery(hql);
query.setFirstResult(1);
query.setMaxResults(10);
List results = query.list();
```



## 标准查询
Hibernate 提供了操纵对象和相应的 RDBMS 表中可用的数据的替代方法。一种方法是标准的 API，它允许你建立一个标准的可编程查询对象来应用**过滤规则**和**逻辑条件**。

Hibernate Session 接口提供了 createCriteria() 方法，可用于创建一个 Criteria 对象。

使用 Criteria 对象可用的 add() 方法去添加一个标准查询的限制。


。。。



##原生SQL
如果你想使用数据库特定的功能如查询提示或 Oracle 中的 CONNECT 关键字的话，你可以使用原生 SQL 数据库来表达查询。




## 一对多映射
一对多映射：

1. 在数据库中，可以通过添加主外键的关联，表现一对多的关系。
2. 在Java类中，通过在一方持有多方的集合实现，即在“一”的一端中使用<set>元素表示持有“多”的一端的对象。
