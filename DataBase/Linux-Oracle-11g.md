# 基于UNIX和Linux的操作系统的Oracle数据库管理员参考手册

默认监听端口：1521

## 1. 安装和管理Oracle数据库
略

## 2 停止和启动Oracle软件
此章讲解了如何识别 Oracle Database 进程和如何停止(stop)和重启(restart)它们的基本信息。也描述了如何设置自动启动startup和shudown关闭。

> See Also:
更多关于`srvctl`命名的信息，见[Database Administrator's Guide](http://docs.oracle.com/cd/E11882_01/server.112/e25494/toc.htm) 和 [Oracle Automatic Storage Management Administrator's Guide ](http://docs.oracle.com/cd/E11882_01/server.112/e18951/toc.htm) 。

### 2.1 Oracle重启 Restart

脚本`dbstart`和`dbshut`曾经用于自动启动和关闭数据库，启动和关闭的时候如果设置完善可同时启动和关闭监听器，oracle存储管理(Oracle ASM)以及其它一些功能。比如我使用dbstart后的这条信息：
`ORACLE_HOME_LISTNER is not SET, unable to auto-start Oracle Net Listener
`
这两个命令只是不建议使用，但还是可以使用的，也有大神一直在用。

>注意：
关于Oracle Restart，你可以使用服务控制使用程序（srvctl)，该命令用于在命令行来管理Oracle进程（数据库实例，监听，ASM实例）；当然他也可以用来管理Oracle Restart配置。
另见：[Configuring Automatic Restart of an Oracle Database ](http://docs.oracle.com/cd/E11882_01/server.112/e25494/restart.htm#ADMIN12708) 


### 2.2 Stoping and Starting Oracle Processes
本节将介绍如何停止和启动Oracle进程。











##dbac的使用记录
打算用dbac更改数据库字符集。没有这个选项。

如果中文乱码，不能显示则：` LANG=en_US.UTF-8  dbca`  使用这种形式运行。

选项页的介绍：

**select the mode in which you want your database to operate by default:**

1. dedicated server mode专用服务器模式:
for each client connection the database will allocate(分配) a resource dedicated to serving only that client. Use this mode when the number of total client connections is expected(预期的) to be small or when clients will be making persistent, long-running requests to the database. 为每个客户端连接的数据库将分配一个专用于只服务客户端资源。当预计总客户端连接数要小的或使用此模式时，客户将作出持久的，长期运行的数据库请求。
2. shared server mode共享服务器模式:		（适用于用户量多的时候）
只解释几个单词；simultaneously同时，efficiently有效率的，utilizing利用。



