# VPS

## VPS介绍

虚拟专用服务器（英语：Virtual private server，缩写为 VPS），是将一台服务器分区成多个虚拟专享服务器的服务。实现VPS的技术分为容器技术和虚拟化技术 。在容器或虚拟机中，每个VPS都可分配独立公网IP地址、独立操作系统、实现不同VPS间磁盘空间、内存、CPU资源、进程和系统配置的隔离，为用户和应用程序模拟出“独占”使用计算资源的体验。VPS可以像独立服务器一样，重装操作系统，安装程序，单独重启服务器。

不同VPS提供商所使用的硬件VPS软件的差异，及销售策略的不同，VPS的使用体验也有较大差异。尤其是VPS提供商超卖，导致实体服务器超负荷时，VPS性能将受到极大影响。 **相对来说，容器技术比虚拟机技术硬件使用效率更高**，更易于超卖，所以一般来说容器VPS的价格都高于虚拟机VPS的价格。 这些VPS主机以最大化的效率共享硬件、软件许可证以及管理资源。每个VPS主机都可分配独立公网IP地址、独立操作系统、独立超大空间、独立内存、独立CPU资源、独立执行程序和独立系统配置等. VPS主机用户除了可以分配多个虚拟主机及无限企业邮箱外， 更具有独立主机功能, 可自行安装程序，单独重启主机。



目前用得最多的虚拟化技术是Xen, OpenVZ, Hyper-V, vmware。


超售情况: 假设宿主机有16G内存，但开出20台1G内存的vps，都卖出去了；而这20台vps里都显示1G内存，这就是超售。事实上OpenVZ通常超售得更厉害！

OpenVZ:  

Xen： 

KVM:  

详见：[百度百科.VPS](http://baike.baidu.com/item/VPS)  




### 知乎上的几个相关问题

1.  [云服务器（ECS）云主机 云虚拟主机 VPS等产品的区别?](https://www.zhihu.com/question/46387307/answer/134871803)  
  第一、云主机和普通主机基本概念相同，是新一代的主机租用服务，它整合了高性能服务器与优质网络带宽，有效解决了传统主机租用价格偏高、服务品质残次不齐的缺点，与VPS相比更稳定、更安全；第二，VPS是虚拟服务器（服务器是真实存在的物理设备），功能与服务器一样，有独立的操作系统，可以理解为是一个小电脑。不同点在于它是虚拟的，在同等配置的情况下性能不如服务器。
  第二，虚拟主机是服务器划分的一块存储空间，功能有限，只能进行资源的存储和访问
2.  [VPS 与虚拟主机有什么异同？](https://www.zhihu.com/question/19856629)  



## VPS帐户被封问题
[Vultr vps账户可能会出现被锁定的原因以及解决方法](http://www.vpspp.com/240.html)  
[Vultr账户被封的原因以及解决方法](https://www.vultrclub.com/76.html)  
[新用户购买和使用Vultr VPS需要知道的8个问题](http://www.chinaz.com/web/2015/1214/483003.shtml)  

Vultr帐户限制：如果被发现我们是多注册或者恶意注册且关联多个相关信息，那只要相关联的账户都会被封的风险。不要利用VPS主机从事群发邮件或者发包业务。








总结，无论是何种原因导致的被封账户，我们需要找到原因以及是不是自己的行为，如果不是我们的问题，我们需要解释清楚，最好不要不了了之，因为海外VPS服务器商家之间有一个账户信息库，如果我们进入黑名单，以后再购买机器是不好付款或者永远都无法购买成功的





## VPS选购

料网的几篇

[Linode 2017新价格方案：5美金来袭！ -  料网](https://www.liaosam.com/linode-2017-new-plan.html)

Vultr 的 5美金方案内存太小了，才768M。通常我们使用 VPS，跑 php 程序部分会考虑分配1/4左右的总内存，剩余的 3/4 的内存要留给 linux系统，数据库以及其他各种程序。而现在WordPress好的主题越来越吃内存，如 Avada 等等，内存至少要有个128M，最好是 256M，所以有个1G的内存，WP建站才安逸一些。（注意：Linode的1G也是理论值，实际差不多990M，不足1024M）

相同 5美金/月的价格，Linode 高品质机房和口碑，1G 内存，而 vultr 768MB 内存。





初学者，最好先买个 搬瓦工 练习一下。

[老左常用国内/国外VPS推荐](http://www.laozuo.org/myvps)  
[有哪些便宜稳定，速度也不错的Linux VPS 推荐？](https://www.zhihu.com/question/20800554)  
[10美元以下VPS](https://www.vpser.net/ten-dollars-vps)  


### BandwagonHOST
[搬瓦工VPS（BandwagonHost）－ 性价比高的年付便宜VPS主机](http://www.laozuo.org/bandwagonhost)  

[BandwagonHOST产品和服务列表](https://bwh1.net/cart.php?gid=1)  

BandwagonHOST（搬瓦工），可选择16年上架的弗里蒙特机房的512M内存19.99刀包年的VPS，只有该一个机房，且该机房从国内访问延迟比其他的几个机房要大；
另有256M内存的8机房套餐。

BandwagonHOST优惠码：IAMSMART5TDT48(目前优惠力度最大的5.08%)优惠码， 4.82%优惠码IAMSMART5GRNII 。


不能换机房的板瓦工就没什么乐趣了。板瓦工可以无损换机房，vultr可以换机房换IP，但是系统要重新安装。其他服务商很少有能换机房换IP的。


第二、搬瓦工VPS数据中心  
搬瓦工VPS主机一共有8个数据中心，且特点就是用户还可以后台自己切换数据中心，这样对于有需要更换独立IP地址的用户来说比较好的。比如我们有些项目IP容易被封所以通过这样的方法更换IP地址。  
洛杉矶IP地址(QN)：104.194.76.20  
洛杉矶IP地址(MC)：98.142.136.11  
凤凰城IP地址：198.35.46.22  
佛罗里达IP地址：23.252.104.22  
弗里蒙特IP地址：184.105.138.67  
加拿大IP地址：172.93.32.16  
纽约P地址：208.167.227.122  
荷兰IP地址：192.243.124.74  
我们可以看到8个数据中心的测试IP地址，老左在"搬瓦工VPS主机洛杉矶、佛罗里达、凤凰城、荷兰四数据中心速度测试"文章中也进行过测试总结。  


广西移动：

```
[fan 16:34:47]~$ ping 184.105.138.67		弗里蒙特数据中心
PING 184.105.138.67 (184.105.138.67) 56(84) bytes of data.
64 bytes from 184.105.138.67: icmp_seq=3 ttl=45 time=390 ms
64 bytes from 184.105.138.67: icmp_seq=4 ttl=45 time=390 ms
64 bytes from 184.105.138.67: icmp_seq=5 ttl=45 time=390 ms
64 bytes from 184.105.138.67: icmp_seq=8 ttl=45 time=391 ms
64 bytes from 184.105.138.67: icmp_seq=9 ttl=45 time=392 ms
64 bytes from 184.105.138.67: icmp_seq=11 ttl=45 time=390 ms
64 bytes from 184.105.138.67: icmp_seq=13 ttl=45 time=397 ms
64 bytes from 184.105.138.67: icmp_seq=14 ttl=45 time=391 ms
64 bytes from 184.105.138.67: icmp_seq=15 ttl=45 time=391 ms
64 bytes from 184.105.138.67: icmp_seq=17 ttl=45 time=392 ms
^C
--- 184.105.138.67 ping statistics ---
17 packets transmitted, 10 received, 41% packet loss, time 16049ms
rtt min/avg/max/mdev = 390.027/391.901/397.960/2.313 ms
[fan 17:01:03]~$ ping 184.105.138.66			弗里蒙特数据中心
PING 184.105.138.66 (184.105.138.66) 56(84) bytes of data.
64 bytes from 184.105.138.66: icmp_seq=1 ttl=45 time=442 ms
64 bytes from 184.105.138.66: icmp_seq=2 ttl=45 time=445 ms
64 bytes from 184.105.138.66: icmp_seq=4 ttl=45 time=444 ms
64 bytes from 184.105.138.66: icmp_seq=5 ttl=45 time=451 ms
^C
--- 184.105.138.66 ping statistics ---
6 packets transmitted, 4 received, 33% packet loss, time 5004ms
rtt min/avg/max/mdev = 442.553/445.859/451.444/3.476 ms
[fan 17:01:49]~$ ping 104.194.76.20				洛杉矶   与ping github.com 差不多
PING 104.194.76.20 (104.194.76.20) 56(84) bytes of data.
64 bytes from 104.194.76.20: icmp_seq=1 ttl=44 time=238 ms
64 bytes from 104.194.76.20: icmp_seq=2 ttl=44 time=221 ms
64 bytes from 104.194.76.20: icmp_seq=3 ttl=44 time=235 ms
64 bytes from 104.194.76.20: icmp_seq=4 ttl=44 time=219 ms
64 bytes from 104.194.76.20: icmp_seq=5 ttl=44 time=235 ms
64 bytes from 104.194.76.20: icmp_seq=6 ttl=44 time=233 ms

```



### Vultr
最低2.5美元一月，512M内存，机房数未知。



### Hostigation

Hostigation，Hostigation又新发布了几款促销，其中256M内存内存的KVM年付只需要12.5美金，机房位于QuadraNet的洛杉矶机房。到国内速度不错。还提供免费的DDoS保护。可以支付宝付款。



VPS 磁盘：有的是大容量的HDD硬盘，有的是相对较小的SSD固态硬盘。


### DeployNode
[高性价比VPS再现 - DeployNode](https://blog.phpgao.com/deploynode.html)  



### 几个便宜的VPS服务器，可以买来自建SS、V2Ray翻墙

[原文地址 ](https://www.igfw.net/archives/13440)



**Virmach**这家被称为价格屠夫不是白叫的，最近支持支付宝支付了，列举几个他家便宜套餐折扣后的价格。

KVM VPS配置 SSD128（KVM类型的VPS性能好比较推荐，注册不要使用代理，信心也不要乱填）        
内存 128MB        
硬盘 10GB        
流量 500GB       
核心 1       
IP 1       
**购买** [年付 8.75 刀](https://billing.virmach.com/aff.php?aff=2798&pid=59) 使用LEB30七折优惠码       

OpenVZ配置       
内存 128MB       
硬盘 10GB      
流量 250GB      
核心 1H1GIP 1      
**购买** [年付 5.25 刀](https://billing.virmach.com/aff.php?aff=2798&pid=35) 使用LEB30七折优惠码        

测速选择速度快的美国西部机房https://billing.virmach.com/knowledgebase.php?action=displayarticle&id=11








## 支付问题
Vultr上用绑定银联的paypal支付，出现说我的付款方式被拒绝。可能只能使用绑定信用卡的PayPal才能支付成功。

中国版的PayPal有些国外网站不支持。

见Pocket上收藏夹的几篇VPS和PayPal的文章。






## VPS安全问题




