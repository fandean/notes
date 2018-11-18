# Ubuntu中输入法安装


## Ubuntu 中输入法安装     


1. ibus 卸载问题(可以选择不卸载)
2. fictx 安装时不要选择下载 im-switch ，安装该程序时会导致卸载 ubuntu-desktop 等三个重要软件。  
3. fictx-rime 会导致 fictx 出错，先使用fictx-googlepingpin ; 该问题只能后期解决，(后面不知为什么又能用了)


## ibus框架


由于之前在ubuntu14上使用ibus感觉不好用，转而使用了搜狗输入法。而现在在xubuntu上发现ibus还不错，并且还在积极开发新版本。

### 安装ibus

```shell
sudo apt install  ibus  ibus-rime ibus-gtk ibus-gtk3 ibus-qt4 librime-data-emoji
```
此时ibus-rime 繁简切换没有问题。

安装演示见： [ibus-rime安装](https://asciinema.org/a/Z3fAd9QStyWlTVfKYRzvsHXFU)


### 配置ibus

ibus 首选项窗口：  
这里重点讲解一下“在应用程序窗口中启用内嵌编辑模式”的效果。如果勾选此项，则在输入文字时在光标处显示当前第一个候选词。这可能在某些无法使输入法跟随光标的程序(比如webstorm)中有所帮助。



> 参考:  
> [IBus (简体中文) - ArchWiki](https://wiki.archlinux.org/index.php/IBus_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87) "IBus (简体中文) - ArchWiki")  
> [linux中文输入法，ibus光标不跟随](http://www.chongchonggou.com/g_484011402.html)  
> [wps 中 ibus 输入法光标跟随](http://speculator.leanote.com/post/wps-%E4%B8%AD-ibus-%E8%BE%93%E5%85%A5%E6%B3%95%E5%85%89%E6%A0%87%E8%B7%9F%E9%9A%8F)  
> [Ubuntu 16.04 安装 Rime 输入法](http://speculator.leanote.com/post/Ubuntu-16.04-%E5%AE%89%E8%A3%85-Rime-%E8%BE%93%E5%85%A5%E6%B3%95)  
>
> [Ubuntu 14.10编译安装中州韵Rime输入法 - 扩软博客](https://blog.kuoruan.com/22.html "Ubuntu 14.10编译安装中州韵Rime输入法 - 扩软博客")


## fcitx框架

安装fcitx主要是为了安装搜狗输入法。 目前 fcitx-rime 基本无法使用。fcitx-rime不是由rime开发者维护(而ibus-rime是)而是由fcitx团队维护，没有那么尽心。


参考：  
<https://wiki.archlinux.org/index.php/Fcitx_(简体中文)>   
<http://wiki.ubuntu.org.cn/Fcitx>   
<https://fcitx-im.org/wiki/Fcitx/zh-cn>   
<http://my.oschina.net/eechen/blog/224291>   

参考：中文环境下安装fcitx一般不会有什么问题，在英文环境下安装需进行配置，参见第二个链接。
​	
经历：在英文环境下安装fcitx后不知道如何配置，按shift键无法实现中英文临时切换。
	问题在于配置上，在 快捷键--> 额外的激活输入法快捷键选择“左shift”  不过这并不是想像中的那种。

输入法配置界面提示：第一个输入法将作为非激活状态。通常需要将 '键盘' 或 '键盘-布局名称' 放在第一个。


安装：

```
#可参考此文  可能有帮助
#http://blog.csdn.net/gopain/article/details/17412057
echo 如果安装前想卸载ibus，请网上搜索拯救方法
sudo apt-get install fcitx fcitx-config-gtk fcitx-rime

# https://wiki.archlinux.org/index.php/Fcitx_(简体中文)
 sudo apt-get install im-switch

 # im-switch -s fcitx -z default	设置fcitx为默认输入法
```

ubuntu 安装 fcitx 输入法
ubuntu <http://blog.csdn.net/gopain/article/details/17412057>



环境：ubuntu 14.04 LTS desktop 64bit 预安装的是 ibus  
系统使用过 从原 ubuntu 14.4 的备份中 还原 /home 目录。  



### 1. 安装


`sudo apt-get install fcitx fcitx-googlepinyin fcitx-rime`


>还有： fcitx-frontend-all 指fcitx在所有环境下的前端(包括 qt、 gtk2、gtk3)  
	fcitx-config-gtk  指fcitx 的gtk的设置图形界面  
	[以上只是参考，默认可能已经将其安装好了]




注意：若按照网上的一些教程，安装 im-switch 时会提示卸载重要系统程序(查看提示：以下程序将被移除...) 	所以不要安装。 
	如果卸载 ibus 也会卸载重要的系统程序; 所以在不懂的情况下不要卸载。


### 2.设置


1. im-config 设置 fcitx 为默认输入法
2. 运行下列命令关闭ibus启动fcitx： 
   killall ibus-daemon
   fcitx -d                                     
3. 设置可以通过shift键，切换中英文输入：   
   执行命令：fcitx-configtool    出现fictx的设置窗口；
   在`输入法`选项卡中设置的顺序为：  键盘-英语（美国）    google拼音    中州韻  
   在`全局配置`选项卡中设置： `额外的激活输入法快捷键` 为 `左shift` 
   完成。   
4. 注销系统，重新登录。  

备注：至于一开始 每当切换输入法到 fcitx-rime 时总是造成整个 fcitx 程序崩溃，进而无法再次启动的原因暂时不明确。   




切换顺序问题再次补充：   
     在`输入法`选项卡中，下方会有如下提示：  “第一个输入法将作为非激活状态，通常您需要将`键盘`或`键盘-布局名称`放在地一个”  
     因此之前的配置中，`google拼音` 和 `中州韻`就处于激活状态；而`键盘-英语（美国）`则处于非激活状态。   
     这有助于理解`全局配置中`的相关选项。   

如果要安装 fictx-sogoupinyin 请上 搜狗 官网下载。   




> 安装 rime 在 ibus 输入法平台 
>
> `sudo apt-get install ibus-rime`
>
> 之后还要进行相关设置 `ibus-setup`
> 打开设置窗口 选择rime
> 或者有可能只要在 系统设置 --> 文本设置 


## 输入法安装


### rime输入法
官网：[RIME 中州韻輸入法引擎](http://rime.im/ "RIME 中州韻輸入法引擎")


### rime繁簡狀態切換

按Ctrl+\`或F4切換繁簡狀態


[Ubuntu 16.10依赖libopencc 1.0.4，导致简体无法转换 · Issue #18 · rime/ibus-rime](https://github.com/rime/ibus-rime/issues/18 "Ubuntu 16.10依赖libopencc 1.0.4，导致简体无法转换 · Issue #18 · rime/ibus-rime") 

輸入emoji表情

參考 https://gist.github.com/2309739 把 emoji 加入輸入方案選單；

**切換到 emoji 輸入方案**，即可通過拼音代碼輸入表情符號。查看[符號表](https://github.com/rime/home/raw/master/images/emoji-chart.png)

輸入 all 可以列出全部符號，符號後面的括弧裏標記其拼音代碼。

若要**直接**在【朙月拼音】裏輸入表情符號，請按此文設定：

http://gist.github.com/3705586




## 输入法配置 im-config



```


```







## 输入法问题

[ubuntu 16.04下搜狗输入法不能输入中文解决（linux下常见软件崩溃问题解决方案）](http://blog.csdn.net/jilijelon/article/details/53759965)

搜狗的配置文件在 ~/.config下的3个文件夹里：   
SogouPY、SogouPY.users、sogou-qimpanel   
删除这3个文件夹，然后重启搜狗。   



[Ubuntu系统拼音无法正确打字怎么解决？](http://www.xitongzhijia.net/xtjc/20160229/68044.html)

运行： `ibus-daemon -drx`





