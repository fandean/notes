# Linux硬件相关


## 基础知识

最好先学习一下内核、外设相关命令：  

学习路径看云上的：《鸟哥的Linux私房菜 第4版基础版》、《完全用 GNU/Linux 工作》

### Linux显示PCI设备
使用命令lspci： 例如 `lspci -tv`   和  `lspci -vv`

### Linux显示USB设备
使用命令lsusb；示例： `lsusb -tv`

### Linux显示内存状态
free命令




## CPU信息

查看位数：  
```
# 说明当前CPU运行在32bit模式下, 但不代表CPU不支持64bit
getconf LONG_BIT
```

通过文件查看： 
```
cat /proc/cpuinfo
```

查看CPU硬件架构：  
```
arch
# 或者
uname -m
```
ia64和x86_64就说明这台机器是64位的


### GUI工具Psensor监测CUP温度

其对应的命令为`sensor`；但其需要事先安装了几个依赖，Ubuntu 16.04中默认安装了该命令，所以直接通过apt安装Psensor即可。

直接使用sensor命令也可查看相关信息。


[如何在 Ubuntu 中检查笔记本 CPU 的温度](https://linux.cn/article-5682-1.html)  



## USB设备

使用lsusb命令查看已连接的usb设备



## 显卡驱动安装

> 没有安装独立显卡的驱动

在“程序和更新”界面，选择“附加驱动”标签页，发现有相关驱动可供选择。



> 安装了第三方提供的Nvidia显卡驱动后，开机无法进入登陆界面（但之前xubuntu 16是没问题的），但可以看到xubuntu 18的启动界面（检查文件系统的界面），直接卸载该网卡驱动再重启居然可以解决（我还以为要手动安装之前的网卡驱动），直接在该界面按 `Ctrl + Alt + F1`进入字符界面，登录账户，然后运行 `sudo apt remove --purge nvidia-* `进行卸载，再 `sudo reboot`进行重启。









## 网卡驱动安装

> 情况：在将磁盘换到另一部电脑后无法连接网络，无线和有线都不行。

在“程序和更新”界面，选择“附加驱动”标签页，发现有相关无线网卡驱动可供选择。但是没有网无法下载。    
在ubs上的Live中测试是可以用有线连到网的，无线连启用wifi都看不到；这个可以使用如下的命令

```
sudo apt-get install linux-headers-generic build-essential dkms  
sudo apt-get install linux-source  
sudo apt-get install --reinstall bcmwl-kernel-source  
sudo modprobe wl
```
> 吐槽：上面的命令是我直接搜索："ThinkPad E431 Linux 安装无线网卡驱动"得到的。

> 使用apt-get只下载二进制包，而不安装的命令是：`sudo apt-get install -d 软件名称`，不过要注意，像bcmwl-kernel-source这种软件是自动根据你的内核版本来下载的。



使用了上面的命令之后，可以看到"启用wifi"选项，可以搜索到附近的wifi信号，但是还是连不上。

> 在此之前，看了下面的一个教程，将有线网卡的驱动换了，并且型号看起来并不是很匹配。
> 现在至少可以确定，重装系统还是可以联网的。

现在考虑是不是配置也有问题，可按理来说我是全盘克隆过来的配置上应该没问题。



---

[Ubuntu更换网卡驱动](http://www.linuxdiyf.com/linux/16286.html)  
ifconfig-a：查看所有网卡名，找到指定网卡；其中eth0是有线网卡，wlan0是无线网卡，lo是localhost

[安装Ubuntu 16.04出现的各种问题总结](http://www.linuxdiyf.com/linux/21471.html) 与平哥的是同一个网卡型号。


在“程序和更新”界面，选择“附加驱动”标签页，发现有相关驱动可供选择。但是没有网无法下载。

[Ubuntu broadcom无线网卡驱动安装](https://my.oschina.net/itblog/blog/221818)    
此教程网卡驱动安装步骤  

1. 查询硬件信息 `lspci -vv | grep Network`
2. 下载驱动
3. 解压到任意目录，编译源文件（解决编译过程中的问题，比如必须有编译环境）
4. 将生成的wl.ko文件拷贝到内核中指定的驱动文件夹中
5. 载入模块：`sudo modprobe wl`，删除有冲突的模块
6. 安装
7. 设置开机启动



[Linux安装无线网卡驱动，实现Linux无线上网](http://7392072.blog.51cto.com/7382072/1271559)    

此教程中外置usb无线网卡驱动安装步骤  

1. 查询硬件信息 `lspci -vv | grep Network`
2. 下载驱动
3. 将下载文件夹中的`/dirver`目录下的文件，复制到`/usr/local/src/`下
4. 编译**安装**驱动（如果是源文件）
5. 重启系统，查看系统是否加载该驱动模块：`lsmode | grep -i 模块名部分匹配字段`
6. 如果不能自动加载，则修改`/etc/modprobe.conf`文件，手动添加
7. 激活网卡
8. 安装网卡工具
9. 。。。



## 电源管理