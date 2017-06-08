# Linux硬件相关

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









## 显卡驱动安装

> 没有安装独立显卡的驱动

## 网卡驱动安装

> 情况：在将磁盘换到另一部电脑后无法连接网络，无线和有线都不行。



