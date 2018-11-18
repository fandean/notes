# MySQL



## 1.无法进入MySQL

(斌斌)centos 6.7安装mysql 5.7后
启动服务后，直接输入mysql：出现如下错误：

```
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: NO)
```


在命令行中始终无法登录myslq，但是在数据库管理工具中却可以登录。然后才发现原来是必须使用`mysql -uUserName -p` 回车，然后输入密码的方式进行登录。

示例：  

```shell
[root@centos7 ~]# mysql -ufan 
ERROR 1045 (28000): Access denied for user 'fan'@'localhost' (using password: NO)
[root@centos7 ~]# mysql -ufan -pfan123 
mysql: [Warning] Using a password on the command line interface can be insecure.
ERROR 1045 (28000): Access denied for user 'fan'@'localhost' (using password: YES)
[root@centos7 ~]# mysql -uroot -pfan123
mysql: [Warning] Using a password on the command line interface can be insecure.
ERROR 1045 (28000): Access denied for user 'root'@'localhost' (using password: YES)
[root@centos7 ~]# mysql --version
mysql  Ver 14.14 Distrib 5.7.15, for Linux (x86_64) using  EditLine wrapper

# 成功登录
[root@centos7 ~]# mysql -ufan -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 17
Server version: 5.7.15 MySQL Community Server (GPL)

Copyright (c) 2000, 2016, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> 
```





## 2.Mysql5.7忘记root密码及mysql5.7修改root密码的方法


解决方案参考：<http://www.jb51.net/article/77858.htm>

<http://www.cnblogs.com/kerrycode/p/3861719.html>
此处mysql 5.7修改密码已经改变，参考此处：<http://blog.csdn.net/u010603691/article/details/50379282> 如果使用原来的方式会出现如下错误：  

**MySQL5.7更改密码时出现:**  

```
ERROR 1054 (42S22): Unknown column 'password' in 'field list'
```





>mysql 5.7.6由于密码过期，而更改密码的方法是：ALTER USER 'root'@'localhost' IDENTIFIED BY 'MyNewPass'; 
>这也是常用的更改密码的方式。



## MySQL 密码验证插件
该插件要求密码至少8个字符；至少一个大写字母，一个小写字母，一个数字，一个特殊字符。

更多密码详情见CentOS 7 中 inMySQL.md。

比如root用户的初始密码如何查找。





## 用户管理



```sql
# mysql -u root -p
use mysql;
-- 查看现有 用户, 允许连接的主机, 密码是否已经过期
SELECT User, Host, password_expired FROM user;
```



```sql
-- 修改root密码

mysql> use mysql

Database changed

mysql> update user set password=PASSWORD('123456') where user='root';

Query OK, 0 rows affected (0.00 sec)

Rows matched: 1  Changed: 0  Warnings: 0

mysql> flush privileges;
```



为root用户授权: 

```sql
mysql> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '密码' WITH GRANT OPTION;
mysql> flush privileges;
```







## 开机启动



### CentOS 7

在centos7中服务不在是用`service`这个命令来启动与停止，也不再用`chkconfig`来设置开机启动与否！在 centos7 中**所有对服务的管理**都集中到了`systemctl`当中

`systemctl` 不再依赖/etc/init.d/下的脚本，它是通过配置文件来完成对服务的管理的。

如果直接使用`systemctl start mysql`启动时出现如下错误：

```shell
[root@centos7 ~]# systemctl start mysql
Failed to start mysql.service: Unit not found.
```

查看 `/usr/lib/systemd/system/`下的配置文件，发现有一个 `mysqld.service`文件，需要使用 mysqld 而非 mysql。

```shell
[root@centos7 ~]# systemctl start mysqld
[root@centos7 ~]# systemctl status mysqld
● mysqld.service - MySQL Server
   Loaded: loaded (/usr/lib/systemd/system/mysqld.service; enabled; vendor preset: disabled)
   Active: active (running)
   。。。。
```

通过systemctl 来设置mysql开机启动：(在虚拟机中可以通过挂起虚拟机来实现相同目的)

```shell
[root@centos7 ~]# systemctl enable mysqld
[root@centos7 ~]#
```





[CentOS 7 下开启Mysql-5.7.19远程访问 - CSDN博客](https://blog.csdn.net/u010758410/article/details/76381632 "CentOS 7 下开启Mysql-5.7.19远程访问 - CSDN博客")



开启3306端口: 

```shell
[root@arjenlee ~]# firewall-cmd --zone=public --add-port=3306/tcp --permanent
[root@arjenlee ~]# firewall-cmd --reload 
```





