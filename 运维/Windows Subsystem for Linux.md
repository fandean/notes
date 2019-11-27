# Windows Subsystem for Linux 



Windows Subsystem for Linux（简称WSL）是一个为在Windows 10上能够原生运行Linux二进制可执行文件（ELF格式）的兼容层。 

- 从Windows到Linux
- 被迫从Linux到Windows
- 到如今 Windows迅速发展，渐渐开始习惯
- 到感觉已经没有必要回到 Linux



还不怎么习惯使用WSL。尽量是设置为一打开终端就自动连接到WSL。

甚至可以通过图形界面来操作WSL；vs code对其也提供了大量支持的插件。

神奇之处在于我们连接到wsl后依然可以在子系统中使用windows下安装的程序，不过对应的命令后面需要添加.exe，如果使用fish的话会自动提示。 之前一直没有意识到这一点的**重要性**。

以后系统盘尽量要分配的够大才行（至少150G）。



## 安装

> 😱 真的要将密码记在这里： 123

对于新版系统的安装参考：

- [Install the Linux Subsystem on Windows 10 | Microsoft Docs](https://docs.microsoft.com/zh-cn/windows/wsl/install-win10 "Install the Linux Subsystem on Windows 10 | Microsoft Docs")
- [Ubuntu on Windows10 跨平台开发环境搭建权威指南 - leejun2005的个人页面 - 开源中国](https://my.oschina.net/leejun2005/blog/1621918?from=juejin "Ubuntu on Windows10 跨平台开发环境搭建权威指南 - leejun2005的个人页面 - 开源中国")





Windows系统的分区全部挂载于 `/mnt` 目录

```
$ ls /mnt
c  d  e  f  g
```



可以为WSL设置别名以便于切换

```
alias cdc='cd /mnt/c/'
alias cdd='cd /mnt/d/'
alias cde='cd /mnt/e/'
```





## 终端配置或替换终端



[Windows Command Line Tools For Developers – Windows Console, Bash on Ubuntu on Windows, Windows Subsystem for Linux, WSL, Linux](https://blogs.msdn.microsoft.com/commandline "Windows Command Line Tools For Developers – Windows Console, Bash on Ubuntu on Windows, Windows Subsystem for Linux, WSL, Linux")



[介绍一个开源的windows命令行配色方案 - 云+社区 - 腾讯云](https://cloud.tencent.com/developer/news/229944 "介绍一个开源的windows命令行配色方案 - 云+社区 - 腾讯云")

[Get a Functional and Sleek Console in Windows ― Scotch](https://scotch.io/tutorials/get-a-functional-and-sleek-console-in-windows "Get a Functional and Sleek Console in Windows ― Scotch")



wsl-terminal 用于 Windows Subsystem for Linux (WSL) 的终端模拟器 ，非常轻量。



> 相关机制参考： [进入 WSL（或者说 Bash on Ubuntu on Windows ）环境的多种方法比较 - 简书](https://www.jianshu.com/p/a8989c23f766 "进入 WSL（或者说 Bash on Ubuntu on Windows ）环境的多种方法比较 - 简书")



**使用cmder连接 wsl：**

ConEmu（包括基于 ConEmu 修改的 cmder） 等终端模拟器也已经开始适配 WSL 环境。

我们添加一个标签页时就可以选择 `WSL --> bash`就可进行连接了。

> 如果显示效果不好可能需要配置一下cmder的背景。

某人的 cmder 的默认启动已经改成 `bash -c fish` 了 



> 不推荐： 开启 sshd，用其它终端做客户端 



## 配置图形环境

 WSL没有原生支持GUI的，但可以

- VNC

- 或通过XServer实现可视化操作 



[Windows Subsystem for Linux入门：安装+配置图形界面+中文环境+vscode · wu-kan](https://wu-kan.github.io/posts/linux/Windows-Subsystem-for-Linux#%E8%A7%A3%E5%86%B3%E4%B8%AD%E6%96%87%E4%B9%B1%E7%A0%81%E9%97%AE%E9%A2%98)





## 在WSL中安装Docker（当前没什么用）

[Get Docker CE for Ubuntu | Docker Documentation](https://docs.docker.com/install/linux/docker-ce/ubuntu/ "Get Docker CE for Ubuntu | Docker Documentation")



The contents of `/var/lib/docker/`, including images, containers, volumes, and networks, are preserved. The Docker CE package is now called `docker-ce`. 



好吧，这只是将WSL中的docker作为 Client来访问Docker for Windows而已，既然这样只需要在WSL中安装客户端即可。



```
[fan 02:14:33]~$ docker version
Client:
 Version:           18.06.0-ce
 API version:       1.38
 Go version:        go1.10.3
 Git commit:        0ffa825
 Built:             Wed Jul 18 19:09:54 2018
 OS/Arch:           linux/amd64
 Experimental:      false
Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?
[fan 02:18:42]~$ export DOCKER_HOST=tcp://127.0.0.1:2375
[fan 02:27:01]~$ docker version
Client:
 Version:           18.06.0-ce
 API version:       1.37 (downgraded from 1.38)
 Go version:        go1.10.3
 Git commit:        0ffa825
 Built:             Wed Jul 18 19:09:54 2018
 OS/Arch:           linux/amd64
 Experimental:      false

Server:
 Engine:
  Version:          18.03.1-ce
  API version:      1.37 (minimum version 1.12)
  Go version:       go1.9.5
  Git commit:       9ee9f40
  Built:            Thu Apr 26 07:22:38 2018
  OS/Arch:          linux/amd64
  Experimental:     false
```



将WSL配置为连接到Docker for Windows

执行命令：export DOCKER_HOST=tcp://127.0.0.1:2375

