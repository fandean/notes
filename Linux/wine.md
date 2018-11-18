
wine安装配置
=======================

1.wine安装
--------------

```
sudo apt-get install wine1.7

```






2.wine配置
---------------------

###配置1


* 终端输入命令 ` $ winetricks`      

* 选择`Select the default wineprefix`    

* 选择`Install a Windows DLL or component`   

* 选择安装的 Windows 部件有：  `riched20, riched30, ie8, vcrun6, flash11, gdiplus, msls31, msxml6, vcrun2005, vcrun2008, winhttp`
	组件   


>实践： 
>
> flash无法安装： `sha1sum mismatch`  ，   
>
> ie8 无法从 google cord 下载相关文件: 卡在`Downloading http://winezeug.googlecode.com/svn/trunk/winetricks_files/winetest.cat to /home/fan/.cache/winetricks/ie8`
> 
>MSXML6.0 install Failed : This MSXML6.0 package is not supported on the current processor type  
> 
>



下载qq， 右键点击QQ.exe , 选择第二项 `Open with wine program loader`， 之后按照提示安装QQ即可。  

<http://blog.163.com/zhaoxiaosen_2008@126/blog/static/10579723920130575313569/>



## 问题记载

安装wine1.7后由于等不及其另外下载相关文件，因为虚拟机 中的SuperMemo 同步的问题还未解决。
然后从Windows8 中重启 再次进入ubuntu 后 系统提示错误 并且虚拟机无法 开启
并提示 有一相关进程未能启动。

以为是 wine的原因导致 虚拟机 产生错误 就用命令
sudo apt-get --purge remove wine*
将其完全卸载 
但卸载了系统原本必要的东西，猜测是。
重启电脑后 发现 系统的错误提示依然在；并且 桌面顶端的菜单栏 侧边栏等没有了。
无法通过 Ctrl + Alt + T 启动 Terminal 
只能通过新建文件夹 进行文件操作


在网上查找相关 问题，看不懂，后自己决定重装 ubuntu-desktop
sudo apt-get --reinstall install ubuntu-desktop 
重装后 谁知 与其相关的(系统自带的除外) 软件全部被卸载了。   
 
之后重装 VirtualBox 后无需其它配置就可以直接使用之前安装的Windows看来这就是保存有配置文件的好处。




###配置2 


####安装wine支持包  

现在，我们安装非开源（但免费）的支持包。包括微软Core Fonts、Visual C++ 运行时环境等软件包。    

1. 安装Cabextract:  

需要该软件包来解压微软 .cab 文件。  

	sudo apt-get install cabextract

2. 下载winetricks脚本：

	wget http://winetricks.org/winetricks 

脚本winetricks, 他会自动下载和安装必要的支持包。(Ubuntu 14.4中安装wine1.7时自动已将其安装)   

使用下面的命令，安装必要的支持包：  

	sh winetricks corefonts Tahoma  

提示：还可使用命令`winetricks`，可从GUI界面选择需要安装的软件包。   




####安装微软Office  

右键点击Office 2007 的` setup.exe` 选择`Open With Windows Program Loader` 启动office安装程序。  



####建立库

Wine 以自己的方法实施了各种 Windows 库，但我们可以直接使用的原生 Windows 库，确保应用程序的最大的兼容性。  
Wine 的配置工具：`winecfg`。除了其他功能外，该工具还可让我们在内置版本的库与原生版本的库之间切换。   

输入命令winecfg，进入到 Libraries 选项卡，把 riched20 和 usp10 添加到 "native, builtin" ,
这表明，wine应该先试着装入原生的 Windows 库。  




参考：<http://www.pcworld.com.cn/Article/ShowArticle.asp?ArticleID=12396>






wine会把~/.wine/driver_c 当做C盘来使用。
可以用Winecfg把常用的工作目录都虚拟成WINDOWS的盘符




###配置3

* 执行winecfg 
* 设置函式库，添加 riched20 和 riched30 


安装qq 

存在不足：  
1. 无法使用输入法，但可以使用扫描二维码登录。
2. QQ 最小化不知如何切换到QQ界面
3. 载入运行缓慢


<http://blog.csdn.net/a756041482/article/details/46233829>





###wine 问题解决

<http://shaoyaoju2001.blog.163.com/blog/static/136336031201042052353695/>










卸载wine中安装的程序
-----------------------

1. 到该程序的目录里 `~/.wine/drive_c/Program Files/* `  , 执行 `wine 卸载.exe`  
2. 或者直接执行: `wine uninstaller`  









卸载wine
----------


<http://www.cnblogs.com/asimple41/p/3989608.html>

