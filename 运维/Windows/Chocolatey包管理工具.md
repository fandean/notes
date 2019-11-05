由于Scoop更容易配置（相比于Chocolatey），这里选择 Scoop



在下载node时发现了两款用于Windows的包管理工具：

- [Chocolatey - The package manager for Windows](https://chocolatey.org/ "Chocolatey - The package manager for Windows")
- [Scoop](https://scoop.sh/ "Scoop")





## PortableApp

之前我一直使用PortableApp来安装一些简单的程序，主要优势是可以 

- **操作简单**
- 可以自定义安装路径（安装到C盘之外）。
- 绿色软件，当重装系统后可以更方便的迁移。



安装列表：

```
GeekUninstaller
Potplayer
Sumatra PDF
7-Zip
GIMP
LiberOffice
Notepad2
WinMerge
ZoomIt
Foxit Reader
Rufus
TeamViewer
```





>  现在有了cmder、WSL、Docker又多了更多选择





## Chocolatey

Chocolatey有 Open Source、Pro(Personal)和Business(C4B)三个版本，其中Open Source是免费的。

另外需要说明的是， Chocolatey 只是把官方下载路径封装到了 Chocolatey 中，所以下载源都是其官方路径（这个可能会变更） 。

[Installation](https://chocolatey.org/install "Installation") Chocolatey自身安装在默认位置即可。



更改使用Chocolatey安装的软件的安装目录：  

**chocolatey免费版本**，本人已验证过可行：

```
choco install jdk10 -ia "INSTALLDIR=""D:\DevPrograms\Java\JDK\jdk10.0.1-x64"""
```

参考官方文档：
<https://chocolatey.org/docs/getting-started#overriding-default-install-directory-or-other-advanced-install-concepts>

如果是pro或business版本，可以使用`--install-directory`参数，参见文档：<https://chocolatey.org/docs/commands-install#installarguments>
`--dir, --directory, --installdir, --installdirectory, --install-dir, --install-directory=VALUE`



> [Windows 神器 Cmder Scoop Chocolatey Listary Seer - CSDN博客](https://blog.csdn.net/u013205877/article/details/78993311 "Windows 神器 Cmder Scoop Chocolatey Listary Seer - CSDN博客")

