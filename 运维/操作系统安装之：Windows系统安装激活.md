# Windows系统安装激活

**操作系统购买：**

直接在微软官网购买Windows 10 家庭版需要1000多，而在其他地方购买家庭版398、专业版598，而且在**双十一期间还会有活动**比如蓝点网推荐过的软购。在淘宝或京东上也有卖。

他这个是绑定账户的，同时也绑定电脑主板，如果更换了电脑主板或者更换了电脑，则不支持再次激活。但是同台电脑是支持重装系统激活的。 





### Win PE

#### 微PE工具箱
[微PE工具箱](http://www.wepe.com.cn/)
免費，純淨。

- 第一家采用独立安装包将PE做成一键安装，进军软件行业的。
- 第一家能够将PE不做任何手动操作一键安装进U盘的。
- 第一家能够将PE一键安装进开机启动项的。
- 第一家能将不同安装方式集成在一起的。


#### CMDPE







3.激活
------------------------------



[http://www.win7u.com/jc/18499.html](http://www.win7u.com/jc/18499.html)

###3.1 用命令查看win10/win8.1等详细激活信息方法          

`Win + R` 输入：       
* `slmgr.vbs -dlv` 	    显示，最为详尽的激活信息，包括：激活ID、安装ID、激活截止日期。      
  * `slmgr.vbs -dli`	显示，操作系统版本、部分产品密钥、许可证状态。       
    * `slmgr.vbs -xpr`显示，是否永久激活。      


###3.2 判断激活密钥是否有效识别  

电话激活前请务必先测试KEY是否有效，省的浪费时间。如果确认密钥有效，那就请跳过此步骤   

- 方法1：按键盘Win + X 键，再按A键，输入 slmgr -ato 回车 将弹出的错误代码            
- 方法2：按下键盘 Wiin+ R，输入 Slui 3 然后确定，输入密钥，点击激活。







4.激活软件
---------------------------------------

[Windows Office Key 密钥获取器](http://www.135s.com/376.html)       

[HEU KMS Activator](http://www.heu8.com/)           



#### TechNet Library 

The TechNet Library contains technical documentation for IT professionals using Microsoft products, tools, and technologies.

[TechNet Library](https://technet.microsoft.com/en-us/library/aa991542.aspx)  获取知识的好地方        


TechNet [Volume Activation Planning Guide](https://technet.microsoft.com/library/dd878528.aspx)  此处包含很多信息。  

The Volume Activation Management Tool (VAMT)                
[Introduction to VAMT](https://technet.microsoft.com/library/hh825141.aspx "包含MAK and KMS的介绍") 另见此页的：See Also  

---



## BCD启动设置参数
BCD(Boot Configuration Data，启动设置参数)，可以通过修改BCD来更改启动时的操作系统文字；可以通过Bcdeidt.exe (BCD Editor)程序来更改这些文字说明。

```cmd
# bcdedit /v  # /v 进行查看
C:\Windows\system32>bcdedit /v

Windows 启动管理器
--------------------
标识符                  {9dea862c-5cdd-4e70-acc1-f32b344d4795}
device                  partition=\Device\HarddiskVolume1
description             Windows Boot Manager
locale                  zh-CN
inherit                 {7ea2e1ac-2e61-4728-aaa3-896d9d0a9f0e}
default                 {d6e772cd-c870-11e6-af92-c7428044c08f}
resumeobject            {d6e772cc-c870-11e6-af92-c7428044c08f}
displayorder            {d6e772cd-c870-11e6-af92-c7428044c08f}
                        {d6e772c7-c870-11e6-af92-c7428044c08f}
toolsdisplayorder       {b2721d73-1db4-4c62-bf78-c548a880142d}
timeout                 5

Windows 启动加载器
-------------------
标识符                  {d6e772cd-c870-11e6-af92-c7428044c08f}  # 识别码
device                  partition=C:
path                    \Windows\system32\winload.exe
description             Windows 10                              # 显示文字
locale                  zh-CN
inherit                 {6efb52bf-1766-41db-a6b3-0ee5eff72bd7}
recoverysequence        {d6e772ce-c870-11e6-af92-c7428044c08f}
recoveryenabled         Yes
allowedinmemorysettings 0x15000075
osdevice                partition=C:
systemroot              \Windows
resumeobject            {d6e772cc-c870-11e6-af92-c7428044c08f}
nx                      OptIn
bootmenupolicy          Standard

实模式启动扇区
---------------------
标识符                  {d6e772c7-c870-11e6-af92-c7428044c08f}
device                  partition=C:
path                    \NST\AutoNeoGrub0.mbr
description             Ubuntu 16
locale                  zh-CN
custom:250000c2         0

# 修改Windows 10的显示文字  /set 进行设置
C:\Windows\system32> bcdedit /set {d6e772cd-c870-11e6-af92-c7428044c08f} description "Win10 测试用"
```

对应的EasyBCD的显示
```
有一个2项已列入bootloader.

默认: Windows 10
超时: 5 秒
EasyBCD引导设备: C:\

条目 #1
名称: Windows 10
BCD ID: {current}
驱动器: C:\
Bootloader的路径: \Windows\system32\winload.exe

条目 #2
名称: Ubuntu 16
BCD ID: {d6e772c7-c870-11e6-af92-c7428044c08f}
驱动器: C:\
Bootloader的路径: \NST\AutoNeoGrub0.mbr
```

--------


2015.11.19 - 2015.11.23 系统装机总结
=============================================================

此篇笔记很多废话，不可发布到网上。 


1 系统安装前的备份
--------------------------------------

1. 当将电脑文件转移到移动硬盘时尽量将多个子文件打包能够大大提高复制速度(另可搜索移动硬盘注意事项)。    
2. 但当安装完系统后，将文件移到电脑硬盘，再进行解压时；我认为当时可以使用 UltraISO 这个软件将这些文件保存成 iso镜像文件，对于一些文件可能并不想再次转移到电脑上，当保存成 iso 镜像文件后，可以快速加载到虚拟光驱，还可随时增删文件。     
3. 当然文件备份最好的方法是使用系统备份功能，或使用备份软件(傲梅助手)。
4. Windows 10中： 使用系统备份： `控制面板 -> 备份和还原 `  可以通过 `更改设置` 来选择你要保存备份文件的位置（当备份到移动硬盘之后，每次插入移动硬盘，都不能够直接弹出，提示设备被占用）和要备份的文件。   
5. Ubuntu 14.4中： 可在 “系统设置” 中选择 “备份”；选定好备份文件的保存位置，要排除的文件夹；设置备份文件加密密码（还原时使用相同的密码，密码随意）。    两种系统备份应该都是增量备份吧？     


>由于自己是直接将自己认为要保存的文件，打包移到移动硬盘；而没有保存一些重要软件的用户数据，或 a user profile 造成了麻烦。   


要保存数据的程序列表（如果是采用系统备份或备份软件就不必了）：   


| 程序名             | 描述            |
| --------------- | ------------- |
| 小狼毫输入法          | 输入法           |
| SuperMemo UX    | 英语学习软件        |
| PotPlayer Skins | PotPlayer 的皮肤 |
| vim  .vimrc     | 保存 vim 配置文件   |








2.安装系统
------------------------------------------------------   


安装 Windows 10 时，删除了全部分区；然后在进行全新分区（裸机安装），但 Windows 10 不能选择分区类型，只能默认主分区，当有三个主分区后，
再是逻辑分区，且其默认会在开头建立一个500M的隐藏主分区用于保存系统引导文件。  

----------------------------


>设置隐藏分区的几种方法：  
>
> 1. 通过修改注册表。`Win + R` -> `regedit` ; 进入
>     `HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Polices\Explorer\` 
>     在左边空白处点击右键，选择`新建二进制值`，重命名为`NoDrives`；
>     双击该键值，输入`00 00 00 00`（不带空格，直接输入，此为系统默认值）。
>     现在介绍值的意义：  
>     第一组`00`设置 `A-H`盘，`01`隐藏A盘，`02`隐藏B盘，`04`隐藏C盘，`08`隐藏D盘，`10`隐藏E盘。（规律为乘以2）
>     第二组`00`设置`I-P`盘。  
>     以此类推 ...
>     按此方法修改后，只是在资源管理器中不显示，但可以通过输入路径访问。
>
> 2. 通过磁盘管理器：`Win + R` -> `diskmgmt.msc`,打开磁盘管理器
>    选中分区，右键`更改驱动器号和路径` -> `删除` 。
>    没有了驱动器号和路径，就无法访问该分区(系统隐藏的分区就是通过此法实现隐藏，可以通过给其添加驱动器号进行访问)


[隐藏分区可能带来如下麻烦](http://notebook.it168.com/a2010/1101/1120/000001120453_1.shtml "真实性有待考量")  

1. 不能使用GHOST版系统光盘来安装WIN7，仅能使用安装版的进行一步一步地安装。 

2. 安装完系统后，不能使用Wingho、OneKey Ghost等一键还原类的软件进行备份系统。 

3. Norton Partition Magic无法正常使用，如果你尝试修复这100MB分区，会导致已安装的WIN7无法引导。

4. 带100MB分区的WIN7激活很麻烦，总不成功。


[删除该隐藏分区的方法](http://notebook.it168.com/a2010/1101/1120/000001120453_2.shtml)：

以管理员身份运行`cmd` -> `bcdboot c:\windows /s c:`(将启动文件从 c:\windows 复制到 c:\) -> `在磁盘管理器中将 C:\ 分区设置为活动分区 ` -> `重启系统，就会发现可以删除隐藏分区`


TODO：“应该去查查什么是活动分区了”

-----------------------------------


开始时我的分区计划是 `主分区 + 逻辑分区 + 主分区 + 逻辑分区` （现在还不知道是否可以这样分） 


在这种认知下，分区无法达到我想要的结果。先分号Win C: 盘，再安装ubuntu，在ubuntu中的逻辑分区在Windows系统磁盘管理工具把它是主分区，而用DiskGenius也没法将未分配的200G空间分区。最后在选择放弃，打算先用通用PE将磁盘分区再安装系统时，发现 傲梅分区助手 竟然能正确识别并进行分区。

在第一次安装Ubuntu后，重启竟然跳过了grub2的选项，直接进入了Ubuntu，运行以下命令就可以解决：
`sudo update-grub2`进行更新grub2 。   

在Windows中安装了**EasyBCD** (一款系统引导相关的软件)，蛋疼 
**[记得将ISO文件放到磁盘根目录]**。


第N次安装Ubuntu时选择将启动项安装在/dev/sda8 的 /boot分区（如果用命令则是：sudo grub-install   /dev/sda8 ; 然后再**更新grub2**），重启直接进入Windows，用EasyBCD添加Ubuntu的启动项，但每次选择进入Ubuntu时，都要等待漫长时间；只好又选择将grub2安装到/sda (整个磁盘的最前面吧)，更新grub2。  

```
[fan 18:36:40]~$ sudo grub-install /dev/sda
[sudo] fan 的密码： 
Installing for i386-pc platform.
grub-install: warning: Sector 32 is already in use by the program `FlexNet'; avoiding it.  This software may cause boot or other problems in future.  Please ask its authors not to store data in the boot track.
grub-install: warning: Sector 33 is already in use by the program `FlexNet'; avoiding it.  This software may cause boot or other problems in future.  Please ask its authors not to store data in the boot track.
Installation finished. No error reported.
[fan 18:38:45]~$ sudo update-grub2 
Generating grub configuration file ...
Found linux image: /boot/vmlinuz-4.4.0-57-generic
Found initrd image: /boot/initrd.img-4.4.0-57-generic
Found linux image: /boot/vmlinuz-4.4.0-53-generic
Found initrd image: /boot/initrd.img-4.4.0-53-generic
Found linux image: /boot/vmlinuz-3.19.0-59-generic
Found initrd image: /boot/initrd.img-3.19.0-59-generic
Found linux image: /boot/vmlinuz-3.19.0-58-generic
Found initrd image: /boot/initrd.img-3.19.0-58-generic
Found linux image: /boot/vmlinuz-3.19.0-56-generic
Found initrd image: /boot/initrd.img-3.19.0-56-generic
Found linux image: /boot/vmlinuz-3.19.0-51-generic
Found initrd image: /boot/initrd.img-3.19.0-51-generic
Found memtest86+ image: /memtest86+.elf
Found memtest86+ image: /memtest86+.bin
Found Windows 10 (loader) on /dev/sda1
done
```


>参见：[安装使用grub2](http://www.cnblogs.com/hopeworld/archive/2009/09/25/1573897.html)


**不管是安装Windows 10 还是 Ubuntu 14.4 选择英文版安装都造成了不少麻烦；Windows 10中有文件编码问题、时间设置问题、输入法安装问题。原因是自己太菜。**




3.系统还原、软件重装
---------------------------------------------------------

### Ubuntu注意事项：

系统还原时需要输入**备份时输入的备份文件加密密码**（非用户密码）；
还原后如果新安装系统中用户密码与原用户密码不同，会要求输入原用户密码以解锁密钥环，**即需记住原用户密码**。   


安装 fictx 输入法时一定要注意，参考其它笔记。  

### Windows 中安装软件：



