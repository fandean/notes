

## 常見錯誤

### coms checksum error-defaults loaded
CMOS checksum error-Defaults loaded 的中文意思是:CMOS执行全部检查时发现错误,要载入系统预设值。

按下F1或者試一下Enter鍵继续进入系统

出现cmos checksum error-defaults loaded原因: CMOS 执行整和检查时发现错误,主要是因为BIOS中设置与真实硬件数据不符引起的,可以分为以下4种情况及解决方法:1、实际上没有软驱或者软驱坏了,而BIOS里却设置有软驱,这样就导致了要按F1才能继续。开机后 按DEL 进入 BIOS ,在选择软驱中选择 NONE 后按F10保存就可以了。2、原来挂了两个硬盘,在BIOS中设置成了双硬盘,后来拿掉其中一个的时候却忘记将BIOS设置改回来,也会出现这个问题。 去设置换过来就好。3、主板电池没有电了也会造成数据丢失从而出现这个故障。,换块电池即可解决。4、重新启动系统,进入BIOS设置中,发现软驱设置为1.44M了,但实际上机箱内并无软驱,将此项设置为NONE后,故障排除。 简单解决问题。

[CMOS CHECKSUM ERROR - DEFAULT LOADED](http://ccm.net/faq/618-cmos-checksum-error-default-loaded)



### Windows时间同步

[Windows时间同步](http://www.metsky.com/archives/439.html  "推荐")
[windows ntp server时间同步命令](http://www.360doc.com/content/11/0718/17/3804236_134325057.shtml)
[Windows 命令行同步时间](http://madman.blog.51cto.com/62132/690077)
[使用windows自带ntp客户端进行时间同步的方法](http://blog.csdn.net/maryzhao1985/article/details/6721489)

笔记本使用时间久了，主板上的CMOS电池没电；导致每次开机时间不正确。在企业级应用环境中，不同服务器之间的时间差很可能引发应用系统问题。

与Internet时间服务器同步,默认一周Windows 7会自动同步一次（Win10 每天同步），当然这个间隔时间还可以调整。Internet时间同步可能很难一次成功，主要原因是因为这些时间同步服务器被太多人使用
检查Windows Time服务是否启动；不同服务器有不同的限制策略，比如nist.gov要求同步时间最短不能小于4秒，连续点肯定会被直接拒绝掉。




可用时间服务器：

- nist-time-server.eoni.com	216.228.192.69	La Grande, Oregon
  - wolfnisttime.com66.199.22.67	Wolf-Tek, Birmingham, Alabama
    - nisttime.carsoncity.k12.mi.us198.111.152.100Carson City, Michigan
    - nist1-lnk.binary.net216.229.0.179Lincoln, Nebraska
    - wwv.nist.gov24.56.178.140WWV, Fort Collins, Colorado
    - utcnist.colorado.edu128.138.140.44University of Colorado, Boulder
      - utcnist2.colorado.edu128.138.141.172University of Colorado, Boulder
    - nist-time-server.eoni.com216.228.192.69La Grande, Oregon


最新的服务器：
time-a.timefreq.bldrdoc.gov	132.163.4.101	NIST, Boulder, Colorado
utcnist.colorado.edu	128.138.140.44	University of Colorado, Boulder


**最终**更改了 Windows Time服务的启动方式为“自动”；更改服务器地址为nist-time-server.eoni.com；在注册表中更改同步周期为6小时（21600十进制），原本为一天86400。【编辑注册表应该就不用了】
并在任务计划程序中建立“当开机时同步网络时间”的任务（通过执行脚本）选中该任务点击属性，触发器设置延迟任务2分钟；在设置中设置如果任务失败则每5分钟执行一次最多尝试3次。

脚本内容：
```bat
@rem REM命令后加注释内容, @表示命令本身不显示出来
@rem 用于进行用户登录时的时间同步（可能需要事先运行Windows Time服务），在计划任务中进行添加
@rem 笔记见<https://www.zybuluo.com/mdeditor#601777>
@REM 不知为什么注释有问题，使用时删除注释内容
w32tm /config /manualpeerlist:"216.228.192.69 132.163.4.101 128.138.140.44"  /syncfromflags:manual  /update
```



### 组策略对象编辑器的使用
组策略对象编辑器： 通过“运行” `gpedit.msc` 来打开



﻿# 电脑使用技巧及优化

---



电脑使用技巧
==============================


1.windows 10 添加开机启动项
------------------------------------

1. 添加快捷键到 `C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp `     
2. `Win + R` 输入 `shell:startup` 会打开一个文件夹，将快捷方式放入此即可。     



2. 添加、修改右键“发送到...”
-------------------------------------------------

`Win + R` 输入 `shell:sendto` 会打开一个文件夹，在此文件夹中添加、删除快捷方式。   


```
Win + R 实在是一个神奇的东西
```


3.查看详细系统信息
-------------------------------------

- 可使用cmd中的`systeminfo`命令。
- 打开 `‪C:\Windows\System32\msinfo32.exe` 可显示超级详细的系统信息。



4.Bash on Ubuntu on Windows
------------------------------------


For Windows, install a Bash shell. There are several options, including the following:

- Download an open source Bash shell, such as PuTTY.
- Or, on Windows 10, use the new built-in Bash shell (beta).（Bash on Ubuntu on Windows）
- Or, if you work with Git, use the Git Bash shell. **利用Git的Bash shell**





新版参考这里：

[Install the Windows Subsystem for Linux](https://docs.microsoft.com/zh-cn/windows/wsl/install-win10)

[Ubuntu on Windows10 跨平台开发环境搭建权威指南 - leejun2005的个人页面 - 开源中国](https://my.oschina.net/leejun2005/blog/1621918?from=juejin "Ubuntu on Windows10 跨平台开发环境搭建权威指南 - leejun2005的个人页面 - 开源中国")







>  lxrun属于旧命令，过时了 ，比如：`lxrun /uninstall /full`   `lxrun /install`









### 5. Windows中创建定时任务

> 需求，定时自动同步FTP









------



一些系统优化的方法
============================

[最初来源](http://www.myhack58.com/Article/48/65/2014/50124.htm)  
[异次元优化](http://www.iplaysoft.com/windows8-you-hua-ji-qiao.html)  
[Windows7开机加速全攻略](http://www.win7china.com/html/5402.html "推荐") 其中包括“全面了解Windows 7系统的百余个服务”的详细介绍。已经摘抄到 OneNote  


1.关闭家庭组，因为这会导致硬盘和CPU处于高负荷状态
----------------------------------------------------

离开现有家庭组，直接把家庭组服务关闭，步骤：  
1. 服务  
2. 禁用 HomeGroup Listener 和 Homegroup Provider服务


2.用好索引选项，减少硬盘压力
-----------------------------

控制面板 --> 索引选项 --> 修改 --> 取消不想索引的位置。   

如果习惯使用 everything搜索软件，可以关闭索引功能。   
禁用服务"Windows Search"   


3.关闭磁盘碎片整理计划
-------------------------------

用好磁盘碎片整理可以提高磁盘性能，如果习惯手动整理，可以关闭整理计划，避免在你工作时系统自动整理，影响性能。   

资源管理器 --> 磁盘 --> 属性 --> 工具 --> ... --> 优化 --> 更改设置 --> 取消选择按计划运行   

**设置好Superfetch服务**    
服务  -->  Superfetch --> 启动类型 --> 自动(延迟启动)；可以避免系统刚好启动时对硬盘的频繁访问。   


4.关闭IPv6
---------------------

部分网卡驱动开启 ipv6 会导致开机系统未响应，如果不是ipv6用户建议关闭。  

网络共享中心 --> 网络连接 --> 以太网 --> 属性 --> 取消ipv6  


5.开启Hybrid Boot
---------------------------

可以加快启动速度。  

控制面板 --> 电源选项 --> 选择电源按钮的功能 --> 更改当前不可用的设置 --> 关机设置 --> 勾上启动快速启动   

开启此项后，如果安装了 Linux/Windows 双系统，则有时会导致Linux系统无法挂载windows分区。  


6.关闭性能特效
------------------------

系统属性 --> 高级 --> 设置 --> 关闭淡出淡入效果   

以加速文件夹、小软件的开启速度  
