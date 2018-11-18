



## SSD
Solid State Disk，SSD已不是使用“碟盘”来记存数据，而是使用NAND Flash。厂商只需使用(非易失性)闪存（NAND FLASH），再配合适当的控制芯片，就可以制造固态硬盘了。新一代的固态硬盘普遍采用SATA-III接口。

2017.09，好吧新的SSD已经采用了PCI-E接口，理论读取速度高达1.5GB，写入速度600MB。



> 固态硬盘的知识可以我的 YouTub 收藏中找到系列专业视频。 SSD原厂厂家只有4家




### 固态硬盘装系统注意事项

必看的几篇文章
> [SSD小白讲堂系列(1):主控、闪存及固件](http://diy.pconline.com.cn/346/3467551.html)
> [SSD小白讲堂(2):手把手教您为SSD装系统](http://diy.pconline.com.cn/360/3603296_all.html "强烈建议")
> [固态硬盘装系统注意事项](http://www.expreview.com/21367.html "蓝屏处理") 比如蓝屏处理
> [SSD固态硬盘的初始化，分区和系统安装教程](http://www.hangge.com/blog/cache/detail_901.html) 与原来HDD的组成双系统

**要发挥SSD最大性能，电脑方面要注意如下几点：**



（1）确认主板是否有SATA3原生接口，如果接在SATA2上只能发挥一半的效果。
（2）进BIOS看是否开启了AHCI模式，选型菜单通常叫“PCH SATA Control Mode”，将其选择AHCI。如果选IDE的话，持续读取速度会比AHCI模式低100MB/s以上。
（3）主板是否支持uefi快速启动（下面会介绍）



**SSD安装系统（引导）**
SSD不同于机械硬盘，SSD建议运行在AHCI模式下。AHCI，全称Advanced Host Controller Interface,即高级主机控制器接口，相比老旧的“IDE“ 虚拟模式更适合SSD SATA存储设备通信协议。**空盘装系统之前**，我们先进入主板BIOS设置SATA模式为AHCI。



> 在我直接迁移系统之后，再切换到 AHCI 出现无法进入系统的问题；但是不切换也是能够运行的。



**SSD分区** 
如果SSD 4K不对齐，写入的数据写入点正好会介于两个4K扇区的之间，也就是说即使是写入最小量的数据，也会使用到两个4K扇区，这样会造成跨区读写，读写次数放大，从而影响读写速度。另外由于固态硬盘写入次数有限，如果4K不对齐，寿命也会缩短。使用SSD必须要进行4K对齐。

> ![](http://img0.pconline.com.cn/pconline/1611/11/8542681_32_thumb.png)
> “DiskGenius”进行分区，选择分区时一定记得勾选“对齐到下列扇区数的整数倍”，也就是我们常说的SSD 4K分区对齐。
>
>
- **注意**勾选“对齐分区到此扇区数的整数倍”这样就可以4K对齐了。
- 32位系统扇区数输入值为2048。如果系统是64位，建议输入值为4096。





原文出自：www.hangge.com  转载请保留原文链接：http://www.hangge.com/blog/cache/detail_901.html

> ![](http://img0.pconline.com.cn/pconline/1310/11/3603296_img_0275_thumb.jpg)
> ![](http://img0.pconline.com.cn/pconline/1305/13/3294218_3_thumb.jpg)

> ![](http://img0.pconline.com.cn/pconline/1409/23/5480481_581_thumb.jpg)


由于SATA模式: IDE或AHCI导致的蓝屏问题。

---

> [SSD故事会(1):5年前后SSD发生哪些变化?](http://diy.pconline.com.cn/610/6107477.html)
> ...
> [SSD故事会(21)：4TB SSD来了你准备好了吗?](http://diy.pconline.com.cn/815/8151000.html)

> [一图看懂：SSD这五年到底发生了什么？](http://diy.pconline.com.cn/850/8509444.html)
> [SSD升级选购全攻略①：SSD有哪些接口？懂了你才会选](http://diy.pconline.com.cn/849/8491225.html)
> 要设置双(多)硬盘设置固态硬盘启动，我们除了主板跳线上设置，还应该在BIOS进行设置。


[闪存](https://zh.wikipedia.org/zh-cn/闪存)

目前(2009年)固态硬盘的缺点：目前固态硬盘普及的五大问题：成本、写入次数、读取干扰、损坏时的不可挽救性及掉速。

> [固态混合硬盘 SSHD](http://www.seagate.com/cn/zh/solutions/solid-state-hybrid/ "希捷科技有限公司")

> 西部数据（Western Digital Corporation，简称WD）与2015年10月以190亿美元收购SunDisk(闪迪)公司。





以下内容摘抄至维基百科[固态硬盘](https://zh.wikipedia.org/zh-cn/固态硬盘)
目前用来生产固态硬盘的NAND Flash有三种，分别是单层式存储（SLC）、多层式存储（MLC，通常用来指称双层式存储）、三层式存储（TLC）。
SLC、MLC、TLC的读写速度依序从快至慢（约4:2:1），使用寿命依序从长至短（约6:3:2），成本依序从高至低。因为SLC的速度较快但成本过高，用于服务器的企业级SSD都改用了MLC。[5]TLC因为速度较慢但成本低。然而TLC的寿命、速度和可靠性（错误率）成为消费者的最大疑虑（见下文：缺点）。生产商会在TLC SSD使用更先进的主控及更多预留空间（OP）来处理这些问题。TLC的错误率已经很高，需要使用先进的主控及大量的空间进行纠错。如果发展4-bit MLC会令错误率升得更高，同时寿命更短。

SSD的预留空间（Over-provisioning，OP）可用作垃圾收回（Garbage collection）、ECC或其他数据保护技术。

预留空间可分成三层。

- 第一层是容量的7.37%；所以标示为0% OP的SSD，实际上也有7% OP。
- 第二层是厂商决定的，通常是0%、7%、28%。所以，我们会看见128GB、120GB、100GB的SSD。它们都有128GB，只是被厂商保留起来作OP。企业版SSD注重稳定性及耐用性，所以会保留多达28%空间作OP。
- 第三层是用户自行划分的，用户在分区时可自行预留空间作为OP，以满足不同需要（稳定性／可用空间）。如果预留多达50%空间作OP，持续地写入大量细小文件的高负载情况下，写入性能只有轻微下降。但一般情况下，没有需要再保留更多空间作OP，因为家用电脑不会大量和持续地写入数据。若以SSD创建RAID，应保留一定空间以弥补没有TRIM的影响。

> op不会造成在操作系统看磁盘大小变小。而是因为操作系统是以二进制计算空间大小。





>分区的时候，注意4K对齐。装固态注意这一点即可,(需从网上确定一下)



### 笔记本电脑加装SSD固态硬盘

<http://v.youku.com/v_show/id_XMTUzODYyNjU0OA==.html>

视频中当选择UEFI时（需要电脑支持）后面给磁盘分区时，如果直接点击“创建”新分
区可能不行，因为它要求分区格式为GPT，而非MBR分区。
此时按“sheft + F10” 打开命令行，使用命令将其转换成GPT格式：
输入命令：

```
> diskpart 
作用：启动diskpart程序，之后的命令都是其子命令。（网上搜索用法：它还可以进行分区，因此不必借助第三方软件）
> list disk     
作用：列出磁盘，看要转换的磁盘编号为数字几（这里是 0）
> select disk 0
作用：选中磁盘 0
> clean
作用：清除磁盘
> convert gpt
作用：转换成GPT格式
```

>DiskPart使用：   
>http://jingyan.baidu.com/article/92255446efce49851748f463.html





## 三星SSD









### Samsung Data Migration 系统迁移软件

Samsung Data Migration software is designed to help users quickly, easily, and safely migrate all of their data – including their current operating system, application software, and user data – from their existing storage device (e.g. HDD) to their new Samsung SSD.



官方说，该软件只能用于 三星自己的 SSD。（英特尔SSD貌似也有自己的系统迁移软件）



下载路径： [SSD Tools &amp; Software | Download | Samsung V-NAND SSD | Samsung Semiconductor Global Website](https://www.samsung.com/semiconductor/minisite/ssd/download/tools/ "SSD Tools &amp; Software | Download | Samsung V-NAND SSD | Samsung Semiconductor Global Website")  ，在 DATA MIGRATION 下寻找，这里还提供了中文用户文档，最好看一下，重点关注上面的限制条件。









