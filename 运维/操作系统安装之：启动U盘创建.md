

## Windows中创建启动U盘



## 系统镜像下载
[在 Mac 上通过 Boot Camp 使用 Windows 10](https://support.apple.com/zh-cn/HT204990)
[从 Microsoft 下载 ISO 文件](https://www.microsoft.com/zh-cn/software-download/windows10ISO)

MSDN我告诉你





### Windows和Linux官方原版iso文件



#### rufus

只支持Windows和多数Linux的官方原版iso镜像文件。

对于**新版**Linux系统镜像，rufus无法做到立即同步，如果rufus提示需要而额外下载文件并且要求的版本号不一致时，建议在之后的选项（如果弹出该选项）中选择"..DD"模式而非推荐的“ISO..”模式，源于一次在写入最新版XUbuntu 18时使用 "ISO..."出现无法引导的情况。



#### UltraISO

功能强大

* 使用 UItraISO打开iso系统镜像文件
* 点击菜单“启动” -> “写入硬盘镜像”
* 在弹出的对话框中的 “硬盘驱动器”处选择你的U盘
* “写入方式”就选择 "USB-HDD+"好了
* 点击“写入”





### Fedora 的官方 iso文件

使用Fedora官方提供的软件进行制作，使用此工具制作的启动U盘**无法用于其它用途**，比如无法用来向里面写入其它文件。

其U盘分区类型如下：


| 设备        | 启动   | Start  | 末尾      | 扇区      | Size  | Id   | 类型                 |
| :-------- | :--- | :----- | :------ | :------ | :---- | :--- | :----------------- |
| /dev/sdb1 | *    | 0      | 3053567 | 3053568 | 1.5G  | 0    | 空                  |
| /dev/sdb2 |      | 104772 | 117775  | 13004   | 6.4M  | ef   | EFI (FAT-12/16/32) |
| /dev/sdb3 |      | 117776 | 145855  | 28080   | 13.7M | 0    | 空                  |

当将该U盘插入Windows系统时只能挂载 /dev/sdb2



### Mac OS 的dmg文件

使用 UItraISO 进行转换和制作启动U盘都失败。



### Linux iso文件



#### UNetbootin 

UNetbootin只可用于写入Linux iso文件，但是它可以在Windows、Linux、Mac上安装。





## Ubuntu中创建启动U盘



推荐： MultiSystem工具。dd命令



### UNetbootin

UNetbootin只可用于写入Linux iso文件，但是它可以在Windows、Linux、Mac上安装。



### MultiSystem

MultiSystem会要求插入FAT 32格式的U盘，并挂载至/media下。

可识别的文件系统类型为:

| 设备        | 启动   | Start | 末尾      | 扇区      | Size | Id   | 类型              |
| --------- | ---- | ----- | ------- | ------- | ---- | ---- | --------------- |
| /dev/sdb1 | *    | 2048  | 7710719 | 7708672 | 3.7G | c    | W95 FAT32 (LBA) |



注意使用： `sudo mkfs.vfat /dev/sdb`或者`sudo mkfs.fat /dev/sdb`格式化的文件系统类型MultiSystem并不能识别。可以使用fdisk进行转换。



[如何在Ubuntu上使用MultiSystem创建多启动USB盘-桌面应用-Linux.中国-开源社区](https://linux.cn/article-4701-1.html "如何在Ubuntu上使用MultiSystem创建多启动USB盘-桌面应用-Linux.中国-开源社区")





### dd命令



**1.查看U盘设备号：**这里U盘为 `/dev/sdb`

```shell
$ sudo fdisk -l

Disk /dev/sda: 465.8 GiB, 500107862016 bytes, 976773168 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Disklabel type: dos
Disk identifier: 0x69b53599


Disk /dev/sdb: 7.4 GiB, 7948206080 bytes, 15523840 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x0975cb23
```

或者使用下面的命令查看：

```shell
sudo parted -l
```


**2.卸载U盘：**（如果U盘被自动挂载)

```shell
sudo umount /dev/sdb*
```

**3.格式化U盘[可选步骤]**

再格式化U盘：格式化为 FAT格式(Windows也能识别)

```shell
sudo mkfs.vfat /dev/sdb –I
```

> 或许在格式化之前你还想先对U盘进行分区，这时可以先使用fdisk进行分区，之后再进行格式化。
>
> ```shell
> $ sudo fdisk /dev/sdb
> ...
> # 进行一系列分区操作
>
> # 卸载U盘
> $ sudo umount /dev/sdb*
> # 格式化某分区
> $ sudo mkfs.fat /dev/sdb1
> ```
>
> 

**4.制作启动U盘：**

```shell
sudo dd if=~/Ubuntu_15_10_64.iso of=/dev/sdb
```

if 表示 input file(输入文件)，if后面是输入的文件。

of 表示 output file(输出文件)，of后面是输出文件的位置。

经过一段时间(大约5~15分钟)的等待(dd没有任何输出提示)，即可将 iso 文件写入 U盘。



因为是使用dd命令直接将将iso文件数据写入U盘，所以U盘不包含一个标准的分区表，从而导致系统无法正常的识别其大小，也无法正常使用。

dd命令直接将Linux的iso写入U盘就能开机引导的原因是，这些Linux的iso自带了引导文件



> **让 dd 显示进度：**
>
> 使用pv命令行工具(Pipe Viewer管道查看器)，它可以检测Linux管道中数据流通的进度。
>
> 使用`sudo apt install pv`安装pv。用法：
>
> ```shell
> pv ~/Ubuntu_15_10_64.iso | sudo dd of=/dev/sdb
> ```
>
> dd 从管道左边读取输入文件，所以这里不用写 if








## Mac OS中创建启动U盘



UNetbootin只可用于写入Linux iso文件，但是它可以在Windows、Linux、Mac上安装。









## 参考

MultiSystem：

[如何在Ubuntu上使用MultiSystem创建多启动USB盘-桌面应用-Linux.中国-开源社区](https://linux.cn/article-4701-1.html "如何在Ubuntu上使用MultiSystem创建多启动USB盘-桌面应用-Linux.中国-开源社区")



dd命令：

[使用dd命令制作USB启动盘 – WTF Daily Blog](http://blog.topspeedsnail.com/archives/4042 "使用dd命令制作USB启动盘 – WTF Daily Blog")

[Linux系统下使用dd命令创建 Live USB - Linux大神博客](https://www.linuxdashen.com/linux%E7%B3%BB%E7%BB%9F%E4%B8%8B%E4%BD%BF%E7%94%A8dd%E5%91%BD%E4%BB%A4%E5%88%9B%E5%BB%BAlive-usb "Linux系统下使用dd命令创建 Live USB - Linux大神博客")

[Linux环境怎样制作u盘系统启动盘- QingSword.COM](https://www.qingsword.com/qing/85.html "Linux环境怎样制作u盘系统启动盘- QingSword.COM")



dmg：

[WIN系统下通过UltraISO把苹果的DMG制作成启动U盘_百度文库](https://wenku.baidu.com/view/a5ffe7cc8bd63186bcebbc41.html "WIN系统下通过UltraISO把苹果的DMG制作成启动U盘_百度文库")

