---
typora-root-url: ..\..\..\..\Pictures\Git-Pictures\typora
---

# Maven



在看完《Maven实战》第3章后再看下面两篇文章。
[Apache Maven 入门篇(上)](http://www.oracle.com/technetwork/cn/community/java/apache-maven-getting-started-1-406235-zhs.html)
[**Apache Maven 入门篇(下)**](http://www.oracle.com/technetwork/cn/community/java/apache-maven-getting-started-2-405568-zhs.html "推荐")

[极客学院： Maven 教程](http://wiki.jikexueyuan.com/project/maven/)

 [Apache Maven Tutorials](https://www.logicbig.com/tutorials/apache-maven.html "Apache Maven Tutorials")





## Maven的介绍和安装配置

Maven是一个跨平台的项目管理工具；Maven主要服务于基于Java平台的项目构建、依赖管理和项目信息管理。（Apache组织的开源项目）

Maven是基于项目对象模型（POM project object model）,可以通过一小段描述信息来管理项目的构建、报告和文档的软件项目管理工具

构建(Build)：编译、运行单元测试、生成文档、打包和部署等工作。

Make和Ant是过程式的，开发者需要显示指定每一个目标，以及完成该目标所需要执行的任务。
Maven是声明式的，项目构建过程和各个阶段所需的工作都由插件实现，并且大部分插件都是现成的，开发者只需要声明项目的基本元素，Maven就执行内置的、完整的构建过程。





**Maven的几个核心概念：**

- POM (Project Object Model)
- Maven 插件
- Maven 生命周期
- Maven 依赖管理
- Maven 库





### Maven安装



**Ubuntu 16安装Maven：**

 ````
sudo apt install maven
 ````


查看Maven信息，运行:

 ```
mvn -v 
 ```



Windows安装Maven：

- 下载：官网：[Maven – Welcome to Apache Maven](https://maven.apache.org/ "Maven – Welcome to Apache Maven") 下载二进制压缩包
- 安装：[Maven – Installing Apache Maven](https://maven.apache.org/install.html "Maven – Installing Apache Maven")



> 配置Maven环境变量：
>
> ```
> MAVEN_HOME : D:\server\maven\apache-maven-3.5.0
> PATH : %MAVEN_HOME%\bin;
> MAVEN_OPTS : -Xms128m -Xmx512m -Duser.language=zh -Dfile.encoding=UTF-8
> ```
>
> 使用 `mvn -v `会看到如下内容：
>
> ```
> Default locale: zh_CN, platform encoding: GBK
> ```
>
> `-Dfile.encoding=UTF-8`应该可以设置编码。

> - Setting配置文件：[Maven – Settings Reference](https://maven.apache.org/settings.html "Maven – Settings Reference")
> - 镜像仓库：[Maven – Guide to Mirror Settings](https://maven.apache.org/guides/mini/guide-mirror-settings.html "Maven – Guide to Mirror Settings")





### 本地仓库配置

从中央仓库下载的jar包，都会统一存放到本地仓库中。 

在全局配置文件中添加如下示例内容：

```xml
  <!-- localRepository
   | The path to the local repository maven will use to store artifacts.
   |
   | Default: ${user.home}/.m2/repository
  -->
  <localRepository>D:\Portable Software\Maven\repository</localRepository>
```






### 设置HTTP代理
先检测代理服务器地址(218...)和相关端口(3128)是否畅通： `telnet 218... 3128` 。如果连接正确，输入`ctrl + ]` 然后 q ，回车退出。

复制`Maven home: /usr/share/maven` `/conf/settings.xml`文件到`~/.m2/settings.xml`
编辑`<proxies>`下的`<proxy>`标签即可；默认第一个被激活的proxy会生效。其中active的值为true表示激活该代理，用户和密码等可以注释掉；其中nonProxyHost元素用来指定哪些主机名不需要代理，使用 `|`分隔多个主机名并支持通配符。





### Maven镜像网站



Maven镜像(更改`vim ~/.m2/settings.xml`文件)：

> maven默认的远程库(<http://repo1.maven.org/maven2>) 

- Maven阿里云中央仓库(国内快)： 
```xml
  <mirrors>
    <mirror>
      <id>alimaven</id>
      <name>aliyun maven</name>
      <url>http://maven.aliyun.com/nexus/content/groups/public/</url>
      <mirrorOf>central</mirrorOf>        
    </mirror>
  </mirrors>
```
- Maven国外镜像
```xml
<mirror>    
      <id>ibiblio</id>    
      <mirrorOf>central</mirrorOf>    
      <name>Human Readable Name for this Mirror.</name>    
     <url>http://mirrors.ibiblio.org/pub/mirrors/maven2/</url>    
</mirror>  
<mirror> 
      <id>repo2</id>    
      <mirrorOf>central</mirrorOf>    
      <name>Human Readable Name for this Mirror.</name>    
      <url>http://repo2.maven.org/maven2/</url>    
</mirror>    
<mirror>    
      <id>ui</id>    
      <mirrorOf>central</mirrorOf>    
      <name>Human Readable Name for this Mirror.</name>    
     <url>http://uk.maven.org/maven2/</url>    
</mirror>    
<mirror>    
      <id>jboss-public-repository-group</id>    
      <mirrorOf>central</mirrorOf>    
      <name>JBoss Public Repository Group</name>    
     <url>http://repository.jboss.org/nexus/content/groups/public</url>    
</mirror>  
```




### Maven项目结构


_**Maven 使用惯例优于配置的原则**_ 。它要求在没有定制之前，所有的项目都有如下的结构：

|目录 | 目的|
|------|-------|
|`${basedir}` | 存放 pom.xml和所有的子目录 |
|`${basedir}/src/main/java` |项目的 java源代码|
|`${basedir}/src/main/resources` |项目的资源，比如说 property文件|
|`${basedir}/src/test/java` |项目的测试类，比如说 JUnit代码|
|`${basedir}/src/test/resources` | 测试使用的资源|

另外： 编译后 的 classes 会放在 `${basedir}/target/classes` 下面， JAR 文件会放在 `${basedir}/target` 下面。





### Maven项目中配置文件的读取和写入

配置文件需要放置在： `${basedir}/src/main/resources` 目录。

比如下面的代码读取的都是该目录下的配置文件：

```java
//示例一： c3p0 的配置文件 c3p0-config.xml
//自动读取 src/main/resources目录下的c3p0-config.xml中的默认配置，获取c3p0的连接池
ComboPooledDataSource ds = new ComboPooledDataSource();
```



```java
//示例二：读取properties配置文件
Properties properties = new Properties();
//这里注意： 对于maven项目，配置文件需要放在 src/main/resources 目录下
InputStream is = DruidDemo.class.getClassLoader()
    .getResourceAsStream("druid.properties");

properties.load(is);
```



测试 `class.getClassLoader().getResource() `和 `class.getResource()`

```java
    // 测试 getClassLoader().getResource() 和 getResource() 
	// 当前类为 DruidDemo
	@Test
    public void test3(){
        /*
        测试路径问题 (在 maven 项目中)
        之前由于路径问题，一直找不到  druid.properties 配置文件
         */
        System.out.println("Class Loader");
        System.out.println(DruidDemo.class.getClassLoader());
        System.out.println(DruidDemo.class.getClassLoader().getResource(""));
//        System.out.println(DruidDemo.class.getClassLoader().getResource("\\"));
        System.out.println(DruidDemo.class.getClassLoader().getResource("/"));
        //需先在 src/main/resources 目录下添加一个名为 123 的文件进行测试
        System.out.println(DruidDemo.class.getClassLoader().getResource("123")); 

        System.out.println("\nThis Class");
        System.out.println(DruidDemo.class);
        System.out.println(DruidDemo.class.getResource(""));
        System.out.println(DruidDemo.class.getResource("/"));
//        System.out.println(DruidDemo.class.getResource("\\"));
        //需先在 src/main/resources 目录下添加一个名为 123 的文件进行测试
        System.out.println(DruidDemo.class.getResource("123"));

        //DruidDemo.class.getClassLoader().getResource("");  等于
        //DruidDemo.class.getResource("/");
    }
```

> **注意**：`DruidDemo.class.getClassLoader().getResource(""); ` 输出内容  等于 `DruidDemo.class.getResource("/");` 的输出内容.

输出内容：

```
Class Loader
jdk.internal.loader.ClassLoaders$AppClassLoader@4629104a
file:/C:/Users/Fan%20Dean/Documents/IdeaProjects/02_mysql/web05_datasource/target/classes/
null
file:/C:/Users/Fan%20Dean/Documents/IdeaProjects/02_mysql/web05_datasource/target/classes/123

This Class
class com.itheima.druid.DruidDemo
file:/C:/Users/Fan%20Dean/Documents/IdeaProjects/02_mysql/web05_datasource/target/classes/com/itheima/druid/
file:/C:/Users/Fan%20Dean/Documents/IdeaProjects/02_mysql/web05_datasource/target/classes/
null
```

> [Java目录总结（七.路径的获取二——ClassLoader的使用） - - ITeye博客](http://zyjustin9.iteye.com/blog/2022654 "Java目录总结(七.路径的获取二——ClassLoader的使用) - - ITeye博客")
>
> [IDEA maven打成jar包后使用ClassLoader获取不到资源文件 - CSDN博客](https://blog.csdn.net/cx118118/article/details/72987127 "IDEA maven打成jar包后使用ClassLoader获取不到资源文件 - CSDN博客")





**加载其它目录下的文件：**

需要在 pom.xml 文件中配置编译时查找所有目录下的配置文件。示例在 pom.xm文件中加入下面内容：

```xml
 <build>
        <!--将其他目录的配置文件打包-->
        <resources>
            <resource>
                <directory>src/main/java</directory>
                <includes>
                    <include>**/*.properties</include>
                    <include>**/*.xml</include>
                </includes>
                <filtering>false</filtering>
            </resource>
        </resources>
    </build>
```







### Maven安装最佳实践
**设置MAVEN_OPTS环境变量：**

运行mvn命令实际上是执行java命令，那么运行Java命令可用的参数也可应用在mvn命令上，可以利用MAVEN_OPTS来做到这一点。通常设置MAVEN_OPTS的值为 `-Xms128m -xmx512m`因为Java默认的最大可用内存往往不能满足Maven运行的需要，在项目较大时如果没有此配置，很容易得到`java.lang.OutOfMemeoryError`。



**配置用户范围settings.xml：**   

- 全局范围：`Maven home: /usr/share/maven` `/conf/settings.xml`文件
- 用户范围：`~/.m2/settings.xml`



**不要使用IDE内嵌的Maven：**

因为内嵌的Maven版本较新，会有各种问题。

在Eclipse中的更改方法：`Windows -- Preferences -- Maven -- Installation， Add -- 输入Maven Home目录，并取消内嵌Maven`。

Idea的见后文。



### 测试配置
运行下面的命令
```
mvn help:system
```

这条命令的目的是让Maven执行一个真正的任务，它会下载相关文件（下载maven-help-plugin），这些文件被下载到了Maven本地仓库中。`~/.m2`文件夹中放置了Maven本地仓库，所有的Maven构件都被放到该仓库中，以方便重用。
可到`~/.m2/repository/org/apache/maven/plugins/maven-help-plugins/`下找到 maven-help-plugin 的 pom文件和 jar 文件。



### Maven仓库

[Maven Repository: Search/Browse/Explore](https://mvnrepository.com/ "Maven Repository: Search/Browse/Explore") 可以在上的仓库中寻找你需要的 jar 包。



**jar包之间的依赖问题：**

比如：你想要找 c3p0 的 jar 包，在该网站搜索框中输入 c3p0，选择第一个，点击进入 c3p0页面；在 Central 标签页中的 version 列中有 c3p0 的各种版本，选择一个版本，点击进入，复制maven标签页下的文本内容，粘贴到  pom.xml 文件的dependencies下，这里需要注意的是：在该网页中，滚动到页面下面会看到 `Compile Dependencies (1)`，这说明 该jar包需要依赖另一个 jar包，在使用时需要同时添加该依赖。



对于 Spring 框架中的包 maven可以自行解决依赖问题？ 

比如我只在 pom.xml 文件中添加 spring-jdbc 依赖，但是我查看项目依赖时发现已经包含了其它几个必要依赖。

![maven repository dependencies](/../../../Documents/fandean.github.io/_drafts/开发工具/assets/maven repository dependencies.png)



## Maven使用入门

### 编写POM
POM（Project Object Model，项目对象模型）定义了项目的基本信息，用于描述项目如何构建，声明项目依赖，等等。

为Hello World项目编辑一个最简单的pom.xml，先创建一个名为 hello-world的文件夹，再新建pom.xml文件：


```xml
<?xml version = "1.0" encoding="UTF-8"?>
<project xmlns = "http://maven.apache.org/POM/4.0.0"
        xmlns:xsi="http:www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
        http://maven.apache.org/maven-v4_0_0.xsd">
        <!-- 指定POM模型的版本，Maven 3 是 4.0.0 -->
        <modelVersion>4.0.0</modelVersion>
        <!-- 指定项目属于哪个组。比如在googlecode上建立了一个myapp项目，那么它就是 com.googlecode.myapp  -->
        <groupId>com.juvenxu.mvnbook</groupId>
        <!-- 当前Maven项目在组中的唯一ID -->
        <artifactId>hello-world</artifactId>
        <!-- SNAPSHOT意为快照，说明该项目还在开发中，不稳定 -->
        <version>1.0-SNAPSHOT</version>
        <!-- 声明一个对用户更为友好的项目名称（可选） -->
        <name>Maven Hello World Project</name>
        <!--  以下依赖在 <编写测试代码> 章节处才添加 -->
        <dependencies>
            <!-- 声明项目的依赖 -->
            <dependency>
                    <groupId>junit</groupId>
                    <artifactId>junit</artifactId>
                    <version>4.10</version>
                    <!-- 依赖仍然包含上面的三个最基本的坐标，有了它们Maven就可以自动从中央仓库下载junit-4.10.jar -->
                    
                    <!-- 指定依赖范围为test，表示该依赖只对测试有效 -->
                    <scope>test</scope>
            </dependency>
    </dependencies>
        
</project>

```

groupId、artifactId、version这三个元素定义了这个项目基本的坐标；在Maven的世界，任何jar、pom、war都是以基于这些基本的坐标进行区分的。



### 编写主代码
项目的主代码会被打包到最终的构件中（如jar)。默认情况，Maven假设项目主代码位于 `src/main/java`目录，创建该目录然后在该目录下创建文件 `com/juvenxu/mvnbook/helloworld/HelloWorld.java`，Java类的包名是`com.juvenxu.mvnbook.helloworld`这与之前在POM中定义的groupId和artifactId相符合。一般来说，项目中的Java类的包都应该基于项目的groupId和artifactId。

编写一个输出 "Hello World"的程序。

```
[fan 22:00:49]~/workspace/test/maven/hello-world$ mvn clean compile
[INFO] Scanning for projects...
[INFO]                                                                         
[INFO] ------------------------------------------------------------------------
[INFO] Building Maven Hello World Project 1.0-SNAPSHOT
[INFO] ------------------------------------------------------------------------
[INFO] 
[INFO] --- maven-clean-plugin:2.5:clean (default-clean) @ hello-world ---               # clean清除输出目录 target/
[INFO] 
[INFO] --- maven-resources-plugin:2.6:resources (default-resources) @ hello-world ---
[WARNING] Using platform encoding (UTF-8 actually) to copy filtered resources, i.e. build is platform dependent!
[INFO] skip non existing resourceDirectory /home/fan/workspace/test/maven/hello-world/src/main/resources
[INFO] 
[INFO] --- maven-compiler-plugin:3.2:compile (default-compile) @ hello-world ---            # 编译项目主代码至target/classes目录
[INFO] Changes detected - recompiling the module!
[WARNING] File encoding has not been set, using platform encoding UTF-8, i.e. build is platform dependent!
[INFO] Compiling 1 source file to /home/fan/workspace/test/maven/hello-world/target/classes
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 1.901 s
[INFO] Finished at: 2017-03-05T22:01:06+08:00
[INFO] Final Memory: 14M/195M
[INFO] ------------------------------------------------------------------------
[fan 22:01:06]~/workspace/test/maven/hello-world$ ls        # 多了个target目录
pom.xml  src/  target/                  
```


### 编写测试代码
为了使项目结构保持清晰，主代码与测试代码应该分别位于独立的目录中。
Maven项目中默认的测试代码目录是 `src/test/java`

JUnit是事实上的单元测试标准。要使用JUnit，首先需要为Hello World项目添加一个JUnit依赖；更改项目的POM：


最终修改的POM见"编写POM"章节的示例。

测试用例编写完毕后，运行 `mvn clean test` 执行测试。




### 打包和运行
默认打包类型为jar。简单的执行命令 `mvn clean package` 进行打包。

jar插件将项目主代码打包成一个jar文件，该文件也位于 target/ 输出目录下；它是根据 artifact-version.jar规则进行命名的。

如果有需要的话，可以复制这个jar文件到其他项目的Classpath中从而使用HelloWorld类。如何让其他的Maven项目直接引用这个jar？
可以执行： `mvn clean install` 将项目输出的jar安装到Maven本地仓库中（只有构件被下载到本地仓库后，才能由所有Maven项目使用）。





## 清除未下载成功的文件

当网络出错时，可能会有未下载完成的文件，这些文件中包含 `lastUpdated`，可以使用下面的脚本清除 maven 未下载完成的文件。

注意：先将 `REPOSITORY_PATH`设置为你的maven的本地仓库的路径。

对应的 bat 脚本文件：

```powershell
set REPOSITORY_PATH="D:\Portable Software\Maven\repository"
rem 正在搜索...
for /f "delims=" %%i in ('dir /b /s "%REPOSITORY_PATH%\*lastUpdated*"') do (
    del /s /q %%i
)
rem 搜索完毕
pause
```







## 在IDEA中使用Maven



### 创建maven项目：不使用原型



>  Create from archetype ： 从原型创建 
>
> 可以不选原型



[IntellIJ IDEA 配置 Maven 以及 修改 默认 Repository - phpdragon - 博客园](https://www.cnblogs.com/phpdragon/p/7216626.html "IntellIJ IDEA 配置 Maven 以及 修改 默认 Repository - phpdragon - 博客园")

[Maven环境配置及idea建Maven工程 - CSDN博客](https://blog.csdn.net/qq_37497322/article/details/78988378 "Maven环境配置及idea建Maven工程 - CSDN博客")



设置Idea：

- `Setting > build, Execution，Deployment > Maven` 指定Maven home directory、User setting file 和 Local repository
- `Setting > build, Execution，Deployment >Remote Jar Repositories` 下的 Maven Jar Repositories下配置maven远程仓库。

- 新建Maven项目

- 跳过选择原型

- 设置项目的 GroupId：定义了项目属于哪个组，一般来说这个网网和公司或组织关联，比如说，你所在的公司为 mycom，那就应该定义为 com.mycom.mymaven ，其中mymaven为项目名称。

  设置ArtifactId：定义了当前Maven项目在组中的唯一id，例如HelloMaven这个项目，我则把他定义为hello-maven

  Version版本：这里使用默认值

- Project name：会自动使用上一步中的ArtifactId值作为项目名

- 还可展开"More Setting"查看更多设置





> groupId：定义了项目属于哪个组，一般来说这个网网和公司或组织关联，比如说，你所在的公司为mycom.那就应该定义为com.mycom.mymaven，mymaven为项目名称  artifactId：定义了当前Maven项目在组中的唯一id，例如HelloMaven这个项目，我则把他定义为hello-maven。









### 在 idea 中设置默认maven

**设置默认 Maven home directory ：**

每次在 `Setting > build, Execution，Deployment > Maven` 手动设置了 "Maven home directory" 后下次，创建项目或模块时，又会默认使用 idea 自带的 maven  【Bundled(Maven 3)】。

如何修改 Idea 中默认的 Maven？需要到 idea 的默认设置界面取进行设置：

从这里 `File > Other Setting > Default Setting` 即可打开默认设置界面，在这里进行配置就好了。



**设置默认 Remote Jar Repositories：**

Maven jar Repositories 每次新建项目也都会恢复到默认值，使用上面同样的方法更改就行。



> 当选择了本地maven后 localRepository可以从本地Maven的setting.xml文件自动检测到，但是 Remote Repositories为啥检测不到？



> [Idea 修改默认的Maven配置 - CSDN博客](https://blog.csdn.net/xzx4959/article/details/79565595 "Idea 修改默认的Maven配置 - CSDN博客")





### 相关设置



maven导入配置：

`Setting > build, Execution，Deployment > Maven > Importing `



- [ ]  Import maven project automatically。 自动导入。
- [ ] 

Automatically download:   [ ] Sources   [ ] Documentation ：自动下载源码与文档





Repositories：

`Setting > build, Execution，Deployment > Maven > Repositories `

为啥这里的仓库不可在这里更改？







### 相关问题



#### 1. 警告1 - 使用的jdk版本问题

在 Maven项目中每次编译运行代码的时候总是提示有下面的警告：

```
Information:javac 8 was used to compile java sources
Information:2018/7/4 16:07 - Compilation completed successfully with 3 warnings in 4 s 207 ms
Warning:java: 源值1.5已过时, 将在未来所有发行版中删除
Warning:java: 目标值1.5已过时, 将在未来所有发行版中删除
Warning:java: 要隐藏有关已过时选项的警告, 请使用 -Xlint:-options。
```





**target bytecode version ： 目标字节码版本** 



```
try-with-resources are not supported at language level 5
```

```
Error:(18, 13) java: -source 1.5 中不支持 try-with-resources
  (请使用 -source 7 或更高版本以启用 try-with-resources)
```



![idea Java Compiler](/../../../Documents/fandean.github.io/_drafts/开发工具/assets/idea Java Compiler.png)

> 每次新建maven项目后 target bytecode version 都会变成 1.5，如何修改该默认值？





**解决办法：**

1. 最直接的方法就是直接在该设置界面进行更改；但是每次新建项目后又会变为 1.5。
2. 我是参考下文的第二个链接，直接在maven 用户级别的 settings.xml 文件中添加 profile 即可，之后新建的项目中默认值就是你设置的值。



> 1. [IntelliJ IDEA 源值1.5已过时，将在未来所有版本中删除 - 简书](https://www.jianshu.com/p/451271c4de11 "IntelliJ IDEA 源值1.5已过时，将在未来所有版本中删除 - 简书") 
> 2. [【永久 | 一次性解决】Intellij IDEA maven 老是自动跳到1.5的JDK - CSDN博客](https://blog.csdn.net/Zereao/article/details/77427989 "[永久 | 一次性解决]Intellij IDEA maven 老是自动跳到1.5的JDK - CSDN博客") 这里是通过在 setting中添加 profile 来解决
> 3. [在idea中maven项目jdk编译version总是跳到1.5 - CSDN博客](https://blog.csdn.net/u010006309/article/details/52780218 "在idea中maven项目jdk编译version总是跳到1.5 - CSDN博客") 这里是通过在 setting中添加 plugin 来解决
> 4. [Intellij IDEA修改默认 Target bytecode version - CSDN博客](https://blog.csdn.net/weixin_35649691/article/details/52934860 "Intellij IDEA修改默认 Target bytecode version - CSDN博客") 这里是通过 在pom.xml文件中添加 plugin 来解决。





> **各种疑问：**
>
> 在maven的setting.xml文件中发现 ，是干什么的？
>
> ```
>     <profile>
>       <id>jdk-1.4</id>
> ```
>
> 为 pom.xml 添加下面的内容是为什么了？难道不是修改了 Java Compiler后才起作用的吗？因为如果只做下面的修改是不行的；而单独修改 Java compiler是有效的。
>
> ```
> <properties>
>     <maven.compiler.source>1.8</maven.compiler.source>
>     <maven.compiler.target>1.8</maven.compiler.target>
> </properties>
> ```
>
> 





### 使用Maven创建web工程



**新方法：**先新建一个 没有使用模板的maven项目，创建好后选择该模块右键 > Add Framework Support > Web Application  (Versions选择 4.0，取消勾选 "Create web.xml")   为其添加web框架的支持。然后就可以了。





服务器为 tomcat 



手动： [IntelliJ IDEA 17 创建maven项目-博客-云栖社区-阿里云](https://yq.aliyun.com/articles/111053 "IntelliJ IDEA 17 创建maven项目-博客-云栖社区-阿里云")  最开始使用这个方法

[IntelliJ IDEA 14 创建maven项目二 - Angelaboy - 博客园](http://www.cnblogs.com/wql025/p/5205716.html?spm=a2c4e.11153940.blogcont111053.14.f890225eb86IGv "IntelliJ IDEA 14 创建maven项目二 - Angelaboy - 博客园")

另一种方法： [使用Intellij IDEA 和maven创建web项目webapp全过程 - CSDN博客](https://blog.csdn.net/qq_33326449/article/details/78034190 "使用Intellij IDEA 和maven创建web项目webapp全过程 - CSDN博客")

[使用IDEA将普通MAVEN项目转为WEB项目 - CSDN博客](https://blog.csdn.net/yun0000000/article/details/70664944 "使用IDEA将普通MAVEN项目转为WEB项目 - CSDN博客")



>  手动创建的缺点，不能自动添加相关注解，不能自动添加要覆盖的方法。
>
>  直接新建一个 servlet 即可。





artifactid

artifact

Facts: 表示当前项目的适配服务组件

Aftifacts: 这个Aftifacts描述了当前项目发布的信息。



> 好像还可以通过tomcat的管理员... 配置maven，然后maven自动部署应用到 tomcat中
>
> [\[转\]Maven实现直接部署Web项目到Tomcat7 - dorothychai - 博客园](https://www.cnblogs.com/dorothychai/p/4669808.html "[转]Maven实现直接部署Web项目到Tomcat7 - dorothychai - 博客园")
>
> 
>
> [IDEA——Maven Web工程：无法创建Java Class文件 - CSDN博客](https://blog.csdn.net/gxx_csdn/article/details/79080265 "IDEA——Maven Web工程：无法创建Java Class文件 - CSDN博客")
>
> [Idea 新建Maven项目时没有servlet选项 - CSDN博客](https://blog.csdn.net/u013605060/article/details/80611041 "Idea 新建Maven项目时没有servlet选项 - CSDN博客")





### 将WEB-INF/lib中的jar添加到Library

在lib目录右键选择 `add Library`





#### 错误： tomcat 找不到类

```
java.lang.NoClassDefFoundError: org/springframework/jdbc/core/JdbcTemplate
```



Maven管理的jar没有发布到`WEB-INF/lib`下的解决方案

Intellij idea 下使用maven管理web项目，部署运行时发现并没有将lib包部署

使用eclipse j2ee IDE时,会将WEB-INF/lib中所有的lib自动加入到library中  

[Maven管理的jar没有发布到WEB-INF/lib下的解决方案 - CSDN博客](https://blog.csdn.net/hualom/article/details/45824395 "Maven管理的jar没有发布到WEB-INF/lib下的解决方案 - CSDN博客")



解决办法：

另见图：

![](/../../../Documents/fandean.github.io/_drafts/开发工具/assets/idea-maven-tomcat-web_inf_lib.png)







### Tomcat部署时war和war exploded区别

- `war` 模式：将WEB工程以包的形式上传到服务器 ；
- `war exploded` 模式：将WEB工程以当前文件夹的位置关系上传到服务器；



（1）war模式这种可以称之为是发布模式，看名字也知道，这是先打成war包，再发布；

（2）war exploded模式是直接把文件夹、jsp页面 、classes等等移到Tomcat 部署文件夹里面，进行加载部署。因此这种方式支持热部署，一般在开发的时候也是用这种方式。

（3）在平时开发的时候，使用热部署的话，应该对Tomcat进行相应的设置，这样的话修改的jsp界面什么的东西才可以及时的显示出来。





[Tomcat部署时war和war exploded区别以及平时踩得坑 - CSDN博客](https://blog.csdn.net/xlgen157387/article/details/56498938 "Tomcat部署时war和war exploded区别以及平时踩得坑 - CSDN博客")

[intelliJ Idea自带热部署和Jrebel实现热部署 - CSDN博客](https://blog.csdn.net/wei19880402/article/details/75529231 "intelliJ Idea自带热部署和Jrebel实现热部署 - CSDN博客")





### 创建Maven项目：使用原型



优先使用本地 archetype-catalog.xml 文件，从而加快创建速度 ：

[解决IntelliJ IDEA 创建Maven项目速度慢问题 DarchetypeCatalog - 记性这么差 - 博客园](https://www.cnblogs.com/del88/p/6286887.html "解决IntelliJ IDEA 创建Maven项目速度慢问题 DarchetypeCatalog - 记性这么差 - 博客园")

在 `Default Settings > Build,Execution... > Maven > Runner > VM Options`中添加如下选项：`-DarchetypeCatalog=internal `





**创建Java项目：**

选择`maven-archetype-quickstart`原型。

![idea-maven-java](/../../../Documents/fandean.github.io/_drafts/开发工具/assets/idea-maven-java.png)

创建之后会缺少`resources`目录，需要手动创建该目录，并将其添加为资源的根目录: `右键目录 > Mark Directory as > Resources Root`。

![idea-maven-add-resources](/../../../Documents/fandean.github.io/_drafts/开发工具/assets/idea-maven-add-resources.png)



pom.xml 文件中部分内容： 

```xml
  <properties>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    <maven.compiler.source>1.7</maven.compiler.source>
    <maven.compiler.target>1.7</maven.compiler.target>
  </properties>
```

可根据需要更改使用到的 JDK 的版本，比如更改为 1.8 .





**创建Web项目：**

选择`maven-archetype-webapp`原型。如果想要通过添加一个新的模型的形式来创建一个Maven项目，在选择原型后的下一步中需要确保：  `Add as module to` 和 `Parent` 都为 `<none>`。



创建之后会缺少`java`和`resources`目录，需要手动创建，并将它们分别设置为相应目录： `右键目录 > Mark Directory as > Sources Root`和  `右键目录 > Mark Directory as > Resources Root`。但是idea可能会并没有在对应的模块的 `.iml` 文件中正确生成 `<sourceRoot>`标签，这时如果想直接新建一个 servlet 可能发现并没有 servlet 这个选项，我们可以重启Idea（不可能）或者手动更改模块 .iml 文件，设置源码根目录，使其能够在new右键列表中出现servlet。

```xml
        <sourceRoots>
          <root url="file://$MODULE_DIR$/src/main/java" />
          <root url="file://$MODULE_DIR$/src/main/resources" />
        </sourceRoots>
```



使用原型的好处之一是：无需手动添加 `WEB-INF/lib`，但是缺点也很明显；那么能否自定义原型？





### Idea中maven相关技巧

在Idea中可以通过点击Maven侧边栏中的 `Execute Maven Goal`图标来执行maven的任意命令。

在Idea中搜索依赖：

![idea-maven-search-dependency](/../../../Documents/fandean.github.io/_drafts/开发工具/assets/idea-maven-search-dependency.png)

如果搜索不到任何结果，则需要更新一下仓库索引：

![](/../../../Documents/fandean.github.io/_drafts/开发工具/assets/idea-maven-update-index.png)





创建骨架（原型）：

[使用Maven Archetype插件构建Maven工程原型模板的实例_java_脚本之家](https://www.jb51.net/article/129672.htm "使用Maven Archetype插件构建Maven工程原型模板的实例_java_脚本之家")



com.fan.maven.archetypes:fan-quickstart

com.fan.maven.archetypes:fan-webapp



GroupId : com.fan.maven.archetypes

artifactId :  fan-webapp



```xml
  <groupId>com.fan.maven.archetypes</groupId>
  <artifactId>fan-webapp-archetype</artifactId>
  <version>1.0-SNAPSHOT</version>
  <packaging>maven-archetype</packaging>
```





### Maven的Mybatis插件

mybatis-generator-maven-plugin 插件：





> [利用mybatis-generator自动生成代码 - 菩提树下的杨过 - 博客园](http://www.cnblogs.com/yjmyzz/p/4210554.html "利用mybatis-generator自动生成代码 - 菩提树下的杨过 - 博客园")
>
> [mybatis-generator-maven-plugin在idea中使用 - 简书](https://www.jianshu.com/p/4db902936b29 "mybatis-generator-maven-plugin在idea中使用 - 简书")







## Maven 相关命令





列出本地资源库中的依赖（比如，需要获取其版本号）



一些基本的操作，编译，构建，单元测试，安装，网站生成和基于Maven部署项目。

- [使用Maven构建项目](http://www.yiibai.com/maven/build-project-with-maven.html)
  “mvn package” 来构建项目
- [使用Maven清理项目](http://www.yiibai.com/maven/clean-project-with-maven.html)
  “mvn clean” 来清理项目
- [使用Maven运行单元测试](http://www.yiibai.com/maven/run-unit-test-with-maven.html)
  “mvn test” 来执行单元测试
- [将项目安装到Maven本地资源库](http://www.yiibai.com/maven/install-project-into-maven-local-repository.html)
  “mvn install” 打包和部署项目到本地资源库
- [生成基于Maven的项目文档站点](http://www.yiibai.com/maven/generate-a-site-for-your-maven-based-project.html)
  “mvn site” 来为您的项目生成信息文档站点
- [使用“mvn site-deploy”部署站点（WebDAV例子）](http://www.yiibai.com/maven/deploy-site-with-mvn-site-deploy-webdav-example.html)
  “mvn site-deploy” 通过WebDAV部署自动生成的文档站点到服务器
- [部署基于Maven的war文件到Tomcat](http://www.yiibai.com/maven/deploy-maven-based-war-file-to-tomcat.html)
  “mvn tomcat:deploy” 以 WAR 文件部署到 Tomcat





[Maven常用命令： - 艺意 - 博客园](https://www.cnblogs.com/wkrbky/p/6352188.html "Maven常用命令： - 艺意 - 博客园")

[Maven教程™](https://www.yiibai.com/maven/ "Maven教程™")



### 安装第三方jar包

[Maven两种方法解决本地第三方jar包引用问题 - CSDN博客](https://blog.csdn.net/pslwap3/article/details/78021966 "Maven两种方法解决本地第三方jar包引用问题 - CSDN博客")



```
mvn install:install-file -Dfile=<path-to-file> -DgroupId=<group-id> \
    -DartifactId=<artifact-id> -Dversion=<version> -Dpackaging=<packaging>
```



示例安装 ojdbc8 到本地仓库：

```
mvn install:install-file -Dfile="D:\Portable Software\Database\sql-JDBC\ojdbc8-oracle18.3.jar" -DgroupId=com.oracle \
    -DartifactId=ojdbc -Dversion=8 -Dpackaging=jar
```

如果在idea中使用，运行上上面的命令后，可能需要更新一下本地maven仓库， `Setting > Build.. > Maven > respositories > Update`

```
mvn install:install-file -Dfile="D:\Portable Software\Database\sql-JDBC\ojdbc6-oracle11.2.0.4.jar" -DgroupId=com.oracle \
    -DartifactId=ojdbc -Dversion=6 -Dpackaging=jar
```

```xml
    <!-- 数据源 -->
    <bean id="dataSource" class="com.alibaba.druid.pool.DruidDataSource" destroy-method="close">
        <property name="driverClassName" value="oracle.jdbc.OracleDriver"/>
        <!--<property name="driverClassName" value="com.oracle.jdbc.OracleDriver"/>-->
        <property name="url" value="jdbc:oracle:thin:@127.0.0.1:1522:XE"/>
        <property name="username" value="itheima"/>
        <property name="password" value="fan123"/>
    </bean>
```









## Maven Wrapper

mvnw全名是Maven Wrapper,它的原理是在maven-wrapper.properties文件中记录你要使用的Maven版本，当用户执行mvnw clean 命令时，发现当前用户的Maven版本和期望的版本不一致，那么就下载期望的版本，然后用期望的版本来执行mvn命令。



Maven Wrapper官方项目主页： [maven-wrapper: The easiest way to integrate Maven into your project!](https://github.com/takari/maven-wrapper "takari/maven-wrapper: The easiest way to integrate Maven into your project!")





**为项目添加mvnw支持很简单，有两种方式：** 

**方法一**，在pom.Xml中添加Plugin声明：

```xml
<plugin>
<groupId>com.rimerosolutions.maven.plugins</groupId>
<artifactId>wrapper-maven-plugin</artifactId>
<version>0.0.4</version>
</plugin>
```

这样当我们执行`mvn wrapper:wrapper` 时，会帮我们生成`mvnw.bat, mvnw, maven/maven-wrapper.jar, maven/maven-wrapper.properties`这些文件。
然后我们就可以**使用`mvnw`代替`mvn`命令** 执行所有的maven命令，比如`mvnw clean package`



**方法二**，直接执行Goal（推荐）

`mvn -N io.takari:maven:wrapper -Dmaven=3.5.4`  表示我们期望使用的maven的版本为3.5.4

产生的内容和第一种方式是一样的，只是目录结构不一样，maven-wrapper.jar 和 maven-wrapper.properties 在 ".mvn/wrapper" 目录下（位于当前项目中）



使用的注意事项：

1、由于我们使用了新的maven ,如果你的settings.xml没有放在当前用户下的.m2目录下，那么执行mvnw时不会去读取你原来的settings.xml文件
2、在mvnw.bat中有如下的一段脚本
`if exist "%M2_HOME%\bin\mvn.cmd" goto init`
意思是如果找到mvn.cmd就执行初始化操作，但是maven早期版本不叫mvn.cmd,而是叫mvn.bat,所以会报"Error: M2_HOME is set to an invalid directory"错误，改成你本地的maven的匹配后缀就好了。（可能没有）



> Maven是一个常用的构建工具，但是Maven的版本和插件的配合并不是那么完美，有时候你不得不切换到一个稍微旧一些的版本，以保证所有东西正常工作。
>
> 而Gradle提供了一个Wrapper，可以很好解决版本切换的问题，当然更重要的是不需要预安装Gradle。
>
> Maven虽然没有官方的Wrapper，但是有一个第三方的Wrapper可以使用。
>
> 安装很简单 `mvn -N io.takari:maven:wrapper `
>
> 使用的时候直接 `./mvnw clean install `即可，它会自动下载**最新版本**来执行。如果需要指定版本则可以使用相关参数：`mvn -N io.takari:maven:wrapper -Dmaven=3.3.3` 表示我们期望使用的Maven的版本为3.3.3。
>
> 如果需要指定版本,重新生成mvnw文件在运行即可
>
> ```
> mvn -N io.takari:maven:wrapper -Dmaven=3.1.0
> ./mvnw clean install
> ```

[Maven Wrapper - 为程序员服务](http://ju.outofmemory.cn/entry/214018 "Maven Wrapper - 为程序员服务")

[mvnw是什么（Maven Wrapper/Maven保持构建工具版本一直的工具） - EasonJim - 博客园](https://www.cnblogs.com/EasonJim/p/7620085.html "mvnw是什么(Maven Wrapper/Maven保持构建工具版本一直的工具) - EasonJim - 博客园")







## Maven插件



### maven compiler plugin





各配置说明：

```xml
<plugin>
	<groupId>org.apache.maven.plugins</groupId>
	<artifactId>maven-compiler-plugin</artifactId>
	<version>3.1</version>
	<configuration>
		<source>1.6</source>
		<!-- 源代码使用的开发版本 -->
		<target>1.6</target>
		<!-- 需要生成的目标class文件的编译版本 -->
		<!-- 一般而言，target与source是保持一致的，但是，有时候为了让程序能在其他版本的jdk中运行(对于低版本目标jdk，源代码中需要没有使用低版本jdk中不支持的语法)，会存在target不同于source的情况 -->
		<!-- 指定项目编码为utf-8 -->
		<encoding>UTF-8</encoding>
		<!-- 这下面的是可选项 -->
		<meminitial>128m</meminitial>
		<maxmem>512m</maxmem>
		<fork>true</fork>
		<!-- fork is enable,用于明确表示编译版本配置的可用 -->
		<compilerVersion>1.3</compilerVersion>
		<!-- 这个选项用来传递编译器自身不包含但是却支持的参数选项 -->
		<!-- <compilerArgument>-verbose -bootclasspath ${java.home}\lib\rt.jar</compilerArgument> -->
		<compilerArguments>
			<verbose />
			<!-- 这个选项用来传递编译器自身不包含但是却支持的参数选项 -->
			<!-- <bootclasspath>${java.home}/lib/rt.jar:${java.home}/jre/lib/jce.jar</bootclasspath> -->
		</compilerArguments>
		<!--  传递参数给 javac -->
		<compilerArgs>
			<arg>-verbose</arg>
			<arg>-Xlint:all,-options,-path</arg>
		</compilerArgs>
	</configuration>
</plugin>
```

> 这里只是为了介绍各种用法而拼凑的内容

也可以这样配置：

```xml
<properties>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    <!-- 配置 maven compiler 插件-->
    <maven.compiler.source>1.8</maven.compiler.source>
    <maven.compiler.target>1.8</maven.compiler.target>
</properties>
```


## Docker
另见 Docker Idea 相关文章




## Maven私服



### Nexus

在maven中的配置



> Nexus的安装和配置见相关文章







