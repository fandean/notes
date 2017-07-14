# Linux install Oracle Database 11g 

为知上收集了几篇文章。

## 总结：实际操作记录

### 安装时的注意事项
提前在此提醒： 

1. 需要注意的是在安装之前的配置工作中，有几个操作可能是需要重启的(也可使用某个命令而不重启)：
如：在/etc/selinux/config 中添加 SELINUX=permissive
和 systemctl 。。。
2. 选择安装并创建数据库到达Typical install configuration界面时，一定记得**字符集选择**为UTF-8相关的比如：AL32UTF8。另外OSDBA Group选择dba（win中选择ORA_DBA）详见下文的翻译。
2. 最后使用root身份执行两条shell命令：需要两条都执行后在点击ok。
4. 如果不能正常显示中文，则需下载中文支持包：**暂无解决办法**（网上说的安装中文支持包的方法对应的软件包都没有）oracle用户的语言选择为中文，但在.bashrc中添加 `export  LANG=en_US.UTF-8`



### 安装
安装环境：CentOS 7 x86_64，在Debian 8上试了下，很多错误放弃了。

参考了：

- [Oracle 11g在不同系统中的安装教程](http://dbaora.com/oracle-new-features-11g/  "值得一看，该网站还有12c的，和一些安装错误解决方法") 
- [参考2](https://oracle-base.com/articles/11g/oracle-db-11gr2-installation-on-oracle-linux-7)

安装时需要解决所有错误提示，出现问题在网上搜索。

安装时由于之前下载的是32bit的数据库，启动时出现问题，搜索了下才明白系统是64bit的。

按照第一个网站上说的在 CentOS 7上安装的教程，设置即可。


### 安装后的配置
> 假设你安装时同时创建了数据库。

如果就在本机使用，直接就可以在SQLPlus中建立连接，并打开数据库，进行操作了。
```
sqlplus  /nolog
SQL> conn / as  sysdba			# 使用安装时设置的oracle用户身份进行登录
SQL> startup                  # 启动数据库
# 然后 ....
```

#### 测试监听器是否可用
命令： lsnrctl
选项： status 查看状态； start启动监听器；stop关闭监听器

先查看监听器状态：lsnrctl status
如果没有启动，显示为 no listener，则启动默认监听器： lsnrctl start


------

如果不能启动，则见后面的错误处理。

原因可能是我不会配置 /etc/hosts文件，
(我在locallhost行添加了centos7，并在.bashrc中添加了 ORACLE_HOSTNAME=centos7。)
**解决方法：**编辑该监听器在listener.ora文件中的HOST = 127.0.0.1；这样启动时没有问题。不知道为什么必须输入ip地址才行。该文件位于 `$ORACLE_HOME/network/admin/`

**这样造成了另一个错误**

	监听器虽然能开启，但是在倒数第二行有如下消息：
	The listener supports no services

原因是HOST不能随意改变。或应该显示设置该监听器要监听的对象。
使用命令 netmgr 打开图形界面的网络管理器，查看服务的配置情况，其中host_name为：centos7， 应该是这个不匹配。
也就是说要与 tmsnames.ora文件中的配置相对应。


##### 关于监听器最后的解决办法：

原来的文件：
文件 listener.ora
```
LISTENER =
  (DESCRIPTION_LIST =
    (DESCRIPTION =
      (ADDRESS = (PROTOCOL = TCP)(HOST = 127.0.0.1)(PORT = 1521))
    )
  )

ADR_BASE_LISTENER = /ora01/app/oracle

```
更改后的 listener.ora
```
SID_LIST_LISTENER =
  (SID_LIST =
    (SID_DESC =
      (GLOBAL_DBNAME = ORA11G)
      (ORACLE_HOME = /ora01/app/oracle/product/11.2.0/db_1)
      (SID_NAME = ORA11G)
    )
  )


LISTENER =
  (DESCRIPTION_LIST =
    (DESCRIPTION =
      (ADDRESS = (PROTOCOL = TCP)(HOST = centos7)(PORT = 1521))
    )
  )

ADR_BASE_LISTENER = /ora01/app/oracle

```

更改后的hosts文件
```
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6

# 10.0.2.15 是本机网卡地址
10.0.2.15  centos7 centos7.localdomain 
```
/etc/hostname文件内容
```
centos7.localdomain
```


.bashrc中添加了 ORACLE_HOSTNAME=centos7

执行： . bashrc

启动监听器，成功启动并监听相关实例。




#### 测试是否可以启动数据库
先启动数据库：
命令行输入： dbstart
如果显示信息中存在如下内容：


```
dbstart        #提示信息
ORACLE_HOME_LISTNER is not SET, unable to auto-start Oracle Net Listener

# 该错误的解决方法是编辑 dbstart 和 dbshut脚本(位于$ORACLE_HOME/bin)，将 ORACLE_HOME_LISTNER=$1 该为 ORACLE_HOME_LISTNER=$ORACLE_HOME
```


此时如果监听器也配置正确，则使用 dbstart 可同时打开数据库和监听器。

也可以不用更改，在后面配置自动启动的操作中有相关参数配置。

#### 远程连接

打开操作系统后，切换到oracle用户。手动（开机自动启动我也没设置成功）
```
打开监听器：  lsnrctl start
打开数据库： dbstart
```
假设是在虚拟机中，还可选择配置虚拟机的端口转发； 设置服务器防火墙；
下载JDBC（或你打算使用 Oracle Client）使用SQL客户端进行连接。

----

> [安装后的配置](https://tangrui.gitbooks.io/installing-oradb11g-on-centos5-x86_64/content/post_installation_config/README.html) 
> **不知这个是否有效？**  可以
设置 HOSTNAME: 
修改 /etc/sysconfig/network 文件中的 HOSTNAME 参数，在本例中假设为 orcl.example.com，需要根据实际情况来更改。
```
HOSTNAME=orcl.example.com
```
>
>修改 hosts 文件
修改 /etc/hosts 文件，为该域名添加本地解析。
```
10.10.10.100 orcl.example.com orcl
```
>根据实际情况，把 IP 地址改为对应网卡的地址。
> 
> 参考该网站配置开机自动启动数据库

#### 参考该网站配置开机自动启动数据库：  

在配置自动启动数据库之前，一定要先解决上面的启动监听器和启动数据库的问题。

详细配置，见虚拟机中的配置文件： /etc/init.d/dboracle

自动配置未能成功，原因有很多细节问题没有注意到。



## 常见错误

#### 错误1：内存太小
远程连接出现如下错误：
```
ORA-01034: ORACLE not available
ORA-27101: shared memory realm(领域，超出) does not exist
Linux-x86_64 Error: 2: No such file or directory
```
使用命令lsnrctl status查看时，看起来状况正常: 
```
Copyright (c) 1991, 2009, Oracle.  All rights reserved.

Connecting to (DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=centos7)(PORT=1521)))
STATUS of the LISTENER
------------------------
Alias                     LISTENER
Version                   TNSLSNR for Linux: Version 11.2.0.1.0 - Production
Start Date                08-OCT-2016 15:30:22
Uptime                    0 days 1 hr. 40 min. 33 sec
Trace Level               off
Security                  ON: Local OS Authentication
SNMP                      OFF
Listener Parameter File   /ora01/app/oracle/product/11.2.0/db_1/network/admin/listener.ora
Listener Log File         /ora01/app/oracle/diag/tnslsnr/localhost/listener/alert/log.xml
Listening Endpoints Summary...
  (DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=10.0.2.15)(PORT=1521)))
Services Summary...
Service "ORA11G" has 1 instance(s).
  Instance "ORA11G", status UNKNOWN, has 1 handler(s) for this service...
The command completed successfully
```

使用sqlplus 也出现提示如下错误：

```
SQL> conn / as sysdba
Connected to an idle instance.  #连接错误；表示数据库没有启动


SQL> select * from all_users;   # 查询时提示的错误提示
select * from all_users
*
ERROR at line 1:
ORA-01034: ORACLE not available
Process ID: 0
Session ID: 0 Serial number: 0
```

使用如下命令提示： 
```
SQL> startup 
ORA-00845: MEMORY_TARGET not supported on this system
```

这让我想起了之前将虚拟机的内存调小到512M，可能问题出现在这里。

关闭虚拟机将内存大小调整到1024后，开机，运行命令 dbstart，即可顺利进行连接。












## 教程
推荐《Oracle数据库精讲与疑难解析》

不要在官方文档上浪费时间了。



















-----------------

下面的文字不用看了。


## 安装（安装未完成之前的文章）
## Fedora and CentOS and ... Oracle Linux
- [Oracle Database 11g Release 2 (11.2) Installation On Fedora 23 (F23)](https://oracle-base.com/articles/11g/oracle-db-11gr2-installation-on-fedora-23) 
[Install Oracle 11G Release 2 (11.2) on Fedora 23](http://dbaora.com/install-oracle-11g-release-2-11-2-on-fedora-23/) 
- [参考1](https://oracle-base.com/articles/11g/oracle-db-11gr2-installation-on-oracle-linux-6)
- [参考2](https://oracle-base.com/articles/11g/oracle-db-11gr2-installation-on-oracle-linux-7)
- [Oracle Linux 6.3下安装Oracle 11g R2(11.2.0.3)](http://blog.csdn.net/leshami/article/details/26356115  "只是他有一系列文章") 
[Oracle 11g在不同系统中的安装教程](http://dbaora.com/oracle-new-features-11g/  "值得一看，该网站还有12c的，和一些安装错误解决方法") 




[Oracle RAC 体验](http://wiki.jikexueyuan.com/project/oraclecluster/overview.html "某研究生在极客学院写的一篇wiki") 




## Debian  
安装步骤已经截图，但依赖不满足，中断了。

- [参考1 ](https://debian-administration.org/article/656/Installing_Oracle11_and_Oracle12_on_Debian_Wheezy_Squeeze "有值得借鉴的地方")
- [参考2：推荐](http://www.cnblogs.com/gaojun/archive/2012/11/22/2783257.html "此处讲的挺多，其它的也多")
- [参考3，讲到了安装之后的图形操作](http://www.linuxidc.com/Linux/2014-04/99893p4.htm  "可省略")
- [参考4：](http://www.dbspecialists.com/oracle-11g-linux-install/)
- [维基百科：VNC](https://zh.wikipedia.org/zh-cn/VNC  "介绍了另一个程序")

**参考1：**中讲到，在服务器上只安装最小的minimal X environment，在这种环境下即可安装Oracle数据库这种软件，无需安装xfce4这种桌面环境(**这是非常好的一个指引**)；其中还提到了vncserver。在参考4 中也提到了 vncserver这个软件，它是一个远程操控软件，但它并不安全，详见维基百科。（能否利用vncserver它避免服务器安装桌面环境... 不能）

> **使用VNC-server :**
>
- [How To Set Up VNC Server on Debian 8](https://www.digitalocean.com/community/tutorials/how-to-set-up-vnc-server-on-debian-8) 
- [VNC ( Virtual Network Computing )](https://wiki.centos.org/HowTos/VNC-Server) 

使用到的命令在 $ORACLE_HOME/bin 目录下。


## 找来找去还是Oracle官方文档详细
但没心情看

#### 安装和卸载

安装硬件需求，最小内存1GB，此时要求交换分区1.5倍RAM。参考下面的安装介绍。

-  [Oracle Database Online Documentation 11g Release 2 (11.2)
Installing and Upgrading](http://docs.oracle.com/cd/E11882_01/nav/portal_11.htm) 
-  [Removing Oracle Database Software](http://docs.oracle.com/cd/E11882_01/install.112/e47689/remove_oracle_sw.htm#LADBI1332) 

官方教程：
[Oracle Database Online Documentation 11g Release 2 (11.2)](http://docs.oracle.com/cd/E11882_01/index.htm) 





--------------------------------

 


## Oracle Database 11g的使用

### Usefull commands
所有命令都需要使用 oracle 用户来执行：  

- check status, start, stop dbconsole
	
	emctl status dbconsole
	emctl start dbconsole
	emctl stop dbconsole

- check status, start, stop listener

	lsnrctl status LISTENER
	lsnrctl start LISTENER
	lsnrctl stop LISTENER
	

另可搜索 "Oracle 基本操作手册"

**解锁scott用户(创始人之一):**  
alter user scott account unlock;
此时其默认密码为：tiger    老虎
scott/tiger 

另见慕课网笔记

###Administrator's Reference for Linux and UNIX-Based Operating Systems
专门针对Linux的[Administrator's Reference for Linux and UNIX-Based Operating Systems](http://docs.oracle.com/cd/E11882_01/server.112/e10839/toc.htm) 

### Linux下启动和关闭Oracle服务和数据库
粗略讲解一下，详细部分见官方文档，或等待下文的翻译。

[安装后的配置](https://tangrui.gitbooks.io/installing-oradb11g-on-centos5-x86_64/content/post_installation_config/README.html) 


了解到编写自动启动关闭数据库的脚本中一般都包含了 lsnrctl 、dbstart/dbshut 两个命令，而不同的教程又包含了不同的第三个命令或者是emctl 或者是其它命令。

emctl 是关于 OEMweb管理方面的命令，可以暂不考虑它，它的启动命令为emctl start dbconsole(启动oem)。

大概涉及三个方面：

1. 启动数据库 
2. 启动监听程序 
3. 启动OEMweb管理（一般不用启动，消耗内存，占用资源）

**启动与关闭数据库**
看到这几种方法：

1. 进入sqlplus：进行连接(连接时并没有指定数据库)；比如 先`sqlplus /nolog`  再`conn  /  as sysdba`再启动数据库：`startup`，关闭数据库：`shutdown` 。（好像没有指定数据库名，可能默认使用环境变量中的配置）
2. 使用直接在命令行bash中使用：dbstart命令启动，dbshut关闭
3. 这是方法 1 的补充`startup nomout`或`startup mount dbname`还有 `startup open dbname` 。。。
	关闭：shutdown 命令，参数：normal(需要在所有用户断开连接后才)，Immediate ，...

> 连接和启动时会花一些时间不要着急。


启动监听器：
监听器主要用来监听用户的连接请求。每个监听程序会占用一个端口 




