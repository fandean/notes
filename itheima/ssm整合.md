



## SSM整合



## 步骤





1. 创建maven web项目

2. 创建典型项目结构

3. 引入相关jar包

4. **配置Spring**，添加`applicationContext.xml`文件，只添加`@Service`注解，*不扫描 Controller*

5. 测试Spring，单独测试`@Service`即可。通过 Junit 创建测试类，然后 **在测试类中加载 `applicationContext.xml`配置文件**。 

6. **配置Spring MVC**，添加`web.xml`文件，添加 `spring-mvc.xml`文件，添加`@Controller`注解，*只扫描 Controller*。

7. 测试Spring MVC，通过浏览器访问相关路径来测试。创建相关jsp文件，配置Controller（让其独立于Service），配置并启动web服务器，浏览器访问。

   注意：这里 `spring-mvc.xml`文件的加载是在 `web.xml`中配置；关注其与 `applicationContext.xml`文件加载的不同之处。

8. 整合 Spring 和 Spring MVC

   目的：可以在 Controller 中注入 Service 

9. 配置 mybatis，使用注解进行映射，创建 sqlMapConfig.xml 映射**配置**文件

10. 测试mybatis

11. Spring整合mybatis，将`sqlMapConfig.xml`的配置内容，转移到`applicationContext.xml`文件中，并通过 `MapperScannerConfig`的一系列操作将 Mapper接口的**代理**类对象注入到Spring，所以无需在xxxDao接口上添加`@Repository`。（详见下文）







## spring和spring mvc整合



### 解决自动扫描带来的问题



**自动扫描带来的问题：** 

* spring和springmvc都要对组件进行扫描
* spring会扫描控制成的组件（`@Controller`）（com.itheima.ssm）
* springmvc也会扫描控制层的组件（`@Controller`）（com.itheima.ssm）
* 这时候可能会有冲突问题，导致注解的事务失效，有些注解不能用



1）SpringMVC IOC容器  存在Controller的实例对象

2）Spring IOC容器  存在Controller的实例和Service层以及Dao层



重叠会引发一些问题：

例如：事务失效、相关注解失效





解决方案：

1. 方案一： 

     spring去掉扫描`@Controller`类的组件
     springmvc只包含扫描`@Controller`类的组件

2. 方案二：

     只让 spring mvc 扫描，不让 Spring扫描

     在 spring mvc 的配置中添加 

     ```xml
     <import resource="applicationContext.xml"></import>
     ```




### 如何加载 applicationContex.xml文件



需要在 启动 web服务器的时候，加载Spring的配置文件。



> 与 ServletContext域对象的关系？





## Mybatis配置



通过 `sqlMapConfig.xml`文件配置Mybatis，**使用注解**的方式直接在AccountDao接口上添加查询语句（会自动生成代理类来执行操作），使用Junit来测试mybatis是否配置成功。

测试是独立与Spring的，所以无需为 AccountDao 添加 `@Repository`注解。



> sqlMapConfig.xml文件：映射**配置**文件
>
> accountDao.xml 文件： 映射文件



sqlMapConfig.xml：(xml映射文件和注解都相同)

```xml
<configuration>
    <!-- 指定数据库连接配置文件的位置 -->
    <properties resource="jdbcConfig.properties"/>

    <!-- ! 配置mybatis的环境-->
    <environments default="mysql">
        <environment id="mysql">
            <!-- 配置事务管理器 -->
            <transactionManager type="JDBC"/>
            <!-- 配置数据源 -->
            <dataSource type="POOLED">
                <!-- 这里具体的配置信息位于 jdbcConfig.properties 文件中 -->
                <property name="driver" value="${jdbc.driver}"/>
                <property name="url" value="${jdbc.url}"/>
                <property name="username" value="${jdbc.username}"/>
                <property name="password" value="${jdbc.password}"/>
            </dataSource>
        </environment>
    </environments>

    <!-- 配置映射文件的信息 -->
    <mappers>
        <!--注册指定包下的所有mapper接口 ： 同时指定xml映射和注解两种配置 -->
        <package name="com.itheima.dao"/>
    </mappers>
</configuration>
```



使用注解：

```java
public interface AccountDao {
    @Select(value = "select * from account")
    public List<Account> findAll();
}
```





使用xml映射文件：(与注解来自不同的两个项目)

```xml
<mapper namespace="com.itheima.dao.ItemsDao">
    <select id="findById" parameterType="Integer" resultType="items">
        select * from items where id = #{id}
    </select>
</mapper>
```









> 下文会对比使用 映射文件（即使用注解与xml的不同） 的不同之处。
>
> 如果使用注解，就不能使用xml映射配置文件



> [Intellij IDEA 2016学习系列之（二）mybatis-generator自动生成 - CSDN博客](https://blog.csdn.net/liudongdong0909/article/details/51534735 "Intellij IDEA 2016学习系列之(二)mybatis-generator自动生成 - CSDN博客")
>
> 使用注解之后似乎多此一举。





## 通过Spring整合Mybatis

目的：把SqlMapConfig.xml配置文件中的内容配置到applicationContext.xml配置文件中





整合时需要用到下面的jar包： 

```xml
<!-- 用于mybatis-spring 之间的整合 -->
<!-- https://mvnrepository.com/artifact/org.mybatis/mybatis-spring -->
<dependency>
    <groupId>org.mybatis</groupId>
    <artifactId>mybatis-spring</artifactId>
    <version>1.3.2</version>
</dependency>
```





applicationContext.xml文件：**当 mybatis 使用注解时**

```xml
    <!-- 整合 mybatis -->
    <!-- SqlMapConfig.xml配置文件中的内容配置到applicationContext.xml配置文件中 -->
    <!-- 指定数据库连接配置文件的位置 -->

    <!-- 配置连接池 : 如何从配置文件中读取? -->
    <bean id="dataSource" class="com.mchange.v2.c3p0.ComboPooledDataSource">
        <property name="driverClass" value="com.mysql.cj.jdbc.Driver"/>
        <property name="jdbcUrl" value="jdbc:mysql://127.0.0.1:3306/itheima_ssm"/>
        <property name="user" value="root"/>
        <property name="password" value="fan123"/>
    </bean>

    <!--sqlSession工厂 : 注意这里使用的是 spring 提供的类 -->
    <bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
        <property name="dataSource" ref="dataSource"/>
    </bean>

    <!-- 扫描dao的包 -->
    <bean id="mapperScanner" class="org.mybatis.spring.mapper.MapperScannerConfigurer">
        <property name="basePackage" value="com.itheima.dao"/>
    </bean>
```



applicationContext.xml文件：**当 mybatis 使用xml映射文件时**

```xml
    <!--dao配置开始-->
	<!-- 这是从另一个项目中摘抄出来的，总体思路相同 -->
    <!-- 数据库连接池 : 这里使用的是 druid 而非 c3p0 没啥太大影响 -->
    <bean id="dataSource" class="com.alibaba.druid.pool.DruidDataSource"
          destroy-method="close">
        <property name="url" value="jdbc:mysql://127.0.0.1:3306/maven?characterEncoding=utf8" />
        <property name="username" value="root" />
        <property name="password" value="admin" />
        <property name="driverClassName" value="com.mysql.jdbc.Driver" />
    </bean>

    <!-- SqlSessionFactoryBean 创建sqlSession对象 -->
    <bean id="sqlSessionFactoryBean" class="org.mybatis.spring.SqlSessionFactoryBean">
        <property name="dataSource" ref="dataSource" />
        <!--别名-->
        <property name="typeAliasesPackage" value="com.itheima.domain"/>
    </bean>

    <!-- 配置接口扫描包 -->
    <bean class="org.mybatis.spring.mapper.MapperScannerConfigurer">
        <!--指定接口位置，可以使用分号分隔多个路径 -->
        <property name="basePackage" value="com.itheima.dao"/>
    </bean>
    <!--dao配置结束-->
```

相比注解，就是在 SqlSessionFactoryBean 处**多了个** `别名` 的属性配置。



### MapperScannerConfigurer的作用

 **MapperScannerConfigurer** 自动扫描 类路径下的映射器并自动将它们创建成 MapperFactoryBean，然后MapperFactoryBean会创建实现了 Mapper接口的代理类并将该代理类的对象注入到Spring。

**所以无需在`xxxDao`接口上添加`@Repository`。**



Mybatis在与Spring集成的时候可以配置**MapperFactoryBean**来生成**Mapper接口**的代理，我们可以这样手动一个一个配置MapperFactoryBean：

```xml
<bean id="userMapper" class="org.mybatis.spring.mapper.MapperFactoryBean">
  <property name="mapperInterface" value="org.mybatis.spring.sample.mapper.UserMapper" />
  <property name="sqlSessionFactory" ref="sqlSessionFactory" />
</bean>
```

MapperFactoryBean 创建的代理类实现了 UserMapper 接口,并且注入到应用程序中。 因为代理创建在运行时环境中(Runtime,译者注) ,那么指定的映射器必须是一个接口,而 不是一个具体的实现类。

但是没有必要在 Spring 的 XML 配置文件中注册所有的映射器。相反,你可以使用一个 MapperScannerConfigurer , 它将会查找类路径下的映射器并自动将它们创建成 MapperFactoryBean。



> 精彩讲解见： 
>
> - [Mybatis MapperScannerConfigurer 自动扫描 将Mapper接口生成代理注入到Spring - 大新博客 - 博客园](https://www.cnblogs.com/daxin/p/3545040.html "Mybatis MapperScannerConfigurer 自动扫描 将Mapper接口生成代理注入到Spring - 大新博客 - 博客园")
> - [Spring与Mybatis整合的MapperScannerConfigurer处理过程源码分析 - format丶 - 博客园](https://www.cnblogs.com/fangjian0423/p/spring-mybatis-MapperScannerConfigurer-analysis.html "Spring与Mybatis整合的MapperScannerConfigurer处理过程源码分析 - format丶 - 博客园")

