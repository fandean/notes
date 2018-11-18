---
layout: post
title: "Ubuntu安装java和使用update-java-alternatives进行切换"
description: "ubuntu安装JDK， 设置默认JDK， 使用update-java-alternatives进行切换"
date: 2017-07-22
tags: [开发工具,Linux,Java]
category: 开发工具
last_updated: 2017-07-24
comments: true
chare: true
---

* Kramdown table of contents
{:toc .toc}



# Ubuntu 安装 Java JDK

> 个人觉得：android studio 和 oracle-jdk都不建议使用ppa的方法安装，因为这两个软件较大，建议下载压缩包到/opt，再进行设置。这样以后更换系统或者电脑时直接把/opt目录复制过去即可。


## 切换jdk涉及到的命令
- update-alternatives
- update-java-alternatives : 通过`sudo apt install java-common`安装


查看java版本的命令：
```
java -version
```
注意：这里不是`java --version`，被这个坑了。

> update-alternatives命令的学习可参考： [update-alternatives](/blog/2017/07/22/update-alternatives/)


## 安装open-jdk
```
sudo apt-get install openjdk-8-jdk
```


附：安装后自动设置的update-alternatives
```
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/rmid 来在自动模式中提供 /usr/bin/rmid (rmid)
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java 来在自动模式中提供 /usr/bin/java (java)
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/keytool 来在自动模式中提供 /usr/bin/keytool (keytool)
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/jjs 来在自动模式中提供 /usr/bin/jjs (jjs)
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/pack200 来在自动模式中提供 /usr/bin/pack200 (pack200)
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/rmiregistry 来在自动模式中提供 /usr/bin/rmiregistry (rmiregistry)
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/unpack200 来在自动模式中提供 /usr/bin/unpack200 (unpack200)
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/orbd 来在自动模式中提供 /usr/bin/orbd (orbd)
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/servertool 来在自动模式中提供 /usr/bin/servertool (servertool)
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/tnameserv 来在自动模式中提供 /usr/bin/tnameserv (tnameserv)
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/jexec 来在自动模式中提供 /usr/bin/jexec (jexec)
正在设置 openjdk-8-jre:amd64 (8u131-b11-0ubuntu1.16.04.2) ...
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/policytool 来在自动模式中提供 /usr/bin/policytool (policytool)
正在设置 openjdk-8-jdk-headless:amd64 (8u131-b11-0ubuntu1.16.04.2) ...
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/bin/idlj 来在自动模式中提供 /usr/bin/idlj (idlj)
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/bin/jdeps 来在自动模式中提供 /usr/bin/jdeps (jdeps)
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/bin/wsimport 来在自动模式中提供 /usr/bin/wsimport (wsimport)
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/bin/rmic 来在自动模式中提供 /usr/bin/rmic (rmic)
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/bin/jinfo 来在自动模式中提供 /usr/bin/jinfo (jinfo)
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/bin/jsadebugd 来在自动模式中提供 /usr/bin/jsadebugd (jsadebugd)
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/bin/native2ascii 来在自动模式中提供 /usr/bin/native2ascii (native2ascii)
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/bin/jstat 来在自动模式中提供 /usr/bin/jstat (jstat)
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/bin/javadoc 来在自动模式中提供 /usr/bin/javadoc (javadoc)
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/bin/javah 来在自动模式中提供 /usr/bin/javah (javah)
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/bin/jstack 来在自动模式中提供 /usr/bin/jstack (jstack)
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/bin/jrunscript 来在自动模式中提供 /usr/bin/jrunscript (jrunscript)
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/bin/javac 来在自动模式中提供 /usr/bin/javac (javac)
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/bin/javap 来在自动模式中提供 /usr/bin/javap (javap)
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/bin/jar 来在自动模式中提供 /usr/bin/jar (jar)
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/bin/extcheck 来在自动模式中提供 /usr/bin/extcheck (extcheck)
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/bin/schemagen 来在自动模式中提供 /usr/bin/schemagen (schemagen)
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/bin/jps 来在自动模式中提供 /usr/bin/jps (jps)
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/bin/xjc 来在自动模式中提供 /usr/bin/xjc (xjc)
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/bin/jmap 来在自动模式中提供 /usr/bin/jmap (jmap)
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/bin/jstatd 来在自动模式中提供 /usr/bin/jstatd (jstatd)
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/bin/jhat 来在自动模式中提供 /usr/bin/jhat (jhat)
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/bin/jdb 来在自动模式中提供 /usr/bin/jdb (jdb)
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/bin/serialver 来在自动模式中提供 /usr/bin/serialver (serialver)
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/bin/wsgen 来在自动模式中提供 /usr/bin/wsgen (wsgen)
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/bin/jcmd 来在自动模式中提供 /usr/bin/jcmd (jcmd)
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/bin/jarsigner 来在自动模式中提供 /usr/bin/jarsigner (jarsigner)
正在设置 openjdk-8-jdk:amd64 (8u131-b11-0ubuntu1.16.04.2) ...
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/bin/appletviewer 来在自动模式中提供 /usr/bin/appletviewer (appletviewer)
update-alternatives: 使用 /usr/lib/jvm/java-8-openjdk-amd64/bin/jconsole 来在自动模式中提供 /usr/bin/jconsole (jconsole)
```


## 安装orecle-jdk

### 安装方式一：使用ppa

使用第三方源，ppa地址: <https://launchpad.net/~webupd8team/+archive/ubuntu/java>   

```
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer 

# 下面两条命令在安装过程中安装器会提示你是否同意 oracle 的服务条款
# 安装 java 8
sudo apt-get install oracle-java8-installer
# 安装 java 7
sudo apt-get install oracle-java7-installer

# 也可使用下面的两条命令，默认就同意oracle的服务条款
# JDK7 默认同意条款: 使用下面的命令
echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
# JDK8 默认同意条款: 使用下面的命令
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
```


附：安装时update-alternatives的输出
```
update-alternatives: using /usr/lib/jvm/java-8-oracle/jre/bin/ControlPanel to provide /usr/bin/ControlPanel (ControlPanel) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/jre/bin/java to provide /usr/bin/java (java) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/jre/bin/javaws to provide /usr/bin/javaws (javaws) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/jre/bin/jcontrol to provide /usr/bin/jcontrol (jcontrol) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/jre/bin/jjs to provide /usr/bin/jjs (jjs) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/jre/bin/keytool to provide /usr/bin/keytool (keytool) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/jre/bin/orbd to provide /usr/bin/orbd (orbd) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/jre/bin/pack200 to provide /usr/bin/pack200 (pack200) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/jre/bin/policytool to provide /usr/bin/policytool (policytool) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/jre/bin/rmid to provide /usr/bin/rmid (rmid) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/jre/bin/rmiregistry to provide /usr/bin/rmiregistry (rmiregistry) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/jre/bin/servertool to provide /usr/bin/servertool (servertool) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/jre/bin/tnameserv to provide /usr/bin/tnameserv (tnameserv) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/jre/bin/unpack200 to provide /usr/bin/unpack200 (unpack200) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/jre/lib/jexec to provide /usr/bin/jexec (jexec) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/appletviewer to provide /usr/bin/appletviewer (appletviewer) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/extcheck to provide /usr/bin/extcheck (extcheck) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/idlj to provide /usr/bin/idlj (idlj) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/jar to provide /usr/bin/jar (jar) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/jarsigner to provide /usr/bin/jarsigner (jarsigner) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/javac to provide /usr/bin/javac (javac) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/javadoc to provide /usr/bin/javadoc (javadoc) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/javafxpackager to provide /usr/bin/javafxpackager (javafxpackager) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/javah to provide /usr/bin/javah (javah) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/javap to provide /usr/bin/javap (javap) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/javapackager to provide /usr/bin/javapackager (javapackager) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/jcmd to provide /usr/bin/jcmd (jcmd) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/jconsole to provide /usr/bin/jconsole (jconsole) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/jdb to provide /usr/bin/jdb (jdb) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/jdeps to provide /usr/bin/jdeps (jdeps) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/jhat to provide /usr/bin/jhat (jhat) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/jinfo to provide /usr/bin/jinfo (jinfo) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/jmap to provide /usr/bin/jmap (jmap) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/jmc to provide /usr/bin/jmc (jmc) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/jps to provide /usr/bin/jps (jps) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/jrunscript to provide /usr/bin/jrunscript (jrunscript) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/jsadebugd to provide /usr/bin/jsadebugd (jsadebugd) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/jstack to provide /usr/bin/jstack (jstack) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/jstat to provide /usr/bin/jstat (jstat) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/jstatd to provide /usr/bin/jstatd (jstatd) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/jvisualvm to provide /usr/bin/jvisualvm (jvisualvm) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/native2ascii to provide /usr/bin/native2ascii (native2ascii) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/rmic to provide /usr/bin/rmic (rmic) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/schemagen to provide /usr/bin/schemagen (schemagen) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/serialver to provide /usr/bin/serialver (serialver) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/wsgen to provide /usr/bin/wsgen (wsgen) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/wsimport to provide /usr/bin/wsimport (wsimport) in 自动模式
update-alternatives: using /usr/lib/jvm/java-8-oracle/bin/xjc to provide /usr/bin/xjc (xjc) in 自动模式
update-binfmts: warning: current package is oracle-java8, but binary format already installed by openjdk-7
Oracle JDK 8 installed
update-alternatives: using /usr/lib/jvm/java-8-oracle/jre/lib/amd64/libnpjp2.so to provide /usr/lib/mozilla/plugins/libjavaplugin.so (mozilla-javaplugin.so) in 自动模式
Oracle JRE 8 browser plugin installed
```


> 如果installer下载速度很慢,可以中断操作，然后去官网下载相应jdk的压缩包,放在:`/var/cache/oracle-jdk7-installer`(jdk7) 或者`/var/cache/oracle-jdk8-installer` (jdk8) 下面,然后再安装一次installer. installer 则会默认使用 你下载的tar.gz包。

> 参考：
- [Install Oracle Java 8 In Ubuntu Or Linux Mint Via PPA Repository](http://www.webupd8.org/2012/09/install-oracle-java-8-in-ubuntu-via-ppa.html)  
- [Ubuntu 安装 JDK 7 / JDK8 的两种方式 - 水是全海大 - 博客园](http://www.cnblogs.com/a2211009/p/4265225.html "Ubuntu 安装 JDK 7 / JDK8 的两种方式 - 水是全海大 - 博客园") 



### 安装方式二：下载压缩包

#### 1.下载
下载： jdk-8u××-linux-x64.tar.gz压缩包 [Java SE Development Kit 8 - Downloads](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html "Java SE Development Kit 8 - Downloads")，解压到/opt 。

#### 2.设置环境变量
设置Java所需的系统环境变量：假设解压后的路径为 `/opt/jdk1.8.0_91`
```shell
export JAVA_HOME=/opt/jdk1.8.0_91
export JRE_HOME=$JAVA_HOME/jre
export CLASSPATH=.:$CLASSPATH:$JAVA_HOME/lib:$JRE_HOME/lib
export PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin
```

#### 3.使用 update-alternatives 切换 java 

这里提前讲解使用update-alternatives切换java，因为它一般只在这里使用；其它情况下推荐使用update-java-alternatives来进行切换。

1.先使用`update-alternatives`安装几个java相关的alternative(就叫它"候选项"吧) 
```shell
JAVAHOME="压缩包解压后的路径"
sudo update-alternatives --install /usr/bin/java java $JAVAHOME/bin/java 300
sudo update-alternatives --install /usr/bin/javac javac $JAVAHOME/bin/javac 300
sudo update-alternatives --install /usr/bin/javaws javaws $JAVAHOME/bin/javaws 300
```

> 还记得上面通过apt-get或者dpkg安装的jdk的deb包时，update-alternatives命令的输出吗？是不是很长，那是自动的，这里手动运行我们就只弄这几个了。


2.如果想使用该java版本，则通过`update-alternatives`切换该java相关的alternative    

```shell
sudo update-alternatives --config javac
sudo update-alternatives --config java
sudo update-alternatives --config javaws
```



**补充：**

默认情况下alternatives将自动安装最佳版本的Java作为默认版本。如果使用命令`update-alternatives --config java`更改了alernatives后 (变成了manually select手动选择) 想设置回默认值，可以使用`update-alternatives --auto java`。

手动选择 alternatives:   
```shell
# 先查看
update-alternatives --display java
# 再更改
update-alternatives --config java 
# 然后选择某个 alternatives 对应的数字
```
The appropriate java binary will automatically be in PATH（相应的java二进制文件将自动在PATH中） by virtue of the `/usr/bin/java` alternative symlink.
```shell
$ ll /usr/bin/java
lrwxrwxrwx 1 root root 22 7月  22 19:37 /usr/bin/java -> /etc/alternatives/java*
```


## 使用update-java-alternatives切换java

也可选择使用 `update-java-alternatives` 进行切换，但还要进行更多的设置。


> `update-java-alternatives`没有提供类似`--install`的选项
> 也可以通过之前安装时的输出进行设置，不过真的很多。

> 参考：  
[How do I make java default to a manually installed JRE/JDK? - Ask Ubuntu](https://askubuntu.com/questions/159575/how-do-i-make-java-default-to-a-manually-installed-jre-jdk "How do I make java default to a manually installed JRE/JDK? - Ask Ubuntu")   
[JavaPackage - Debian Wiki](https://wiki.debian.org/JavaPackage "JavaPackage - Debian Wiki")  
[update-java-alternatives vs update-alternatives --config java - Ask Ubuntu](https://askubuntu.com/questions/315646/update-java-alternatives-vs-update-alternatives-config-java "update-java-alternatives vs update-alternatives --config java - Ask Ubuntu")   



### update-java-alternatives介绍

你也看到了上面安装一个jdk最后会使用`update-alternatives`设置n多的alternatives。

那么在每次切换java的jre或jdk时我们需要同时对他们进行切换就非常麻烦，这时可以使用`update-java-alternatives`，它允许您一次更新属于一个runtime/development kit的所有alternatives。    

> java-common 提供了 `update-java-alternatives` 命令。
查看man文档 `man update-java-alternatives`可知，存在一个配置文档`/usr/lib/jvm/.*.jinfo`


### 切换使用apt-get或dpkg安装的jdk

这样安装的jdk，默认就设置了`/usr/lib/jvm/.*.jinfo`文件；并使用了`update-alternatives --install`设置安装了所需的候选项；所以可以直接进行切换即可。

先查看已经配置好的java版本可供选择（输出的第一列的名称，我们把它叫做jname吧）：
```shell
sudo update-java-alternatives -l
```
再进行切换：
```shell
sudo update-java-alternatives -s <jname>
```


### 切换通过压缩包安装的jdk

相比前面的切换这里还要先进行一些配置。假设 jdk 保存路径为 `/opt/jdk1.8.0_91/`。

步骤：
- 使用`update-alternatives --install`设置安装所需的候选项(由于候选项太多，所以将其全部写在一个脚本文件中)
- 创建`/usr/lib/jvm/.*.jinfo`文件（这是一个隐藏文件以.开头）
- 创建链接到`/opt/jdk1.8.0_91/`的软链接
- 运行`update-java-alternatives -l`命令查看是否已经添加了该候选项。
- 运行`update-java-alternatives -s <jname>`进行切换。

使用到的两个脚本文件见： [Ubuntu安装oracle jdk alternatives和配置update-java-alternatives的脚本](https://gist.github.com/FanDean/4f2bad05d638e1bfec6421748c64d732)

操作演示见：[orecle-jdk-alternatives - asciinema](https://asciinema.org/a/RX1Vw2d90kZmP6wmBmE3deZY4 "orecle-jdk-alternatives - asciinema")



也可以参考`/usr/lib/jvm/`目录下的现有配置：
```
$ ll /usr/lib/jvm/
总用量 24K
drwxr-xr-x   3 root root 4.0K 7月  22 19:37 ./
drwxr-xr-x 140 root root  12K 7月  23 00:07 ../
lrwxrwxrwx   1 root root   20 5月   6 11:55 java-1.8.0-openjdk-amd64 -> java-8-openjdk-amd64/
-rw-r--r--   1 root root 2.6K 5月   6 11:55 .java-1.8.0-openjdk-amd64.jinfo
drwxr-xr-x   7 root root 4.0K 7月  22 19:37 java-8-openjdk-amd64/
```
由此可知，openjdk-8直接安装到了 `/usr/lib/jvm/java-8-openjdk-amd64`下面；然后添加了一个软链接和一个隐藏的`.jinfo`文件。


> 参考：  
[Generate ".jdk1.8.jinfo" and "alternatives.sh" files to install java 8 using ubuntu alternatives.](https://gist.github.com/olagache/a2eff8b2bbc95e03280b)   
[ancho/jinfo-alternatives: Install custom java alternatives on debian based distros with jinfo-files](https://github.com/ancho/jinfo-alternatives "ancho/jinfo-alternatives: Install custom java alternatives on debian based distros with jinfo-files")   

