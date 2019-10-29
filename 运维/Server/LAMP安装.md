Fedora 23 安装Apache/MySQL/PHP
=====================================

[toc]

1.开源数据库
-------------------------

###1.1 mariaDB数据库

[mariaDB](http://baike.baidu.com/link?url=F084oi4gyq25AfrVZnYgkhR_GRcQTdYDaWxAPBvI3DVau86nMZjP_tXi6mjj4BjOGT-2VQFNEsZgMOZYSeuP-_ "百度百科")

MariaDB数据库管理系统是MySQL的一个分支，主要由开源社区在维护，采用GPL授权许可 MariaDB的目的是完全兼容MySQL，包括API和命令行，使之能轻松成为MySQL的代替品。 MariaDB由MySQL的创始人Michael Widenius（英语：Michael Widenius）主导开发，MariaDB名称来自Michael Widenius的女儿Maria的名字。

MariaDB 的API和协议兼容MySQL，由于担心甲骨文MySQL的一个更加封闭的软件项目，Fedora计划在Fedora 19中的以MariaDB取代MySQL。

在Fedora 23 上用`yum`安装 MySQL 时会默认安装 mariadb 

```
yum install mariadb mariadb-server  #或者安装 mysql mysql-server 也一样会安装 mariadb 

systemctl start mariadb			  #启动mariadb

systemctl enable mariadb 			# 开机启动

mysql_secure_installation			#设置root密码等

mysql -uroot -p123456				#测试登录，可以直接使用 mysql 的命令，兼容
```


###1.2 PostgreSQL数据库

[PostgreSQL新手入门](http://www.ruanyifeng.com/blog/2013/12/getting_started_with_postgresql.html "阮一峰")

PostgreSQL是以加州大学伯克利分校计算机系开发的对象关系型数据库管理系统（ORDBMS）。PostgreSQL支持大部分 SQL标准并且提供了许多其他现代特性：复杂查询、外键、触发器、视图、事务完整性、MVCC。同样，PostgreSQL 可以用许多方法扩展，比如， 通过增加新的数据类型、函数、操作符、聚集函数、索引。

PostgreSQL 开发者把它拼读为 "post-gress-Q-L"。它也经常被简略念为 "postgres"






2.Apache 2 服务器
--------------------------

[Apache](http://baike.baidu.com/link?url=Xnp1_g8G2kiwIGrJHb5kJp7uUx-80hwt85uOIni369i5Bk02_R10DNe3zp9mW26I0Ia80_c_y5zBPN3-TyjYnNmS8IcxSywvcdX-y5C8Lc3 "百度百科：带有Debian的安装配置")

Apache HTTP Server（简称Apache）是Apache软件基金会的一个开放源码的网页服务器，是最流行的Web服务器端软件之一。


###2.1 Apache安装、启动、防火墙设置

**安装命令：**
```
yum install httpd		#安装apache 

systemctl start httpd.service 		#启动 apache

systemctl enable httpd.service 		#开机启动 apache 


```

另外还有这些命令，以后要把它们的区别搞清楚：

```
启动/关闭Apache服务:
service httpd start
service httpd stop

或者命令启动/关闭Apache:
/etc/init.d/httpd start
/etc/init.d/httpd stop

设置apache服务开机自动启动
chkconfig –level 235 httpd on
或直接
chkconfig httpd on

查看httpd服务的启动状态
chkconfig --list httpd						(会显示httpd在各个级别(level)下的启动状态)

检查httpd是否在listen 80端口，选项p加入 
netstat -tlnp | grep 80 
```



**防火墙设置**
(胡乱抄写)  

检查防火墙设置   
默认情况下，端口80和3306是拒绝访问的，在防火墙上进行配置：   

```
vi /etc/sysconfig/iptables(在"COMMIT"的上一行加上如下两句) 
 -A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT（允许80端口通过防火墙）
 -A INPUT -m state --state NEW -m tcp -p tcp --dport 3306 -j ACCEPT（允许3306端口通过防火墙） 
 
接着重启防火墙使得配置生效：/etc/init.d/iptables restart

实在不行，关闭防火墙： /etc/init.d/iptables stop
```




###2.2 Apache配置文件

[Apache配置详解](http://liudaoru.iteye.com/blog/336338)

Fedora 系统中Apache默认根目录为`/var/www/html`    
配置文件位于 `/etc/httpd/conf/httpd.conf`   
其他配置文件位于 `/etc/httpd/conf.d`  




