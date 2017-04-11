# Linux系统升级、版本和桌面环境介绍

标签：Linux

---

## 迁移文章到 作业部落  

## 1. Linux系统升级

### Ubuntu14.04升级到16.04    

Ubuntu 16.04 LTS (Xenial Xerus)各种版本官网，升级更新方法，见Ubuntu的网站：[Ubuntu release notes](https://wiki.ubuntu.com/XenialXerus/ReleaseNotes "Ubuntu 16.04 LTS (Xenial Xerus)")
注意该网站的地址为<https://wiki.ubuntu.com/XenialXerus/ReleaseNotes> 中间部分XenialXerus为该版本的名称。


> 前期查阅：
> 参考：<http://forum.ubuntu.com.cn/viewtopic.php?f=180&t=477472>  
<https://www.sysgeek.cn/upgrade-ubuntu-16-04-lts/>  
>
> **注意事项**   
>     
>使用命令：`sudo update-manager` 升级,另还需添加选项；当使用不同的选项时升级到不同的
版本，比如`-d`升级到研发版（devel version)；而一般选择升级到（lts release)版。  -p 选项，升级到推荐版(提前释放的更新)，见man帮助。
>
>如：
>`sudo update-manager -c -d`
>
>可能存在的问题：当不使用`-d`选项时，可能无法检测到新版本。 [14.04 -> 16.04 问题与解决](http://forum.ubuntu.org.cn/viewtopic.php?f=48&t=477478&p=3162191#p3162191)



## 2. 各Linux发行版介绍

Ubuntu的几种版本（应以流畅性，可用性为标准）
------------------------------
参考：https://wiki.ubuntu.com/DerivativeTeam/Derivatives
Ubuntu的衍生版分为两类： 官方衍生产品和非官方衍版。

### 官方支持的衍生版包括： 

　(1):Kubuntu : 和ubuntu不同的是它采用的桌面环境是KDE Plasma，而ubuntu采用是Gnome,KDE Plasma桌面效果非常漂亮，比gnome好看很多，其它方面基本上和ubuntu一样，kubuntu除了可以安装ubuntu的软件之外，还可以安装kde程式。现在最新版本也是10.10，提供32位和64位版本，安装方法和ubuntu差不多。界面虽然漂亮但是对电脑的配置要求比ubuntu高。 

　　(2):Edubuntu : education ubuntu，这个ubuntu比较特别，因为它是一个以教育为目的的ubuntu，其面向的对象主要是6~18岁的儿童和青少年还有面对学校，里面装了很多关于学习的软件，例如学习算术的GCompris，还有KDE Edutainment Suite,Schooltool Calendar等等软件。这个系统制作的目的是想集合所有免费的与教育相关的软件到一个系统里面去，然后让大家更容易地学习。这个系统界面也是采取ubuntu使用的gnome，其它方面，例如软件安装基本上也和ubuntu差不多。 

　　(3):Server版本：ubuntu的服务器版本，建立在稳定的debian服务器版本上,集成了LAMP（Linux, Apache, MySQL 和 PHP），安装后会自动安装，让你减低手动安装时的风险。它提供了一个标准的互联网服务: mail, web, DNS, 和数据库管理等。而且它能给你更低的资源消耗（内存，硬盘等）和成本费用，企业无需付费就可以获取。



### 认可的衍生版包括：

　(1):Xubuntu： xubuntu使用的是XFCE的桌面环境，不同于ubuntu的gnome环境和kubuntu的kde桌面环境。由于xfce主要是一套用于配置低的电脑的桌面环境，所以使到xubuntu系统的主要特点是系统需求配置非常低，适用于旧电脑（例如装有老单核，内存小和老集成显卡的电脑），而且安装后速度很快。假如你的电脑运行ubuntu不顺畅可以尝试安装xubuntu
安装软件： 
　　xubuntu主要运行基于GTK+的程序，可以用ubuntu的所有程序和KDE程序 
http://xubuntu.org/

### Ubuntu GNOME
http://ubuntugnome.org/


### Lubuntu 採用了比Xfce更輕量的桌面環境 Lxde

Xubuntu 和 Lubuntu 轻量但可能可安装的软件有些许限制


### Linux Mint
[Linux Mint](https://linuxmint.com)更简单、更优雅、更完备的Ubuntu。它拥有大量Ubuntu所没有的编解码器、驱动器、源、应用程序；
它拥有专为管理系统各个部分而创建的程序，例如，程序安装、程序运行、软件更新、桌面自定义。
在这里，你完全见不到病毒与间谍软件的踪影，Linux发行版所提供的安全保障，也是应当纳入考虑的因素。
它分为两个版本：Cinnamon 版（Cinnamon desktop 也不错）、 MATE版（MATE desktop）两者都基于GNOME 2
**可以考虑试用 Linux Mint** 


>可以考虑安装的Linux发行版有：  
>Fedora 、Linux Mint、Archlinux、XUbuntu、LUbuntu、或者考虑 Fedora + xfce 的形式
>
>对于Fedora，该网站有对应的不同桌面版本：[spins of fedora](https://spins.fedoraproject.org/) Note that you can always install different official spins of Fedora. They include different desktop environments by default.




## 3. 各桌面环境介绍

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
安装gnome3
sudo add-apt-repository ppa:gnome3-team/gnome3
sudo apt-get update
sudo apt-get install gnome-shell
需要安装主题执行这一条；
sudo apt-get install gnome-themes*
**删除unity:**
sudo apt-get -y --auto-remove purge unity
sudo apt-get -y --auto-remove purge unity-common
sudo apt-get -y --auto-remove purge unity-lens*
sudo apt-get -y --auto-remove purge unity-services
sudo apt-get -y --auto-remove purge unity-asset-pool
设置默认登陆桌面；
sudo /usr/lib/lightdm/lightdm-set-defaults -s gnome-shell
如果默认进入gnome classic,执行以下指令；
sudo /usr/lib/lightdm/lightdm-set-defaults -s gnome-classic
完事儿之后**注销**，登陆试试，应该不会有什么问题的。

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


#### Xfce 设置 

**或见本地文件**  
[推荐：此处介绍到几个插件](http://ubuntuhandbook.org/index.php/category/xfce/)
[Xfce/指南](https://wiki.gentoo.org/wiki/Xfce/Guide/zh-cn)

[How to Launch Xfce4 Terminal in Quake-style Drop-down Mode]见推荐处，这个快捷键一定要配置。

>参考篇文章把xfce 界面配置的很好，但他在新版博客中说到git出现问题，更换系统到Linuxdeepin才解决问题。
>[Archlinux + Xfce 4.10 体验小记](http://munen.cc/ben-lab/tech/1864.html)
>或参考自己的本地文档。 




 
#### XFCE Global Menu

**直接使用Xubuntu自带的也行**
 
**安装xfce4-appmenu-plugin**  
[通过 PPA 安装 XFCE 全局菜单插件](http://www.oschina.net/question/12_31965)
已经常时间未更新（最后更新日期为2011年），不推荐安装。

**必须安装TopMenu**     
TopMenu only works with GTK2 and GTK3 applications. It doesn't work for Qt (4 or 5) applications as well as LibreOffice, Firefox andThunderbird. 
[HOW TO GET A GLOBAL MENU IN XUBUNTU 16.04 OR LUBUNTU 16.04 (USING TOPMENU)](http://www.webupd8.org/2016/05/how-to-get-global-menu-in-xubuntu-1604.html “参见其相关设置，及如何使用”)


#### 可考虑安装的插件

通过apt-cache policy xfce- 接着两次tab列出能够安装的插件，看自己需要哪一个，并查看其是否已经安装、查看描述信息。

- xfce4-datetime-plugin
- xfce4-indicator-plugin
- xfce4-pulseaudio-plugin


#### 快捷键
Alt+F2 Application Finder box.。


#### 主题安装
[How to install new themes](https://wiki.xfce.org/howto/install_new_themes)
该篇文章中分别介绍了4中主题文件的**存放位置**和每种主题应包含的文件。

主体来源 <https://www.xfce-look.org>


**主题推荐：**

Icon Themes(图标)：

- Faenza  /Faenza-Dark ...  Faenza-blue 也不错
- Obsidian-1
- Ubo Icons Theme （还没出正式版，期待）
- Flat-Glass
- Flat-Remix
- Papirus
- Numix
- Mac iOS Icon theme v2  (存在一个小bug，home中的几个文件夹显示太小，不然非常好)
- macOS iCon theme v3.5
- Buuf 3.22


xfwm4 Themes(窗体):

- Greybird-yosemite
- Arc-OSX-MID-XFCE-edition
- axiom
- Dots Black/White
- Greybird Joshua Tree

外观样式：

- Greybird (系统自带)



> **最佳搭配：**  样式Greybird  +  窗体Greybird-yosemite  + 图标Faenza-Dark
另唯一可变的就只有图标了。










### Ubuntu 安装LXDE
[Ubuntu安装Lxde](http://blog.sina.com.cn/s/blog_6b1ed4fb0101k1qh.html)

由于Lubuntu的界面操作更方便美观（有声音和电源显示）并且它和单纯的lxde消耗的资源差不多，所以先尝试安装lubuntu-core ，或看是否需要安装lubuntu-desktop 等。【在建议安装的软件中也有xfce的电源管理器】再尝试安装lxde。  感觉Xubuntu 16和 Lubuntu都很不错。
