
## Mac OS

这里是在 Vbox中安装 macOS Sierra 版本 10.12



### 电脑选购

适用于苹果系统的电脑的选购。

[The Always Up-to-Date Guide to Building a Hackintosh (macOS Sierra)](http://lifehacker.com/the-always-up-to-date-guide-to-building-a-hackintosh-o-5841604 "The Always Up-to-Date Guide to Building a Hackintosh (macOS Sierra)")




### 黑苹果安装包下载

比较伤心的国内一些网站制作的iso文件需要付费才可下载；而国外很多教程使用的安装包都放在Google Drive上下载比较麻烦。

最终还是下载别人制作好的 vmdk 文件，然后再导入Vbox中。

> 这些dmg文件在Vbox中都无法使用：
>
> http://www.xp933.com/download/4942.html
>
> http://www.360doc.com/content/16/1019/10/30817634_599560041.shtml
>
> macOS Sierra_10.12.5.zip包 **安装不了**： [下载地址](https://mega.nz/#!ESQS3Qjb!9zg1lFkNJq8hHz5kqjRt9ENP1wiKP94C9f189VUCu64) 
>
> 解压密码见 [{OS X 10.12 } MacOS Sierra Direct Download - Hackintosh Mumbai](http://www.hackintoshmumbai.com/macos-sierra-direct-download/ "{OS X 10.12 } MacOS Sierra Direct Download - Hackintosh Mumbai")
>
> 密码是： `http://www.hackintoshmumbai.com`
>
> 另一个下载地址：
>
> [Télécharger et Installer macOS Sierra 10.12.5 Final / Liens pkg + zip - Zone Actu](https://www.zoneactu.fr/2017/05/15/telecharger-et-installer-macos-sierra-10-12-5-final-liens-pkg "Télécharger et Installer macOS Sierra 10.12.5 Final / Liens pkg + zip - Zone Actu")




### Vbox安装Mac OS



直接挂载 dmg 文件出现如下错误：

```
打开虚拟盘文件/source/backup/macOS Sierra 10.12.4(16E195)MAS/Install macOS Sierra 10.12.4.dmg 失败.

Could not open the medium '/source/backup/macOS Sierra 10.12.4(16E195)MAS/Install macOS Sierra 10.12.4.dmg'.

VD: error VERR_VD_DMG_INVALID_HEADER opening image file '/source/backup/macOS Sierra 10.12.4(16E195)MAS/Install macOS Sierra 10.12.4.dmg' (VERR_VD_DMG_INVALID_HEADER).

返回 代码:NS_ERROR_FAILURE (0x80004005)
组件:MediumWrap
界面:IMedium {4afe423b-43e0-e9d0-82e8-ceb307940dda}
被召者:IVirtualBox {0169423f-46b4-cde9-91af-1e9d5b6cd945}
被召者 RC:VBOX_E_OBJECT_NOT_FOUND (0x80BB0001)
```



将 dmg 文件转换为 iso 文件**还是不行**。

[使用UltraISO将苹果dmg文件转换标准ISO镜像 - 漫步网络 - 51CTO技术博客](http://leihenzhimu.blog.51cto.com/3217508/625015 "使用UltraISO将苹果dmg文件转换标准ISO镜像 - 漫步网络 - 51CTO技术博客")   
[转：在ubuntu下将dmg文件转化为iso格式 - 李伯波 - 博客园](http://www.cnblogs.com/li-baibo/archive/2012/11/22/2782620.html "转：在ubuntu下将dmg文件转化为iso格式 - 李伯波 - 博客园")    
[Converting .dmg to .iso file in Ubuntu Linux ~ Daily Technologies Update](http://dailytechnologiesupdate.blogspot.jp/2011/11/converting-dmg-to-iso-file-in-ubuntu.html "Converting .dmg to .iso file in Ubuntu Linux ~ Daily Technologies Update")   



**最终还是下载别人制作好的 vmdk 文件，然后再导入Vbox中**。


在命令行中手动运行下列命令：(必须)

```shell
VBoxManage modifyvm "Sierra"  --cpuidset 00000001 000306a9 00020800 80000201 178bfbff
# VBoxManage modifyvm "Sierra" --cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff
VBoxManage setextradata "Sierra" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac11,3"
VBoxManage setextradata "Sierra" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
VBoxManage setextradata "Sierra" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Iloveapple"
VBoxManage setextradata "Sierra" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
VBoxManage setextradata "Sierra" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
```





遇到的问题：

```
Configuration error: Querying "UUID" failed (VERR_CFGM_VALUE_NOT_FOUND)
```

解决方法：设置虚拟机 -> 系统 -> 主板 -> 勾选“启用EFI”（由于之前参考其它教程将其去掉了）



由于先在移动硬盘上测试了该 vmdk 文件，结果再将此 vmdk 移动到电脑上使用的时候出现：

```
打开虚拟盘文件/source/backup/VirtualBox VMs/Sierra/macOS 10.12 Sierra Final by TechReviews.vmdk 失败.

Cannot register the hard disk '/source/backup/VirtualBox VMs/Sierra/macOS 10.12 Sierra Final by TechReviews.vmdk' {f3852edf-d188-4738-8546-93c6332979aa} because a hard disk '/media/fan/PriEncryptSync/VM/macOS 10.12 Sierra Final by TechReviews.vmdk' with UUID {f3852edf-d188-4738-8546-93c6332979aa} already exists.

返回 代码:NS_ERROR_INVALID_ARG (0x80070057)
组件:VirtualBoxWrap
界面:IVirtualBox {0169423f-46b4-cde9-91af-1e9d5b6cd945}
被召者 RC:VBOX_E_OBJECT_NOT_FOUND (0x80BB0001)
```

解决方法：

点击 -> 管理 -> 虚拟介质管理器 -> 虚拟硬盘 -> 删除该硬盘。之后再次添加该虚拟硬盘。


存在的问题。不能安装vbox的增强功能，所以不能在主机和虚拟机之间共享文件夹。



[VirtualBox中更改OS X Mavericks的分辨率 - 互联网－从零开始 - CSDN博客](http://blog.csdn.net/newborn2012/article/details/28419785 "VirtualBox中更改OS X Mavericks的分辨率 - 互联网－从零开始 - CSDN博客")

[更改VirtualBox中Mac OS的分辨率 - 峻祁连 - 博客园](http://www.cnblogs.com/junqilian/archive/2012/07/29/2614018.html "更改VirtualBox中Mac OS的分辨率 - 峻祁连 - 博客园")



参考文章：

[VirtualBox虚拟机安装Mac OS 10.12图文教程 - 下1个好软件](https://www.xia1ge.com/virtualbox-install-mac-os-10-12.html "VirtualBox虚拟机安装Mac OS 10.12图文教程 - 下1个好软件")

[How to install Mac OS X Sierra 10.12 on VirtualBox? – HintDesk](http://hintdesk.com/how-to-install-mac-os-x-sierra-10-12-on-virtualbox/ "How to install Mac OS X Sierra 10.12 on VirtualBox? – HintDesk")





## Mac OS使用



- 使用**Launchpad**快速查找和打开App
- Finder窗口： 通过 Finder，您能查看 Mac 上几乎全部内容，包括应用软件、硬盘、文件、文件夹和 DVD
- 打开终端：1. Finder -> 应用程序 -> 实用程序。2. Launchpad -> 实用程序
- Mission Control：用于集中显示所有打开的窗口。快捷键 `Ctrl + 上/下箭头`






### 拷贝粘贴

复制和拷贝"文件"的区别：

* 右键，复制文件是在当前文件夹中制作一个副本
* 右键，拷贝文件就与Windows中的复制相同



拷贝、粘贴、剪切**文本**的快捷键和Windows中类似，只不过是使用 Command 替换了 Ctrl。



### 剪切文件 

1. 先拷贝文件，再右键的同时按Option键(对应Alt)，此时原来的粘贴会变成**移动**到此处。
2. 使用**Command+C** 复制，然后用 **Command +Option+V** 将其移动到目标目录。




### 语言选择

系统偏好设置 -> 语言与地区



### 睡眠与屏幕锁定

都在系统与偏好中设置：

睡眠设置： 在 “节能” 中设置

屏幕锁定：在“安全性与隐私”中设置



### 输入法切换

系统偏好设置 -> 键盘 ：

在"输入法"中添加简体拼音；并设置字体大小为18

在"快捷键"中设置"选择上一个输入法"的快捷键。`^空格` 表示 Ctrl + 空格。双击快捷键即可更改该快捷键。



Caps Lock键的讨论：

中文输入法模式下，点击caps lock可以输入小写英文。

**CapsLock键，短按切换中英文，长按切换大小写。**

macOS Sierra 可用 Caps Lock 切换自带的中文输入法和英文。

不是调用中文输入法的英文模式，而是调用最近使用的西文输入法。



### 设置鼠标

发现虚拟机中鼠标滚动方向与常规的不一样，方向是相反的。解决办法：

系统偏好设置 -> 鼠标 -> 取消勾选“滚动方向：自然” 



### 声音调节

系统偏好设置 -> 声音 -> 输出 ，在此勾选"在菜单栏中显示音量"



### Mac OS 快捷键



| 图标   | Mac快捷键    | Windows   |
| ---- | --------- | --------- |
| ⌘    | Command 键 | Win       |
| ⌃    | Control 键 | Ctrl      |
| ⌥    | Option 键  | Alt       |
| ⇧    | Shift 键   | Shift     |
| ⇪    | Caps Lock | Caps Lock |
| fn   | 功能键       | fn        |







### 程序卸载与安装









### 系统备份

使用 Time Machine进行系统备份。





> 参考：
>
> [Mac入门教程-Mac大学](http://www.macdaxue.com/tag/mac%E5%85%A5%E9%97%A8%E6%95%99%E7%A8%8B/ "Mac入门教程-Mac大学")
>
> [Mac 教程：OS X「剪切」移动文件的三种方法 - 少数派](https://sspai.com/post/28389)
>
> [Mac OS X 显示隐藏文件的方法-Mac大学](http://www.macdaxue.com/hidden-file/ "Mac OS X 显示隐藏文件的方法-Mac大学")
>
> [Mac OS X 入门系列(10)：Mac 附带的应用程序介绍-Mac大学](http://www.macdaxue.com/os-x-app/ "Mac OS X 入门系列(10)：Mac 附带的应用程序介绍-Mac大学")
>
> [Mac OS X 入门系列(13)：屏幕截图和快捷键-Mac大学](http://www.macdaxue.com/os-x-jietu/ "Mac OS X 入门系列(13)：屏幕截图和快捷键-Mac大学")





### 命令行



sudo 命令: 与Ubuntu中的一样



**open 命令**

用 `open` 或者 `open -a /Applications/Whatever.app` 使用桌面应用打开文件。

打开 Safari：`open /Applications/Safari.app/`

可以使用`-a`选项要求自行选择打开的程序，或使用`-e`强制在TextEdit中编辑此文件。



用 `pbcopy` 复制任何命令的输出到桌面应用，用 `pbpaste` 粘贴输入。



用 `sw_vers` 获取 OS X 的版本信息。



## 软件管理



### Homebrew 与 Homebrew-cask

用 `brew` （Homebrew）或者 `port` （MacPorts）进行包管理。这些可以用来在 OS X 系统上安装以上的大多数命令。

#### Homebrew

安装： [Homebrew — macOS 缺失的软件包管理器](https://brew.sh/index_zh-cn.html "Homebrew — macOS 缺失的软件包管理器")

这个管理器基于Ruby和Git来实现，**所有安装的软件都来源于安装软件的官方网站。**使用 Homebrew 我们无需担心文件的位置，所有安装包都会放在一处，并将其文件软链接至 `/usr/local` 



Homebrew对应的命令： brew 

**常用命令**
`brew install xxx`  
`brew uninstall xxx `   
`brew search xxx`   
`brew list` 列出已安装的软件   
`brew update `  
`brew info` 显示应用的信息   
`brew deps` 显示包依赖   
Homebrew将应用独立安装在类似/usr/local/Cellar/wget之类的地方，在/usr/local/bin下面建立一个到具体安装路径的符号链接。   



卸载与更新：

```
# 卸载对应包名字
brew uninstall <package_name>
# 列出过时的包
brew outdated
# 更新过时的包，不带包名就跟新所有包
brew upgrade [ package_name ]
# 跟新HomeBrew自身
 brew update
# 清除缓存
brew cleanup [包名]
# 列出已经安装的包
brew list
```



**安装扩展：**

很多时候有些软件包并不在官方提供列表里面而是由第三方提供的这个时候，我们就需要使用下面的命令：

```
brew [un]tap <github_userid/repo_name> #添加或者删除仓库
```

`brew tap`作用用于添加更多仓库



**更换源：**





> 推荐：[Homebrew总结 - 简书](http://www.jianshu.com/p/8ad7056b243f "Homebrew总结 - 简书")

#### Homebrew-cask

安装：[Homebrew-Cask](https://caskroom.github.io/ "Homebrew-Cask")  

一种高效快速安装 Mac 软件的方法：**使用 Homebrew Cask 扩展**。Homebrew Cask，它是一套建立在 Homebrew 基础之上的 OS X 软件安装命令行工具，是 Homebrew 的扩展。会在home目录中的Applications文件夹中创建一个快捷方式。

Homebrew-cask对应的命令： brew cask



**常用命令**
`brew cask install`   
`brew cask uninstall`   
`brew cask search xxx`   
`brew cask info` 显示应用的信息    



比如安装 atom ：

```
brew cask install atom
```



> 还有一个 MacPorts 包管理器



> 参考：
>
> [8个不可不知的Mac OS X专用命令行工具 - SegmentFault 业界资讯 - SegmentFault](https://segmentfault.com/a/1190000000509514 "8个不可不知的Mac OS X专用命令行工具 - SegmentFault 业界资讯 - SegmentFault")
>
> [Mac OS X 中一些常用的命令行技巧 - World Under Control](http://easior.is-programmer.com/posts/43672.html "Mac OS X 中一些常用的命令行技巧 - World Under Control")
>
> [命令行的艺术](https://github.com/jlevy/the-art-of-command-line/blob/master/README-zh.md)
>
> [macOS 的一些独有命令行程序 · 不立不破](https://blog.windrunner.me/apple/utilities.html "macOS 的一些独有命令行程序 · 不立不破")
>
> [Mac安装软件新方法：Homebrew-cask - 阳志平的网志](http://www.yangzhiping.com/tech/homebrew-cask.html "Mac安装软件新方法：Homebrew-cask - 阳志平的网志")
>
> [Homebrew的作用和安装 - Soo Smart!](http://soosmart.com/topic/760.html "Homebrew的作用和安装 - Soo Smart!")
>
> [brew和brew cask有什么区别？ - 知乎](https://www.zhihu.com/question/22624898 "brew和brew cask有什么区别？ - 知乎")





### Mac开源软件列表



open-source-mac-os-apps

https://github.com/serhii-londar/open-source-mac-os-apps Star 12654

![img](https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1568666117,2122488795&fm=173&app=25&f=JPEG?w=640&h=206&s=790C3472C7F5503116552DCF0100C0B2)

macOS开源应用程序列表，包含许多本机和跨平台应用程序，旨在找到免费的macOS开源应用程序，涵盖音频、浏览器、数据库、JSON解析等模块





### 安装和使用Xcode

首先你需要注册一个Apple id。如果你的id可用，就可以直接在 App Store中搜索并安装xcode。

> 之前注册过一个帐号，但是密保问题忘记了，并且之前没有在App Store中登录并下载过东西。这次他要我补充信息，但是到了最后填写账单地址时始终过不去。于是只好离线下载 xcode，进行安装。

也可下载离线版xcode.xip文件。官方下载地址： <https://developer.apple.com/download/more/>，但这里也需要苹果帐号(之前那个未完成的帐号也可使用)。记得在虚拟机中下载该文件。

下载好之后直接双击xcode.xip文件即可进行解压，解压后即可使用xcode。或者先将xcode.xip移动到应用程序，再进行解压。



项目文件 `xcodeproj` 或 `.playground` 文件







