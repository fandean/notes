

[每个Java开发者都应该知道的5个JDK工具 - CSDN博客](https://blog.csdn.net/tswc1990/article/details/41344635 "每个Java开发者都应该知道的5个JDK工具 - CSDN博客")



## Java Mission Control（JMC）

[Java 性能分析工具 , 第 3 部分: Java Mission Control - aurain - 博客园](https://www.cnblogs.com/aurain/p/6178671.html "Java 性能分析工具 , 第 3 部分: Java Mission Control - aurain - 博客园")



JMC 是源自 JRockit JVM 的一套监控和管理工具，Oracle 在 2013 年发布  JAVA 7u40（Java 7 Update 40） 时**将其包含在 JDK 中，用户不再需要额外下载**。该工具主要由三个组件构成：Java 进程浏览器、JMX 控制台和 Java Flight 记录器。

- Java 进程浏览器允许用户列出并连接到本地和远程运行的 Java 应用。它能够使用 Java 发现协议（JDP）自动地发现本地和远程运行的 Java 进程。
- JMX 控制台能够通过 JMX 接口管理并监控 JDK 。它提供了实时集合、堆使用情况、CPU 负载以及其他通过 MBeans 暴露的和在 MBean 服务器中注册的信息。
- Java Flight 记录器提供了一种从操作系统层、JVM 和 Java 应用程序层收集事件的方式。收集的事件包括线程延时事件，例如休眠（sleep）、等待（wait）、锁竞争、I/O、GC 和方法分析。

![img](https://static.oschina.net/uploads/space/2018/0506/204725_YmLu_2896879.png)

Java Mission Control（JMC）的源代码已正式开源。源码地址：http://hg.openjdk.java.net/jmc



