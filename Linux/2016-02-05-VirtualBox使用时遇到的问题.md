---
layout: post
title: "Virtual Box使用时遇到的问题"
description: "Virtual Box使用时遇到的问题"
date: 2016-02-05
tags: [Linux软件]
category: Linux
comments: true
share: true
---


* Kramdown table of contents
{:toc .toc}


# Virtual Box使用时遇到的问题

> Virtual Box虚拟机简称Vbox。

> Vbox网卡配置，Vbox与主机通信，见《使用SSH连接VirtualBox虚拟机.md》



## 在客户机时中安装Vbox的增强程序

手动安装VBoxAdditon ，即在虚拟机中安装Vbox的增强程序。

**前提**：  

- 虚拟机需安装 gcc 和 make 



### Fedora 中安装增强插件错误

根据之前的记录： 
```
#install gcc 
yum install gcc -y 
yum install gcc-g++ -y

#install VBoxLinuxAdditions.run FAILED,   
yum install kernel -y
yum install kernel-devel -y
#现在安装 vbox 增强插件的依赖已经具备， 现在需要手动进入 挂载的iso文件中执行操作。
```



### Debian 中安装增强插件错误

在Debian 8中它是被挂载到 `/media/cdrom0/` 目录下，进入该目录，以root身份执行 autorun.sh；如产生错误一定要去看/var/log/下的日志文件，以寻找解决办法。


在安装了gcc g++ make 后 /var/log/vboxadd-install.log中显示，
```
Makefile:181: *** Error: unable to find the sources of your current Linux kernel. Specify KERN_DIR= and run Make again. Stop
```

执行： `apt-get install linux-headers-$(uname -r)` 

解决问题。




## 虚拟机中的Linux系统挂载Vbox共享的文件夹

假定在添加共享文件夹的时候，共享的文件夹被你命名为 shared 
则在Guest Linux中执行： 

```
mkdir /mnt/vbox_shared
mount -t vboxsf shared /mnt/vbox_shared
```

如需每次开机自动挂载，则先要在添加共享文件夹时勾选“固定分配”，然后参考如下网站： 

[参考1](http://forum.ubuntu.org.cn/viewtopic.php?t=294734)   
[参考2](https://help.ubuntu.com/community/VirtualBox/SharedFolders)   
[参考3](http://www.cnblogs.com/52linux/archive/2012/03/07/2384381.html)    




## Vbox启动错误

错误提示如下：  

```
VirtualBox - Error in suplibOslnit   

Kernel driver not installed(rc=-1908)  
	...
Please reinstall the kernel module by executing 

`/sbin/vboxconfig`

...
...

```

执行了错误提示中的命令：  但没有效果。


由于VisualBox 与linux内核的结合比较紧密，而Linux内核更新频繁，因此可能出现如上错误；
在此情况下，需要重新编译VirtualBox的内核，Ubuntu中使用如下命令：   
```
sudo /etc/init.d/vboxdrv setup  
```

[参考](http://www.cnblogs.com/WormCanFly/archive/2012/05/23/2514338.html)

> 处理方法已经写入 `~/.local/bin/`  下的相关sh文件中。





## 不能为虚拟机XXX打开一个新任务


```
不能为虚拟机XXX打开一个新任务
。。。
apic#0: Config mismatch - uApicMode: saved=3 config=2 [ver=5 pass=final] (VERR_SSM_LOAD_CONFIG_MISMATCH).
```
当前虚拟机处于休眠状态

解决办法：点击清除虚拟机状态。重启就好了。



## VirtualBox安装扩展包

[在此](https://www.virtualbox.org/wiki/Downloads)下载对应版本的扩展包（版本一定要对应），扩展包后缀名为 ` .vbox-extpack`，直接双击扩展包进行安装即可。

[VirtualBox扩展包安装教程](http://www.xitongcheng.com/jiaocheng/xtazjc_article_24066.html "VirtualBox扩展包安装教程")





## VirtualBox快照失效

在重装系统后，再次安装virtualox，所有路径保持原先路径，然后调用原来的磁盘文件，发现虚拟机是可以使用了，但是原来的快照全部丢失，虽然我的快照文件还在电脑里并且还在原来的路径，但是virtualbox死活不认了 。

VirtualBox快照（Snapshot）



**最初的操作步骤：**

`新建 -> 填入“虚拟电脑名称和系统类型” -> 然后在虚拟硬盘处 -> 选用"使用已有的虚拟硬盘文件" -> 创建 -> 完成 `

出现的问题： 新建的虚拟机运行于创建第一个快照之前，并且无法看到任何快照。



**之后又使用如下的方式导入虚拟机：**

1. 控制
2. 注册
3. 选择对应虚拟机的 `.vbox` 文件

运行虚拟机后，可以看到已经恢复到最新状态（最后一个快照之后），但是还是不能看到之前创建的虚拟机。





 `.vbox` 文件，可以以文本格式打开。


[VirtualBox虚拟机的迁移和快照问题__新浪博客](http://blog.sina.com.cn/s/blog_4adf6c7b0101i4x0.html "VirtualBox虚拟机的迁移和快照问题_章郎虫_新浪博客")



