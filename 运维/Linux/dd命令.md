# dd命令

dd 的其他作用



使用 Linux中 的 dd 命令 创建启动U盘

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

