# Win PE 和 Linux Live CD



## Win PE

- 微PE：干净，（好像有几年没维护，但应该不影响使用）
- [Hiren's BootCD PE](https://www.hirensbootcd.org/) (国外应该用的挺多)
- 下文介绍的 AIO 的 Windows AutoRun
- 相关文章《启动U盘创建》中介绍的 YUMI  的下拉列表中也包含了一些主流的 PE





## Linux Live CD

> [7 best Linux live CD distro for 7 different purpose - PCsuggest](https://www.pcsuggest.com/best-linux-live-distro/)
>
> [The Five Best Linux Live CDs - Linux.com](https://www.linux.com/tutorials/five-best-linux-live-cds/)

参考上面两篇文章和自己的考察，它们对功能支持的话就是看其包含的工具有哪些；不同的Live CD都包含很大一部分相同的工具，并且自己的需求是系统救援，最终选出下面几款：



- GParted Live CD：在Ubuntu中用过GParted，是一个分区管理工具，调整分区大小，复制和移动删除分区，支持各种文件系统。但是它不能像文件管理器那样查看和管理单个文件；但是在**CD中**还包含了其他工具图形界面工具有：lxterminal、pcmanfm图形文件管理器、leafpad文件编辑器、 netsurf浏览器；命令行工具有：Midnight Commander 一个基于文本的文件管理器 、vi、GRand Unified Bootloader，rsync同步工具、fsarchiver 、partimage等。（下面介绍的几个都包含单一的GParted）

-  **AIO**：[All in One – System Rescue Toolkit](https://paul.is-a-geek.org/aio-srt/) 系统救援工具包

  AIO包含了两个部分：

  - Live CD ：一种基于Ubuntu的CD，其中包含对技术人员和管理员最有用的工具。可用于Linux 和 Mac。
  - Windows AutoRun (AIO-SRT) ：包含许多用于修复和管理Windows的实用程序。

  安装方法：挂在光盘，打开Aio-SRT.exe，点击General 打开 Build AiO-SRT Flash Drive将其写入U盘。或者直接使用Rufus写入即可。

- **Rescatux：** Rescatux是基于Debian的特殊救援CD，主要用于破碎的系统救援 。 还原或更新GRUB引导加载程序，还原Windows MBR，引导收件选项，检查文件系统是否有缺陷等。  也提供一些有趣的选项，例如更改或清除linux密码，清除Windows密码，解锁Windows用户或使用户管理员等，**也提供了Gparted** 。官方说明： 与其他救援磁盘不同的地方是 Rescatux同时提供Rescapp， Rescapp是一个很好的向导，它将指导您完成救援任务。 [Rescatux & Super Grub2 Disk](https://www.supergrubdisk.org/)（官网有视频）这个**操作起来是最简单**的功能也比较多；

  它也包含了两个部分：

  - Rescatux
  - Super Grub2 Disk：大小只有20M
  
- **System Rescue CD:** 它基于Gentoo，与其他Live CD相比，它通常会使用新的内核和更新的工具进行更新（1-3个月）。 [SystemRescueCd ](http://www.system-rescue-cd.org/)的官方说明： SystemRescueCd是Linux系统应急磁盘，用于在崩溃后管理或修复系统和数据。它带有许多Linux系统实用程序，例如GParted，fsarchiver，文件系统工具和基本工具（编辑器，Midnight Commander，网络工具）。可以用于Linux和Windows计算机。内核支持所有重要的文件系统（ext3 / ext4，xfs，btrfs，reiserfs，jfs，vfat，ntfs），以及网络文件系统，例如Samba和NFS。 **其文档说明写的非常详细** 。缺点是有些工具只能在命令行中运行。



### 下面是它们分别包含的程序和功能

**AIO：**

The **Live CD** portion contains the following utilities，Live CD 包含：

- [Boot Repair](https://sourceforge.net/p/boot-repair/home/Home/) – simple tool to recover access to your Operating Systems
- [ClamAV](https://www.clamav.net/) – open source antivirus engine
- [Xfburn](http://goodies.xfce.org/projects/applications/xfburn) – simple CD/DVD burning tool
- [Clonezilla](http://clonezilla.org/) – partition and disk imaging/cloning program
- [Disks](https://en.wikipedia.org/wiki/GNOME_Disks) – disk utility to manage SMART and disk partitions
- [Disk Usage Analyzer](https://wiki.gnome.org/Apps/Baobab) – graphical application to analyse disk usage
- [Galculator](http://galculator.mnim.org/) – a GTK 2 / GTK 3 algebraic and RPN calculator
- [GParted](http://gparted.org/) – partition editor for graphically managing your disk partitions
- [LBreakout2](http://lgames.sourceforge.net/LBreakout2/) – breakout-style paddle ball game
- [Mprime](http://www.mersenne.org/download/) – Mersenne prime CPU torture test
- [NT Password Reset](http://www.chntpw.com/guide/) – **Windows password removal utility**
- [Nwipe](https://github.com/martijnvanbrummelen/nwipe) – **secure disk eraser**
- [PhotoRec](http://www.cgsecurity.org/wiki/PhotoRec) – file data **recovery** software
- [System Profiler and Benchmark](https://apps.ubuntu.com/cat/applications/precise/hardinfo/) – displays information about your hardware
- [Terminal](https://help.gnome.org/users/gnome-terminal/stable/) – Lubuntu Command Line Interface (CLI)
- [TestDisk](http://www.cgsecurity.org/wiki/TestDisk) – data recovery software designed to help recover lost partitions
- [Web Browser](http://midori-browser.org/) – a lightweight, fast, and free web browser

![](https://paul.is-a-geek.org/wp-content/uploads/2018/01/LiveCD-1024x576.jpg)

**Windows Autorun 包含：**

- System Info
  - Quick troubleshooting icons ![img](https://paul.is-a-geek.org/wp-content/uploads/2016/04/CPU_GH.ico) CPU  [![img](https://paul.is-a-geek.org/wp-content/uploads/2016/04/RAM_GH.ico)](https://paul.is-a-geek.org/aio-srt/ram_gh/) RAM  ![img](https://paul.is-a-geek.org/wp-content/uploads/2016/04/HDD_GH.ico) HDD
  - System Info tab can be copy/pasted
-  General
  - Verify Toolkit Integrity
  - Task Manager
  - [File Manager for Technicians](http://freecommander.com/)
  - Powershell (Admin)
  - [Whois Domain Lookup](https://technet.microsoft.com/en-us/sysinternals/whois.aspx)
  - [System Analyzer](http://www.webroot.com/us/en/business/resources/analyzer)
  - Resource Monitor
  - Build AiO-SRT Flash Drive
  - Reboot Safe Mode
  - AiO-SRT Lite to Desktop
- Hardware
  - [CPU Stress Test](http://www.mersenne.org/download/)
  - Memory Diagnostics
  - [Hard Drive Diagnostics](https://gsmartcontrol.sourceforge.io/home/)
  - Disk Management
  - Defrag System Drive
  - [Hardware Monitor Sensors](http://www.cpuid.com/softwares/hwmonitor.html)
  - Device Manager
  - [LCD Dead Pixel Test](http://softwareok.com/?seite=Microsoft/IsMyLcdOK)
  - [Hard Drive Usage](https://windirstat.info/)
  - [Data Recovery](http://www.cgsecurity.org/)
- Repair Windows
  - Windows Startup
  - System File Checker
  - DISM System Repair
  - Registry Editor
  - Repair Explorer Icons
  - Windows Reliability Monitor
  - [Blue Screen View](http://www.nirsoft.net/utils/blue_screen_view.html)
  - System Restore
  - Windows Update Repair
  - Disk Cleanup
- Software
  - Sleep & Wake Info
  - [Uninstall Programs](http://www.nirsoft.net/utils/uninstall_view.html)
  - [RichCopy](https://technet.microsoft.com/en-us/library/2009.04.utilityspotlight.aspx)
  - [Bootable ISO to USB](https://rufus.akeo.ie/)
  - [Play LBreakout2](http://lgames.sourceforge.net/LBreakout2/)
  - [Don’t Sleep](http://www.softwareok.com/?seite=Microsoft/DontSleep)
  - [Product Keys](http://www.nirsoft.net/utils/product_cd_key_viewer.html)
  - [Web Browser](http://www.qtweb.net/)
  - [CD/DVD Drive Emulator](http://wincdemu.sysprogs.org/)
  - [Explore ext2/ext3/ext4](http://www.chrysocome.net/explore2fs)
- Networking
  - Reset TCP/IP & Winsock
  - [TCP & UDP Port Query](https://social.technet.microsoft.com/wiki/contents/articles/27661.portqueryui-gui-tool-that-can-be-used-for-troubleshooting-port-connectivity-issues.aspx)
  - View Open Ports
  - [LAN Speed Test](http://totusoft.com/lanspeed/)
  - Continuous Ping Test
  - Windows Firewall
  - [Wireless Site Survey](http://www.the-sz.com/products/homedale/)
  - [SSH/Telnet/Serial Console](http://www.putty.org/)
  - View Open Shared Files
  - [Network Mapper](https://nmap.org/zenmap/)
- Security
  - Windows Security Center
  - [Install Microsoft Security Essentials](http://windows.microsoft.com/en-us/windows/security-essentials-download)
  - [Kaspersky Virus Removal Tool](http://www.kaspersky.com/antivirus-removal-tool?form=1)
  - [Microsoft Safety Scanner](https://www.microsoft.com/security/scanner/en-us/default.aspx)
  - [COMODO Cleaning Essentials](https://www.comodo.com/business-security/network-protection/cleaning_essentials.php)
  - [ESET Online Scanner](https://www.eset.com/us/home/online-scanner/)
  - [Norton Power Eraser](https://security.symantec.com/nbrt/npe.aspx)
  - [ClamWin Antivirus](http://www.clamwin.com/)
  - [Virus Total Online Scanner](https://www.virustotal.com/)
  - [Eicar Anti-Virus Test File](http://www.eicar.org/86-0-Intended-use.html)
- AV Removal
  - Avast、Avira、AVG、Kaspersky、McAfee、Norton 等等杀毒软件移除工具
  - [Trend Micro Removal Tool](https://esupport.trendmicro.com/en-us/home/pages/technical-support/1037161.aspx)
  - [Webroot Removal Tool](https://www.webroot.com/prodCheck/?pc=64150&origrc=1&oc=221&mjv=7&rel=6&bld=38&lang=en&loc=AUS&kc=ppc`lkik^^afhgpewgfa&opi=2&omj=6&omn=1&osl=en)
  - [Universal AV Remover](http://support.eset.com/kb146/?locale=en_US)
- autoFIX Utility
  - Automatic Tasks – unattended tasks, auto reboot, generate log files
  - Diagnostic Only – hardware testing only, no system modifications
  - Diag & Tune-up – hardware testing and general tune-up
  - Malware Removal – malware targeted tasks
  - Generic OS Repair – generic Windows repair tasks
  - Customize – setup your own task queue
- Customize
  - 各种语言，比如中文

![](https://paul.is-a-geek.org/wp-content/uploads/2018/01/WindowsAutorun-1024x576.jpg)



**SystemRescueCd ：**

System tools included

- [**GNU Parted**](https://www.gnu.org/software/parted/): creates, resizes, moves, copies partitions, and filesystems (and more).
- [**GParted**](http://gparted.org/): GUI implementation using the GNU Parted library.
- [**FSArchiver**](http://www.fsarchiver.org/): flexible archiver that can be used as both system and data recovery software
- [**Partimage**](http://www.partimage.org/): popular opensource disk image software which works at the disk block level
- [**ddrescue**](https://www.gnu.org/software/ddrescue/) : Attempts to make a copy of a partition or floppy/Hard Disk/CD/DVD that has hardware errors, optionally filling corresponding bad spots in input with user defined pattern in the copy.
- **File systems tools** (for Linux and Windows filesystems): format, resize（调整分区大小）, and debug an existing partition of a hard disk
- [**Ntfs3g**](http://www.system-rescue-cd.org/manual/Mounting_ntfs_filesystems/): enables read/write access to MS Windows **NTFS** partitions.
- [**sfdisk**](http://www.partimage.org/Partimage-manual_Backup-partition-table) **saves and restores** partition tables.  分区表工具 
- [**Test-disk**](https://www.cgsecurity.org/wiki/TestDisk) : tool to check and undelete partition, supports reiserfs, ntfs, fat32, ext3/ext4 and many others
- [**Memtest**](http://www.system-rescue-cd.org/manual/System_boot_floppy_disks/): to test the memory of your computer (first thing to test when you have a crash or unexpected problems)
- [**Rsync**](http://www.system-rescue-cd.org/manual/Backup_and_transfer_your_data_using_rsync/): very-efficient and reliable program that can be used for remote backups.
- **Network tools** (Samba, NFS, ping, nslookup, …): to backup your data across the network
- Secure Deletion：文件安全删除工具
- 动态语言：Ruby、Python、Perl
-  Midnight Commander ：浏览、编辑、搜索文本文件
- Archiving Tools ：处理各种压缩包

完整列表见 [SystemRescueCd - System tools](http://www.system-rescue-cd.org/System-tools/) 

[Package included in SystemRescueCd](http://www.system-rescue-cd.org/Detailed-packages-list/)  （所有封装）



**Rescatux & Super Grub2 Disk：**

[Rescatux](https://www.supergrubdisk.org/rescatux/)：完整功能见下面

- [Fixes GRUB / GRUB2](https://www.supergrubdisk.org/wizard-restore-grub-with-rescatux/)
- [Many UEFI boot options](https://www.youtube.com/watch?v=rhAg_ojj3VQ)
- Check and fix filesystems
- [Clear Windows password](https://www.supergrubdisk.org/howto-clear-windows-password-with-rescatux/)
- Change Gnu/Linux password
- Regenerate sudoers file
- [And much more features…](https://www.supergrubdisk.org/rescatux/)
- [How to put Rescatux into a CDROM or a USB](https://www.supergrubdisk.org/wizard-step-put-rescatux-into-a-media/)
- ~ 672 MB Size

[Super Grub2 Disk](https://www.supergrubdisk.org/super-grub2-disk/)：

- Boots into many systems and GRUB2 ones!
- [Helps you to fix your GRUB or GRUB2](https://www.supergrubdisk.org/wizard-restore-grub-with-super-grub2-disk/)
- Loads Grub legacy confs (menu.lst)
- Optional LVM / RAID support
- [How to put Super Grub2 Disk into a CDROM or a USB](https://www.supergrubdisk.org/wizard-step-put-super-grub2-disk-into-a-media/)
- **~ 20.00 MB Size**





Clonezilla Live：

先来了解一下 Clonezilla 是什么？Clonezilla 是一个分区区和磁盘映像/克隆程序。它可以帮助您进行系统部署，裸机备份和恢复。 而 **CloneZilla Live**是一个实时Linux发行版，其中预装有FileZilla和其他备份实用程序。  这在硬盘驱动器崩溃和完整磁盘备份的情况下非常有用。克隆的数据可以保存到另一个本地媒体或通过SSH远程保存到NFS共享文件系统或SAMBA共享中。  默认情况下，CloneZilla支持各种磁盘驱动器和磁盘分区类型，除了Linux还包括Windows NTFS和Mac HFS +。 

