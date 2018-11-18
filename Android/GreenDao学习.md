## GreenDao

## 相关概念介绍

ORM （Object Relation Mapping - 对象关系映射）

**PO**(persistant object) 持久对象：可以看成是与数据库中的表相映射的 java 对象。最简单的 PO 就是对应数据库中某个表中的一条记录，多个记录可以用 PO 的集合。 PO 中应该不包含任何对数据库的操作。

**VO**(View Object) 值对象：视图对象，用于展示层，它的作用是把某个指定页面（或组件）的所有数据封装起来。

**DAO**(Data Access Object) 数据访问对象是一个面向对象的数据库接口。是一个 sun 的一个标准 j2ee 设计模式， 这个模式中有个接口就是 DAO ，它负持久层的操作。为业务层提供接口。此对象用于访问数据库。通常和 PO结合使用， **DAO 中包含了各种数据库的操作方法**。通过它的方法 , 结合 PO 对数据库进行相关的操作。夹在业务逻辑与数据库资源中间。配合 VO(View Object，值对象), **提供数据库的 CRUD 操作**。



**greenDAO** is a **light & fast** ORM for Android that maps objects to SQLite databases. Being highly optimized for Android, greenDAO offers great performance and consumes minimal memory. 还可加密数据库。




GreenDao 2.\* 视频教程：

[Android框架-GreenDao-慕课网](http://www.imooc.com/learn/760 "Android框架-GreenDao-慕课网") 差

[老罗Android开发视频第二季【育知同创】_腾讯课堂](https://ke.qq.com/course/170202 "老罗Android开发视频第二季【育知同创】_腾讯课堂") ，好。可以在这里看两个视频先了解相关概念，再学习 3.\*版本。


GreenDao 3.\* 教程：添加了相关注解操作更加方便

[GreenDao数据库集成 - 简书](http://www.jianshu.com/p/1ceea4b3f94f)

[Android 你必须了解的ORM框架GreenDao - 简书](http://www.jianshu.com/p/85f5831cfab6)

[史上最高效的 ORM 方案——GreenDao3.0 详解 - Android - 掘金](https://juejin.im/entry/583bd4800ce463006ba5b8fe) 好文



GreenDao 2 ，使用传统的greenDAO生成器(generator)创建实体和DAO文件

GreenDao 3，使用新的 Gradle plugin，我们可以方便的使用注解来完成相关操作。但是某些高级功能，比如 *multiple schemas* 还是需要使用生成器generator来生成。



## GreenDao核心的几个类

![](http://greenrobot.org/wordpress/wp-content/uploads/Core-Classes-150.png)



- DaoMaster:
  - 是GreenDao的入口也是greenDao顶级对象,对于一个指定的表单持有数据库对象（SQLite数据库）并且能够管理DAO类- 能够创建表和删除表
  - 其内部类OpenHelper 与DevOpenHelper是创建SQlite数据库的SQLiteOpenHelper的具体实现
- DaoSession:
  - 对于一个指定的表单可以管理所有的Dao 对象。
  - 也能够对实体类执行 insert ,load，update,refresh.delete操作。
  - DaoSession也能跟踪 identity scope：即session查询后的实体会存在缓存中，并给该实体生成一个flag来追踪该实体，下次再次查询时会直接从缓存中取出来而不是从数据库中取出来
- **DAOS**
  - 能够持久访问和查询实体类
  - 比起DaoSession有更多的持久化方法 count, loadAll,insertInt等等；
- **Entities** - 持久的实体对象；一般情况下与javaBean对象的属性一一对应。



## 分析官方示例

先查看下面的官方页面：

1. [Introduction](http://greenrobot.org/greendao/documentation/introduction/ "Introduction - Open Source by greenrobot")
2. [How to get started](http://greenrobot.org/greendao/documentation/how-to-get-started/ "How to get started - Open Source by greenrobot")
3. [greenDAO Documentation](http://greenrobot.org/greendao/documentation/ "greenDAO Documentation - Open Source by greenrobot") 该文档已经说明的很详细了

官方给出的工程： [DaoExample](https://github.com/greenrobot/greenDAO/tree/master/examples/DaoExample)





Add `mavenCentral()` to your `build.gradle` project repositories.

For example in your root `build.gradle`:

```java
allprojects {
    repositories {
        jcenter()
        mavenCentral()
    }
}
```

通过[greenDAO](http://greenrobot.org/greendao/ "greenDAO: Android ORM for your SQLite database - Open Source by greenrobot")官网学习，看 How to get started with greenDAO, Documentation 这个章节下的介绍。它会利用DaoGenerator为我们生成部分类，官方给出的[examples](https://github.com/greenrobot/greenDAO/tree/master/examples/DaoExample/src/main/java/org/greenrobot/greendao/example)中部分java文件是由DaoGenerator自动生成。



项目中的 build.gradle文件：

```java
repositories {
        jcenter()
        mavenCentral()  //添加maven
    }


    dependencies {
        classpath 'com.android.tools.build:gradle:2.3.3'
        classpath 'org.greenrobot:greendao-gradle-plugin:3.2.2' // add plugin (用于GreenDao)

    }
    
```



模块中的 build.gradle文件

```java
apply plugin: 'org.greenrobot.greendao' // apply plugin

  
  
greendao {
    schemaVersion 1         //数据库版本号
    daoPackage 'com.greendao.dao'   //可选，greendao自动生成的类的包名
    targetGenDir 'src/main/java'    //可选，greendao自动生成的目标文件夹
}
```



创建 entity，只需创建字段并添加注解即可

```java
@Entity
public class User {
    @Id
    private Long id;

    @NotNull
    private String name;
}
```

创建其它 entity ...

然后通过 Build -> Make Project ，即可 为上面的实体生成构造函数getter和setter方法 和  生成相关类文件（DaoMaster，DaoSession，xxDao这三种类）如果在之前没有配置这三种类的保存路径，默认就会保存在 `项目根目录/app/build/generated/source/greendao/包路径`。











