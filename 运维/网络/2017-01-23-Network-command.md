---
layout: post
title: "Network Command"
description: "介绍了一些简单的cmd网络命令"
date: 2017-01-23
tags: [网络]
category: 网络
comments: true
share: true
---



* Kramdown table of contents
{:toc .toc}


> Windows中使用的相关命令

## 相关命令

type 查看文本文件內容
more 分屏顯示；-p 显示下一屏之前先清屏。與管道結合。
dir /p ：分屏顯示結果

echo 輸出換行：
```cmd
echo,>test.txt    #注意：echo與各標點之間沒有空格
echo.>test.txt
echo:>test.txt
echo;>test.txt
```


## NAT
[端口映射](http://baike.baidu.com/view/765.htm)是NAT的一种，功能是把在公网的地址转翻译成私有地址， 采用路由方式的ADSL宽带路由器拥有一个动态或固定的公网IP，ADSL直接接在HUB或交换机上，所有的电脑共享上网。



## ping
[PING命令入门详解](http://www.linkwan.com/gb/tech/htm/928.htm)

ping /?
**ping -a** 選項：Resolve addresses to hostnames.

```cmd
D:\tmp>ping -a 192.168.5.18
Pinging kh-gp12.radiant.com.tw [192.168.5.18] with     #在此解析

Reply from 192.168.5.18: bytes=32 time=42ms TTL=58
...
Ping statistics for 192.168.5.18:
    Packets: Sent = 4, Received = 4, Lost = 0 (0% l
...
```

Ping 

　　使用格式：ping [-t] [-a] [-n count] [-l size] 

　　参数介绍： 

　　-t 让用户所在的主机不断向目标主机发送数据 

　　-a 以IP地址格式来显示目标主机的网络地址 

　　-n count 指定要ping多少次，具体次数由后面的count来指定 

　　-l size 指定发送到目标主机的数据包的大小 

　　主要功能：用来测试一帧数据从一台主机传输到另一台主机所需的时间，从而判断主响应时间。 

　　详细介绍： 

　　该命令主要是用来检查路由是否能够到达，由于该命令的包长非常小，所以在网上传递的速度非常快，可以快速地检测你要去的站点是否可达，一般你在去某一站点时可以先运行一下该命令看看该站点是否可达。如果执行Ping不成功，则可以预测故障出现在以下几个方面：网线是否连通，网络适配器配置是否正确，IP地址是否可用等；如果执行Ping成功而网络仍无法使用，那么问题很可能出在网络系统的软件配置方面，Ping成功只能保证当前主机与目的主机间存在一条连通的物理路径。它的使用格式是在命令提示符下键入：Ping　IP地址或主机名，执行结果显示响应时间，重复执行这个命令，你可以发现Ping报告的响应时间是不同的。具体的ping命令后还可跟好多参数，你可以键入ping后回车其中会有很详细的说明。 

　　举例说明： 

　　当我们要访问一个站点例如www.chinayancheng. net时，就可以利用Ping程序来测试目前连接该网站的速度如何。输入Ping和用户要测试的网址，例如ping www.chinayan- cheng.net，接着该程序就会向指定的Web网址的主服务器发送一个32字节的消息，然后，它将服务器的响应时间记录下来。Ping程序将会向用户显示4次测试的结果。响应时间低于300毫秒都可以认为是正常的，时间超过400毫秒则较慢。出现“请求暂停（Request time out）”信息意味着网址没有在1秒内响应，这表明服务器没有对Ping做出响应的配置或者网址反应极慢。如果你看到4个“请求暂停”信息，说明网址拒绝Ping请求。因为过多的Ping测试本身会产生瓶颈，因此，许多Web管理员不让服务器接受此测试。如果网址很忙或者出于其他原因运行速度很慢，如硬件动力不足，数据信道比较狭窄，过一段时间可以再试一次以确定网址是不是真的有故障。如果多次测试都存在问题，则可以认为是用户的主机和该网址站点没有联接上，用户应该及时与因特网服务商或网络管理员联系。 



## ipconfig



```bash
# 查看帮助
ipconfig /?
# 查看ip地址
ipconfig
ipconfig /all
# 清除系统的DNS缓存
ipconfig /flushdns
```





## telnet

在Windows中需要先开启telnet，`控制面板 -> 程序和功能-> 启用或关闭Windows功能->Telet客户端` 

测试某个端口是否开启 :

```
telnet 192.168.3.42 2121
```



> ```
> netstat -anp tcp  可以查看当前主机tcp开放了哪些端口
> ```








## tracert

- -d 不將地址解析成主機名


> 有3种方式用来探测一个数据包从源点到目的地经过了哪些中转路由器，这3种方式分别是：基于记录路由选项的路由探测，基于UDP协议的路由探测，基于ICMP Echo Request的路由探测。三种方式都可以用来探测一个数据包到达目的设备经过了哪些中间路由器，但实现的过程却截然不同。



## pathping
pathping是tracert和ping的混合體。
`pathping www.baidu.com`:的結果，第一部分显示到达目的地经过了哪些路由，第二部分显示了路径中每个路由器上数据包丢失方面的信息。

## arp






## net
net view ： 显示域中的共享资源。
net user : 添加或修改用户账户，或显示用户账户信息（修改密码...）
net use: 控制共享资源。将计算机的共享资源连接或断开，或者显示...。指派连接的设备（比如磁盘，打印机），指定访问共享资源所需的密码。
net statistics：显示统计日志
net share：操作共享资源
net session：设置计算机之间的对话
net print：控制打印服务
net localgroup：添加显示修改本地组
net group:全局组
net help、net /? 、net use /help 、 net help use、net use /?
net file： 显示共享的文件名
net config：
nbtstat：显示统计数据



### netstat
显示协议统计和当前的TCP/IP网络连接。

- -a : 查看当前主机的网络通信状态
- -r:显示路由表的内容
- -an ：解析当前连接主机的IP地址，并反馈连接端口状态。



可以查看当前主机tcp开放了哪些端口：

```
netstat -anp tcp  
```



`findstr "关键字"`



```
netstat -anp | findstr "80"
```





### nslookup

[百度百科nslookup](http://baike.baidu.com/item/nslookup)
显示DNS服务器的信息
Nslookup(name server lookup)( 域名查询):是一个用于查询 Internet域名信息或诊断DNS 服务器问题的工具.

輸入一個主機名發現相應的IP地址；它也會相反的名字查找為一個你指定的IP住址找出主機名。

nslookup 发送域名查询包给指定的（或默认的）域名系统（DNS）服务器。

当前的DNS服务器 ,可用server命令改变。
DNS有两种，一是普通DNS，一是根DNS，兩者的區別見百科。(私有IP的解析，需使用本地DNS服務器)
根DNS不能设置转发查询，也就是说根DNS不能主动向其他DNS发送查询请求。如果内部网络的DNS被设置为根DNS，则将不能接收网外的合法域名查询。
- name 
- set all




### whois
[移動區段查詢](http://ipwhois.cnnic.cn/bns/query/Query/ipwhoisQuery.do?queryOption=ipv4&txtquery=183.233.129.111&x=40&y=15 )   
[聯通區段查詢](http://ipwhois.cnnic.cn/bns/query/Query/ipwhoisQuery.do?queryOption=ipv4&txtquery=58.249.122.107&x=29&y=15)   
[Server Room]()

Server Room:　218.107.12.117  中國聯通



**私有地址**
私有地址（Private address）属于非注册地址，专门为组织机构内部使用。
以下列出留用的内部私有地址
```
A类 10.0.0.0--10.255.255.255
B类 172.16.0.0--172.31.255.255
C类 192.168.0.0--192.168.255.255
```





## FTP
[Windows命令行使用FTP](http://www.cnblogs.com/whseay/p/3456038.html)   
[ftp 命令](http://www.ibm.com/support/knowledgecenter/zh/ssw_aix_71/com.ibm.aix.cmds2/ftp.htm)   
利用FTP上传文件夹：   
md 文件夹名字   
cd 文件夹名字   
mput *   
mget *    

mput 一次上传多个文件  





## hosts文件的別名機制

```
<ip>		<別名> 	<主機名>

192.168.0.161   uxprd1 uxprd1.radt.cn
192.168.0.212   uxprd2 uxprd2.radt.cn
192.168.0.142   uxprd3 uxprd3.radt.cn
```
可以ping同這些別名，所以不需要再在 hosts 文件中添加這些items。




