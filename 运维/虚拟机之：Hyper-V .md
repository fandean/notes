# Hyper-V



[Windows 10 上的 Hyper-V 简介 | Microsoft Docs](https://docs.microsoft.com/zh-cn/virtualization/hyper-v-on-windows/about/ "Windows 10 上的 Hyper-V 简介 | Microsoft Docs")



Hyper-v 的各种操作，包括如何开启Hyper-V 和 如何创建虚拟机。



启用了 Hyper-V 功能后， Vmware Workstation 和 VirtualBox 都不能使用。



> 各种虚拟机： [4 Free Virtualization Software Solutions For Windows](https://www.maketecheasier.com/4-free-virtualization-software-solutions-for-windows/ "4 Free Virtualization Software Solutions For Windows")



由于想体验 Docker for Windows 才启用了 Hyper-V 功能，但是还是会照成不少麻烦，后来想到可以通过在 Linux 虚拟机中安装 Docker来使用 Docker。



**安装 Docker for Windows：**

只有windows 10 内置了Hyper V 虚拟环境，所以只有win10才能安装docker for windows。

下载安装包安装即可，首次运行会出现下面的提示：“Hyper-V and Containers features are not enabled. Do you want to enable them for Docker to be able to work properly?
Your computer will restart automatically. Note: VirtualBox will no longer work.（VirtualBox将不能运行）” 开启Hyper-V将不能使用Vbox虚拟机，这个让人感到苦恼，这里有人提供了命令来开启和关闭Hyper-V功能 [virtualbox - Simple instructions needed for enabling and disabling Hyper V Docker - Stack Overflow](https://stackoverflow.com/questions/47081205/simple-instructions-needed-for-enabling-and-disabling-hyper-v-docker "virtualbox - Simple instructions needed for enabling and disabling Hyper V Docker - Stack Overflow")。

You can do below to disable

```
dism.exe /Online /Disable-Feature:Microsoft-Hyper-V
bcdedit /set hypervisorlaunchtype off
```

and below to enable

```
dism.exe /Online /Enable-Feature:Microsoft-Hyper-V /All
bcdedit /set hypervisorlaunchtype auto 
```

From PowerShell

To Disable

```
Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All
```

To Enable

```
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V –All
```

**记得以管理员身份运行**。运行后需要重启操作系统。

Windows中的相关问题可以参考一下Docker的文档： [Logs and troubleshooting | Docker Documentation](/docker-for-windows/troubleshoot/ "Logs and troubleshooting | Docker Documentation")

[Windows 10 上的 Hyper-V 简介 | Microsoft Docs](https://docs.microsoft.com/zh-cn/virtualization/hyper-v-on-windows/about/ "Windows 10 上的 Hyper-V 简介 | Microsoft Docs")

[在 Windows 10 上启用 Hyper-V | Microsoft Docs](https://docs.microsoft.com/zh-cn/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v "在 Windows 10 上启用 Hyper-V | Microsoft Docs")







[使用Hyper-V创建虚拟机 - whdxwym - 博客园](https://www.cnblogs.com/masterwen/p/4230385.html "使用Hyper-V创建虚拟机 - whdxwym - 博客园")



（2017） Vmware 和 Hyper-V 比较：

Vmware挂起虚拟机较慢，需要等到虚拟内存释放掉才能关机。而Hyper-V挂起虚拟机比较快，且可在不考虑虚拟系统运行的情况下直接关机。

在虚拟系统显示上VMware略胜一筹，在开启vm-tools之后能够自动配置虚拟系统界面显示大小。**Hyper-V只能显示固定大小**。

网络配置方面，VMware可随时桥接主机网络适配器，Hyper-V需要配置虚拟路由器。

Hyper-V不能直接使用USB外设，这直接导致我弃用Hyper-V，Hyper-V设计的一大败笔。



Hyper-V中虚拟机的屏幕大小，最小只能是 100% 缩放，而我的屏幕分辨率低，导致不能完整显示；这样在操作时只能通过 “全屏查看” 时产生的 滚动条来查看一些显示在屏幕外、看不到的按钮。







## Hyper-V 安装 CentOS 7



此次安装是默认选择安装了如下服务：

- ftp， ssh
- 邮件服务器
- PostgreSQL
- 必要的开发环境
- ... 忘了





```
kernel.x86_64                                                               3.10.0-862.9.1.el7                                                     updates
kernel-devel.x86_64                                                         3.10.0-862.9.1.el7                                                     updates
kernel-headers.x86_64                                                       3.10.0-862.9.1.el7                                                     updates
kernel-tools.x86_64                                                         3.10.0-862.9.1.el7                                                     updates
kernel-tools-libs.x86_64                                                    3.10.0-862.9.1.el7
```



