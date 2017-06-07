# Ubuntu 小技巧

> 已经将此文章转移到 《Linux使用过程出现的问题》的章节里面。

<!-- TOC -->

- [Ubuntu 小技巧](#ubuntu-小技巧)
    - [Ubuntu 小技巧](#ubuntu-小技巧-1)
        - [1.添加臨時安裝源](#1添加臨時安裝源)
        - [2.特殊字符输入](#2特殊字符输入)
        - [3. boot空间太小，无法完成更新](#3-boot空间太小无法完成更新)
        - [4. 详细系统备份还原介绍：](#4-详细系统备份还原介绍)
        - [5. Ubuntu下光标闪烁问题](#5-ubuntu下光标闪烁问题)
        - [6. mkdir命令：](#6-mkdir命令)
        - [7. ibus 输入法，翻页问题](#7-ibus-输入法翻页问题)
        - [8. ibus 卸载可能导致系统出错](#8-ibus-卸载可能导致系统出错)
        - [9.推荐软件](#9推荐软件)
        - [10.图形界面卡死](#10图形界面卡死)
        - [11.fonts-config](#11fonts-config)
        - [12.](#12)
        - [13. 安装Chromium后Flash Player的安装](#13-安装chromium后flash-player的安装)
        - [14. 与windows共用的硬盘分区无法加载](#14-与windows共用的硬盘分区无法加载)
        - [15. ssh用法](#15-ssh用法)
        - [16  Java编程环境安装](#16--java编程环境安装)
        - [17 主题/及主题切换工具安装](#17-主题及主题切换工具安装)
        - [18. 修改默认程序](#18-修改默认程序)
        - [19. apt-get build-dep 选项](#19-apt-get-build-dep-选项)
        - [20 boot空间旧内核清理](#20-boot空间旧内核清理)
        - [21.7zip安装使用](#217zip安装使用)
        - [22.保存屏幕亮度](#22保存屏幕亮度)
        - [23.添加桌面图标](#23添加桌面图标)
        - [24.Okular保存标注到PDF文件的方法](#24okular保存标注到pdf文件的方法)
        - [25.修改系统默认编辑器为vim](#25修改系统默认编辑器为vim)
        - [26. 自建的启动器位于~/.local/share/applications/](#26-自建的启动器位于localshareapplications)
        - [27. 自建 freeplane 桌面启动器，导致的中文输入问题](#27-自建-freeplane-桌面启动器导致的中文输入问题)

<!-- /TOC -->

## Ubuntu 小技巧

> vs code插件生成的markdown目录的各层级间需要是连续的；不然显示会有问题。


### 1.添加臨時安裝源
安裝好軟件後即將其手工註釋掉，免得影響穩定版軟件。

### 2.特殊字符输入

<https://help.ubuntu.com/lts/ubuntu-help/tips-specialchars.html>

2.特殊字符输入  
<https://help.ubuntu.com/lts/ubuntu-help/tips-specialchars.html>

### 3. boot空间太小，无法完成更新

	插入启动优盘，进入试用模式
	sudo su -
	sudo gparted               #gparted图形界面的硬盘分区软件
	在gparted下调整/boot 大小
	此法还可能有错误，详情见 <http://forum.ubuntu.org.cn/viewtopic.php?t=257333>

### 4. 详细系统备份还原介绍：
<http://ghosertblog.github.io/blog/2012/12/04/ubuntu-living-handbook-backup-restore/>

### 5. Ubuntu下光标闪烁问题
可能是双显卡问题，在显示设置处禁用未知显示器，问题解决。(亲测)    
其它情况可能要重新完整安装gnome桌面环境。(未试)   

### 6. mkdir命令：
		mkdir -p test/test1/test2

### 7. ibus 输入法，翻页问题

		usr/lib/ibus/ibus-setup-*			进行设置
		也可在图形界面进入目录 /usr/share/applications  进行设置
		ibus-googlepinyin , ibus-rime 等输入法再ibus 下无法设置，首选项不可选

### 8. ibus 卸载可能导致系统出错
详见：<http://sixipiaoyang.blog.163.com/blog/static/623235882014450916276/>  


### 9.推荐软件 
基于文本的Torrent客户端： rTorrent 。应该不咋地。

### 10.图形界面卡死

	ctrl+alt+F1
	ps -t tty7
	找到Xorg进程 （Xorg是界面上的进程）
	kill ***
	ctrl+alt+F7

在Xubuntu中，按一下电源键会弹出关机、重启界面，选择重启。


### 11.fonts-config

<forum.ubuntu.com.cn/viewtopic.php?t=377905>

[字体美化]: http://forum.ubuntu.com.cn/viewtopic.php?t=377905

	命令 	$ fc-config

### 12. 
突然发现fictx按下 ctrl + ; 键可以调出粘贴板，并有5项缓存可供选择。但此按键当开启keynav时被其占用。  
修改方式“输入法配置” --> “附加组件” --> “选中剪贴板” --> “点击配置” 
可将其修改成 ctrl+'




### 13. 安装Chromium后Flash Player的安装   
已经安装了Adobe Flash Player，可是还是提示未安装Flash Player。    

**在Chromium发生这个问题的原因是**    
之前Chromium使用Netscape Plugin API架构来支持Flash，从Ubuntu 14.04开始，
Chromium将会停止使用Netscape Plugin API。

**修复方法**   
在Ubuntu 14.04的源里有Adobe Flash Player Pepper安装器。这个安装器会下载Google Chrome，
提取出Pepper Flash Player然后设置给Chromium使用。    

	$ sudo apt-get install pepperflashplugin-nonfree
	$ sudo update-pepperflashplugin-nonfree --install

之后重启Chromium即可。  

参考网址：<http://jingyan.baidu.com/article/ad310e80caaeeb1849f49e94.html>  




### 14. 与windows共用的硬盘分区无法加载

在Windows的电源管理中关闭快速启动功能


### 15. ssh用法     

如果服务端未启动ssh服务则启动： ` /etc/init.d/sshd start

连接：  ssh name@address 

更多技巧见： < http://www.seye.com.cn/newsDetail.lzs?id=959>  




### 16  Java编程环境安装

<http://www.cnblogs.com/meizhouxiang/p/4266006.html>  
<http://blog.csdn.net/conanswp/article/details/24131019>  



### 17 主题/及主题切换工具安装
http://itsfoss.com/best-icon-themes-ubuntu-1404/
http://itsfoss.com/how-to-install-themes-in-ubuntu-13-10/

不好用


### 18. 修改默认程序    
右击该文件，选择"属性" --> "打开方式" , 即可进行更改。  



### 19. apt-get build-dep 选项

	sudo apt-get build-dep vim      

安装vim的编译依选项 build-dep使用  

另赋 `-y` 选项，在安装软件询问是否下载时，自动选择 yes 。



### 20 boot空间旧内核清理 

旧内核占用/boot太多空间，以至于无法更新，新内核。    
0. df -lh   ： 查看是否是/boot 空间不足  
1. dpkg --get-selections | grep linux-image   ：用于查看已经安装的linux-image各版本。       
2. uname -a 查看当前使用的是哪个版本（一般是最新的）     
3. sudo apt-get purge linux-image--3.16.0-30-generic  ： 使用purge卸载3.16.0-30，使用remove选项存在残留，为保险  
   起见一般不把所有旧内核全部卸载，而保留1-2各旧版本。   
4. sudo du -m /boot  ： 以MB 为单位显示 /boot 目录。   
5. sudo apt-get upgrade 升级系统。   

  注意：Ubuntu 14.10 中清除linux-image--3.19-**-generic 后，它会在下次检查更新时又重新安装上，所以可以保留它而不卸载；原因未知。其它的可以卸载。





### 21.7zip安装使用

1. 安装： `sudo apt-get install p7zip`      

2. 解压文件：     
  `7z x test.7z -r -o/tmp/test`         

| 命令或开关 | 描述                                       |
| ----- | ---------------------------------------- |
| x     | 代表解压文件，并按照原始目录解压，test.7z是压缩文件。（注意 x前没有-） |
| -r    | 表示递归所有的子文件夹                              |
| -o    | 指定解压到的目录，注意**-o 和目录直接无空格**               |

3. 压缩文件：   
  `7z a -t7z -r test.7z /home/test/* `    
  test.7z 是压缩之后的压缩包， /home/test/是要压缩的目录， `*`表示该目录下所有的文件。    

| 命令或开关 | 描述            |
| ----- | ------------- |
| a     | 添加文件 文件夹到压缩包  |
| -t    | 是指定压缩类型，一般为7z |
| -r    | 递归所有子文件夹      |



### 22.保存屏幕亮度

看样子有不行

[参考](https://www.qingsword.com/qing/1026.html)

但是他的系统安装了两个显卡驱动  
/sys/class/backlight/intel_backlight/  
屏幕亮度最大值： 4882     位于文件max_brightness中  
屏幕亮度最小值： 2842     位于文件actual_brightness中  
当前屏幕亮度：	 2842     位于文件brightness中  


### 23.添加桌面图标


1. 可直接从dash中将图标拖到桌面。   
2. 使用配置文件,略


### 24.Okular保存标注到PDF文件的方法

一般使用Okular对PDF进行的标注并未直接保存在PDF文件中，Okular根据文件名来加载之前的标注。  

保存标注到PDF文件本身的方法是，选择打印该PDF文件，在打印选项中确保“打印标注”被勾选即可。
(可保存除弹出式标注以外的标注)


### 25.修改系统默认编辑器为vim

默认编辑器可能是nano，将其修改成vim的办法有两种：  
1. sudo update-alternatives --config editor
  然后选择vim.basic这一项即可，update-alternatives的使用见另一篇文章，另一个选项--display 
2. echo export EDITOR=/usr/bin/vim >> ~/.bashrc


### 26. 自建的启动器位于~/.local/share/applications/
而系统保存的启动器位于 /usr/share/applications/


### 27. 自建 freeplane 桌面启动器，导致的中文输入问题
从自建的桌面启动器启动后导致无法切换到中文输入法，无法输入中文。但如果从命令行启动该程序则可以输入中文，
在.bashrc文件中也做了些修改（不必） 
解决方法： 从命令行启动程序后，将其固定在启动器侧边栏，下次从此启动则可输入中文。


