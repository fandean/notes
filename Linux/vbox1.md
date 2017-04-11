# Vbox
> Virtual Box虚拟机简称Vbox。

> Vbox网卡配置，Vbox与主机通信，见《使用SSH连接VirtualBox虚拟机.md》


## 手动安装VBoxAdditon 
即在虚拟机中安装Vbox的增强程序。

前提：  
虚拟机需安装了 gcc 和 make 


## Fedora 中安装增强插件错误
根据之前的记录： 
#install gcc 
yum install gcc -y 
yum install gcc-g++ -y

#install VBoxLinuxAdditions.run FAILED,   
yum install kernel -y
yum install kernel-devel -y
#现在安装 vbox 增强插件的依赖已经具备， 现在需要手动进入 挂载的iso文件中执行操作。



## Debian 中安装增强插件错误

在Debian 8中它是被挂载到 /media/cdrom0/ 目录下，进入该目录，以root身份执行autorun.sh；如产生错误一定要去看/var/log/下的日志文件，以寻找解决办法。


在安装了gcc g++ make 后 /var/log/vboxadd-install.log中显示，
```
Makefile:181: *** Error: unable to find the sources of your current Linux kernel. Specify KERN_DIR= and run Make again. Stop
```

执行： apt-get install linux-headers-$(uname -r) 

解决问题。




## 虚拟机中的Linux系统挂载Vbox共享的文件夹

假定在添加共享文件夹的时候，共享的文件夹被你命名为 shared 
则在Guest Linux中执行： 

```
mkdir /mnt/vbox_shared
mount -t vboxsf shared /mnt/vbox_shared
```

如需每次开机自动挂载，则先要在添加共享文件夹时勾选“固定分配”，然后参考如下网站： 

[1](http://forum.ubuntu.org.cn/viewtopic.php?t=294734)
[2](https://help.ubuntu.com/community/VirtualBox/SharedFolders)
[参考3](http://www.cnblogs.com/52linux/archive/2012/03/07/2384381.html)




## Vbox启动错误

处理方法已经写入 ~/.local/bin/  下的相关sh文件中。


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
在此情况下，需要重新编译VirtualBox的内核，Ubuntu下命令如下：   

sudo /etc/init.d/vboxdrv setup  




[参考如下](http://www.cnblogs.com/WormCanFly/archive/2012/05/23/2514338.html)


## 不能为虚拟机XXX打开一个新任务


```
不能为虚拟机XXX打开一个新任务
。。。
apic#0: Config mismatch - uApicMode: saved=3 config=2 [ver=5 pass=final] (VERR_SSM_LOAD_CONFIG_MISMATCH).
```
当前虚拟机处于休眠状态

解决办法：点击清除虚拟机状态。重启就好了。

