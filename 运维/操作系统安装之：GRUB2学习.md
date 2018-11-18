



## GRUB介绍



> 另见《系统引导和修复》



> 本文 GRUB 均指 GRUB 2



- GRUB 是一个**多重**启动管理器，用来引导不同系统。GRUB是GRand Unified **Bootloader**的缩写 。

- GRUB 是一个用于计算机**寻找操作系统内核并加载其到内存**的智能程序。 

- GRUB 被设计为**兼容**操作系统[多重引导规范](https://en.wikipedia.org/wiki/Multiboot_Specification)，它能够用来引导不同版本的 Linux 和其他的开源操作系统；它还能链式加载专有操作系统的引导记录。 

- GRUB 允许用户从任何给定的 Linux 发行版本的几个**不同内核中选择**一个进行引导。这个特性使得操作系统，在因为关键软件不兼容或其它某些原因升级失败时，具备**引导到先前版本**的内核的能力 

-  GRUB 也是一个类似主框架（mainframe）系统上的**基于命令行的前置操作系统**（Pre-OS）环境，使得在预引导阶段配置更为方便和易操作。GRUB2 通过 `/boot/grub2/grub.cfg` 进行配置。

- 分区大小改变后不必重新配置 。只要操作系统核心的路径没有改变，grub就可以引导系统。 

- GRUB可以读取本机的各种（应该是大多数）分区（类型）。

   



>  由于GRUB的快速发展，最初的GRUB（被命名为 GRUB Legacy）开始跟不上扩展需求，最后不得不重写GRUB的核心，并将新版本命名为GRUB2。







## Linux开机引导和启动示例

>  [Linux 开机引导和启动过程详解](https://linux.cn/article-8807-1.html "技术|Linux 开机引导和启动过程详解")
>
> 理解操作系统开机引导和启动过程对于配置操作系统和解决相关启动问题是至关重要的。该文章陈述了 [GRUB2 引导装载程序](https://en.wikipedia.org/wiki/GNU_GRUB)开机引导装载内核的过程和 [systemd 初始化系统](https://en.wikipedia.org/wiki/Systemd)执行开机启动操作系统的过程。



事实上，操作系统的启动分为两个阶段：引导boot和启动startup。**引导阶段**开始于打开电源开关，结束于内核初始化完成和 systemd 进程成功运行。**启动阶段**接管了剩余工作，直到操作系统进入可操作状态。



![](https://segmentfault.com/img/bV0Rp5?w=529&h=300)



> stage：阶段
>
> 引导加载程序 (Boot loader) 
>
> 上面的 Init 可以换成 **systemd**进程（systemd时老式System V系统的init程序的替代品），
>
> systemd 是所有进程的父进程。它负责将 Linux 主机带到一个用户可操作状态（可以执行功能任务），可以管理运行中的 Linux 主机的许多方面，包括挂载文件系统，以及开启和管理 Linux 主机的系统服务等。 



- **BIOS 上电自检（POST）：** 当电脑接通电源，电脑开始执行 BIOS（基本输入输出系统Basic I/O System）的 POST（**上电自检**Power On Self Test）过程。 **BIOS 上电自检确认硬件的基本功能正常**，然后产生一个 BIOS [中断](https://en.wikipedia.org/wiki/BIOS_interrupt_call) INT 13H，该中断指向某个接入的可引导设备的**引导扇区**。它所找到的包含有效的引导记录的第一个引导扇区将被装载到内存中，并且控制权也将从引导扇区转移到此段代码。 **引导扇区**是**引导加载器**真正的第一阶段。大多数 Linux 发行版本使用的引导加载器有三种：GRUB、GRUB2 和 LILO 
- 引导装载程序 (GRUB2)
- 内核初始化
- 启动 systemd，其是所有进程之父。





当电脑接通电源，电脑开始执行 BIOS（基本输入输出系统Basic I/O System）的 POST（上电自检Power On Self Test）过程。 





查看顺序：

1. [Linux 开机引导和启动过程详解](https://linux.cn/article-8807-1.html "技术|Linux 开机引导和启动过程详解")
2. [Grub学习笔记 - 个人文章 - SegmentFault 思否](https://segmentfault.com/a/1190000012559337 "Grub学习笔记 - 个人文章 - SegmentFault 思否")
3. [GRUB启动分析之stage1-Bean_lee-ChinaUnix博客](http://blog.chinaunix.net/uid-24774106-id-3497929.html "GRUB启动分析之stage1-Bean_lee-ChinaUnix博客") （一系列有深度的文章）
4. GRUB2更新 ： http://www.cnblogs.com/f-ck-need-u/p/7094693.html







GRUB 的最主要作用都是将内核加载到内存并运行 ，其主要的 3 个引导阶段：





## GRUB基本命令

可以使用Tab补全。



### 安装grub

GRUB的一个重要的特性是安装它不需依附一个操作系统;但是，这种安装需要一个Linux副本。由于单独工作，GRUB实质上是一个微型系统，通过链式启动的方式，它可以启动所有安装的主流操作系统。

　　与LILO不同，修改GRUB的配置文件后，不必把GRUB重新安装到MBR或者某个分区中。

　　在Linux中，“grub-install”命令是用来把GRUB的步骤1安装到MBR**或者**分区中的。GRUB的配置文件、步骤2以及其它文件必须安装到某个可用的分区中。如果这些文件或者分区不可用，步骤1将把用户留在命令行界面。

　　GRUB配置文件的文件名和位置随系统的不同而不同;如在Debian和OpenSUSE中，这个文件为/boot/grub/menu.lst， 而在Fedora和Gentoo中为/boot/grub/grub.conf。Fedora提供了一个从/etc/grub.conf到/boot/grub/grub.conf的符号链接。

　　除了硬盘外，**GRUB也可安装到光盘、软盘和闪存盘等移动介质中** （这个怎么弄？），这样就可以带起一台无法从硬盘启动的系统。





[GRUB - 搜狗百科](https://baike.sogou.com/v2847868.htm?fromTitle=GRUB "GRUB - 搜狗百科")



## grub.conf配置

如果只是想要配置GRUB则直接修改grub.conf文件即可。





- [一分钟掌握Linux系统grub.conf配置核心知识](https://mp.weixin.qq.com/s?src=11&timestamp=1529117882&ver=941&signature=KSwc8wo0sxo7whd39-DSMWyOwDlbO*6VPsLaaJ6Mxrm9XDXBB9HscTDm0Z7f4C39kNXDpa2tTQCUKgNVx1Nx6C6nbX62PDngxpmwc4*4IrW9ove8wVhPYCE0DxE8I2uA&new=1 "老男孩Linux运维")
- [GRUB入门教程](http://www.360doc.com/content/17/0718/17/2902158_672367942.shtml "GRUB入门教程")
- [安装乌班图后进不去？手动写入GRUB就搞定！](https://mp.weixin.qq.com/s?src=11&timestamp=1529117882&ver=941&signature=g5VaENfRBSYpPSfgRPPRDdUQs1A0GpW2Ia5dFPHwFK1P8WY4ID5XMVOzBDmirpradyUag0Lu8BZ3MTwvBx7ABaqcCjXBq7ZtviLFVW74yycWB0ORKpEYbqFpZcmXJJ7K&new=1 "椰果笔记")
- [GRUB手册（1） - CSDN博客](https://blog.csdn.net/wuhui_gdnt/article/details/6647749 "GRUB手册（1） - CSDN博客")







一些文件：

如今Grub已经成为了主流（类似Windows下的boot.ini引导文件） 

 在[传统的常规 MBR](https://en.wikipedia.org/wiki/Master_boot_record) 中，引导代码实际所占用的空间大小为 446 字节。这个阶段 1 的 446 字节的文件通常被叫做引导镜像（boot.img） 

阶段 1.5 的代码镜像 core.img 文件 



参考：

[Grub学习笔记 - SegmentFault 思否](https://segmentfault.com/a/1190000012559337 "Grub学习笔记 - 个人文章 - SegmentFault 思否")







