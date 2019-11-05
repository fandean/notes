

# Scoop 包管理工具

由于Scoop更容易配置（相比于Chocolatey），这里选择 Scoop

使用Scoop安装最佳的应用程序通常称为“便携式”应用程序：即在解压缩时独立运行的压缩程序文件，不存在更改注册表或将文件放在程序目录之外的副作用。 



运行于 PowerShell（命令行）  之中。在 cmder（一个命令行终端） 中运行没有问题。

Github页面： [scoop: A command-line installer for Windows.](https://github.com/lukesampson/scoop "lukesampson/scoop: A command-line installer for Windows.")

Scoop更专注于开源的命令行开发人员工具 。



可以通过Scoop安装的软件：[scoop/bucket](https://github.com/lukesampson/scoop/tree/master/bucket "scoop/bucket at master · lukesampson/scoop")

虽然 Scoop 的作者在项目的 GitHub Wiki 中谈到， Scoop 只是一个安装工具（installer），不应该被称为包管理器（package manager）。但是对于使用者而言，它与我们一般认为的软件包管理工具其实很是相似。 

总的来说， Chocolatey 能更加全面地包办绝大多数的软件安装，适应重度需求；而 Scoop 则更加简单利落，容易自定义软件包，适应中低需求。而我恰是后者，对于像 VirtualBox、Docker for Windows 这些需要高权限的软件还是会用安装包在用户界面下自定义安装。更特殊的用户倒是更可以将 Chocolatey 和 Scoop 结合使用。 

Chocolatey 的安装脚本默认要求管理员权限安装，同时非管理员安装默认路径是 `C:\ProgramData\chocoportable`，这对于非高权限用户来说不太友好（比如没有管理员权限的工作机安装会比较折腾），而 Scoop 默认仅需普通用户权限，安装路径是 `%USERPROFILE%\scoop` 则显得比较清新，不过这都是**可以根据需求修改**的了。 

其实如果你是偏重度的用户，想尽量多的软件可以用命令行管理，又不在乎我前文说的 Chocolatey 的软件包描述文件相对复杂等缺点的话，其实可以去试试使用 Chocolatey。而如果你没那么强烈的需求，只是像我一样有一点点 “**绿色软件洁癖**”，同时想用命令行管理部分软件包，并且以此构建一个**相对轻量的命令行环境**的话，不妨可以尝试一下 PowerShell + Scoop + Cmder 这套组合。或者，Chocolatey 和 Scoop 二者一起用也是可以的。 



> [再谈谈 Scoop 这个 Windows 下的软件包管理器 · Chawye Hsu, H404bi](https://h404bi.com/blog/2018/05/12/talk-about-scoop-the-package-manager-for-windows-again.html "再谈谈 Scoop 这个 Windows 下的软件包管理器 · Chawye Hsu, H404bi")
>
> 作者个人维护的Bucket [h404bi/dorado: 🐟 A bucket of Scoop, for h404bi](https://github.com/h404bi/dorado "h404bi/dorado: 🐟 A bucket of Scoop, for h404bi")





### 安装配置Scoop

默认设置已配置为用户级别**安装的程序**和Scoop本身都位于 `C:\Users\<user>\scoop `

全局安装的程序（所有用户可用）（`--global`）位于`C\ProgramData\scoop`中。可以通过环境变量更改这些设置 。

所以安装时先通过配置环境变量来配置其安装路径；然后在PowerShell运行命令下载。

**Install Scoop to a Custom Directory**

```
[environment]::setEnvironmentVariable('SCOOP','D:\Scoop','User')
$env:SCOOP='D:\Scoop'
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
```

> 相当于在用户变量中设置  `SCOOP=D:\Scoop`
>
> 具体安装方法见其Github

**Configure Scoop to install global programs to a Custom Directory**（可选，建议不改）

```
[environment]::setEnvironmentVariable('SCOOP_GLOBAL','D:\Scoop\GlobalScoopApps','Machine')
$env:SCOOP_GLOBAL='D:\Scoop\GlobalScoopApps'
```

> 相当于在系统变量中设置： `SCOOP_GLOBAL=D:\Scoop\GlobalScoopApps`；默认是在  `C:\ProgramData\scoop`，感觉不应该更改。

为什么需要全局安装呢？我想应该 对于那些 要求管理员权限的程序需要安装在全局

[Global Installs / scoop Wiki](https://github.com/lukesampson/scoop/wiki/Global-Installs) ，像字体、7zip等需要给所有用户使用，所以需要使用全局安装。

```powershell
#初次安装也可选择安装下面这些，其中sudo要先安装
scoop install sudo
sudo scoop install 7zip git openssh --global
# 更新同样需要sudo 和 -g
sudo scoop update git -g
```

> 这里不建议这样安装Git，建议安装  posh-git ，[posh-git](http://dahlbyk.github.io/posh-git/)  A PowerShell environment for Git 



**Multi-connection downloads with aria2**

scoop可通过aria2来进行多任务下载：

```shell
scoop install aria2
```



### Scoop常用命令

```shell
scoop help #查看帮助
scoop help <某个命令> # 具体查看某个命令的帮助
scoop install #安装 APP
scoop uninstall #卸载 APP
scoop list #列出已安装的 APP
scoop search #搜索 APP
scoop update #更新 Scoop 自身
scoop update appName1 appName2 # 更新某些app
scoop update *  # 更新所有 app （前提是需要在apps目录下操作）
scoop status # 检查哪些软件有更新
scoop bucket known #通过此命令列出已知所有 bucket（软件源）
scoop bucket add bucketName #添加某个 bucket
scoop cache rm <app> # 移除某个app的缓存
```



- **对于GUI程序**，scoop会自动为其在开始菜单中添加快捷方式 ，路径： `C:\Users\Fan Dean\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Scoop Apps`

- **对于命令行程序**，scoop会自动在 scoop应用安装路径下的 shims 文件夹下为其添加对应的exe程序，而shims文件夹是被添加到 PATH 变量中，所以可以直接在命令行中运行刚安装的程序。

  

**安装 curl 、grep**

```
scoop install curl grep
```

我们发现，下载的过程中自动下载了依赖7-zip。 在安装方面，它利用了7zip去解压安装包/压缩包，因此它对绿色软件有天生的友好属性。 。不仅如此，**下载之后的内容会自动将加入到（Path）环境变量中**。十分方便。大家都可以自己尝试为一些免安装软件建立软件源（需要安装的软件比较复杂，需要一定门槛）



>  Scoop 是一个强大的工具，有着极大的可玩性、设计与实现理念，包括但不限于 `shim` 的软链接理念、利用 `persist` 存储**用户数据**等等，如果你感兴趣，请直接参考 [Scoop 官方的 Wiki](https://github.com/lukesampson/scoop/wiki)。 



### 添加软件源Bucket

Scoop说自己的软件源为Bucket，而我更习惯直接叫其为软件源。

参考：

- [Buckets · lukesampson/scoop Wiki](https://github.com/lukesampson/scoop/wiki/Buckets#creating-your-own-bucket "Buckets · lukesampson/scoop Wiki")

```
# bucket的用法
scoop bucket add|list|known|rm [<args>]
```



一个添加第三方bucket的示例：

```
scoop bucket add dorado https://github.com/h404bi/dorado
```

 明确指定安装此软件源中的的程序

```
scoop install dorado/<app_name>
# 下面是dorado中特有的软件，测试其是否添加成功
scoop search trash
```



推荐的Bucket：

- `extras`：Scoop 官方维护的一个仓库，涵盖了大部分因为种种原因不能被收录进主仓库的常用软件。地址：[lukesampson/scoop-extras](https://github.com/lukesampson/scoop-extras/tree/master/bucket)

- `nirsoft`：是一个 NirSoft 开发的小工具的安装合集。NirSoft 制作了大量的（dozens and dozens）小工具，包括系统工具、网络工具、密码恢复等等，孜孜不倦、持续更新。

- - Bucket 地址：[kodybrown/scoop-nirsoft](https://github.com/kodybrown/scoop-nirsoft)
  - NirSoft 官网地址：[NirSoft](http://www.nirsoft.net/)

- dorado（对中文支持更好）[h404bi/dorado: 🐟 A bucket of Scoop, for h404bi](https://github.com/h404bi/dorado)
- ash258：[Ash258/scoop-Ash258: Personal bucket with wide variety of applications of all kind.](https://github.com/Ash258/scoop-Ash258)
- java：

```shell
# 先添加bucket
scoop bucket add extras
scoop bucket add nirsoft
scoop bucket add dorado https://github.com/h404bi/dorado
scoop bucket add Ash258 'https://github.com/Ash258/Scoop-Ash258.git'
# 对Java开发
scoop bucket add java
```





使用时遇到的问题：

由于extras bucket更新时遇到问题，我将其删除后再添加提示成功，但是它却把 main bucket及默认的bucket给删除了。通过"scoop status"检查状态时出现"These app manifests have been removed"并且下面列出了已被移除的软件名单。**那么如何将 main bucket重新添加进来？**

```shell
scoop help bucket
scoop bucket known #通过此命令列出已知所有 bucket

$ scoop bucket known # 示列
main
extras
versions
nightlies
nirsoft
php
nerd-fonts
nonportable
java
games
jetbrains

scoop bucket add main #添加 main bucket
```





### 网络问题安装失败



比如安装irfanview一直失败，查看信息

```
ERROR Download failed! (Error 1) An unknown error occurred
ERROR https://www.irfanview.info/files/iview453_x64.zip
```









### 已安装软件列表

添加额外的extras bucket：

```shell
scoop bucket add extras
```

离线文档查看 zeal ：可集成到 idea 等

```shell
λ scoop install zeal
```

**视频播放器 mpv** 

```shell
λ scoop install mpv
```

**文件同步工具 syncthing**，在GitHub上超级火爆

```shell
λ scoop install syncthing
```

**ImageMagick 看图软件**:



```
scoop install sliksvn
scoop install xx-net
```

**idea-ultimate：**

```
scoop install idea-ultimate
```



## 推荐的软件

> 这里记录了Github上各种bucket，[rasa/scoop-directory: A directory of buckets for the scoop package manager for Windows](https://github.com/rasa/scoop-directory) 相当于Scoop的第三方软件源。



新机安装顺序：

- 可选：Google官网下载Chrome下载器

- 先安装 scoop，将其配置好；再为scoop添加下面几个软件源：extras、dorado（对中文支持更好）、ash258、java
- 通过scoop安装cmder（或者安装WindowsTerminal）、RunAny（第一次使用scoop安装其他程序时就会自动安装7z）
- 通过scoop安装必要软件



按安装方式进行分类



下载exe安装包安装：

- Firefox：使用scoop下载的话会出现无法更改语言和添加插件；使用PortableApp下载速度又贼慢

  Firefox最新版本下载：根据此处（[latest Firefox release](https://ftp.mozilla.org/pub/firefox/releases/latest/README.txt)）说明，拼出下面的下载地址（Win64，简体中文）

  ```
  https://download.mozilla.org/?product=firefox-latest&os=win64&lang=zh-CN
  ```

- Chrome浏览器：直接在官网下载（是一个安装器），通过安装器安装的Chrome在之后更新时无需翻墙

  

通过压缩包安装：

- [RunAny - 开源免费“一劳永逸”的热键快速启动工具 ](https://www.iplaysoft.com/runany.html) 非常不错的工具，它的快捷键是`，如果要在文件中输入它，需要先按 “win”键。
- tree：移植Linux中的tree命令。需要参考着两篇文章 [中文环境下更好的命令行tree工具 ](https://segmentfault.com/a/1190000020234585) （但是在cmder中显示乱码，不够完善；暂且用tree原版）、[Window 平台下添加 tree 命令 ](https://zhuanlan.zhihu.com/p/35626363)
- ZoomIt：用作教鞭。通过Scoop无法安装它。ZoomIt是由微软工作人员开发的 [Sysinternals Utilities](https://docs.microsoft.com/en-us/sysinternals/downloads/) 系列中的一个，我们可以全部打包下载，对于这一包建议放在自定义的bin目录下

通过PortableApp安装：

- 在这里是中文的程序，并还没测试scoop：
  - WinMerge
  - LibreOffice
  - sumatra pdf
  - potplayer

通过Scoop安装：

- Cmder：Windows下替代cmd的字符终端

- 各种可在命令行使用的开发相关的程序
- geekuninstaller：著名的卸载工具，能够完全清理卸载残留
- vscode-portable ：VS code 在scoop中已经有绿色版
- qbittorrent：BT下载软件
- notepadplusplus：替代默认记事本的程序
- 7-zip：
- uGet：简洁无广告的下载工具（Linux上可用）



```

```

