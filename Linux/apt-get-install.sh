sudo apt-get update -qq

#选项 -y 表示同意安装此软件

#C++编译器
sudo apt-get install g++ -y
#版本控制工具 git ## 参考另一篇笔记，源码安装最新版。
sudo apt-get install git git-doc -y
# git-flow  
sudo apt-get install git-flow -y
# gitg : 非常适合查看 git log
sudo apt-get install gitg -y
# curl 与 wget 类似的下载工具
sudo apt-get install curl -y
#关于软件编译... 等
sudo apt-get install checkinstall -y
sudo apt-get install autoconf automake -y


# vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv


# 用于编译 vim8，并使其支持某些特性所需的依赖
# lua 
sudo apt-get install lua5.3 liblua5.3-dev luajit libluajit-5.1-dev  
# perl
sudo apt-get install libperl-dev


##########################################################################
#
#                   编程语言相关（开发环境）尽量先安装
#
##########################################################################

######### Java ########
# Java JDK 安装见后面的第三方软件安装


######### Node.js########
# Node.js安装：直接在网站下载最新版，里面包含了npm。位置存放在/opt 目录

# npm: package manager for Node.js
# 安装后对应的命令分别为    node 和 npm 
# 使用 npm 安装gtop这个软件：  npm install gtop -g


######### Ruby ########
# 在安装vim-youcompleteme的时候就同时安装了： libruby2.3 rake ruby ruby2.3 vim-addon-manager vim-nox 

# 编译vim所需，安装jekyll所需
# sudo apt-get install ruby-dev -y

# ruby语言相关的程序，建议通过 rbenv 来安装，见我的  blog


######### Jekyll ########
# 需在ruby之后安装
# gem install jekyll 
# gem install bundler

######### python ########
# xubuntu 16.04默认安装了python 但没有安装 pip

# pip : alternative Python package installer
sudo apt-get install python-pip -y

# 编译vim和支持vim的相关功能
sudo apt-get install python-dev -y
sudo apt-get install python3.5-dev 


#  nodejs的npm、Ruby的gem、python的pip 都存在相同的功能  package manager
# 并且安装完成后都需要修改仓库地址为国内镜像地址。



# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


#两个著名的编辑器，及其插件
sudo apt-get install emacs -y
sudo apt-get install vim vim-doc vim-scripts -y
#sudo apt-get ingtall gvim -y	#没有这个了？
#另见vim Teb 之后列出的软件，其中包括，vim-youcompleteme

# 安装vim-youcompleteme会同时安装： vim-nox , ruby...， 
# 并且会设置 update-alternatives: 使用 /usr/bin/vim.nox 来在自动模式中提供 /usr/bin/vim (vim)
sudo apt-get install vim-youcompleteme -y

#用于vim，或 ... 
sudo apt-get install exuberant-ctags -y
# vim + ctags + cscope 查看源码
# sudo apt-get install ctags -y
sudo apt-get install cscope -y
#安装vim的某自动补全插件需要的工具
sudo apt-get install cmake -y


#VirtualBox的安装参见官网介绍的添加项目到sources.list的方法安装

#fcitx输入法框架，及输入法
sudo apt-get install fcitx fcitx-googlepinyin fcitx-frontend-fbterm -y

#分区工具GParted 支持动态调整分区大小
sudo apt-get install gparted -y

#思维导图软件,需要Java运行库的支持
#sudo apt-get install freemind -y
#可以考虑使用freemind开发者的另一个软件 freeplane
#sudo apt-get install freelane  (版本旧)

# freeplane思维导图，最新版。 推荐
# 直接下载编译过的压缩文件，解压，直接命令行运行，固定到启动器。


#记单词... 软件
sudo apt-get install anki -y

#视频播放器，存在视频卡顿、花屏、图像跟不上的现象
#sudo apt-get install vlc -y 

#命令行下的视频播放器
sudo apt-get install mplayer -y

#另安装最新版mpv或者smplayer视频播放器，通过添加ppa的形式

#命令行下，避免错误删除的软件
sudo apt-get install trash-cli -y

#在将来某个时刻运行： at 和 batch 命令
sudo apt-get install at -y

#闹钟
#sudo apt-get install alarm-clock-applet -y

#分屏软件
sudo apt-get install tmux -y

# 翻译软件
sudo apt-get install goldendict -y

#解压软件
sudo apt-get install unrar -y
sudo apt-get install rar -y
sudo apt-get install p7zip-full -y

# convmv用于和p7zip-full一起解决zip压缩文件乱码问题。如果还是不能解决问题尝试使用unzip -O GBK 文件名.zip
sudo apt-get install convmv -y

#以树形结构列出目录结构
sudo apt-get install tree -y


#取代鼠标的软件
sudo apt-get install keynav -y

#用于在终端下正确显示输入中文
sudo apt-get install fbterm -y


#入侵检测软件 aide , 暂时不会用。  
#sudo apt-get install aide


#用于图像处理
###########################################################################################
# Graphviz提供了 dot 语言来编写绘图脚本，可以很容易的来绘制结构化的图形网络；且是跨平台的工具 。  
# 可在此查看相关例子： http://www.cnblogs.com/sld666666/archive/2010/06/25/1765510.html  
# 不会用
#sudo apt-get install graphviz -y
#
#
# Dia 是一款矢量图形绘制程序，跨平台,可用于创建流程图、网络图、电路图。 
# Inkscape 矢量图像编辑软件，跨平台。  ,感觉挺棒的。必装
# Gimp 跨平台的图像处理程序，包括几乎所有图像处理所需的功能，号称Linux下的PhotoShop。    
# sudo apt-get install dia -y
sudo apt-get install inkscape -y
sudo apt-get install gimp -y

# 很强大的绘图软件，比较复杂, 通过 ppa 下载最新版
# sudo apt-get install krita -y 
# 简单易用的绘图软件，不支持中文输入
# sudo apt-get install pinta
############################################################################################

#图片查看软件
# Xubuntu 中的默认看图软件Ristretto相对来说非常好
sudo apt-get install ristretto -y


# kazam Ubuntu上一款桌面屏幕录制工具， 带截图功能；视频录制
 sudo apt-get install kazam -y

# recordMyDesktop   屏幕录制，视频录制
# sudo apt-get install gtk-recordmydesktop


#Launchy 按键启动器,及其插件和皮肤，没错就是Windows中用的那个
#sudo apt-get install launchy launchy-plugins launchy-skins -y

#录制和编辑音频  30M  可使用chrome相关插件代替。
#sudo apt-get install audacity -y

#Bluefish 编辑器，网路开发编辑器，面向有经验的网页设计师的HTML编辑器。 在Ubuntu软件中心，可选择下载相关插件.   
#sudo apt-get install bluefish*  -y

#traceroute 命令： 追踪网路数据的路由途径
sudo apt-get install traceroute -y

#FileZila 通过FTP、FTPS 和 SFTP 上传下载文件 
sudo apt-get install filezilla -y

# Remmina一个功能丰富的远程桌面共享工具(VNC),并带有SFTP, SSH等功能。同时安装所有插件。
sudo apt-get install remmina remmina-plugin-*

#GnuPG 加密软件，非对称加密 


# 视频编辑
# [2016 年 Linux 下五个最佳视频编辑软件](https://linux.cn/article-7955-1.html )
# 视频编辑器。另有视频编辑器Cinelerra可将图片添加到视频；Kino可将静态图形导出成gif。好莱坞级别的Lightworks但其对硬件要求极高。
# Blender也可以用来编辑视频
# 暂时用不到
# 一个觉得不错的视频编辑软件
# sudo apt-get install kdenlive -y


#FeedReader 阅读器，即RSS阅读器，有相关插件，
sudo apt-get install liferea -y 

#电子书阅读器。缺点不能生成目录。
#sudo apt-get install fbreader -y


# Calibre 致力于提供完整的电子书库解决方案。它拥有书库管理、格式转换、新闻转换为电子书、电子书 阅读器同步等功能。
# 缺点： 软件体积大，不喜欢它的书库管理功能
# 优点： epub、mobi的查看效果最好，能够随时查看目录。
# Calibre 有一个内置的阅读器（E-book viewer），支持所有主要的电子书格式。我们可以所有程序中找到该阅读器。
sudo apt-get install calibre -y

# 基于KDE的PDF浏览器，支持加亮、标注；另有相关插件; 利用打印选项可保存标注到PDF文件中。推荐
sudo apt-get install okular -y  

# 另一个PDF编辑器  Master PDF Editor ，有免费版；需手动下载安装。推荐。


#C/C++ 调试器 
#sudo apt-get install nemiver -y

#kiki 正则表达式测试软件  有在线的其它...
#sudo apt-get install kiki -y  

#Bleachbit是类似windows中的CCleaner的清理软件
sudo apt-get install bleachbit -y

#OpenVPN 相关软件（参考ProtonVpn）
sudo apt-get install openvpn -y
# Network Manager GUI
sudo apt-get install network-manager-openvpn-gnome -y
# resolvconf
sudo apt-get install resolvconf -y



#alien 用于各种安装包之间的转换，包括 rmp --> deb，
#alien 可将RPM包转换成.deb 包,他会安装几个额外的软件，包括rmp
#转换了一个vym软件但不成功.
#sudo apt-get install alien -y

# ubuntu-make 可以用来安装软件。
#allows you to download the latest version of popular developer tools on your installation 
# 安装形式如 umake ide lighttable 安装Android-Studio只需: umake android-studio 
# 卸载软件： umask -r ide lighttable
# ubuntu 16之前的版本 最新版下载安装
# sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make
#
# . ubuntu make  ; ubuntu 16 可直接使用 apt 命令安装
# sudo apt install ubuntu-make -y


# Visual Studio Code
# 安装: 可直接通过 umake 进行安装
# 卸载 : sudo apt-get remove code

# vscode的一个图片预览插件需要安装的工具
sudo apt-get install xclip -y 

# Light Table全新理念的IDE 编辑器
# sudo add-apt-repository ppa:dr-akulavich/lighttable
# 使用ubuntu-make安装 见<https://itsfoss.com/install-lighttable-ubuntu/>
# umake ide lighttable 

# ClamAV 一款跨平台的杀毒软件


# TLP 电源管理软件，减慢耗电速度，见官网
# 安装后，使用: sudo tlp start 启动， 使用： sudo tlp-stat 查看状态, tlp-stat -c 显示配置信息。
# tlp-stat -t 显示温度，sudo tlp ac 开启交流电模式(及插电)，sudo tlp bat 开启电池模式(及使用电池与tlp true一样),它与xfce4 PM 好像并无冲突，后者处理关闭盖子等事件。
# <http://www.mamicode.com/info-detail-40199.html>
# "注意"：安装后关闭屏幕等配置可能就要在这个软件中配置.
# sudo apt-get install tlp -y

# Remarkable，Linux下的Markdown编辑器
# 推荐Typora ，该编辑器非常好用。


# lolcat它能通过类似cat命令的方式将某个命令的默认屏幕出错颜色，彩虹效果。示例：ls -l | lolcat -as 25
sudo apt-get install lolcat -y


# KchmViewer用于打开 chm 帮助文件；另可下载 chrome 的插件来打开chm文件
sudo apt-get install kchmviewer -y


# GitKraken：git的第三方GUI客户端


# Redshift 屏幕亮度调节，护眼。另还有f.lux
# sudo apt-get install redshift -y

# Asciinema 记录和分享你的终端会话操作，（录制终端）；`asciinema rec`进行录制，按 Ctrl + D 或者 exit退出
# 版本太低，使用ppa安装
# sudo apt-get install asciinema -y


# autojump高级的目录跳转命令；配置见相关笔记。通过记录cd过的目录来实现快速跳转。该命令的简写是 j
# 还有个bd命令用来快速返回某级父目录，其安装方法请自行搜索
sudo apt-get install autojump -y


# colordiff，把原本diff的输出加上颜色，使其更易于阅读，可以单独使用也可结合diff使用
# colordiff file1 file2					或   diff -u file1 file2 | colordiff
sudo apt-get install colordiff -y


# ASCII Art：纯文本流程图绘制
# http://weishu.me/2016/01/03/use-pure-ascii-present-graph/


# Fresh player plugin 用于火狐
# sudo apt-get install browser-plugin-freshplayer-pepperflash

# speedtest-cli 网速测试； 国内测试可能不是非常准确。使用方法直接 speedtest-cli
# 该工具可以使用python 的 pip 进行升级： sudo pip install speedtest-cli --upgrade
sudo apt-get install speedtest-cli -y


# pv: Pipe Viewer(管道查看器)。它可以监测Linux管道中数据流通的进度
sudo apt-get install pv -y


# Seahorse： 用于管理PGP和SSH密钥的一个GUI工具(Linux中国)
sudo apt-get install seahorse -y

# Zsync：用于分发数据。 https://linux.cn/article-9477-1.html
# 如果你会得到一份已有文件旧版本，它只下载该文件新的部分。
# 注意：只有当人们提供zsync下载方式时，zsync才有用（后缀为.zsync的文件）
# 用法示例： zsync http://cdimage.ubuntu.com/ubuntu/daily-live/current/bionic-desktop-amd64.iso.zsync
sudo apt-get install zsync -y



#################################################################################
# 
#           与特定系统相关的软件
#
#################################################################################

# Ubuntu 额外的版权受限程序,  可在Ubuntu软件中心查看相关评论，和相关信息。  
# 会有一个错误，原因是： 网站被墙 消息如下：ttf-mscorefonts-installer 无法下载。
# 在安装其包含的安装Microsoft Windows Fonts微软字体库ttf-mscorefonts-installer时会要求同意其协议
# 安装该字体库后，运行下面的命令 : sudo fc-cache -fv
# 在软件中心见到： 
# oxideqt-codecs 和 libavcodec54 两个软件包未能下载。
# sudo apt-get install ubuntu-restricted-extras -y
# 有专门针对 xubuntu 的版本
sudo apt-get install xubuntu-restricted-extras -y


# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#闹钟, 需要 下一个GStreamer 插件的支持，获得更好的支持.
# sudo apt-get install alarm-clock-applet -y

#GStreamer-??-plugins* 附加 插件 ，是一系列流媒体解码器。
# GStreamer本身是Gnome环境下用来构建流媒体应用的开源多媒体框架。可以找其编程教程。该软件可能已经更新
# 安装 xubuntu-restricted-extras 时，也会安装gstreamer1.0-plugins的相应版本
# sudo apt-get install gstreamer0.10-plugins-ugly -y
# sudo apt-get install gstreamer1.0-plugins-ugly -y
sudo apt-get install gstreamer1.0-plugins-good -y


########################################################################
#
#				        第三方软件
#	        适用于 Ubuntu 16.04
#           建议备份 /etc/apt/ 目录
#
########################################################################

# 推荐：
# 100款开源软件：http://server.it168.com/a2010/0811/1089/000001089290_7.shtml  
# [How To Install The Latest Nvidia Drivers In Ubuntu or Linux Mint Via PPA](http://www.webupd8.org/2016/06/how-to-install-latest-nvidia-drivers-in.html)
# [Use GNOME 3.18+ Google Drive Integration Feature In Unity, Xfce And Other Desktop Environments](http://www.webupd8.org/2016/03/use-gnome-318-google-drive-integration.html)
# [Mount Google Drive In Linux With google-drive-ocamlfuse](http://www.webupd8.org/2013/09/mount-google-drive-in-linux-with-google.html "挂载Google Drive")
# [Translate Any Text You Select On Your Linux Desktop With A Keyboard Shortcut And Notifications](http://www.webupd8.org/2016/03/translate-any-text-you-select-on-your.html "这个翻译看起来不错，使用的还是google翻译的api")
# [How To Change The Mouse Scroll Wheel Speed In Linux Using imwheel](http://www.webupd8.org/2015/12/how-to-change-mouse-scroll-wheel-speed.html "调节鼠标滚轮速度")
# [Encrypt Your Cloud Files With Cryptomator (Open Source, Cross-Platform)](http://www.webupd8.org/2016/04/encrypt-your-cloud-files-with.html "加密云端文件")


# ################### 第三方软件安装 ###############################
#        在此处统一添加 ppa  
#    添加： add-apt-repository ppa:user/ppa-name
#    移除： add-apt-repository -r ppa:user/ppa-name
#    最新的PPA见各软件的官网，或官方blog
#
# 1. Java JDK 安装，但是安装时会有协议让你选择,且下载过程十分缓慢
# 推荐直接官网下载JDK 解压到 /opt ，然后配置3个环境变量即可，环境变量见.bashrc文件，此方法不妥，见单独的java安装配置文件
# 必看参考：[Install Oracle Java 8 In Ubuntu Or Linux Mint Via PPA Repository](http://www.webupd8.org/2012/09/install-oracle-java-8-in-ubuntu-via-ppa.html)
# sudo add-apt-repository ppa:webupd8team/java

# 2. shutter 出名的屏幕截图工具，跨平台,可实现多种截图形式/功能
sudo apt-add-repository ppa:shutter/ppa

# 3. Midori主要侧重速度的浏览器，更加轻量。（相比QupZilla占用的内存更少，
# 可正常加载复杂页面，而Ubuntu自带的浏览器这方面有些欠缺，自行编译的NetSurf也一样）
# 不推荐。直接用 firefox 就好。已经添加了8G内存，直接用Chrome
# sudo apt-add-repository ppa:midori/ppa 


# 4. uget 下载工具
sudo apt-add-repository ppa:plushuang-tw/uget-stable

# 5. mpv 很棒的媒体播放器，快速播放声音和视频都无卡顿，音色正常。
sudo apt-add-repository ppa:mc3man/mpv-tests

# 6. SMPlayer is built with Qt and is based on MPlayer. 
#    一个跨平台的Mplayer或MPV的图形前端，最新PPA见官方blog: <blog.smplayer.info>
#    在首选项切换多媒体引擎时选择mpv或mplayer
sudo add-apt-repository ppa:rvm/smplayer-qt4

# 7. flux自动调节屏幕，以保护眼睛 （在Ubuntu 16.04中可能RedShift更稳定）
sudo add-apt-repository ppa:nathan-renniewaldock/flux

# 8. KDE Connect将Android手机连接到Linux的程序，另需在手机上也安装该程序,不能进行屏幕共享
# 不推荐
# sudo add-apt-repository ppa:vikoadi/ppa


# 9. CopyQ高级剪切板管理工具(对于XUbuntu可考虑xfce4-clipman)<https://linux.cn/article-7329-1.html>
sudo add-apt-repository ppa:hluk/copyq

# 10. asciinema 录制终端
sudo add-apt-repository ppa:zanchey/asciinema


# 11.  typora
# Linux中最好用的Markdown编辑器
# 能够直接在实时预览界面直接编辑，也可切换到源码模式进行编辑，能通过自动生成的目录进行跳转。
# 能够切换5种主题或自定义主题，能够保存历史文件的文件夹位置。
# 安装教程见官网：https://www.typora.io/#linux
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE 
sudo add-apt-repository 'deb https://typora.io ./linux/'


# 12. shadowsocks-qt5 主要用于fq的软件
sudo add-apt-repository ppa:hzwhuang/ss-qt5


# 13.  google-chrome：浏览器
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

# 14. vscode： 一个编辑器
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# 15. Atom： 一个编辑器
sudo add-apt-repository ppa:webupd8team/atom  

# 16. MultiSystem 多系统启动U盘制作
sudo apt-add-repository 'deb http://liveusb.info/multisystem/depot all main'
wget -q -O - http://liveusb.info/multisystem/depot/multisystem.asc | sudo apt-key add -

# 17. Sublime Text 3, 一个著名的编辑器
# 还是不能输入中文，就算解决中文输入问题，输入框还是无法跟随光标
# wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
# echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# 18.  Blender   3D模型动画制作，也有视频编辑功能。要求有独立显卡，并安装了独立显卡驱动。
sudo add-apt-repository ppa:thomas-schiex/blender

# 19. Persepolis Download Manager (简称 PDM)  Aria2图形界面免费开源下载软件
sudo add-apt-repository ppa:persepolis/ppa


##################统一在在此更新############################
sudo apt-get update  -qq


# 1. Oracle的JavaSE 的安装由于版本更新，安装时修改版本号
#sudo apt-get install oracle-java8-installer -y

# 2. shutter
sudo apt-get install shutter -y

# 3. midori浏览器
# sudo apt-get install midori -y

#4.下载软件 uget 及其插件,另可以通过添加PPA (Personal Package Archives, 个人软件包档案。见百度百科 Ubuntu PPA)安装最新版。
#uget官网有最新版下载，并且介绍如何添加ppa
sudo apt-get install aria2 -y
sudo apt-get install uget -y
#另外可考虑的下载软件有 JDownload 和 uTorrent 官网下载

#5. mpv
sudo apt-get isntall mpv -y

# 6. Smplayer
sudo apt-get install smplayer -y

# 7. flux
sudo apt-get install fluxgui -y

# 8. KDE Connect
# sudo apt-get install kdeconnect indicator-kdeconnect

# 9. CopyQ
sudo apt-get install copyq -y

# 10. asciinema
sudo apt-get install asciinema -y

# 11. typora
sudo apt-get install typora -y

# 12. shadowsocks-qt5
sudo apt-get install shadowsocks-qt5 -y

# 13. google-chrome
sudo apt-get install google-chrome-stable -y

# 14. vscode
sudo apt-get install code -y

# 15. Atom
sudo apt-get install atom -y

# 16. MultiSystem
sudo apt-get install multisystem -y

# 17. Sublime Text 3
# sudo apt-get install sublime-text -y


# 18.  Blender
# sudo apt-get install blender -y

# 19. Persepolis Download Manager (简称 PDM)
sudo apt install persepolis -y



