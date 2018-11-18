# Linux发行版本和桌面环境

标签：Linux



兼容Ubuntu系统的软件要多于其他系统，安装软件更加容易。遇到软件安装不上真的很烦。所以尽量考虑Ubuntu及其衍生版系统。





## 笔记本选购

[Linux 笔记本电脑选购指南-观点](https://linux.cn/article-8110-1.html )



## Linux系统升级

### Ubuntu14.04升级到16.04    

Ubuntu 16.04 LTS (Xenial Xerus)各种版本官网，升级更新方法，见Ubuntu的网站：[Ubuntu release notes](https://wiki.ubuntu.com/XenialXerus/ReleaseNotes "Ubuntu 16.04 LTS (Xenial Xerus)")
注意该网站的地址为<https://wiki.ubuntu.com/XenialXerus/ReleaseNotes> 中间部分XenialXerus为该版本的名称。


> 前期查阅：
> 参考：<http://forum.ubuntu.com.cn/viewtopic.php?f=180&t=477472>  
> <https://www.sysgeek.cn/upgrade-ubuntu-16-04-lts/>  
>
> **注意事项**   
> ​    
> 使用命令：`sudo update-manager` 升级,另还需添加选项；当使用不同的选项时升级到不同的
> 版本，比如`-d`升级到研发版（devel version)；而一般选择升级到（lts release)版。  -p 选项，升级到推荐版(提前释放的更新)，见man帮助。
>
> 如：
> `sudo update-manager -c -d`
>
> 可能存在的问题：当不使用`-d`选项时，可能无法检测到新版本。 [14.04 -> 16.04 问题与解决](http://forum.ubuntu.org.cn/viewtopic.php?f=48&t=477478&p=3162191#p3162191)



## Ubuntu的几种版本


（应以流畅性，可用性为标准）


参考：https://wiki.ubuntu.com/DerivativeTeam/Derivatives
Ubuntu的衍生版分为两类： 官方衍生产品和非官方衍版。





### 官方支持的衍生版包括： 

　(1):Kubuntu : 和ubuntu不同的是它采用的桌面环境是KDE Plasma，而ubuntu采用是Gnome,KDE Plasma桌面效果非常漂亮，比gnome好看很多，其它方面基本上和ubuntu一样，kubuntu除了可以安装ubuntu的软件之外，还可以安装kde程式。现在最新版本也是10.10，提供32位和64位版本，安装方法和ubuntu差不多。界面虽然漂亮但是对电脑的配置要求比ubuntu高。 

　　(2):Edubuntu : education ubuntu，这个ubuntu比较特别，因为它是一个以教育为目的的ubuntu，其面向的对象主要是6~18岁的儿童和青少年还有面对学校，里面装了很多关于学习的软件，例如学习算术的GCompris，还有KDE Edutainment Suite,Schooltool Calendar等等软件。这个系统制作的目的是想集合所有免费的与教育相关的软件到一个系统里面去，然后让大家更容易地学习。这个系统界面也是采取ubuntu使用的gnome，其它方面，例如软件安装基本上也和ubuntu差不多。 

　　(3):Server版本：ubuntu的服务器版本，建立在稳定的debian服务器版本上,集成了LAMP（Linux, Apache, MySQL 和 PHP），安装后会自动安装，让你减低手动安装时的风险。它提供了一个标准的互联网服务: mail, web, DNS, 和数据库管理等。而且它能给你更低的资源消耗（内存，硬盘等）和成本费用，企业无需付费就可以获取。



### 认可的衍生版包括：

### Xubuntu

xubuntu使用的是XFCE的桌面环境，不同于ubuntu的gnome环境和kubuntu的kde桌面环境。由于xfce主要是一套用于配置低的电脑的桌面环境，所以使到xubuntu系统的主要特点是系统需求配置非常低，适用于旧电脑（例如装有老单核，内存小和老集成显卡的电脑），而且安装后速度很快。假如你的电脑运行ubuntu不顺畅可以尝试安装xubuntu

安装软件： 
　　xubuntu主要运行基于GTK+的程序，可以用ubuntu的所有程序和KDE程序 
http://xubuntu.org/

### Ubuntu GNOME
http://ubuntugnome.org/



### Lubuntu

Lubuntu 採用了比Xfce更輕量的桌面環境 Lxde

Xubuntu 和 Lubuntu 轻量但可能可安装的软件有些许限制




### Linux Mint
[Linux Mint](https://linuxmint.com)更简单、更优雅、更完备的Ubuntu。它拥有大量Ubuntu所没有的编解码器、驱动器、源、应用程序；
它拥有专为管理系统各个部分而创建的程序，例如，程序安装、程序运行、软件更新、桌面自定义。
在这里，你完全见不到病毒与间谍软件的踪影，Linux发行版所提供的安全保障，也是应当纳入考虑的因素。
它分为两个版本：**Cinnamon 版**（Cinnamon desktop 也不错）、 **MATE版**（MATE desktop）两者都基于GNOME 2

Linux Mint 与 Ubuntu软件仓库完全兼容，采用**apt**管理和.deb软件包。



**可以考虑试用 Linux Mint** 的 Cinnamon 版。

- Cinnamon：是 Unix-like 系统下的一个用户界面。是 GNOME Shell 的一个派生版本，最初是为 Linux Mint 所开发，其提供了如同 GNOME 2 般，易于使用的拟真接口。Cinnamon 使用 Muffin，一个 GNOME 3 的窗口管理器 Mutter 的派生版本，作为自 1.2 版起的默认窗口管理器。
- MATE：由已经停止官方维护的 GNOME 2 源代码派生而来。



[Linux Mint 18.1 (Serena)-Linux 发行版](https://linux.cn/article-3260-1.html "Linux Mint 18.1 (Serena)-Linux 发行版")





## 其他发行版



### Fedora

Fedora是技术先进的Linux，所以你需要小心一点，以免遇到不必要的麻烦。如果你还不是Linux专家或者不想成为Linux专家，还是别用Fedora为好。

真的遇到很多麻烦。 可能使用centos更方便。



### CentOS和Debian

它们更适合于服务器，而不是桌面。那倒不是说你不能把它们用作桌面，而是我建议使用其他更加针对桌面的发行版。



### OpenSUSE

它有两个版本，一个是滚动发布发行版Tumbleweed，另一个是较为传统的Linux发行版Leap。滚动发布的Linux不断更新。如果你觉得这听起来像是开发运维领域的持续部署概念，那就对了，就是这样。

这些openSUSE变种酷似Fedora。它们面向从事软件或云项目的Linux专业人员。

[openSUSE 42.1-Linux 发行版](https://linux.cn/article-4143-1.html "openSUSE 42.1-Linux 发行版")



### Arch Linux

[Arch Linux](https://www.archlinux.org/)是另一种滚动发布发行版。Arch是一款轻量级、对用户友好的发行版。其设计理念是“力求简单”，其开发人员兑现了之前的承诺。**不过安装是例外**。

消耗的资源少。

基于最新 Arch Linux 技术的 ArchEX Build 160724 发布，在这个发行版中包括了最新的软件包，比如Linux内核4.6.4。据该操作系统开发者 Arne Exton 称，这一版本在几乎所有机器上运行是最快的，鉴于Arch Linux是最轻量级、高度定制并且拥有一大批用户的操作系统，采用的**LXDE**桌面环境即便是在旧的PC机上也是运行最快的，我们有理由相信Arne Exton的话。



### ZorinOS

 ZorinOS 完全基于 Ubuntu 系统。

ZorinOS 就是专门作为 Windows 和 Mac 系统的替代品而设计的，所以它下了很大的功夫来模仿 Windows 和 Mac 桌面的外观和感觉。

然而， ZorinOS 有两个版本： Zorin Ultimate 和 Zorin Core 。 Zorin Core 是免费的，但它不包含几乎所有你能够在 Zorin Ultimate 中找到的软件。当然，如果你不想花钱购买 Ultimate 版本，你也可以从 Core 版本包含的软件包管理工具中安装几乎所有你需要的东西。

[Install Apps - Zorin OS](https://zorinos.com/help/install-apps/ "Install Apps - Zorin OS")

built-in Wine runtime。系统中默认就安装了 Wine。



### Elementary OS

[Elementary OS](http://www.iplaysoft.com/elementary-os.html) 系统它是一款基于 [Ubuntu](http://www.iplaysoft.com/ubuntu.html) 精心打磨美化的桌面 [Linux](http://www.iplaysoft.com/tag/linux) 发行版，号称 “**最美的 Linux**”。 Elementary 最早是 Ubuntu 的一个[美化](http://www.iplaysoft.com/tag/%E7%BE%8E%E5%8C%96)主题项目，后来太受欢迎演变成了独立的发行版。

Elementary OS 在外观和感觉上所达到的效果和 OS X 桌面非常相似。Elementary OS 的开发者们很好的保持了桌面的一致性。从 dock， 到面板、菜单、到包括的应用，你找不到任何一个看起来或感觉没有归属感的单一元素。

Elementary OS 对整体的外观和感觉相当严格。开发人员已经创建了自己的组件，包括桌面环境。此外，他们**只选择**适合设计范例的应用程序。

因为 elementary OS 的核心还是 [Ubuntu](http://www.iplaysoft.com/ubuntu.html)，因此它与 Ubuntu 的仓库和包完全兼容，它也是使用 Ubuntu 自己的软件中心来处理软件的安装和卸载。



> 试用了一下感觉一般，都没有我的 xfce4 好。



### WattOS

WattOS 主要为老旧硬件设计，运行速度飞快。但是会有些小问题。

[WattOS：一个稳如磐石、快如闪电、面向所有人的轻量级 Linux 发行版-观点](https://linux.cn/article-8012-1.html "WattOS：一个稳如磐石、快如闪电、面向所有人的轻量级 Linux 发行版")



### Crossover Linux

如果你仍需要一些Windows程序，可以试一试Crossover Linux，在Linux上运行这些程序。虽然它无法运行所有的Windows应用程序，但是效果确实很好。



Linux for Gaming: **Steam OS**

[How to choose the best Linux distro for your laptop](http://www.techradar.com/news/how-to-choose-the-best-linux-distro-for-your-laptop )





[Linux 最佳选择：总有一款桌面发行版适合你](https://linux.cn/article-7172-1.html "Linux 最佳选择：总有一款桌面发行版适合你-")

[给 Linux 新手的最佳发行版 ](https://linux.cn/article-8138-1.html)

[The Best Linux Distros for 2017](https://www.linux.com/news/learn/sysadmin/best-linux-distributions-2017)

[**八款值得尝试的精美的 Linux 发行版（2017 版）**](http://mp.weixin.qq.com/s?timestamp=1508205792&src=3&ver=1&signature=LD5Gs4d3SbEX9*Uh66q0yP2osCg-gh0dU6RUupXH9eJLWdHfXXYy9oueR3dEh3SgbwiwgbNGzXs1u-aaCXOwI7QF9lm5luqBXmS-XT5uz8sI5XGOlpXEqsdWEaEtfklVYxm58605K*tkRqbvMCi9-4SArKcRhVKRB5LAXFhxeXQ= "八款值得尝试的精美的 Linux 发行版（2017 版）")



### 个人感受



可以考虑安装的Linux发行版有：  


* Linux Mint ：可以配置的很好。
* XUbuntu
* ZorinOS   
* Archlinux  
* Fedora  





对于Fedora，该网站有对应的不同桌面版本：[spins of fedora](https://spins.fedoraproject.org/) Note that you can always install different official spins of Fedora. They include different desktop environments by default.








## 各桌面环境介绍

### 要体验各种桌面环境请分别浏览其官方网站

#### GNOME 2
GNOME 3的激进改变和不成熟让很多GNOME 2忠实用户难以接受，他们中的许多人依旧认为GNOME 2是最好的桌面环境，但不想一直使用旧的发行版。Linux Mint发行版的开发者因此创建了MATE项目，基于GNOME 2.32的分支。

![enter image description here](https://upload.wikimedia.org/wikipedia/commons/d/d9/Gnome-screenshot-full.jpg)

#### GNOME 3 
[GNOME](https://www.gnome.org/) 
![Fedora 24默认用的就是Gnome 3 ](https://www.gnome.org/wp-content/uploads/2016/03/activities-overview-940x529.png)

GNOME Shell是GNOME 3的重要部分，提供窗口切换、打开应用程序等功能，它和窗口管理器(Window Manager)Mutter一起构成了我们看到的GNOME 3桌面。GNOME Shell扩展丰富。

强烈建议安装GNOME 3的配置工具GNOME Tweak Tool，系统主题、扩展、字体的设置都可通过此工具完成。

**GNOME 3 教程：**   
[GNOME 3安装配置与使用](http://linux-wiki.cn/wiki/zh-hans/GNOME_安装配置与使用)
[GNOME 3 使用白皮书](https://linux.cn/article-125-1.html)

#### KDE Plasma 5

界面不错，但耗费资源。

[KDE Plasma 5](https://www.kde.org/announcements/plasma5.0/)

![enter image description here](https://www.kde.org/announcements/plasma5.0/screenshots/desktop.png)
![enter image description here](https://www.kde.org/announcements/plasma5.0/screenshots/osd-brightness.png)

#### MATE
[MATE](http://mate-desktop.org/)   
The MATE Desktop Environment is the continuation(延续) of GNOME 2.
Linux Mint发行版


![enter image description here](http://mate-desktop.org/gallery/1.14/MATE-1.14_1.png)

![enter image description here](http://mate-desktop.org/gallery/1.14/MATE-1.14_10.png)


#### Cinnamon
[Cinnamon](https://en.wikipedia.org/wiki/Cinnamon_(software))
Linux Mint发行版 


![Fedora Cinnamon Desktop](https://spins.fedoraproject.org/static/images/screenshots/screenshot-cinnamon.jpg "Fedora Cinnamon Desktop")


#### Ubuntu Unity desktop

Unity 资源消耗还是算大的

#### XFCE
[XFCE](http://www.xfce.org/)  
Xfce 是类 UNIX 操作系统上的轻量级桌面环境。虽然它致力于快速与低资源消耗，但仍然具有视觉吸引力且易于使用。

Linus Torvalds弃GNOME 3用Xfce

![enter image description here](http://cdn.xfce.org/about/screenshots/4.12-1.png)

![enter image description here](http://cdn.xfce.org/about/screenshots/4.12-2.png)

![enter image description here](http://cdn.xfce.org/frontpage/slider-desktop.jpg)

#### LXDE
[LXDE](http://lxde.org/)

LXDE (abbreviation for Lightweight X11 Desktop Environment) 同時具備高效能以及節能兩大特點之桌面環境。（需考虑它是否支持安装必要的软件）

![LXDE Desktop](http://lxde.org/sites/default/files/images/desktop_full.preview/index.png)

![enter image description here](http://lxde.org/sites/default/files/images/lxappearance.preview/index.png)

#### GTK+ 与 QT是？  







### Linux 操作系统桌面环境GNOME和KDE的切换

<http://www.jb51.net/os/RedHat/1356.html>



### 另一种切换思路
先装好gnome跟kde所需的所有组件，开机不自动启动gdm之类的登录管理器，也就是开机直接终端登录。创建~/.xinitrc文件，里面内容是exec gnome-session。然后在终端打startx，就启动了gnome。修改xinitrc的内容换成启动kde的，startx就启动kde了，类似这样，自己再摸索下


Linux系统安装桌面环境  
----------------------------------------------
在Fedora 24中我是直接使用命令 dnf groupinstall kde 
切换桌面的方法：在登陆系统输入密码界面，有一个设置图标，点击这个图标即可选择要进入的桌面环境，
安装的KDE桌面环境在Fedora24中是名为 Plasma 的选项。（如果开启了自动登录选项，结果就没有了界面切换选项了）
KDE Plasma

>fedora 24安装 xfce4 ：   dnf install @xfce-desktop 或 dnf groupinstalll xfce-desktop 一样的。
>
> 安装Lxde ：  yum install @lxde-desktop

> Fedora卸载gnome： dnf remove gnome*  但这样可能会导致卸载必要的依赖组件，所以安装时选择kde的话就好处理一点，或在之前介绍的 spins of Fedora中选一个已经弄好的桌面。

### fedora 10 安装KDE的参考：  
安装KDE桌面环境
yum groupinstall "KDE (K Desktop Environment)"
我是直接使用命令 dnf groupinstall kde 即可

卸载GNOME桌面环境
yum groupremove "GNOME Desktop Environment"
卸载KDE桌面环境
yum groupremove "KDE (K Desktop Environment)"
安装GNOME桌面环境
yum groupinstall "GNOME Desktop Environment"
另一种方法：
yum groupinstall kde-desktop
yum --enablerepo=kde-testing groupupdate kde-desktop
yum update



### Ubuntu安装gnome


[Ubuntu 13.04 用户安装 gnome 3.8 桌面](http://linuxeden.com/html/softuse/20130501/138774.html)

如果想安装gnome到最新版本也可以，可以使用官方提供的PPA源进行安装。如果你是Ubuntu gnome 13.04 用户最好，你遇到的麻烦会少一些，直接升级你的桌面，如果你Unity 桌面用户，那么安装可能会花一些时间，主要是安装的东东有点多。

unity 用户使用一下命令进行安装gnome shell就可以了：
sudo add-apt-repository ppa:gnome3-team/gnome3
sudo apt-get update
sudo apt-get install gnome-shell ubuntu-gnome-desktop
安装过程中会让你选择登录界面：

如果你已经安装Gnome -shell低版本或者你是ubuntu gnome 13.04 用户，那么使用下面的命令进行升级：
sudo add-apt-repository ppa:gnome3-team/gnome3-staging
sudo apt-get update
sudo apt-get dist-upgrade

如果你想卸载Gnome，可以直接在软件中心进行卸载。
删除PPA。
先必须安装命令程序：
ppa-purge
然后运行命令删除：
sudo ppa-purge ppa:gnome3-team/gnome3
staging版本：
sudo ppa-purge ppa:gnome3-team/gnome3-staging
也可以运行命令卸载gnome：
sudo apt-get remove gnome-shell ubuntu-gnome-desktop
文章参考：omgubuntu.co.uk

>**[另参考](http://www.it165.net/os/html/201207/2834.html "即上面的另参考部分")**   
>按如下命令执行；
>安装gnome3
>sudo add-apt-repository ppa:gnome3-team/gnome3
>sudo apt-get update
>sudo apt-get install gnome-shell
>需要安装主题执行这一条；
>sudo apt-get install gnome-themes*
>**删除unity:**
>sudo apt-get -y --auto-remove purge unity
>sudo apt-get -y --auto-remove purge unity-common
>sudo apt-get -y --auto-remove purge unity-lens*
>sudo apt-get -y --auto-remove purge unity-services
>sudo apt-get -y --auto-remove purge unity-asset-pool
>设置默认登陆桌面；
>sudo /usr/lib/lightdm/lightdm-set-defaults -s gnome-shell
>如果默认进入gnome classic,执行以下指令；
>sudo /usr/lib/lightdm/lightdm-set-defaults -s gnome-classic
>完事儿之后**注销**，登陆试试，应该不会有什么问题的。

### Ubuntu下安装使用Xfce4

>Ubuntu中安装Xubuntu-desktop后的惊喜：
>在原来的Ubuntu14.4中安装Xubuntu-desktop后，在Xubuntu桌面使用`sudo update-manager -d`命令居然提示可以升级到Xubuntu 16.04。升级后效果怎样就不知了。

xfce有一个电源管理器，可以装上，允许您快速的控制您的屏幕亮度。

安装时使用script命令进行记录，不喜欢就将安装的软件全部卸载（如果只是输入卸载 xfce4则只卸载掉 14kb ，其它程序可能可以使用自动移除的方式移除）。

[Ubuntu下安装使用Xfce4](http://forum.ubuntu.com.cn/viewtopic.php?t=1160)

1. 方式1：  
  `sudo  apt-get  install  xfce4`  
2. 方式2 会多一些软件： 
  `sudo apt-get install xubuntu-desktop`

**Ubuntu 14.4请注意**：由于默认安装的是xfce 4.10，若想安装 xfce 4.12 
则参考[ubuntu14.04LTS命令行安装xfce4桌面](http://blog.csdn.net/zhaihaifei/article/details/50562748)

[How to Upgrade XFCE 4.10 to XFCE 4.12 in Xubuntu 14.04 and Xubuntu 14.10](http://ubuntuportal.com/2015/03/how-to-upgrade-xfce-4-10-to-xfce-4-12-in-xubuntu-14-04-and-xubuntu-14-10.html "包含了卸载方法")


卸载 ibus(现在更换了桌面终于可以把它卸载了)   unity  



> xfce4设置：见 xfce4设置.md 







### Ubuntu 安装LXDE
[Ubuntu安装Lxde](http://blog.sina.com.cn/s/blog_6b1ed4fb0101k1qh.html)

由于Lubuntu的界面操作更方便美观（有声音和电源显示）并且它和单纯的lxde消耗的资源差不多，所以先尝试安装lubuntu-core ，或看是否需要安装lubuntu-desktop 等。【在建议安装的软件中也有xfce的电源管理器】再尝试安装lxde。  感觉Xubuntu 16和 Lubuntu都很不错。
