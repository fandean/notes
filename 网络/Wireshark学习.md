

## Wireshark介绍

Wireshark是一个开源的、跨平台的网络封包**嗅探和分析**工具。 

主要用途： 截取网络数据并提供数据包详细分析结果。



**Wireshark使用环境：**

1. 本机环境：直接对本机网卡进行抓包

   ![](https://gitlab.com/faner/Git-Pictures/raw/master/%E8%BD%AF%E4%BB%B6%E6%93%8D%E4%BD%9C/Wireshark/%E6%9C%AC%E6%9C%BA%E7%8E%AF%E5%A2%83-2017-10-26_10-14-57.png)

2. 交换机环境：在本机侦听其它主机的流量
   - 端口镜像：在交换机上做端口镜像，将交换机上其它端口的流量复制一份发送给PC1(安装了wireshark的主机)

     ![](https://gitlab.com/faner/Git-Pictures/raw/master/%E8%BD%AF%E4%BB%B6%E6%93%8D%E4%BD%9C/Wireshark/%E7%AB%AF%E5%8F%A3%E9%95%9C%E5%83%8F_2017-10-26_10-18-10.png)

   - ARP欺骗：当我们没有权限在交换机上设置端口镜像时采用的方法一，借助 ARP攻击软件 Cain & Abel ，先进行流量劫持，再利用wireshark分析。

     ![](https://gitlab.com/faner/Git-Pictures/raw/master/%E8%BD%AF%E4%BB%B6%E6%93%8D%E4%BD%9C/Wireshark/ARP%E6%AC%BA%E9%AA%97_2017-10-26_10-23-43.png)

   - MAC泛洪：当我们没有权限在交换机上设置端口镜像时采用的方法二。

     ![](https://gitlab.com/faner/Git-Pictures/raw/master/%E8%BD%AF%E4%BB%B6%E6%93%8D%E4%BD%9C/Wireshark/MAC%E6%B3%9B%E6%B4%AA_2017-10-26_10-29-57.png)




数据包嗅探工作原理：

1. 收集（收集原始的二进制数据）
2. 转换（将收集的二进制转换成可读形式）
3. 分析（对捕获和转换后的数据进行深入分析）



> 对于大型企业一般会直接买台专门用来进行网络分析的设备；比如一台70多万的科来，使用它可以直接得出网络分析结果，而不会安装wireshark。

## Wireshark安装

在Ubuntu下：
```shell
sudo apt-get install wireshark
```

但是建议通过PPA安装，参考：  

[在Ubuntu 14.04 通过 PPA 安装 Wireshark 2.2.0 及配置技巧](http://blog.csdn.net/hubinqiang/article/details/53779694)



安装过程中的设置：

```
软件包设置    
             正在设定 wireshark-common           
Dumpcap can be installed in a way that allows members of the "wireshark" system group to capture packets. This is recommended over the alternative of running Wireshark/Tshark directly as root, because less of the code will run with elevated privileges. 

For more detailed information please see /usr/share/doc/wireshark-common/README.Debian. 

Enabling this feature may be a security risk, so it is disabled by default. If in doubt, it is suggested to leave it disabled.    

					    <确定>
```



```
           正在设定 wireshark-common
Should non-superusers be able to capture packets? 
		 	<是> 			 <否>
```

选择“否”表示普通用户无法抓取数据包。



Wireshark 2.4.2 有中文界面： 

packet：被翻译为"分组" ，也可以将其看作为"数据包"

wire: 线

Shark: 鲨鱼





运行Wireshark：

```shell
sudo wireshark 
```





## Wireshark界面介绍和设置

![](https://gitlab.com/faner/Git-Pictures/raw/master/%E8%BD%AF%E4%BB%B6%E6%93%8D%E4%BD%9C/Wireshark/%E8%BD%AF%E4%BB%B6%E7%95%8C%E9%9D%A2_2017-10-26_23-33-26.png)

软件界面从上到下：

- 菜单栏
- 工具栏
- 分组（数据包）过滤栏
- 分组（数据包）列表区
- 分组（数据包）详情区
- 分组（数据包）字节区
- 状态栏




### 常用的几个菜单

文件菜单：保存数据。只有停止捕获后才可导出数据。

捕获菜单：开始、配置捕获

分析菜单：设置过滤器（比如按协议过滤）、追踪流(比如追踪TCP流)

统计菜单：





### 第一次抓包

步骤就是先选择要捕获的接口(比如某个网卡，或者使用默认接口) 再点击开始捕获即可。

开始捕获(使用默认接口)： "捕获"菜单 > 开始 (或点击工具栏开始按钮)

关闭捕获："捕获"菜单 > 关闭 (或点击工具栏上的关闭按钮)



> 手动选择接口： "捕获" > 点击 "选项" 打开"捕获接口"窗口 > 选择某一接口 > 点击"开始"即可进行捕获。





### 分组列表区

从左到右每列代表的含义：

- No.：分组序号
- Time：每个分组捕获时的**相对**时间
- Source：发送方(源ip地址)
- Destination：接收方(目的ip地址)
- Protocol：采用的协议
- Length：包长度
- Info：发送的内容



**分组：**每一行代表一个分组。

**自动滚动：**在工具栏中选中“在实时捕获时，自动滚动到最新分组处”的图标，将滚动条滚动到最下方就可以**自行滚动**。该图标旁边还有个“使用您的着色规则来应用到分组”。![](https://gitlab.com/faner/Git-Pictures/raw/master/%E8%BD%AF%E4%BB%B6%E6%93%8D%E4%BD%9C/Wireshark/%E5%88%86%E7%BB%84%E5%88%97%E8%A1%A8%E6%8C%89%E9%92%AE_2017-10-26_23-44-54.png)



点击工具栏中向上和向下的箭头可以迅速的回到第一个分组或**最后一个分组**。

**时间参考：**右键点击某个分组，然后选择"设置/取消时间参考"，后面的分组的时间值将会以当前分组的时间值为参考进行设置（便于分析）。另可以设置多个时间参考。



**名字解析：**

- 功能：将MAC地址、IP地址、端口号等转换为名字，默认只开启MAC地址解析（另还有：网络名字解析、传输名字解析）
- 优缺点：开启IP地址或端口解析可以加大可读性，但是也可能会出现解读错误并且会耗费一部分资源。
- 设置方法：捕获 > 点击 "选项" 打开"捕获接口"窗口 > "选项" > 解析名称






### 分组详情区



下面是**某个分组**的详细信息：（该分组的协议为 TCP）

- **Frame**帧
- **Ethernet II**，  Src(源MAC地址)： xxx 比如我电脑的网卡的MAC ， Dst(目标MAC地址): xxx 比如斐讯路由器的MAC
- **Internet Protocol Version 4**(IPv4协议)： Src源： ， Dst目标：
- **Transmission Control Protocol**(TCP协议)：Src Port源： ， Dst  Port目标：




> 如果该分组采用的是http协议，那么详细信息中还会有：
>
>  Hypertext Transfer Protocol (超文本传输协议)：
>
> 可能会有： Line-based text data: 





## 分组操作

### 标记分组

选择某个分组，然后右键选择进行标记。

各种类型的分组会配以不同的颜色，可以通过"视图">"着色规则"查看和**永久修改**着色规则。

有问题的分组一般颜色为红色或黑色；正常的分组一般为浅色。并且还会根据协议类型来进行一些区分。



**临时修改着色：**右键分组 >  对话着色 > 再选择某种协议 > 最后选择某种颜色

从字面看"对话着色"是与某次会话有关；选择的协议 可能是用来进一步过滤该会话。



### 注释分组

为某分组添加注释： 

右键分组 > 分组注释



### 合并分组

将两次抓包获得的分组进行合并。

文件 > 合并 



### 打印分组

文件 > 打印

打印所有分组或打印选中的分组。

> 打印效果差，另可选择导出分组



### 导出分组

文件 > 导出...



## 首选项设置

编辑 > 首选项



修改默认打开目录：外观 > 打开文件夹中的文件 > 设置某个固定的文件夹

修改用户界面：布局、字体、颜色

修改名称解析： Name Resolution



## 捕获选项设置

捕获 > 选项

**混杂模式**：一般只会接收发送给自己的包，如果是发送给别人的包(公共的包)会丢弃；如果开启混杂模式那么也会抓取所有网卡都能看到的但不是发给自己的包。

设置过滤器。

每多少秒/多少字节自动创建新文件。

设置自动停止捕获的条件。

设置名称解析。

显示选项：默认勾选全部显示选项。下面解释一下他们的含义：

- 实时更新分组列表。如果没有勾选它，则在捕获时不会显示分组列表。
- 实时捕获时自动滚屏。
- 显示额外的捕获信息对话框。(再我的Xubuntu 16.04中勾选它没用)



## 过滤器设置

### 捕获过滤器

捕获选项 > 捕获过滤器



使用BPF语法(Berkeley Packet Filter)。

**类型Type：** host、net、port 等

**方向Dir ：** src、dst

**协议Proto：** ether、ip、tcp、udp、http、ftp 等

**逻辑运算：** `&&` 与 、`||`或、`!`非



几个示例：

- `src host 192.168.1.1 && dst port 80` 抓取源地址为192.168.1.1，目的为 80端口 的流量。
- `host 192.168.1.1 || host 192.168.1.2` 
- `!broadcast`不抓取广播包



过滤MAC地址案例：

- `ether host 00:88:ca:86:f8:0d`
- `src ether host 00:88:ca:86:f8:0d`
- `dst ether host 00:88:ca:86:f8:0d`

过滤IP地址案例：

- `host 192.168.1.1`
- `src host 192.168.1.1`

过滤端口案例：

- `port 80`
- `!port 80`
- `dst port 80`

过滤协议案例：

- `arp`
- `icmp`

综合过滤案例：

- `host 192.168.1.1 && port 8080`





### 显示过滤器

显示过滤器位于分组列表的上方。

显示过滤器语法与捕获过滤器语法不同。



比较操作符：`==`、`!=`、`>`、`<`、`>=`、`<=`

逻辑操作符：`and`、`or`、`xor`、`not`

IP地址：`ip.addr`、`ip.src`、`ip.dst`

端口：`tcp.port`、`tcp.srcport`、`tcp.dstport`、`tcp.flags.syn`、`tcp.flags.ack`

协议： arp、ip、icmp、udp、tcp、bootp、dns



示例：

```
ip.src == 192.168.1.1 and tcp.dstport == 80
```



利用 `tcp.flags.syn` 和 `tcp.flags.ack` 还可检测TCP的三次握手的过程。

比如显示过滤器  `tcp.flags.syn == 1 or tcp.flags.ack == 1` 



**显示过滤器表达式：**

可以通过表达式来**辅助创建**过滤器，点击显示过滤器栏上的"表达式"即可打开显示过滤器表达式对话框。



**添加显示过滤器快捷按钮：**点击旁边的 `+` 号，添加一个显示过滤器按钮(即创建一个显示过滤器快捷按钮) ；"标签"对应该按钮的名称。点击 OK 即可再显示过滤器栏添加一个快捷按钮。








## Wireshark 高级功能

> 下面的内容为 Wireshark 高级功能，使用频率不是很高



### 数据流追踪

功能：将TCP、UDP、SSL等数据流进行重组并完整呈现出来。

有两种方式开始追踪流：

1. 分析 > 追踪流
2. 选中某分组右键选择追踪流



追踪TCP流： 对话框中红色部分为请求数据，蓝色部分为响应数据。



### 专家信息说明

功能：可以对分组中特定状态进行警告。可以方便的找到产生错误、警告的分组。在状态栏的左下脚对应有一个小圆点也表示了相关信息。

分析 > 专家信息





### 统计摘要说明

统计 >  捕获文件属性

且在状态栏的左下脚对应的第二个图标表示了相关信息。



### 协议分级统计

统计通信流量中不同协议占用的百分比。通过该工具可以对全网流量有直观的了解。

统计 > 协议分级统计



### 网络节点和会话统计

**网络会话：**统计通信会话之间接收和发送的数据包和字节数。通过这个工具可以找出网络中哪个会话（IP地址或端口号）最占宽带。

统计 > 对话



**网络节点：**统计通信会话中每个节点之间接收和发送的数据包和字节数。通过这个工具可以找出网络中哪个节点（IP地址或端口号）最占宽带。

统计 > 端点



**弹出的对话框中部分列代表的含义：**(其它的可以猜测出)

- Address A 和 Address B 分别表示了通信的两端
- Packets：分组数
- Bytes：字节大小
- Bytes A -> B ：A发送给B的字节
- Bytes A <- B ：B发送给A的字节
- Packets A -> B：A发送给B的分组数



**技巧：**可以对各列进行排序。



### 数据包长度

统计数据流量中包长度的分布。

统计 > 分组长度

正常分组长度一般在 40 ~ 2560 之间

小型帧或巨型帧攻击：这些帧出现在 40 ~ 2560 区间之外



### 图表分析

**IO图表(IO Graph)：**对网络中的吞吐流量进行实时图像显示。

统计 > IO图表



**数据流图(Flow Graph)：**将会话通信过程图形可视化出来。

统计 >  流量图

一般先在分组列表中利用显示过滤器过滤数据，再打开流量图，并在"显示"处选择"显示的分组"。




## 学习资料



[Wireshark协议分析从入门到精通（免费版）_腾讯课堂](https://ke.qq.com/course/232174 "Wireshark协议分析从入门到精通（免费版）_腾讯课堂")

《大咖讲Wireshark网络分析》电子版只需3元，对应视频 [Wireshark抓包实战分析_腾讯课堂](https://ke.qq.com/course/192926 "Wireshark抓包实战分析_腾讯课堂")

[Wireshark抓包分析全套【G-LAB郭主任】_腾讯课堂](https://ke.qq.com/course/226319 "Wireshark抓包分析全套【G-LAB郭主任】_腾讯课堂") 付费



> 相关软件
>
> 通用抓包工具：Sniffer、Omnipeek
>
> 用于Http的抓包工具：Fiddler、Httpwatch
>
> 命令行工具： tcpdump
>
> 国内有：[科来网络分析系统](http://www.colasoft.com.cn/download/capsa.php) （有免费的软件）
>

> 科来提供的一副网络通信协议图：[科来网络通讯协议图](http://www.colasoft.com.cn/download/protocols_map.php)

