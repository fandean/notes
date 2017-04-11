# Network command

标签（空格分隔）： 网络

---

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


## ipconfig


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

```cmd
nslookup示例 
----------------------
Default Server:  gz-ad01.radiant.com.tw
Address:  192.168.8.1

> name
Server:  gz-ad01.radiant.com.tw     #(Server)
Address:  192.168.8.1

Name:    name.com.tw                #(Name)
Address:  185.53.179.9

> help
Commands:   (identifiers are shown in uppercase, [] means optional)

NAME            - print info about the host/domain NAME using default server (查看)
NAME1 NAME2     - as above, but use NAME2 as server
help or ?       - print info on common commands

set OPTION      - set an option

    all                 - print options, current server and host  #(查看)
    [no]debug           - print debugging information
    [no]d2              - print exhaustive debugging information
    [no]defname         - append domain name to each query
    [no]recurse         - ask for recursive answer to query
    [no]search          - use domain search list
    [no]vc              - always use a virtual circuit
    domain=NAME         - set default domain name to NAME
    srchlist=N1[/N2/.../N6] - set domain to N1 and search list to N1,N2, etc.
    root=NAME           - set root server to NAME  #(DNS有两种)
    retry=X             - set number of retries to X
    timeout=X           - set initial time-out interval to X seconds
    type=X              - set query type (ex. A,ANY,CNAME,MX,NS,PTR,SOA,SRV)
    querytype=X         - same as type
    class=X             - set query class (ex. IN (Internet), ANY)
    [no]msxfr           - use MS fast zone transfer
    ixfrver=X           - current version to use in IXFR transfer request

server NAME     - set default server to NAME, using current default server  #(設置當前、默認的DNS服務器)
lserver NAME    - set default server to NAME, using initial(最初的) server
finger [USER]   - finger the optional NAME at the current default host
root            - set current default server to the root

ls [opt] DOMAIN [> FILE] - list addresses in DOMAIN (optional: output to FILE)
    -a          -  list canonical names and aliases
    -d          -  list all records
    -t TYPE     -  list records of the given type (e.g. A,CNAME,MX,NS,PTR etc.)

view FILE           - sort an 'ls' output file and view it with pg
exit            - exit the program

```


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









```
> tracert kh-gphs
Tracing route to kh-gphs.radiant.com.tw [192.168.5.18]

over a maximum of 30 hops:

  1     5 ms    15 ms     9 ms  10.8.14.254 
  2     4 ms    <1 ms    <1 ms  192.168.8.250 
  3     8 ms     4 ms     6 ms  172.30.106.9 
  4    40 ms    39 ms    40 ms  172.17.173.1 
  5    43 ms    42 ms    43 ms  bogon [172.17.173.2] 
  6    42 ms    44 ms    42 ms  192.168.0.253 
  7    43 ms    45 ms    45 ms  kh-gp12.radiant.com.tw [192.168.5.18] 

Trace complete.
Windows IP Configuration

> ipconfig

Ethernet adapter 區域連線:
        Connection-specific DNS Suffix  . : radiant.com.tw
        IP Address. . . . . . . . . . . . : 10.8.14.166
        Subnet Mask . . . . . . . . . . . : 255.255.255.0
        Default Gateway . . . . . . . . . : 10.8.14.254
```





hosts文件的別名機制

```
<ip>		<別名> 	<主機名>

192.168.0.161   uxprd1 uxprd1.radiant.com.tw
192.168.0.212   uxprd2 uxprd2.radiant.com.tw
192.168.0.142   uxprd3 uxprd3.radiant.com.tw
```
可以ping同這些別名，所以不需要再在 hosts 文件中添加這些items。



### 所有cmd記錄

```cmd
tracert kh-gp 
-------------------------------Tracing route to kh-gp.radiant.com.tw [192.168.0.103]over a maximum of 30 hops:  1    <1 ms    <1 

ms    <1 ms  10.8.14.254 
  2     3 ms    <1 ms     1 ms  192.168.8.250 
  3     6 ms     3 ms     3 ms  bogon [172.30.106.9] 
  4    40 ms    38 ms    38 ms  bogon [172.17.173.1] 
  5    42 ms    39 ms    39 ms  bogon [172.17.173.2] 
  6    40 ms    40 ms    39 ms  kh-gp.radiant.com.tw [192.168.0.103] 
Trace complete.
tracert kh-gphs 
-------------------------------Tracing route to kh-gphs.radiant.com.tw [192.168.5.18]over a maximum of 30 hops:  1    <1 ms    <1 

ms     1 ms  10.8.14.254 
  2    <1 ms    <1 ms    <1 ms  192.168.8.250 
  3     3 ms     3 ms     3 ms  bogon [172.30.106.9] 
  4    39 ms    41 ms    42 ms  bogon [172.17.173.1] 
  5    39 ms    40 ms    40 ms  bogon [172.17.173.2] 
  6    41 ms    41 ms    43 ms  192.168.0.253 
  7    41 ms    40 ms    40 ms  kh-gp12.radiant.com.tw [192.168.5.18] Trace complete.




ipconfig /all 
-------------------------------Windows IP Configuration        Host Name . . . . . . . . . . . . : GP66000350
        Primary Dns Suffix  . . . . . . . : radiant.com.tw
        Node Type . . . . . . . . . . . . : Hybrid
        IP Routing Enabled. . . . . . . . : No
        WINS Proxy Enabled. . . . . . . . : No
        DNS Suffix Search List. . . . . . : radiant.com.tw
                                            radiant.com.tw
                                            com.twEthernet adapter 區域連線:        Connection-specific DNS Suffix  . : 

radiant.com.tw
        Description . . . . . . . . . . . : Realtek PCIe GBE Family Controller
        Physical Address. . . . . . . . . : 00-1E-0B-AC-DE-39
        Dhcp Enabled. . . . . . . . . . . : Yes
        Autoconfiguration Enabled . . . . : Yes
        IP Address. . . . . . . . . . . . : 10.8.14.166
        Subnet Mask . . . . . . . . . . . : 255.255.255.0
        Default Gateway . . . . . . . . . : 10.8.14.254
        DHCP Server . . . . . . . . . . . : 192.168.8.4
        DNS Servers . . . . . . . . . . . : 192.168.8.1
                                            192.168.8.2
        Primary WINS Server . . . . . . . : 192.168.8.2
        Secondary WINS Server . . . . . . : 192.168.8.1
        Lease Obtained. . . . . . . . . . : 2016年12月19日 上午 08:01:12
        Lease Expires . . . . . . . . . . : 2016年12月24日 上午 08:01:12

211.144.155.133
百度IP地址：
61.135.169.125 
111.13.101.208 

185.53.179.9

domain=NAME  - set default domain to NAME




N天后，再次ipconfig /all

D:\>ipconfig /all

Windows IP Configuration

        Host Name . . . . . . . . . . . . : GP66000350				//Host Name不變
        Primary Dns Suffix  . . . . . . . : radiant.com.tw
        Node Type . . . . . . . . . . . . : Hybrid
        IP Routing Enabled. . . . . . . . : No
        WINS Proxy Enabled. . . . . . . . : No
        DNS Suffix Search List. . . . . . : radiant.com.tw
                                            radiant.com.tw
                                            com.tw

Ethernet adapter 區域連線:

        Connection-specific DNS Suffix  . : radiant.com.tw
        Description . . . . . . . . . . . : Realtek PCIe GBE Family Controller
        Physical Address. . . . . . . . . : 00-1E-0B-AC-DE-39
        Dhcp Enabled. . . . . . . . . . . : Yes
        Autoconfiguration Enabled . . . . : Yes
        IP Address. . . . . . . . . . . . : 10.8.14.55				//IP地址發生改變
        Subnet Mask . . . . . . . . . . . : 255.255.255.0
        Default Gateway . . . . . . . . . : 10.8.14.254
        DHCP Server . . . . . . . . . . . : 192.168.8.3
        DNS Servers . . . . . . . . . . . : 192.168.8.1
                                            192.168.8.2
        Primary WINS Server . . . . . . . : 192.168.8.1
        Secondary WINS Server . . . . . . : 192.168.8.2
        Lease Obtained. . . . . . . . . . : 2017年1月20日 上午 09:15:55
        Lease Expires . . . . . . . . . . : 2017年1月25日 上午 09:15:55





nslookup示例 
----------------------
Default Server:  gz-ad01.radiant.com.tw
Address:  192.168.8.1

> name
Server:  gz-ad01.radiant.com.tw
Address:  192.168.8.1

Name:    name.com.tw
Address:  185.53.179.9

> help
Commands:   (identifiers are shown in uppercase, [] means optional)NAME            - print info about the host/domain NAME using 

default server
NAME1 NAME2     - as above, but use NAME2 as server
help or ?       - print info on common commandsset OPTION      - set an option    all                 - print options, current 

server and host
    [no]debug           - print debugging information
    [no]d2              - print exhaustive debugging information
    [no]defname         - append domain name to each query
    [no]recurse         - ask for recursive answer to query
    [no]search          - use domain search list
    [no]vc              - always use a virtual circuit
    domain=NAME         - set default domain name to NAME   	#默認域名
    srchlist=N1[/N2/.../N6] - set domain to N1 and search list to N1,N2, etc.
    root=NAME           - set root server to NAME
    retry=X             - set number of retries to X
    timeout=X           - set initial time-out interval to X seconds
    type=X              - set query type (ex. A,ANY,CNAME,MX,NS,PTR,SOA,SRV)
    querytype=X         - same as type
    class=X             - set query class (ex. IN (Internet), ANY)
    [no]msxfr           - use MS fast zone transfer
    ixfrver=X           - current version to use in IXFR transfer requestserver NAME     - set default server to NAME, using 

current default server（設置當前、默認的DNS服務器）
lserver NAME    - set default server to NAME, using initial(最初的) server
finger [USER]   - finger the optional NAME at the current default host
root            - set current default server to the root

ls [opt] DOMAIN [> FILE] - list addresses in DOMAIN (optional: output to FILE)
    -a          -  list canonical names and aliases
    -d          -  list all records
    -t TYPE     -  list records of the given type (e.g. A,CNAME,MX,NS,PTR etc.)view FILE           - sort an 'ls' output file and 

view it with pg
exit            - exit the program






---------------------




D:\>pathping GZ-N-07

Tracing route to GZ-N-07 [10.8.16.120]
over a maximum of 30 hops:
  0  GP66000350.radiant.com.tw [10.8.14.55]
  1  10.8.14.254
  2     *        *        *
Computing statistics for 50 seconds...
            Source to Here   This Node/Link
Hop  RTT    Lost/Sent = Pct  Lost/Sent = Pct  Address
  0                                           GP66000350.radiant.com.tw [10.8.14.55]
                                0/ 100 =  0%   |
  1    0ms     0/ 100 =  0%     0/ 100 =  0%  10.8.14.254
                              100/ 100 =100%   |
  2  ---     100/ 100 =100%     0/ 100 =  0%  GP66000350.radiant.com.tw [0.0.0.0]

Trace complete.



D:\>pathping GP66001088

Tracing route to GP66001088.radiant.com.tw [10.8.14.140]
over a maximum of 30 hops:
  0  GP66000350.radiant.com.tw [10.8.14.55]					//無需經過 10.8.14.254
  1  gp66001088.radiant.com.tw [10.8.14.140]

Computing statistics for 25 seconds...
            Source to Here   This Node/Link
Hop  RTT    Lost/Sent = Pct  Lost/Sent = Pct  Address
  0                                           GP66000350.radiant.com.tw [10.8.14.55]
                                0/ 100 =  0%   |
  1    0ms     0/ 100 =  0%     0/ 100 =  0%  gp66001088.radiant.com.tw [10.8.14.140]

Trace complete.





D:\>tracert GZ-N-07

Tracing route to GZ-N-07 [10.8.16.120]
over a maximum of 30 hops:

  1    <1 ms    <1 ms     2 ms  10.8.14.254
  2    <1 ms    <1 ms    <1 ms  gz-n-07.radiant.com.tw [10.8.16.120]

Trace complete.





D:\>pathping GZ-N-10

Tracing route to GZ-N-10.radiant.com.tw [10.8.16.50]
over a maximum of 30 hops:
  0  GP66000350.radiant.com.tw [10.8.14.55]
  1  10.8.14.254
  2  gz-n-10.radiant.com.tw [10.8.16.50]

Computing statistics for 50 seconds...
            Source to Here   This Node/Link
Hop  RTT    Lost/Sent = Pct  Lost/Sent = Pct  Address
  0                                           GP66000350.radiant.com.tw [10.8.14.55]
                                0/ 100 =  0%   |
  1    0ms     0/ 100 =  0%     0/ 100 =  0%  10.8.14.254
                                0/ 100 =  0%   |
  2    0ms     0/ 100 =  0%     0/ 100 =  0%  gz-n-10.radiant.com.tw [10.8.16.50]

Trace complete.







D:\>pathping 192.168.0.211

Tracing route to uxprd1.radiant.com.tw [192.168.0.211]			//可能是Unix或者Linux提供打印的服務器，SAP使用此打印服務
over a maximum of 30 hops:
  0  GP66000350.radiant.com.tw [10.8.14.55]
  1  10.8.14.254
  2  192.168.8.250
  3  172.30.106.9
  4  172.17.173.1
  5  bogon [172.17.173.2]
  6  uxprd1.radiant.com.tw [192.168.0.211]

Computing statistics for 150 seconds...
            Source to Here   This Node/Link
Hop  RTT    Lost/Sent = Pct  Lost/Sent = Pct  Address
  0                                           GP66000350.radiant.com.tw [10.8.14.55]
                                0/ 100 =  0%   |
  1    0ms     0/ 100 =  0%     0/ 100 =  0%  10.8.14.254
                                0/ 100 =  0%   |
  2    0ms     0/ 100 =  0%     0/ 100 =  0%  192.168.8.250
                                0/ 100 =  0%   |
  3  ---     100/ 100 =100%   100/ 100 =100%  172.30.106.9
                                0/ 100 =  0%   |
  4  ---     100/ 100 =100%   100/ 100 =100%  172.17.173.1
                                0/ 100 =  0%   |
  5  ---     100/ 100 =100%   100/ 100 =100%  bogon [172.17.173.2]
                                0/ 100 =  0%   |
  6   35ms     0/ 100 =  0%     0/ 100 =  0%  uxprd1.radiant.com.tw [192.168.0.211]

Trace complete.

```


20170123000036:timer1.Enabled= false 
20170123000036:checkstatus
20170123000036:check_ntp
20170123000036:啟動上傳中.....
20170123000036:heartpluse
20170123000036:postheartpluse
20170123000037:D BM7DATA上傳中.....
20170123000037:clearmsg
20170123000037:timer1.Enabled = true
20170123000037:getdefectdatahostname_sqllasttime
20170123000038:ReadDefectData_Access
20170123000038:getbm7datafreehostname_sqllasttime
20170123000038:ReadBM7DATAFREE_Access
20170123000039:BM7DATAFREE_JUDGE_UP2SQL
20170123000039:BM7DATAFREE_JUDGE_UP2SQL
20170123000039:BM7DATAFREE_JUDGE_UP2SQL
20170123000039:D BM7DATAFREE上傳結束
20170123000039:getbm7datahostname_sqllasttime
20170123000040:ReadBM7DATA_Access
20170123000040:D BM7DATA上傳結束
20170123000040:showcnt
20170123000040:DEFECTDATA_DEFECTTYPE_UP2SQL
20170123000040:D DEFECTDATA上傳結束
20170123000040:showcnt


20170123144641:BM7DATAFREE_JUDGE_UP2SQL
20170123144642:BM7DATAFREE_JUDGE_UP2SQL
20170123144643:timer1.Enabled= false 
20170123144643:checkstatus
20170123144643:check_ntp
20170123154712:Form1_Load
20170123154712:cleanlog
20170123154812:timer1.Enabled= false 
20170123154812:checkstatus
20170123154812:check_ntp
20170123154811:啟動上傳中.....
20170123154811:heartpluse
20170123154811:postheartpluse
20170123154812:D BM7DATA上傳中.....
20170123154812:D DEFECTDATA上傳開始
20170123154812:clearmsg
20170123154812:timer1.Enabled = true
20170123154812:getdefectdatahostname_sqllasttime
20170123154813:ReadDefectData_Access
20170123154813:getbm7datafreehostname_sqllasttime
20170123154814:ReadBM7DATAFREE_Access
20170123154814:BM7DATAFREE_JUDGE_UP2SQL
20170123154815:BM7DATAFREE_JUDGE_UP2SQL






