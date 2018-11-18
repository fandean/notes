# Log4J日志

标签（空格分隔）： 开发工具

---

> 参考《Tomcat与Java Web开发技术详解》的第31章：使用Log4J进行日志操作



> 另见 SLF4J 的相关文章



## Log4J简介

Log4J是Apache的一个开放源代码项目。通过Log4J，可以指定日志信息输出的目的地，如控制台、文件、GUI组件、远程套接字服务器、NT的事件记录器、Unix Syslog守护进程等。


**Log4J主要由以下3大组件构成：**

- Logger:负责**生成日志**，并能对日志信息进行**分类筛选**。（日志记录器）
- Appender: 定义日志信息输出的目的地。
- Layout: 指定日志信息的输出格式（比如：SimpleLayout、PatternLayout）


## Logger组件
它代表了Log4J的日志记录器。
Logger组件由`org.apache.log4j.Logger`类来实现，它提供了如下方法：
```
//创建及访问Logger实例的静态方法
public static Logger getRootLogger();
public static Logger getLogger(String name);

//*打印*各种类别的日志的方法
public void debug(Object message);
public void info(Object message);
public void warn(Object message);
public void error(Object message);
public void fatal(Object message);

//*打印*日志的通用方法。(Priority:日志级别)
public void log(Priority P, Object message);
```

可以在Log4J的***配置文件***中配置自己的Logger组件，例如：
```
log4j.logger.helloappLogger=WARN
```

上面定义了一个名为helloappLogger的Logger组件，它的日志级别(Priority)取值为"WARN"。


对于这些输出日志的方法，只有当它输出日志的级别大于或等于为Logger组件配置的日志级别时，这个方法才会被真正执行。


## Appender组件
Appender组件执行将日志信息输出到以下目的地：

- 控制台（Console）
- 文件（File）
- GUI组件（GUI component）
- 远程套接字服务器（Remote socket server）
- NT的事件记录器（NT Event Logger）
- 远程UNIX Syslog守护进程（Remote UNIX Syslog daemon）

一个Logger可以同时对应多个Appender。

```properties
# 配置代码
log4j.logger.helloappLogger=WARN,file,console

log4j.appender.file=org.apache.log4j.RollingFileAppender
log4j.appender.file.File=log.txt

log4j.appender.console=org.apache.log4j.ConsoleAppender
```



## Layout组件
决定日志的输出格式，它有以下几种类型：

- org.apache.log4j.HTMLLayout (以HTML表格形式布局)
- org.apache.log4j.PatternLayout （可以灵活地指定布局模式）
- org.apache.log4j.SimpleLayout （包含日志信息的级别和信息字符串）
- org.apache.log4j.TTCCLayout （包含日志产生的时间、线程和类别等信息）


示例：为名为“console”的Appender配置SimpleLayout布局，采用下面的配置代码：
```
log4j.appender.console.layout=org.apache.log4j.SimpleLayout
```


PatternLayout可以让开发者依照 ConversionPattern去定义输出格式。

| 符号 | 描述 |
|-----------|-------------------|
|`%r`|自程序开始运行到输出当前日志所消耗的毫秒数|
|`%t`|表示输出当前日志的线程的名字|
|`%p`|表示日志的级别|
|`%d`|表示输出当前日志的日期|
|`%c`|表示输出当前日志的Logger的名字|
|`%m%n`|表示日志信息的内容|

例如：要为名为"file"的Appender配置PatternLayout布局
```
log4j.appender.file.layout=org.apache.log4j.PatternLayout
log4j.appender.file.layout.ConversionPattern=%t %p - %m%n
```



## Logger组件的继承性
Log4J提供了一个root Logger，它是所有Logger组件的祖先。
```
#配置root Logger的示例代码
log4j.rootLogger=INFO,console
```

在配置文件中，凡是在符合`.`后面的Logger组件都会成为在符号`.`前面的Logger组件的子类。
```
log4j.apache.helloappLogger=WARN
# 子类
log4j.apache.helloappLogger.childLogger=,file
```

Logger组件的继承关系：

- 如果子类没有定义日志级别，则将继承父类的日志级别，（定义了则不继承）
- 默认，子类Logger组件会继承父类所有的Appender
- 如果把子类Logger组件的additivity标志设为false，那么他就不会继承父类的Appender。


## Log4J的基本使用方法

### 定义配置文件
Log4J支持在程序中以编程方式设置这些组件，还支持通过配置文件来配置组件。

Log4J支持xml和Java属性文件(后缀为`.properties`)两种配置文件。



```properties
# Set root category priority to INFO and its only appender to CONSOLE.
#log4j.rootCategory=INFO, CONSOLE            五种日志级别 debug   info   warn error fatal
# 含义： 输出级别为 info ，既在控制台输出，又在日志文件中输出
log4j.rootCategory=info, CONSOLE, LOGFILE

# Set the enterprise logger category to FATAL and its only appender to CONSOLE.
log4j.logger.org.apache.axis.enterprise=FATAL, CONSOLE

# CONSOLE is set to be a ConsoleAppender using a PatternLayout.
log4j.appender.CONSOLE=org.apache.log4j.ConsoleAppender
log4j.appender.CONSOLE.layout=org.apache.log4j.PatternLayout
log4j.appender.CONSOLE.layout.ConversionPattern=%d{ISO8601} %-6r [%15.15t] %-5p %30.30c %x - %m\n

# LOGFILE is set to be a File appender using a PatternLayout.
log4j.appender.LOGFILE=org.apache.log4j.FileAppender
# 指定日志的输出文件
log4j.appender.LOGFILE.File=d:/axis.log
log4j.appender.LOGFILE.Append=true
log4j.appender.LOGFILE.layout=org.apache.log4j.PatternLayout
log4j.appender.LOGFILE.layout.ConversionPattern=%d{ISO8601} %-6r [%15.15t] %-5p %30.30c %x - %m\n
```





> 上面的配置都是在Java属性文件的格式。



### 在程序中使用Log4J

下载Log4J的jar包。

1.读取配置文件，配置Log4J环境

- BasicConfigurator.configure():自动快速的使用默认Log4J环境
- PropertyConfigurator.configure(String configFilename)：读取使用Java属性格式的配置文件并配置Log4J环境。
- DOMConfigurator.configure(String filename)：读取XML形式的配置文件并配置Log4J环境。

2.获得日志记录器
这个记录器负责控制日志信息的输出。
获取root Logger：
`Logger rootLogger=Logger.getRootLogger();`

获取用户自定义的Logger：
`Logger helloappLogger = Logger.getLogger("log4j.logger.helloappLogger ");`

3.输出日志信息
调用Logger的各种输出日志方法来输出不同级别的日志。
`helloappLogger.warn("This is a log message from the " + helloappLogger.getName());`



### 在Web应用中使用Log4J
可以将配置Log4J环境的代码放在Servlet的init()方法中，这样可以保证当Servlet被加载并初始化后，Log4J的环境就已经配置好了。



