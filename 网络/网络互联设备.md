# 网络互联设备

标签（空格分隔）： 网络

---


## TCP/IP知识


TCP/IP

|   分层名称   |   协议(程序)     |   功能   |   功能概览   |   设备    | 软件层面 |
|------------- |----------------- |-------------- |--------------- |------------- |---------- |
|应用层 | DNS、URI、HTTP、TLS/SSL、SMTP、IMAP、SSH、FTP、TELNET、...|针对特定应用的协议| | 4~7层交换机 |应用程序|
|传输层|TCP、UDP、UDP-Lite、SCTP、DCCP |管理（重发、校验、确认）两个节点之间的数据传输，负责可靠连接 |在两个主机之间创建逻辑上的通信连接；让应用程序之间实现通信，识别各种端口号 | |操作系统|
|互联网层（网络层）|IP、ARP、ICMP  |地址管理与路由选择| 将数据传输到最终目标地址，端对端【宏观调控】|路由器：连接任意两个数据链路，根据IP将分组报文发送给另一个路由器 |操作系统|
|网卡层（网络接口层，数据链路层）| |互联设备之间传送和识别数据帧，数据帧的生成和接收|数据帧与比特流之间的转换，实现每个区间的通信【微观调控】|网桥：根据数据帧内容（MAC地址等）转发数据给相邻网络，基本只用于连接相同类型的而网络|设备驱动程序与网络接口|
|硬件（物理层）| |以0和1代表电压的高低，界定连接器和网线的规格|比特流与电子信号之间的转换|中继器（集线器）：通过物理层的连接延长网络，对减弱的信号进行增强和发送| |


数据链路（可指OSI中的数据链路层或通信手段）名：以太网、无线、ATM、FDDI   

数据链路层可进一步分为两层：    

- 介质访问控制层（MAC）：根据不同数据链路所特有的首部信息进行控制   
- 逻辑链路控制层（LLC）：根据不同数据链路所共有帧头信息进行控制。   

以太网帧格式：`前导码 + 以太网帧本体(目标MAC、源MAC、类型、数据、FCS)`

分组交换协议。分组交换机（路由器）。    
IP协议的作用是将分组数据包发送到目的主机。   
ARP从分组数据包的IP地址中解析出物理地址的一种协议。   


## 网络互连设备
组成因特网的各个网络叫做**子网**，用于连接子网的设备叫做中间系统（Intermediate System，IS）。中间系统可以是一个单独的设备，也可以是一个网络。另见《图解TCP/IP》   
互联设备（依据概念分类）：   


中继器（集线器）--> 物理层  
网桥和交换机 --> 数据链路层  
路由器和三层交换机 -->  网络层  
网关  -->  网络层以上的协议层  

> 在实际的网络互连产品中可能是几种功能的组合，从而可以提供更复杂的网络互联服务。


### 中继器（Repeater）
中继器工作与物理层


### 网桥（Bridge）
数据链路层。  
分析数据帧地址字段，以决定是否把收到的帧转发到另一个网段上。  
网桥检查帧的源地址和目标地址，如果目标地址和源地址不在同一个网段上，就把帧转发到另一个网段上。所以网桥能起到过滤帧的作用（可以利用该功能调节网络负载，提高通信效率）。   
网桥可以连接不同传输介质的网络，比如同轴电缆以太网和双绞线以太网之间的互联，或以太网与令牌环网之间。  
网桥工作于MAC子层，只要两个网络**MAC子层以上的协议相同**，都可以用网桥互联。   

以太网中广泛使用的**交换机是一种多端口网桥**，每个端口都可以连接一个局域网。   


### 交换机（Switch）
数据链路层。

>某学校的系列文章 [电力...系列PDF](http://www.vr.ncue.edu.tw/esa/a1012/)   
包含網路配線(ch09.pdf)，電話佈線和實務（ch07.pdf）水電設計和維修實務、水龍頭實務、馬桶原理與實務、淨水器原理、電視電纜佈線和實務等   
[電話佈線和實務](http://www.vr.ncue.edu.tw/esa/a1012/ch07.pdf)   
[網路配線](http://www.vr.ncue.edu.tw/esa/a1012/ch09.pdf)  

书籍： 《交换机·路由器·防火墙》

Cisco Catalyst智能交换机   
[Cisco Catalyst 2960-L Series Switches产品手册和资料](http://www.cisco.com/c/zh_cn/products/switches/catalyst-2960-l-series-switches/literature.html)   
[思科 Catalyst 2960系列交换机详细规格及参数](http://www.ict361.com/cisco-technology/109.html)   

思科 Catalyst 2960系列:   
产品类型	智能交换机  
应用层级：二层   
交换方式：存储-转发  
MAC地址表：8K   
VLAN：支持 （不确定）   
![](https://img.alicdn.com/imgextra/i1/761876735/TB2vmaZXVXXXXaXXXXXXXXXXXXX_!!761876735.jpg)    

思科 Catalyst 2960系列某产品的参数：   
![](https://img.alicdn.com/imgextra/i2/761876735/TB2ewWZXVXXXXbZXXXXXXXXXXXX_!!761876735.jpg)   
![](https://img.alicdn.com/imgextra/i3/761876735/TB2SlCYXVXXXXcaXpXXXXXXXXXX_!!761876735.jpg)   



[如果路由器与交换机忘记密码怎么办？](http://www.ict361.com/160.html)   
[Catalyst2960交换机基本配置](http://wenku.baidu.com/view/90649537a98271fe910ef9cb.html)   

交换机CLI配置界面（IOS Command Line Interface）：  
```
Switch>
Switch>enable
Switch#
```


### 路由器（Router）
网络层。   
路由器根据网络逻辑地址在互连的子网之间传递分组。一个子网可能对应于一个物理网段，也可能对应于几个物理网段。它工作于网络层，因而可以用于连接下面三层执行不同协议的网络，协议的转换由路由器完成，从而消除了网络层协议之间的差别，通过路由器连接的子网在网络层之上必须执行相同的协议。


路由器CLI配置界面：
```
Router>
Router>enable
Router#
Router(config)# username root secret My$Password
```

### 网关（Gateway）
网络层以上的协议层。




## 广域网互连
广域网的互连一般采用在网络层进行协议转换的办法实现。这里使用的互连设备较做网关，更确切的说是路由器。








## 网络仿真软件

[网络仿真软件](http://baike.baidu.com/view/2416838.htm)   
[（一）Ns3网络仿真软件简单介绍](http://blog.csdn.net/finded/article/details/45096883) 系列文章。   
[Cisco Packet Tracer 简易教程](jsjxy.shiep.edu.cn/network/files/Packet_Tracer_使用教程.pdf )   
作为一个学生太过专业的模拟器也并不见得适合，作为一名学生在刚刚入门学习网络Cisco的模拟器对学习网络拓扑的构建以及路由交换机制的了解都有着不错的效果。  

[Packet Tracer 5.0 网络模拟软件深入分析](http://jiangxuezhi.blog.51cto.com/839007/349465) 系列文章。  

[Cisco Packet Tracer 6.2 for Windows Student Version](https://onedrive.live.com/?authkey=%21AK6Ipa_CDwUTBEo&cid=071D2D0C5E7E691A&id=71D2D0C5E7E691A%21227&parId=root&action=locate)   
[Cisco Packet Tracer 7.0 32bit & 64bit for Windows Free Download](http://ccna-v5.net/cisco-packet-tracer-7-0-32bit-64bit-windows-free-download.html)   
[Cisco Networking Academy(学院)](https://www.netacad.com/zh/about-networking-academy/packet-tracer/ "已注册")  





入门级：

- Cisco Packet Tracer
- [华为eNSP](http://support.huawei.com/enterprise/en/network-management/ensp-pid-9017384/)
- H3C H3C Cloud Lab

华为公司的eNSP模拟器和虚拟机软件VMware，用它们搭建实验平台用于缓解教学设备不够的情况。虽然思科也有很多模拟软件如GNS3、Packet tracer和Web IOU，但GNS3缺少交换设备，Packet tracer的模拟功能又很有限，Web IOU的安装又不如华为的eNSP简单，因此在此推荐华为公司的eNSP软件和虚拟机软件VMware来解决设备短缺的问题。 


### [网络模拟软件NS2与OPNET的剖析比较(2010)](http://www.c-s-a.org.cn/ch/reader/create_pdf.aspx?file_no=20100623)
OPNET具有商业软件的优势，在用户友好性、模拟速度、内存消耗等方面优于NS2，而NS2则在开源和易扩展性方面优于OPNET，适合于模拟中小型网络。

NS(Network Simulator)与OPNET(Optimized  Network  Engineering  Tool)以 及OMNeT++和SSFNet 等，其中在教育、科研、商业等领域使用最广泛的是NS2与OPNET.

NS从原始版本进化到较成熟版本NS2，最新版本NS3也已经面世。虽然NS3版本较NS2新，但它是一个全新的模拟器，不向下兼容前一版的NS2，不支持NS2的API[2]，在诸多方面与NS2相差较大。由于目前NS3在无线网络模拟等方面功能欠缺，且用户数与NS2相差悬殊，因此本文选择NS2作为研究对象。

OPNET其产品线主要有Modeler、IT Guru、SP Guru和WDM Guru等。每种产品所针对的用户群不同，功能也不尽相同。其中OPNET Modeler几乎包含其他产品的功能，其主旨在于为网络技术人员提供一个网络技术和产品的模拟平台，以帮助其设计和分析网络拓扑和通信协议[3]，在功能和用途上与NS2相似。

NS2，它使用两种编程语言，一种是由麻省理工学院开发的面向对象工具命令语言OTcl，另一种是C++。

NS2并未提供路由器、交换机等具体网络设备模型库，建模用的网络设备模型均需用户手动编写OTcl脚本建立且参数配置复杂。




## 组网技术

### 交换机
交换机分类比较复杂，略。

>电缆连接及终端配置：
>在未开机条件下，把PC的串口1(com1)通过控制台电缆与交换机的Console端口相连。
交换机Console端口的默认参数如下：
>
- 端口速率：9600bps
- 数据位：8
- 奇偶校验：无
- 停止位：1
- 流控：无
>
> 在配置PC的超级终端时只需将端口属性配置的与上面参数相同，就可成功访问到交换机。（超级终端，仿真终端，是什么？）连接并设置好后，打开交换机，此时超级终端窗口就会显示交换机的启动信息。

交换机的配置模式：

- 普通用户模式：很少的几个命令，如查询操作系统版本和系统时间。用户使用超级终端仿真软件或Telnet登录上交换机，自动进入用户配置模式，其命令状态如下：switch>
- 特权模式：对交换机进行查看、配置操作。输入`switch>enable`进入特权模式（switch#）。
- 全局配置模式：主要完成对交换机的配置。输入`switch>config terminal`进入全局配置模式`switch(config)#`
- 局部配置模式：对某个具体端口进行配置；它包括端口配置模式`switch(config-if)#`和线路配置模式`switch(config-line)#`。

> 这几种配置模式是**递进**的关系

```
switch> enable
switch# config t
switch(config)# enable password cisco (设置使能口令为cisco，密码明文显示）
switch(config)# enable secret cisco1  (设置使能密码为 cisco1，密码密文显示。password和secret只需配置一个，相互覆盖）
switch(config)# hostname C2950       (设置主机名为C2950)
C2950(config)#                      (注意：提示符改变)
C2950(config)# end                   (退回到特权模式)
```

配置命令可以使用缩写形式：比如en开头的只有enable所以，enable --> en,ena,enab,enabl
config --> con
config terminal --> con t





### 路由器
路由器分类：

- 骨干路由器
- 企业级路由器
- 接入级路由器

路由器的操作系统：

稍微复杂的路由器都有操作系统，各个厂家的路由器操作系统不尽相同，但都以Cisco的因特网操作系统（Internetwork Operation System, IOS）作为工业标准。每种路由器平台的IOS版本都不同，事实上有几百个不同的IOS版本。Cisco IOS一般有几兆字节大小，运行在路由器或交换机上。
路由器或交换机的操作是由配置文件（configuration file或config）控制的。配置文件包含有关设备如何操作的指令，是由网络管理员创建的。

命令行界面（Command Line Interface，CLI）。

> 访问控制列表（Access Control List, ACL)是Cisco IOS提供的一种访问控制技术，被广泛应用于路由器和三层交换机。借助ACL，可以有效的控制用户对网络和Internet的访问，从而最大限度的保障网络安全。

