


# 访问数据库-《Tomcat与Java Web开发技术详解(第2版)》



> 《Tomcat与Java Web开发技术详解(第2版)》.(孙卫琴).pdf
《Tomcat and Java Web development technology》本书翻译的英文名，将本书简称为 TaJWdt

## JDBC简介

有些驱动器的Driver类在被加载的时候，能自动创建本身的实例，然后调用DriverManager.registerDriver()注册自身；所以注册步骤可以省略。
```
//加载Mysql Driver类
Class.forName(); 
//注册MySQL Driver
java.sql.DriverManager.registerDriver(new com.mysql.jdbc.Driver()); //不是必要步骤
```

JDBC URL的一般形式：
```
jdbc:drivertype:driversubtype://parameters
```



## 数据源（DataSource）简介


## 配置数据源


## 程序中访问数据源


## 处理中文编码



## 分页显示批量数据







