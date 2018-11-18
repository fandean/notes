# Shadowsocks简介和安装

> 包含ShadowsocksR

## Shadowsocks简介
Shadowsocks 是**开源**的轻量级服务器中转包传输工具，该软件在中国大陆一般被当作 socks5 代理服务器来突破GFW。Shadowsocks简称SS。

[Shadowsocks维基百科](https://zh.wikipedia.org/wiki/Shadowsocks)  

Shadowsocks 各平台的客户端介绍，见 [Shadowsocks维基教科书](https://zh.wikibooks.org/wiki/Shadowsocks)  

[Shadowsocks官网](https://shadowsocks.org/en/index.html)  
[Shadowsocks GitHub](https://github.com/shadowsocks/shadowsocks/tree/master)  


### Shadowsocks原理与安全性
详见:  

[Shadowsocks维基百科](https://zh.wikipedia.org/wiki/Shadowsocks)  

[Shadowsocks 原理简介及安装指南](http://www.barretlee.com/blog/2016/08/03/shadowsocks/)  


shadowsocks分为服务器端和客户端，在使用之前，需要先将服务器端部署到服务器上(利用该服务器进行中转)面，在服务器端部署完成后，用户需要按照指定的密码、加密方式和端口使用客户端软件与其连接。在成功连接到服务器后，客户端会在用户的电脑上构建一个本地Socks5代理(客户端连接服务器并创建本地连接)。浏览网络时，网络流量会被分到本地socks5代理，客户端将其加密之后发送到服务器，服务器以同样的加密方式将流量回传给客户端，以此实现代理上网。

```
+------+     +------+     +=====+     +------+     +-------+
| 设备  | <-> |Client| <-> | GFW | <-> |Server| <-> | 服务器 |
+------+     +------+     +=====+     +------+     +-------+
```

Client 和 Server 之间可以通过多种方式加密，并要求提供密码确保链路的安全性。




Shadowsocks自行设计的加密协议对双方的身份验证仅限于预共享密钥，亦无完全前向保密，也未曾有安全专家公开分析或评估协议及其实现。


> **ShadowsocksR简介**  
> ShadowsocksR（简称SSR），全新一代的轻型代理服务。比Shadowsocks（简称SS）抗干扰性更强，数据传输速度更快更稳定。
> ShadowsocksR是[breakwa11](https://github.com/breakwa11)发起的shadowsocks分支，在shadowsocks的基础上增加了一些数据混淆方式，称修复了部分安全问题并可以提高QoS优先级。



## 服务器端部署

### 安装
Shadowsocks的服务器和客户端的安装可直接参考其官网或者GitHub上的说明。

服务端的程序有多种语言编写的多个版本，一般选择Python语言版的，通过如下命令即可安装：  
```
pip install shadowsocks
```

对于Debian/Ubuntu系统还可安装`C with libev`版，直接使用如下命令即可安装该版本：  
```
sudo apt install shadowsocks-libev
```


两种运行Shadowsocks的方法：  

1. 通过直接通过命令`ssserver`外加一大堆参数的方法：  
```
ssserver -p PORT -k PASSWORD -m rc4-md5 --log-file /tmp/ss.log -d start
```
2. 通过命令`ssserver`加配置文件的方法（需先进行配置）：
```
ssserver -c /etc/shadowsocks.json -d start
```

> 需要关闭stop，重启restart等操作，只需替换上面的start即可。

### 配置

两个比较好的参考：  

[使用 Shadowsocks 自建翻墙服务器，实现全平台 100% 翻墙无障碍](https://www.loyalsoldier.me/fuck-the-gfw-with-my-own-shadowsocks-server/ "推荐")  
[在VPS上部署shadowsocks服务](http://imzlp.me/posts/31145/ "推荐")  



编辑配置文件`/etc/shadowsocks.json`，这里是全局配置，也可自行指定一个配置文件路径。

单用户单端口配置示例：  

```
{
    "server":"my_server_ip",
    "server_port":8388,
    "local_address": "127.0.0.1",
    "local_port":1080,
    "password":"mypassword",
    "timeout":300,
    "method":"aes-256-cfb",
    "fast_open": false
}
```

多用户多端口配置示例如下：  

```
{
    "server":"0.0.0.0",
    "port_password": {
        "9990":"password0",
        "9989":"password1"
    },
    "local_address":"127.0.0.1",
    "local_port":1080,
    "timeout":600,
    "method":"aes-256-cfb"
}
```

port_password就是端口和它所对应的密码，这里可以使用多个端口和密码，你可以把它分配给不同的人，每个人使用单独的端口。


选择单用户配置即可。



配置文件的说明：  

- [Configuration via Config File](https://github.com/shadowsocks/shadowsocks/wiki/Configuration-via-Config-File)  
- [配置文件各项说明](https://github.com/breakwa11/shadowsocks-rss/wiki/config.json)  



### 服务器操作系统设置

确保开启了SS使用的相关端口；(防火墙没有禁止该端口)。

考虑是否需要将ss设置为开机启动。

> 添加到开机启动， 参考：[在VPS上部署shadowsocks服务](http://imzlp.me/posts/31145/ "推荐")  

### 优化Shadowsocks性能
可选。

参考：  

[使用 Shadowsocks 自建翻墙服务器，实现全平台 100% 翻墙无障碍](https://www.loyalsoldier.me/fuck-the-gfw-with-my-own-shadowsocks-server/ "推荐")  



## Linux客户端部署与配置
详见官网。


### 客户端安装
GUI 客户端： 可安装 Shadowsocks-Qt5  

命令行客户端：安装和服务器端安装一样，使用`pip install shadowsocks` 或者 `apt-get install shadowsocks-libev`即可。


> 这里服务端和客户端都只是指Linux系统。


> SshadowsocksR的安装：  
> [ShadowsocksR 服务端安装教程](https://github.com/breakwa11/shadowsocks-rss/wiki/Server-Setup)  
> [Shadowsocks部署指南](https://slarker.me/ss-deploy/)  


### 客户端配置

简单配置，略。


高级配置，参考：  

[使用 Shadowsocks 自建翻墙服务器，实现全平台 100% 翻墙无障碍](https://www.loyalsoldier.me/fuck-the-gfw-with-my-own-shadowsocks-server/ "推荐")  

Shadowsocks 还有一个强大的功能： PAC（代理自动设置）。它可以根据在配置文件中设置的网址，来决定哪些网站流量需要经过墙外服务器进行代理。

Shadowsocks 的 PAC 功能是通过 Shadowsocks 软件目录下的 pac.txt 和 user-rule.txt 两个文件同时实现的。前者是 SS 默认自动翻墙的网站列表，后者是用户自己设置的需要翻墙的网站列表。



## 客户端系统上的其他软件如何使用该SS？


### Chrome浏览器使用SS

**配置浏览器的SwitchyOmega插件:**  

如果只是想让浏览器使用SS，则配置该插件即可。

SwitchyOmega的基本使用, 略。


先新建一个类型为代理服务器类型的情景模式，名称为`SS`；之后代理协议选择Socks5，代理服务器填写`127.0.0.1`，代理端口填写`1080`（填写你的SS客户端实际的值），然后应用更改。

再新建一个类型为自动切换的情景模式，名称为`SS-AutoProxy`，规则列表规则 选择 `SS`，默认情景模式 选择 直接连接；规则列表设置处的规则列表格式选择`AntoProxy`，规则列表网址填写`https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt`；


规则列表正文内容解释：

```
! 警号开头的行为注释行

! 两个 || 开始的行，表示后面的地址使用代理
||javhuge.com

! 两个@@ 开始的行，表示后面的地址不使用代理（使用默认的情景模式，之前设置为直接连接）
@@||nmmba.gov.tw
```

如果之前使用SwitchyOmega时保留了自行添加的切换规则，则可将其复制过来（通过点击编辑源代码的方式更加方便编辑）。


### 如何将其设置为系统代理？

。。。


[使用 Shadowsocks 自建翻墙服务器，实现全平台 100% 翻墙无障碍](https://www.loyalsoldier.me/fuck-the-gfw-with-my-own-shadowsocks-server/ "推荐")  


还是说为要使用SS的软件一个个设置代理地址？



这里有个软件MEOW Proxy，它的作用有(关注第2项)：  

- 作为全局HTTP代理（支持PAC），可以智能分流（直连国内网站、使用代理连接其他网站）
- 将SOCKS5等代理转换为HTTP代理，HTTP代理能最大程度兼容各种软件（可以设置为程序代理）和设备（设置为系统全局代理）
- 架设在内网（或者公网），为其他设备提供智能分流代理
- 编译成一个无需任何依赖的可执行文件运行，支持各种平台（Win/Linux/OS X），甚至是路由器或者树莓派（Linux ARM）

[MEOW GitHub](https://github.com/renzhn/MEOW)  


> 考虑在Shadowsocks-Qt5程序中配置连接时，将"本地服务器类型"勾选为"HTTP"，是否也能将Socks5代理转换为Http代理？



## Android客户端配置

在"服务器设置"下的配置，设置为与SS服务器配置文件中的一样即可。

"功能设置"下的配置：  

- 路由： 绕过局域网及中国大陆地址
- 远程DNS：`8.8.8.8`  (默认)
- IPv6路由：关闭
- 分应用代理：关闭；也可自行选择哪些APP使用代理。
- DNS转发：关闭（若服务器不支持UDP，设置后，上网会出现问题）



## TCP加速软件
TCP 加速程序，能够增强VPS/服务器连接的稳定性，且有效的提高服务器的带宽利用率，进而提高访问速度。

TCP加速软件的具体效果如何，现在不得而知。

### 锐速
之前(2016年前)大家使用的**锐速**已经阵亡。

它是单边加速软件，只需在服务器端安装即可。

无法使用在Openvz类型的VPS上。
搬瓦工的服务器是OpenVZ架构，无法修改内核参数，所以无法使用锐速，只有Linode、Digital Ocean和Vultr等KVM或XEN架构的服务器可以使用。

### FinalSpeed (TCPSpeed)
TCPSpeed是FinalSpeed的高级版，需付费。  
双边加速软件，需同时在服务器端和客户端安装，否则无效。但是现在没有安卓版客户端软件。

[TCPSpeed网站](http://www.tcpspeed.com/)  

[一篇介绍文章](https://www.91yun.org/archives/610)  

注意：TCPSpeed的激活码只能在服务器上使用,如果没有服务器,请勿购买!


