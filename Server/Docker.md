# Docker





[](https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Docker_%28container_engine%29_logo.svg/610px-Docker_%28container_engine%29_logo.svg.png)

## 学习资料

[ **如何选择Docker书籍** - Docker 问答录（95 问） · 大桥下的蜗牛](https://blog.lab99.org/post/docker-2016-07-14-faq.html#ru-he-xuan-ze-docker-shu-ji "Docker 问答录（95 问） · 大桥下的蜗牛")

**观察一下当前的 Docker 版本号，选择不要晚于 3 个版本的 Docker 书籍。**否则看到的很多东西可能将会因过时而无法使用，或者已经不必如此繁琐有更简单的方式去实现了。

> Docker的版本号规则发生了改变。以前是v1.12什么的，现在直接变成 v17.06，这里17表示2017年。

Docker中国 (Docker官网的中文镜像)  [Docker 文档 - Docker 中文文档](https://docs.docker-cn.com/ "Docker 文档 - Docker 中文文档")

最近官方推出了这个网站来帮助学习Docker，可以在线练习docker命令哦 ：[Play With Docker](https://www.google.com.hk/url?sa=t&rct=j&q=&esrc=s&source=web&cd=10&ved=0ahUKEwiQ7tzk1e7VAhVHT7wKHSFNADUQFghbMAk&url=%68%74%74%70%3a%2f%2f%70%6c%61%79%2d%77%69%74%68%2d%64%6f%63%6b%65%72%2e%63%6f%6d%2f&usg=AFQjCNEMuuAFK-sAUH3Wpyybe5UZHrhAWw "Play With Docker")



[Docker 入门教程 - 阮一峰的网络日志](http://www.ruanyifeng.com/blog/2018/02/docker-tutorial.html "Docker 入门教程 - 阮一峰的网络日志")   

[Docker (软件)](https://zh.wikipedia.org/zh-cn/Docker_\(%E8%BB%9F%E9%AB%94\))   
[Docker 教程](http://www.runoob.com/docker/docker-tutorial.html)   
[Docker —— 从入门到实践](https://www.gitbook.com/book/yeasy/docker_practice/details "GitBook")   看这里吧，这本书一直都有更新。 
[Docker 极客学院](http://wiki.jikexueyuan.com/list/docker/)   
[Docker入门教程（一）介绍](http://dockone.io/article/101)   

百度云上有一套  《实战 Docker到Kuberneter技术系列视频教程》

 [宋宝华：Docker 最初的2小时(Docker从入门到入门)](http://blog.csdn.net/21cnbao/article/details/56275456) 后面如果有时间，作者会再完成一个《Docker 相处的8小时》。   
[宋宝华- KVM最初的2小时（KVM从入门到入不了门）](http://blog.csdn.net/21cnbao/article/details/56654334)   



[从开发到部署会用到的 Docker 命令](http://mp.weixin.qq.com/s?timestamp=1508205792&src=3&ver=1&signature=LD5Gs4d3SbEX9*Uh66q0yP2osCg-gh0dU6RUupXH9eJLWdHfXXYy9oueR3dEh3SgbwiwgbNGzXs1u-aaCXOwI9vHdmA2FIm8RJnB0WOqvxjts42gdICVTgbpAUR1p7c5U76WHV-a8eVCT47T*eIQ-a1XXKrp7YALISDQVoRAclM= "从开发到部署会用到的 Docker 命令")

其它：  

[11个Docker的奇思妙用](https://mp.weixin.qq.com/s?__biz=MzA4MzQ1NjQ5Nw==&mid=207201323&idx=1&sn=7da24c12ac97e41c94237a0e323f7fe9&scene=21#wechat_redirect "11个Docker的奇思妙用")



> 看过《[Docker —— 从入门到实践](https://www.gitbook.com/book/yeasy/docker_practice/details "GitBook") 》
>
> 《第一本Docker书》相比之下这本书有不错的补充






## Docker介绍

> 第一课

使用 Docker 可以通过定制应用镜像来实现持续集成、持续交付、部署。开发人员可以通过
Dockerfile 来进行镜像构建，并结合 持续集成(Continuous Integration) 系统进行集成测试



Docker 包括三个基本概念：

- 镜像（Image ） 
- 容器（Container ） 
- 仓库（Repository ）    





### Windows Container和Linux Container(LXC)



[Windows Container 和 Docker：你需要知道的5件事 - CSDN博客](https://blog.csdn.net/gm48mg0m/article/details/55049491 "Windows Container 和 Docker：你需要知道的5件事 - CSDN博客")

[Install Docker for Windows | Docker Documentation](https://docs.docker.com/docker-for-windows/install/ "Install Docker for Windows | Docker Documentation")







在Ubuntu上安装LXC：

```
sudo apt-get install lxc
```







### Docker Image

> 《第一本Docker书》第4.1节：什么是Docker镜像？





### Docker Container

Docker Container 是共享内核的，Docker Container是Docker Image的运行实例。Docker Container里面可以运行不同OS的Image（这里OS相当于就是壳）

Docker Container 的IP地址只能在当前的主机上才可以ping通。



#### Docker Container的生命周期



Docker Container中运行的命令都是前台的。不管你是否是以后台方式启动的该命令，只要命令运行完成，Docker Container就会消亡。很多时候Docker Container作为临时使用。



容器的典型生命周期：

```
创建  -->  管理  --> 停止  --> 最终删除
```

 docker run 提供了容器的**创建**到启动的功能




###   Docker Registry



Docker Registry：分为公有和私有。

Docker Hub 属于公有的



### Docker核心组件的关系

> Docker Daemon 守护进程。对应的程序现在已经从 `docker daemon` 变为了 `dockerd`



首先在主机(Host)上安装一个Docker Deamon，它负责启动Docker Container(可以是多个)，它在启动容器的过程中会从Docker Hub中拉取image。

通过Docker Client操作Docker Deamon





## Docker 部署和配置

> 第2课



### 安装社区版 Docker CE 

对于使用 Docker 而言，使用最新版本非常重要。所以不要直接使用 yum 或 apt 安装 docker，我们需要先进行配置一下。

参考这里在Ubuntu 16.04上安装成功：[Docker CE 镜像源站-博客-云栖社区-阿里云](https://yq.aliyun.com/articles/110806 "Docker CE 镜像源站-博客-云栖社区-阿里云") ，安装成功。




> [fedora安装 Get Docker CE for Fedora - Docker Documentation](https://docs.docker.com/engine/installation/linux/docker-ce/fedora/ "Get Docker CE for Fedora - Docker Documentation" ) 可直接参考**官方文档**，但是官网下载速度慢。
>
>  [清华大学开源软件镜像站 - Tsinghua Open Source Mirror](https://mirrors.tuna.tsinghua.edu.cn/help/docker-ce/ "清华大学开源软件镜像站 - Tsinghua Open Source Mirror") （这里选择：对于 amd64 架构的计算机，添加软件仓库）。
>
> [Centos7上安装docker-ce社区版 - 瀚海星空 - 周海汉博客](http://abloz.com/tech/2017/06/06/centos7-docker-installation/ "Centos7上安装docker-ce社区版 - 瀚海星空 - 周海汉博客")



**设置开机启动Docker Deamon进程：**

```shell
# 开启 docker 服务
systemctl start docker.service
# 设置开机启动
systemctl enable docker.service
```



> CentOS 的 firewalld 会导致 Docker不能正常运行，需要将其关闭 `systemctl disable firewalld`（未验证）。
>
> 并且需要安装 iptables：因为Docker(1.8)会做一些端口映射
>
> ```shell
> yum -y install iptables-services
> systemctl enable iptables
> systemctl start iptables
> ```



安装并启动docker之后，必须是root用户或者是docker组中的用户才能运行命令。

比如尝试运行 `docker info`：

```shell
$ docker info
Cannot connect to the Docker daemon. Is the docker daemon running on this host?
```

创建 docker 用户组：

```shell
$ sudo groupadd docker
```

将当前用户添加到docker用户组：

```shell
$ sudo usermod -aG docker $USER
```

然后重启系统以生效：直接**注销**即可

```shell
$ sudo shutdown -r now
```





**推荐的storage driver：**

Docker 官方推荐使用 `overlay2` storage driver，Docker EE和Docker CE都建议使用storage driver。

在 `/etc/docker/daemon.json`文件中 配置Docker使用`overlay2` storage driver，见 [Use the OverlayFS storage driver](https://docs.docker.com/storage/storagedriver/overlayfs-driver/ "Use the OverlayFS storage driver | Docker Documentation")



> 不推荐使用 `overlay` storage driver。
>
> 此外，Docker不建议任何需要您禁用操作系统安全功能的配置，例如，如果您在CentOS上使用overlay或overlay2驱动程序，则需要禁用selinux。
>
> ```shell
> $ docker info
> 
> Containers: 0
> Images: 0
> Storage Driver: overlay2 # 查看当前
>  Backing Filesystem: extfs # 没搞懂
> ```







### Windows中安装Docker



> 安装 Docker for Windows：
>
> 只有windows 10 内置了Hyper V 虚拟环境，所以只有win10才能安装docker for windows。
>
> 下载安装包安装即可，首次运行会出现下面的提示：“Hyper-V and Containers features are not enabled. Do you want to enable them for Docker to be able to work properly?
> Your computer will restart automatically. Note: VirtualBox will no longer work.（VirtualBox将不能运行）” 开启Hyper-V将不能使用Vbox虚拟机，这个让人感到苦恼，这里有人提供了命令来开启和关闭Hyper-V功能 [virtualbox - Simple instructions needed for enabling and disabling Hyper V Docker - Stack Overflow](https://stackoverflow.com/questions/47081205/simple-instructions-needed-for-enabling-and-disabling-hyper-v-docker "virtualbox - Simple instructions needed for enabling and disabling Hyper V Docker - Stack Overflow")。
>
> You can do below to disable
>
> ```
> dism.exe /Online /Disable-Feature:Microsoft-Hyper-V
> bcdedit /set hypervisorlaunchtype off
> ```
>
> and below to enable
>
> ```
> dism.exe /Online /Enable-Feature:Microsoft-Hyper-V /All
> bcdedit /set hypervisorlaunchtype auto 
> ```
>
> From PowerShell
>
> To Disable
>
> ```
> Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All
> ```
>
> To Enable
>
> ```
> Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V –All
> ```
> Windows中的相关问题可以参考一下Docker的文档： [Logs and troubleshooting | Docker Documentation](/docker-for-windows/troubleshoot/ "Logs and troubleshooting | Docker Documentation")
>
> [Windows 10 上的 Hyper-V 简介 | Microsoft Docs](https://docs.microsoft.com/zh-cn/virtualization/hyper-v-on-windows/about/ "Windows 10 上的 Hyper-V 简介 | Microsoft Docs")
>
> [在 Windows 10 上启用 Hyper-V | Microsoft Docs](https://docs.microsoft.com/zh-cn/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v "在 Windows 10 上启用 Hyper-V | Microsoft Docs")





> 看到这样一句话： 默认情况下Boot2Docker需要安装Virtualbox，而不支持Hype-V，这很麻烦，还得我们修改BCD引导文件，因为Hyper-V和Virtualbox不兼容。 



**后期遇到的问题：**使用`-v`挂载本机目录到容器中时没有任何效果，容器启动时也没有报错。主机中保存了数据库文件，开启mysql容器后却不能挂载这些，之前是可以的；后来查看某博文说自己更改了windows的密码，需要重新认证；才想起前段时间，自己将windows的本地账户转换为了在线账户，可能是这个问题。

解决步骤：

`Docker Setting > Shared Drives > Reset credentials... ` 然后在弹出的对话框中输入你的在线账户的密码（也就是你电子邮箱的密码）。

坑了我好久。



[win10 docker 使用run -v 时，虚拟机无法显示宿主机挂载的目录 - CSDN博客](https://blog.csdn.net/ap10062kai/article/details/79232582 "win10 docker 使用run -v 时，虚拟机无法显示宿主机挂载的目录 - CSDN博客")





### 配置加速器



由于某些原因，在国内访问这些服务可能会比较慢。国内的一些云服务商提供了针对 Docker Hub 的镜像服务（Registry Mirror），这些镜像服务被称为**加速器**。常见的有 [阿里云加速器](https://cr.console.aliyun.com/#/accelerator)、[DaoCloud 加速器](https://www.daocloud.io/mirror#accelerator-doc)、[灵雀云加速器](http://docs.alauda.cn/feature/accelerator.html)等。使用加速器会直接从国内的地址下载 Docker Hub 的镜像，比直接从官方网站下载速度会提高很多。在后面的章节中会有进一步如何配置加速器的讲解。

国内也有一些云服务商提供类似于 Docker Hub 的公开服务。比如 [时速云镜像仓库](https://hub.tenxcloud.com/)、[网易云镜像服务](https://c.163.com/hub#/m/library/)、[DaoCloud 镜像市场](https://hub.daocloud.io/)、[阿里云镜像库](https://cr.console.aliyun.com/)等。

[阿里云加速器](https://cr.console.aliyun.com/#/accelerator "阿里云加速器") 点击此链接登录阿里云，然后可能会弹出对话框让你设置docker镜像的独立密码（这里的密码与你的专属链接没有关系），设置完成点击"Docker Hub镜像站点" 会看到属于你的**专属链接**，并附有操作说明（**注意**：不要参考此处的操作说明，它既有可能是配置老版本的docker的方法，会造成之后的配置出错）。



[给Docker配置官方国内加速镜像 - 运维之美](http://www.10tiao.com/html/357/201706/2247485374/1.html "给Docker配置官方国内加速镜像 - 运维之美 ")

[Docker 加速器 - DCS 文档 (DaoCloud加速器)](http://guide.daocloud.io/dcs/docker-9153151.html "Docker 加速器 - DCS 文档")

[Docker 镜像加速器-博客-云栖社区-阿里云](https://yq.aliyun.com/articles/29941 "Docker 镜像加速器-博客-云栖社区-阿里云")

[Ubuntu16.04安装Docker及配置镜像加速器](http://www.itfanr.cc/2017/01/14/ubuntu-install-docker-and-configure-mirror-accelerator/ "Ubuntu16.04安装Docker及配置镜像加速器")

[Docker 问答录（95 问） · 大桥下的蜗牛](https://blog.lab99.org/post/docker-2016-07-14-faq.html "Docker 问答录（95 问） · 大桥下的蜗牛")   配置加速器还是这里说的清楚。

[个人维护的 Docker 加速仓库 — 漠然](https://mritd.me/2017/03/21/private-maintenance-docker-mirror-registry/ "个人维护的 Docker 加速仓库 — 漠然")



**成功的配置方法：**

```shell
# 查看版本 
[fan 23:19:05]~$ sudo docker -v
Docker version 17.06.1-ce, build 874a737

# 先设置开机启动
[fan 23:19:05]~$ sudo systemctl enable docker

# 编辑 docker.service 文件来配置
[fan 08:10:11]~$ sudo vim /etc/systemd/system/multi-user.target.wants/docker.service 
# 修改 ExecStart=  这一行，改为
# ExecStart=/usr/bin/dockerd --registry-mirror=加速器地址

# restart
[fan 08:12:19]~$ sudo systemctl daemon-reload 
[fan 08:12:46]~$ sudo systemctl restart docker

# 查看是否配置成功（是否出现：--registry-mirror=加速地址）
[fan 08:13:05]~$ sudo ps -ef | grep dockerd
root      7070     1  1 08:13 ?        00:00:00 /usr/bin/dockerd --registry-mirror=https://bura38ov.mirror.aliyuncs.com
fan       7189  5333  0 08:13 pts/1    00:00:00 grep --color=auto dockerd
```

再运行下面的命令试一下：

```shell
$ docker run hello-world
```





错误1：命令写错

```shell
# 单词拼写错误 将 daemon 拼写为 deamon
[fan 22:42:32]~$ sudo systemctl deamon-reload
Unknown operation deamon-reload.
[fan 22:46:07]~$ sudo systemctl restart docker
Warning: docker.service changed on disk. Run 'systemctl daemon-reload' to reload units.
# 正确单词  daemon-reload
[fan 22:48:28]~$ sudo systemctl daemon-reload
```

错误2: 配置加速器时一定要按照相应版本来配置

查看版本：

```shell
[fan 23:19:05]~$ sudo docker -v
Docker version 17.06.1-ce, build 874a737
```

开始我尝试了阿里提供的方法(修改daemon.json文件)，**没有用**。然后我又尝试了另一种方法(修改docker.service文件)，结果出现了下面的错误：

```shell
[fan 22:57:33]~$ sudo vim /etc/systemd/system/multi-user.target.wants/docker.service
[fan 22:57:33]~$ sudo systemctl daemon-reload
[fan 22:57:45]~$ sudo systemctl restart docker
Job for docker.service failed because the control process exited with error code. See "systemctl status docker.service" and "journalctl -xe" for details.
[fan 22:57:52]~$ sudo systemctl status docker.service 
● docker.service - Docker Application Container Engine
   Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor preset: enabled)
   Active: inactive (dead) (Result: exit-code) since 三 2017-08-23 22:57:53 CST; 18s ago
     Docs: https://docs.docker.com
  Process: 17860 ExecStart=/usr/bin/dockerd --registry-mirrors=https://jxus37ad.mirror.aliyuncs.com (code=exited, status=1/FAILURE)
 Main PID: 17860 (code=exited, status=1/FAILURE)
```

出现错误的原因是**必须先删除之前创建的 daemon.json 文件**。

**还有个坑人的地方**是，docker.service文件也需要根据版本来配置。原则就是："Docker 1.12 之前的版本，`dockerd` 应该换为 `docker daemon`，更早的版本则是 `docker -d`"。（之前看到网上有些教程附带有 `-d -H`参数什么的也跟着乱配）。



> 这里 `https://jxus37ad.mirror.aliyuncs.com` 如何与用户对应？
>
> 我的本地电脑用户名称与阿里云帐号的用户名称。这里并不需要对应。






```shell
[root@centos7 ~]# ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN 
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP qlen 1000
    link/ether 08:00:27:01:d1:2f brd ff:ff:ff:ff:ff:ff
    inet 10.0.2.15/24 brd 10.0.2.255 scope global dynamic enp0s3
       valid_lft 84785sec preferred_lft 84785sec
    inet6 fe80::a00:27ff:fe01:d12f/64 scope link 
       valid_lft forever preferred_lft forever
3: virbr0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN 
    link/ether 00:00:00:00:00:00 brd ff:ff:ff:ff:ff:ff
    inet 192.168.122.1/24 brd 192.168.122.255 scope global virbr0
       valid_lft forever preferred_lft forever
4: virbr0-nic: <BROADCAST,MULTICAST> mtu 1500 qdisc pfifo_fast state DOWN qlen 500
    link/ether 52:54:00:62:8b:46 brd ff:ff:ff:ff:ff:ff
5: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN 
    link/ether 02:42:d0:8f:2d:00 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 scope global docker0
       valid_lft forever preferred_lft forever
```

看第20行：docker会创建一个 `docker0`的网桥，并分配了私有网段 `172.17.0.1/16`,docker中的所有容器将会在此网段上分配一个可用的ip地址；该地址是私有地址只能在本机访问。



**Docker配置文件与日志：**

配置文件： `/etc/sysconfig/docker`

docker服务的配置文件： `/usr/lib/systemd/system/docker.service`

日志文件：`/var/log/message`，查找： `tail -f /var/log/message | grep docker`





### 更改Docker的相关路径

docker for **windows** 安装时默认不能修改路径，所以全部安装在c盘（这让人很火）。



**Disk image location：**

`seting -> Advanced -> Disk image location`，然后更改目录即可，其包含的 vhdx 文件会自动迁移。



> 在我的系统默认是：`C:\Users\Public\Documents\Hyper-V\Virtual Hard Disks\MobyLinuxVM.vhdx`（这应该是与我将Docker安装成所以用户可用有关）



> 这里分为linux容器和windows容器： (这里是个人理解，似乎有误)
>
> linux 容器下Docker 容器安装在 MobyLinuxVM.vhdx 内，只要更改VHD 路径即可会自动移动VHD
>
> Windows 容器docker的安装路径默认在`C:\ProgramData\Docker`





> windows上安装的docker其实本质上还是借助与windows平台的hyper-v技术来创建一个linux虚拟机，你执行的所有命令其实都是在这个虚拟机里执行的，所以所有pull到本地的image都会在虚拟机的Virtual hard disks目录的文件中，这个文件就是虚拟硬盘文件。 
>
> [docker for windows pull镜像文件的安装位置改变方法 - CSDN博客](https://blog.csdn.net/stemq/article/details/53150939 "docker for windows pull镜像文件的安装位置改变方法 - CSDN博客")
>
> [window7 修改docker安装的machine 位置 - CSDN博客](https://blog.csdn.net/u011248395/article/details/70994088 "window7 修改docker安装的machine 位置 - CSDN博客")





**Docker运行根目录：** (似乎不需要更改)

Ｄocker 后台进程参数：

更改docker运行根目录的参数：`-g, --graph="/var/lib/docker"`  ：设置Docker运行时根目录

或者可以在deamon.json配置文件中修改：

```json
{
    "graph":"/app/docker"
}
```

在Windows中通过 `setting -> Daemon -> 切换“Basic"按钮 -> `然后就可以配置该文件



> 在cmd中运行 `docker info`命令，会看到 ”Docker Root Dir: /var/lib/docker“



> 在Windows中 `C:\Users\youname\.docker`目录下可以看到 `config.json`，`deamon.json`两个文件





### Docker for Windows 设置 Shared Drives目录

Shared Drives的作用，"Select the local drives you want to be available to your containers."，类似于为虚拟机添加共享文件夹（比如怎样才能让虚拟机中的系统访问主机中的文件）。



Dockers version 18.03.1-ce已经可以正确处理权限问题，设置shared drives目录时会跳出一个对话框让你输入管理员密码就行。



> [win10系统，docker设置共享文件夹](https://newsn.net/say/docker-share-folder.html "win10系统，docker设置共享文件夹")
>
> [在windows10上使用docker哪些坑 - 程序人生 - SegmentFault 思否](https://segmentfault.com/a/1190000006799421 "在windows10上使用docker哪些坑 - 程序人生 - SegmentFault 思否")





## Docker基础命令

Docker运行容器前需要本地存在对应的镜像,如果镜像不存在本地,Docker	会从
镜像仓库下载(默认是 Docker Hub 公共注册服务器中的仓库)。



### docker help

查看一下简单帮助信息和**可用命令**



[Docker命令详解  - 博客园](https://www.cnblogs.com/ivictor/archive/2015/09/08/4791274.html "Docker命令详解 - iVictor - 博客园")



### docker info

查看docker的系统信息





### docker search 

搜索镜像

`docker search java`  : 查找一个Java镜像。







### docker pull 

拉取镜像到本地

完整格式：

```shell
docker pull	[选项][Docker Registry地址]<仓库名>:<标签>
```



> Dockers Registry（Docker镜像仓库地址）完整格式： `<域名/IP>[:端口号]` ；默认值（省略时使用默认值）：默认为 hub.docker.com  
>
> 仓库名，完整格式：`<用户名>/<软件名>`；默认值，如果省略用户名则默认为 `labrary`，它表示官方版本
>
> 标签： 如果省略则表示下载最新版，即 `latest`版



```shell
#  会拉取默认版本（表示从Docker Hub网站下载官方的最新版java）
docker  pull java
```



```shell
docker pull ubuntu
```



> 官方版本的理解：官方版本指的是该容器由Docker公司提供。也就是说那么对于 ubuntu 这个镜像它并不是由 ubuntu 公司提供，而是由 Docker公司提供。





### docker image



列出本地已经下载的镜像：

```
docker image ls [关键字]
```



删除本地镜像：

```
docker image rm [选项] <镜像1id> [<镜像2id ...]
```



> 建议通过镜像的 id 或摘要来删除一个镜像，因为它们是一个镜像的唯一标识





### docker run *

```
docker run -it -rm  java ps 
```



该命令解释：(相关步骤)

1. Docker会检查本地是否存在java镜像，如果没有就会去默认仓库中查看是否有此镜像，如果找到就下载该镜像到本地。
2. 随后，Docker在文件系统内部用该镜像创建一个新容器。该容器拥有自己的网络、IP地址，以及一个用来和宿主主机进行通信的桥接网络接口。
3. 最后我们告诉Docker在新容器中要运行的命令 ，这里是 `ps`。
4. 当 ps 命令运行结束，容器也就停止了运行



```shell
docker run -it --rm java java -version 

# 还可在java镜像中运行 ps 命令，这意味着java镜像也是一个Linux容器
docker run -it --rm  java ps  

docker run -it --rm java uname  
# 查看该容器的 ip
docker run -it --rm java ip addr
# 查看该容器的环境变量
docker run -it --rm java env 
```

注意：`docker run 。。。`里面的命令结束了，container就结束了。

对于临时性的容器我们可以使用 `docker run --rm `运行完成就删除



> 因为Docker的容器实在太轻量级了，很多使用用户都是随时删除和新建容器



> - `-it` ：其中 `-i`表示交互式操作（让容器的标准输入保持打开），`-t` 表示终端；（交互式终端）
> - `--rm`：表示容器退出后就将其删除，默认情况下，为了排障需求，退出的容 器并不会立即删除，除非手动 docker rm 。我们这里只是随便执行个命令，看看结果， 不需要排障和保留结果，因此使用 `--rm` 可以避免浪费空间。    
>
> 参数的位置：这里对于第一条执行 ps 的命令中参数 `-it`  (-rm也一样) 位置不能随便放，如果放在 ps 的后面，它会认为该参数是传递给 ps 命令的。当使用 `docker ps -a`查看时可以看到在 COMMAND 列中（表示容器最后运行的命令）对应的是 `ps -it`



当容器中指定的应用终结时，容器也自动终止。







#### 后台运行容器

在原有运行命令的基础上使用 `-d`参数 （detached 分离）即可

```shell
$ docker run -d 
```

`-d` 参数启动后会返回一个唯一的 id    





> 有三种方式可以指定唯一容器：
>
> - 短 UUID
> - 长 UUID
> - 容器名称，（在创建容器时如果没有指定名称则将会获得一个自动生成的名称，可以使用 `--name`来为容器命名）





#### 停止后台运行的容器

```
docker stop <容器>
```



#### 指定端口

·`-p`选项

指定特定端口， 随机端口，所有端口



#### 挂载数据卷

`-v`选项

挂载目录

可以挂载文件，但是不可以改变文件inode (改变后容器内外就不再是同一文件了) ；也就是说能够更改此文件的内容，但是不能从别处复制一个同名文件过来进行覆盖。





#### 自启动容器

 在使用`docker run`启动容器时，使用`--restart`参数来设置：



| --restart的参数值 | 描述                                                         |
| ----------------- | ------------------------------------------------------------ |
| `no`              | 容器退出后，不自动重启容器（默认值）                         |
| `on-failure`      | 如果容器由于错误（非0）而退出，则将其重新启动；非0退出代码表示错误 |
| `unless-stopped`  | 重启容器；（排除两种情况）除非明确停止**容器**或者**Docker**被停止或重新启动 |
| `always`          | 只要容器停止了，就重新启动                                   |



还可以在使用`on-failure`策略时，可以指定Docker将尝试重新启动容器的最大次数。默认情况下，Docker将尝试永远重新启动容器。

```
sudo docker run --restart=on-failure:10 redis
```





重启策略注意点：

- 重启策略只在容器启动成功后才生效。这种情况下，成功启动的意思是容器运行 10 秒以上，并且 Docker 已经开始监控它。这可以防止根本不启动的容器进入重启循环。
- 如果你手动停止一个容器，它的重启策略会被忽略，直到 Docker 守护进程重启或容器手动重启。这是防止重启循环的另一个尝试。
- 重启策略只作用于容器。swarm 服务的重启策略配置方式不同。





如果在最初运行容器时没有使用`--restart`选项，那么可以通过`update`命令进行更新：

```
docker update --restart=always <container>
```

取消自动重启：

```
docker update --restart=no <container>
```



> [Docker 生产环境之配置容器 - 自动启动容器 - CSDN博客](https://blog.csdn.net/kikajack/article/details/79521306 "Docker 生产环境之配置容器 - 自动启动容器 - CSDN博客")
>
> [开机自启docker后 开启或关闭自启容器 | Maple's Blog](https://www.cqmaple.com/201801/when-system-startup-docker-restart-container.html "开机自启docker后 开启或关闭自启容器 | Maple's Blog")
>





#### Docker容器互连



**方法一：**使用`--link`，创建两个容器的别名，它需要两个参数：

- 一个时要连接的容器名字
- 另一个是连接后容器的别名



示例1：

```shell
$ docker run -d --name db mysql
$ docker run -d --name web --link db:webdb httpd
```

通过`--link`参数连接到容器db，并为其设置别名webdb。然后在httpd容器中就可以直接使用**db或webdb**作为连接地址来和mysql通信了 。 不要再使用 localhost  了。



示例2：

```
docker run --name some-redis -d redis
```

其它 app 使用 redis

```shell
docker run --name some-app --link some-redis:redis -d application-that-uses-redis
```

redis-cli 连接 redis

```shell
# 这里 -h -p 选项是传递给 redis-cli 用的，并非给 docker run 使用
docker run -it --link some-redis:redis --rm redis redis-cli -h redis -p 6379
```







**方法二：** **建议**将容器加入自定义的Docker网络来连接多个容器，而不是使用 `--link`

**方法三**：如果你有多个容器之间需要互相连接，推荐使用 Docker Compose



> [Docker学习总结之跨主机进行link - vikings`s blog - 博客园](https://www.cnblogs.com/vikings-blog/p/4223462.html "Docker学习总结之跨主机进行link - vikings`s blog - 博客园")





### docker exec

可以通过docker exec命令在容器内部**额外启动新进程**。

作用：当需要操作进入后台的容器时 ，可以使用此命令

可以在容器内运行的进程有两种类型：

- 后台任务
- 交互式任务

示例：

```shell
docker exec -t -i deamon_dave /bin/bash
```

这里的 `-t`和`-i`标志为我们执行的进程创建了 TTY 并捕捉 STDIN。



**注意：**如果从这个stdin中 exit，容器不会停止运行（因为它是新开一个进程）。

这也是`docker exec` 和 `docker attach` 的区别。

所以推荐使用 `docker exec`。



### docker attach *

使用该命令**重新**附着到某容器的会话上。

作用：当需要操作进入后台的容器时 ，可以使用此命令

使用场景示例：

```shell
$ docker run -dit ubuntu
243c....
$ docker container ls
...
$ docker attach 243c
```

**注意：**如果从这个stdin中 exit，会导致容器的停止。









### docker ps

docker ps  ： 查看正在运行的容器

docker pa -a ：查看运行过的所有的容器




### docker logs *

示例：

```
docker logs -f -t --since="2017-05-31" --tail=10  the_container
```



- `--since` : 此参数指定了输出日志开始日期，即只输出指定日期之后的日志。
- `-f` : 查看实时日志
- `-t` : 查看日志产生的日期
- `--tail=10` : 查看最后的10条日志。
- `the_container` : 容器名称





跟踪某个容器的最新日志而不必读取整个日志文件：

```shell
$ docker logs --tail 0 -f the_container
```

使用 `-t`为每条日志加上时间戳：

```shell
$ docker logs -ft the_container
```



使用 `Ctrl + C` 退出日志跟踪





> 推荐： [Docker容器的调试技巧：docker logs 与 docker service logs - CSDN博客](https://blog.csdn.net/u013272009/article/details/79148562 "Docker容器的调试技巧：docker logs 与 docker service logs - CSDN博客")
>
> [Docker学习笔记（五）之attach与logs命令 - CSDN博客](https://blog.csdn.net/u013246898/article/details/52986886 "Docker学习笔记(五)之attach与logs命令 - CSDN博客")
>
> [docker log - 简书](https://www.jianshu.com/p/c12622a9f4c1 "docker log - 简书")

> 如果安装了 portainer ，也可直接在 portainer中查看





补充知识：

容器中不建议更改配置文件，所以最常用的就是通过环境变量与其进行的信息传输。

但是对于用户密码等并合适通过明文的环境变量进行传递，它又提供了某种机制来保证安全。



### docker top

查看容器内部运行的进程

```shell
$ docker top the_container
```










### docker container 相关*



`docker run`见上文。



```shell
$ docker container ls

# 要获取容器的输出信息
$ docker container logs [container ID or NAMES]

#  终止一个运行中的容器
$ docker container stop

# 终止状态的容器可以用 下面 命令看到
$ docker container ls -a

# 处于终止状态的容器，可以通过 docker container start 命令来重新启动。
$ docker container start

# 进入在后台运行的容器 docker exec
$ docker exec -it 容器(或id) bash
# 如果从这个 stdin 中 exit，不会导致容器的停止。这就是为什么推荐大家使用 docker exec 的原因。
# docker exec --help

# 删除一个处于终止状态的容器
$ docker container rm 
# 或使用 
$ docker rm 

# 清理所有处于终止状态的容器
$ docker container prune

# 导出本地某个容器
$ docker export

# 从容器快照文件中再导入为镜像
$ docker import
```



#### docker 容器退出方式

可以通过 `docker container start` 命令来重新启动处于终止状态的容器：这里docker容器重启的时候，会沿用 `docker run`命令时指定的参数来运行。

比如，我们这样启动了 ubuntu 容器：

```
docker run -it ubuntu bash
```

退出该容器后，使用``docker container start``  启动时依旧会运行一个交互式的会话 shell 。这里容器主要就是运行容器中的 shell，所以如果退出该shell，容器也会随之停止运行。



**上面容器的几种退出方式：**

- 先按 `ctrl + p`，再按 `ctrl + q`   （我好像明白了，该快捷键应该对应Linux中使进程转换到后台的快捷键。实际操作时结果终端被锁了）
- 使用 `exit` 或者 `ctrl + d`





*方法*一: 如果要正常*退出*不关闭容器,请按Ctrl+P+Q进行*退出*容器

*方法*二: 如果使用 exit *退出* ，那么在*退出*之后会关闭容器，可以使用下面的流程进行恢复使用`docke `





### docker inspect

该命令会对容器进行详细的检查，然后返回其配置信息。



> 除了查看容器，还可以通过 `/var/lib/docker`目录来深入了解Docker的工作原理.



### docker update

为 容器更新 (部分)配置

- cpu 相关配置
- mems 内存相关配置
- `--restart`













### docker cp *

```
Usage:  docker cp [OPTIONS] CONTAINER:SRC_PATH DEST_PATH|-
        docker cp [OPTIONS] SRC_PATH|- CONTAINER:DEST_PATH
```



容器 -> 主机

主机 -> 容器



用于容器与主机之间的数据拷贝 。选项：

- -L ， --follow-link : 保持源目标中的链接 





示例：容器 mysql中`/usr/local/bin/`中存在docker-entrypoint.sh文件，可如下方式copy到宿主机

```
docker cp mysql:/usr/local/bin/docker-entrypoint.sh  /root
```

修改完毕后，将该文件重新copy回容器

```
docker cp /root/docker-entrypoint.sh  mysql:/usr/local/bin/  
```








### docker volume *



创建数据卷：

```shell
$ docker volume create my-vol
```

查看所有数据卷：

```shell
$ docker volume ls
```

查看指定数据卷信息

```shell
$ docker volume inspect my-vol
```

删除某个数据卷：

```shell
$ docker volume rm my-vol
```

清除所有无主的数据卷：

```shell
$ docker volume prune
```

删除容器时同时删除它使用的数据卷

```shell
$ docker rm -v
```









### docker history

显示镜像制作的过程，相当于Dockfile。



### docker login

使用该命令登录到Docker Hub。

> 你先要在注册有 docker 网站的帐号，注册时如果看不到图片验证码则必须翻墙。






## Docker  Ubuntu




[Docker容器中运行Ubuntu系统_楚盟博客](https://www.5yun.org/14787.html "Docker容器中运行Ubuntu系统_楚盟博客")





在容器中安装程序时出现下面的问题：

```shell
root@31b393be04b1:/# apt-get install vi
Reading package lists... Done
Building dependency tree
Reading state information... Done
E: Unable to locate package vi
```

解决办法： 

需要先运行 `apt-get update` ，再安装程序。这个命令的作用是：同步 `/etc/apt/sources.list` 和 `/etc/apt/sources.list.d` 中列出的源的索引，这样才能获取到最新的软件包。 









## 自定义容器镜像



Dockerfile 使用基本的基于DSL语法的指令来构建一个Docker镜像。

每条指令必须为大写字母，且后面要跟随一个参数；指令会按照顺序执行。

每条指令都会创建一个新的镜像层并对镜像进行提交。Docker大概按照如下流程执行Dockerfil中的指令：

1. Docker从基础镜像运行一个容器
2. 执行一条指令，对容器做出修改
3. 执行类似`docker commit`的操作，提交一个新的镜像层
4. Docker再基于刚才提交的镜像运行一个新容器
5. 执行dockerfile中的下一条指令，直到所有指令都执行完毕。



从上面可以看出，如果某条指令失败了，你还是可以得到一个可以使用的容器，这对调试很有用，这样而我们可以在该容器中手动执行失败指令来调试。



> 使用`#` 注释某行



>  实际开发中，一个 image 文件往往通过继承另一个 image 文件，加上一些个性化设置而生成。举例来说，你可以在 Ubuntu 的 image 基础上，往里面加入 Apache 服务器，形成你的 image。 





### docker commit命令创建镜像

> 现在不推荐使用`docker commit`，建议使用Dockerfile



**`docker commit`语法格式：**

```shell
docker commit [选项] <容器ID或容器名> [<仓库名>[:<标签>]]
```

示例： 
```shell
docker commit -m="A new custom image" --author="fan" webserver nginx:v2
```





> 《第一本Docker书》
>
> 这里 `jamtur01` 是作者在Docker Hub上的仓库。下文有无需指定仓库的示例。
>
> ```shell
> #                镜像id   镜像仓库/镜像名
> sudo docker commit 4aab3ce jamtur01/apache2
> ```
>
> 提交的同时添加提交信息：
>
> ```shell
> # 使用m选项指定提交信息；使用--author指定作者信息； 同时为该镜像增加了一个webserver标签
> sudo docker commit -m="A new custom image" --author="James Turnbull" 4aab3ce jamtur01/apache2:webserver
> ```
>
> 可以使用完整标签`jamtur01/apache2:webserver`来指定这个镜像。
>
> 



### docker build命令和Dockerfile文件

> Dockerfile使用基本的基于DSL语法的指令来构建一个Docker镜像；之后使用`docker build`命令基于该Dockerfile中的指令构建一个新的镜像。



> 看到过下面的build命令：
>
> ```
> docker build --rm --tag sonatype/nexus oss/
> ```
>
> 还有
>
> ```
> docker build --rm=true --tag=sonatype/nexus .
> ```
>
> 好奇其 --rm 参数的具体作用是什么？



#### Dockerfile指令





注释：使用`#`进行注释

`FROM`指令：因该是第一条指令，该指令指定一个已经存在的镜像，有后续指令都将基于该镜像进行，这个镜像被称为基础镜像(base iamge)。

`MAINTAINER`指令：指定该镜像的作者以及电子邮件（有助于标识镜像）

`RUN`指令： 在当前镜像中运行指定的命令。每条`RUN`指令都会创建一个新的镜像层。

`EXPOSE`指令：指示容器建议向外公开的(多个)端口。



> 《docker 实战》中： 之前说过， Dockerfile 中每一个指令都会建立一层， RUN 也不例外。     我感觉不对呀。



> 《第一本Docker书》
>
> 示例：
>
> ```shell
> # 创建目录 用于放置 Dockerfile 文件
> mkdir static_web
> cd static_web
> touch Dockerfile
> ```
>
> 
>
> 一个Dockerfile示例
>
> ```dockerfile
> FROM ubuntu:18.04
> MAINTAINER Fan "fan@gmail.com"
> RUN apt-get -qq update
> RUN apt-get install -y nginx
> RUN echo 'Hi, I am in your container' > /usr/share/nginx/html/index.html
> EXPOSE 80
> ```
>
> 
>
> ```shell
> # 切换到存放dockerfile文件的目录中
> cd static_web
> # 使用 docker build 执行 dockerfile 中的指令
> sudo docker build -t="jammtur01/static_web" .
> # 也可以为镜像设置一个标签 v1 
> sudo docker build -t="jammtur01/static_web:v1" .
> ```
>
> 
>
> `-t`选项为新镜像设置了[仓库]和名称。本书中仓库为 jamtur01；在这里镜像名称为 static_web
>
> 



另一个示例：

```shell
docker build -t nginx:v3 .
```



#### 正确的Dockerfile写法

同一目的的相关命令可以通过 `&&`写在同一个`RUN`指令中，这样完成该功能对应只需创建一层镜像。



在撰写 Dockerfile 的时候， 要经常提醒自己， 这并不是在写 Shell 脚本， 而是在定义每 一层该如何构建    



#### 构建上下文

用于放置 Dockerfile 文件的目录，就是我们的构建环境；Docker称此环境为上下文或者构建上下文。Docker会在构建镜像时将构建上下文**和**该上下文中的文件和目录**上传到Docker守护进程**。这样Docker守护进程就能**直接访问**你想在镜像中存储的任何代码、文件或者其它数据。



比如在执行 `docker build`时会看到下面的输出：

```
Sending build context to Docker deamon

```



可以通过创建 `.dockerignore`文件来指定需要忽略的文件（作用类似 .gitignore文件），其匹配规则采用Go语言中的filepath。





**注意：**在《docker实战》中，作者特别说明了 `.` 是用于指定构建上下文所在位置，如果要明确指定Dockerfile所在位置，可以使用 `-f`来指定。可能的一种情况是docker更新后相关命令发生了变化，而《第一本docker书》比较旧了（上文内容）。

默认情况下，如果不额外指定 Dockerfile 的话，会使用上下文目录下的Dockerfile 。可以使用 `-f`选项指定`docker build`执行的文件及其位置。



`ENV`指令：在镜像中设置环境变量





#### 构建缓存

考虑场景：第一次我们执行了该Dockerfile，之后我们又更改了该Dockerfile，需要再次执行。由于Docker的构建缓存机制，当再次构建时，会从第一条变动的指令处开始，而非从头开始构建；这样可以节省大量时间。

但是像执行 `sudo apt update` 这类命令时，我们并不希望使用之前的APT的包缓存，这时可以为 `docker build` 添加 `--no-cache`选项来略过docker的缓存功能。



**基于构建缓存的Dockerfile模板：**

这里先不管模板的概念，先来理解。

```dockerfile
FROM ubuntu:18.04
MAINTAINER Fan "fan@gmail.com"
RUN apt-get -qq update
RUN apt-get install -y nginx
RUN echo 'Hi, I am in your container' > /usr/share/nginx/html/index.html
EXPOSE 80
```



`ENV`指令：在镜像中设置环境变量。 `REFRESHED_AT`环境变量，来表明该镜像模板最后的更新时间。 只需更新`REFRESHED_AT`的时间值



#### 容器中应用在前台和后台执行的问题

见`CMD`指令



Docker不是虚拟机，容器中的应用都应该以前台执行，容器内没有后台服务的概念。而不应像虚拟机一样使用类似`updtart` 、`systemd`这样的启动后台服务的命令

对于容器而言， 其启动程序就是容器应用进程， 容器就是为了主进程而存在的， 主进程退 出， 容器就失去了存在的意义， 从而退出， 其它辅助进程不是它需要关心的东西。    



推荐使用 exec格式:

```
exec 格式： CMD ["可执行文件", "参数1", "参数2"...]
```



在 shell 格式中，每次主进程都是 `sh` ，主进程一结束，容器也就退出了。



示例：

```
CMD ["./sbin/nginx","-g","daemon off;"]
```



- /sbin/nginx 这个没什么说的，就是正常启动nginx服务；
- `-g`： 设置配置文件外的全局指令，也就是启动nginx时设置了`daemon off`参数，默认参数是打开的on，是否以守护进程的方式运行nginx，守护进程是指脱离终端并且在后台运行的进程。这里设置为off，也就是不让它在后台运行。为什么我们启动nginx容器时不让它在后台运行呢，docker 容器默认会把容器内部第一个进程，也就是pid=1的程序作为docker容器是否正在运行的依据，如果docker 容器pid挂了，那么docker容器便会直接退出。





#### Dockefile不等同于shell脚本

`WORKDIR`和 `USER`指令：



错误示例：

```dockerfile
RUN cd /app
RUN echo "hello" > world.txt
```

> 避免方法之一：使用绝对路径



在 Shell 中， 连续两行是同一个进程执行环境， 因此前 一个命令修改的内存状态， 会直接影响后一个命令； 

而在 Dockerfile 中， 这两行 RUN 命令 的执行环境根本不同， 是两个完全不同的容器。 这就是对 Dockerfile 构建分层存储的概念 不了解所导致的错误。    

之前说过每一个 RUN 都是启动一个容器、 执行命令、 然后提交存储层文件变更。 第一层 RUN cd /app 的执行仅仅是当前进程的工作目录变更， 一个内存上的变化而已， 其结果不会造成任 何文件变更。 而到第二层的时候， 启动的是一个全新的容器， 跟第一层的容器更完全没关 系， 自然不可能继承前一层构建过程中的内存变化。    

因此如果需要改变以后各层的工作目录的位置， 那么应该使用 WORKDIR 指令。    











```
###### 想启动 nginx 服务并持续提供服务 #########
# shell思维：想在后台启动nginx守护进程
# shell 格式，（主进程为sh，sh执行完下面的命令后就退出了。结果：服务无法启动）
CMD service nginx start

# exec 格式 
# 直接让nginx作为主进程，并要求以前台形式运行
CMD ["nginx", "-g", "daemon off;"]
```







> 目前业界可选的Containger Registry主要有如下：
>
> - **Docker Hub** 提供了直观的界面、自动化构建、私有仓库以及众多官方镜像。这是官方的公有库，下载镜像必须联接外网。
> - **Docker Registry** 最流行的开源registry。你可以在自己的设施上运行或者使用Docker Hub。
> - **Quay.io** 最初由一个两人工作室开发的产品，专注于Docker私有库。目前已被Coreos收购。
> - **CoreOS Enterprise Registry Coreos**收购Quay.io之后推出的企业级Containger Registry，提供细化权限和审计跟踪。
> - **Nexus 3.0 nexus**原来只是一个maven的仓库服务器，升级到3.0之后，也可以使用它对docker的镜像进行管理。
> - **Harbor vmware**开源的企业级容器registry，基于开源的Docker Registry进行增强。









## Docker图形化管理和监控

> 第7课



> [容器与云|Dry：一个命令行交互式 Docker 容器管理器](https://linux.cn/article-9615-1.html "容器与云|Dry：一个命令行交互式 Docker 容器管理器")





### Portainer

轻量开源。

Portainer的安装方式主要有两种，一个是使用Docker安装，一个是二进制文件直接跑，我建议用Docker安装，比较方便点，也不用你自己去配置自启动啥的。 



参考  [Deployment — Portainer 1.18.1 documentation](https://portainer.readthedocs.io/en/stable/deployment.html "Deployment — Portainer 1.18.1 documentation") 的示例：

Example on Windows: 

```
docker run -d -p 9000:9000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v C:\ProgramData\Portainer:C:\data portainer/portainer
```



因为我的docker for windwos使用的linux容器，那么我的命令为：

```
docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v G:\Docker\portainer\data:/data portainer/portainer
```

这里先要为主机创建： `G:\Docker\portainer\data` 目录。

- `-v /var/run/docker.sock:/var/run/docker.sock `：把宿主机的Docker守护进程(Docker daemon)默认监听的Unix域套接字挂载到容器中； （上面是照搬Linux中使用的命令，**那么在Windows中该如何？**）


> 注意：上面的命令还没有明确为该容器指定一个name， 默认的name是 silly_heyrovsky。



运行该容器后，在浏览器中输入： <http://127.0.0.1:9000>

进入管理界面，必须添加用户： 这里为管理员用户： admin  设置的密码为: ···12345






> 在Windows中发现路径使用下面三种形式都可以：
>
> ```
> docker run -v G:\\Docker\\portainer\\data:/data 
> ```
>
> ```
> docker run -v G:\Docker\portainer\data:/data
> ```
>
> ```
> docker run  -v G:/Docker/portainer/data:/data
> ```
>
> 该命令还没试，我使用的是下面的命令，但是后续出现问题，稍等。
>
> 最开始我以为在Windows中不可以使用带 `-v /var/run/docker.sock:/var/run/docker.sock`  的run命令，然后再后面的操作中收到下面的错误提示：
>
> ```
> 大概就是提示必须使用： -v /var/run/docker.sock:/var/run/docker.sock  来运行容器
> ```
>
> 最后发现：  [Deployment — Portainer 1.18.1 documentation](https://portainer.readthedocs.io/en/stable/deployment.html "Deployment — Portainer 1.18.1 documentation") 好像似乎明白了，使用该选项是没有任何问题的。
>
> 


>  运维大神 [docker：轻量级图形页面管理之Portainer-DevOps(甘兵)-51CTO博客](http://blog.51cto.com/ganbing/2083051 "docker：轻量级图形页面管理之Portainer-DevOps(甘兵)-51CTO博客") 

> [Docker管理面板系列——Portainer(简单、美观、强大) | Senraの小窝](http://www.senra.me/docker-management-panel-series-portainer/ "Docker管理面板系列——Portainer(简单、美观、强大) | Senraの小窝")





### Rancher

重量级且部署较简单

[Rancher文档](https://rancher.com/docs/rancher/v1.6/zh/ "Rancher文档") 

[Docker管理面板系列——Rancher(能够对接各家公有云) | Senraの小窝](http://www.senra.me/docker-management-panel-series-rancher/ "Docker管理面板系列——Rancher(能够对接各家公有云) | Senraの小窝") 





## Docker 网络

```
docker help network
```



创建一个网络：

```
docker network create -d bridge my-net
```



-d 参数指定 Docker 网络类型， 有 bridge overlay 。 其中 overlay 网络类型用于 Swarm mode， 在本小节中你可以忽略它。    



运行一个容器并连接到新建的 my-net 网络 

```
$ docker run -it --rm --name busybox1 --network my-net busybox sh
```

 打开新的终端， 再运行一个容器并加入到 my-net 网络 

```
$ docker run -it --rm --name busybox2 --network my-net busybox sh   
```



 下面通过 ping 来证明 busybox1 容器和 busybox2 容器建立了互联关系。即可以通过容器的名称来进行通信。





## 学习资料

[Docker入门教程-慕课网](https://www.imooc.com/learn/867?mc_marking=40eb6678df9f85e7a854421cef4ba5e9&mc_channel=syb43 "Docker入门教程-慕课网")