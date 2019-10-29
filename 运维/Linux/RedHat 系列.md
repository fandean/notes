
# RedHat 系列系统

[Linux命令大全(手册)_](http://man.linuxde.net/ "Linux命令大全(手册)_Linux常用命令行实例详解_Linux命令学习手册") 的排版和命令解释都很不错。



查看系统版本：

```shell
cat /etc/redhat-release

# 查看详细信息
cat /etc/*-release
```





## 包管理器



### rpm



选项：

```
-i：显示软件包的相关信息
-i<软件包>或--install<软件包>：安装指定的软件包；
-l：显示软件包的文件列表；
-p<软件包>+：查询指定的RPM软件包；
-q：使用询问模式，当遇到任何问题时，rpm指令会先询问用户；
-R：显示软件包的关联性信息；
-v：显示附加信息。显示指令执行过程；
-vv：显示调试信息。详细显示指令执行过程，便于排错。
-h或--hash：软件包安装时显示安装进度
```



**安装rpm包：**

```shell
# 安装rpm包
rpm -ivh ***.rpm　　#其中i表示安装，v表示显示安装过程，h表示显示进度
# 推荐使用 yum 安装 rpm 包
yum install ***.rpm
```

安装时可选的参数：

| 选项          | 含义                         |
| ------------- | ---------------------------- |
| -h            | 安装时以`#`显示安装进度      |
| --percent     | 以百分比的形式输出安装的进度 |
| --test        | 测试安装                     |
| --replacepkgs | 替换属于其它软件包的文件     |
| --force       | 忽略软件包及文件的冲突       |
| --noscripts   | 不运行预安装和后安装脚本     |
| --ignorearch  | 不校验软件包的结构           |
| --ignoreos    | 不检查软件包运行的操作系统   |
| --nodeps      | 不检查依赖性关系             |



**升级rpm包：**

```shell
# 升级rpm包
rpm -Uvh ***.rpm
```



**删除软件包：**

```shell
rpm -e PACKAGE_NAME
rpm -e –nodeps PACKAGE_NAME    #不考虑依赖包
rpm -e –allmatches PACKAGE_NAME    #删除所有跟PACKAGE_NAME匹配的所有版本的包
```

有时会出现一些错误或者警告：

```
... is needed by ...
```

这说明这个软件被其他软件需要，不能随便卸载，可以用`rpm -e --nodeps`强制卸载



**查询软件包：**

```shell
rpm -q PACKAGE_NAME
rpm -qp ***.rpm 获取当前目录下的rpm包相关信息
rpm -qa | less 列出所有已安装的软件包
rpm -qf /usr/sbin/httpd 查看某个文件属于哪个软件包，可以是普通文件或可执行文件，跟文件的绝对路径
rpm -qi PACKAGE_NAME 列出已安装的这个包的标准详细信息
rpm -ql PACKAGE_NAME 列出rpm包的文件内容
rpm -q –scripts kernel | less 列出已安装rpm包自带的安装前和安装后脚本
rpm -qa –queryformat ‘Package %{NAME} was build on %{BUILDHOST}\n’ |less queryformat强大的查询
rpm –querytags | less 可以列出queryformat可以使用的所有变量从而组合成更强大的查询
```



**如何不安装但是获取rpm包中的文件**

使用工具[rpm2cpio](http://man.linuxde.net/rpm2cpio)和[cpio](http://man.linuxde.net/cpio)

```
rpm2cpio xxx.rpm | cpio -vi
rpm2cpio xxx.rpm | cpio -idmv
rpm2cpio xxx.rpm | cpio --extract --make-directories
```

参数i和extract相同，表示提取文件。v表示指示执行进程，d和make-directory相同，表示根据包中文件原来的路径建立目录，m表示保持文件的更新时间。



**如何查看与rpm包相关的文件和其他信息**

下面所有的例子都假设使用软件包[mysql](http://man.linuxde.net/mysql)-3.23.54a-11

1、我的系统中安装了那些rpm软件包。

```
rpm -qa 讲列出所有安装过的包
```

如果要查找所有安装过的包含某个字符串sql的软件包

```
rpm -qa | grep sql
```

2、如何获得某个软件包的文件全名。

```
rpm -q mysql
```

可以获得系统中安装的mysql软件包全名，从中可以获得当前软件包的版本等信息。这个例子中可以得到信息mysql-3.23.54a-11

3、一个rpm包中的文件安装到那里去了？

```
rpm -ql 包名
```

注意这里的是不包括.rpm后缀的软件包的名称，也就是说只能用mysql或者mysql-3.23.54a-11而不是mysql-3.23.54a-11.rpm。如果只是想知道可执行程序放到那里去了，也可以用[which](http://man.linuxde.net/which)，比如：

```
which mysql
```

4、一个rpm包中包含那些文件。

- 一个没有安装过的软件包，使用`rpm -qlp ****.rpm`
- 一个已经安装过的软件包，还可以使用`rpm -ql ****.rpm`

5、如何获取关于一个软件包的版本，用途等相关信息？

- 一个没有安装过的软件包，使用`rpm -qip ****.rpm`
- 一个已经安装过的软件包，还可以使用`rpm -qi ****.rpm`

6、某个程序是哪个软件包安装的，或者哪个软件包包含这个程序。

```
rpm -qf `which 程序名`    #返回软件包的全名
rpm -qif `which 程序名`   #返回软件包的有关信息
rpm -qlf `which 程序名`   #返回软件包的文件列表
```

注意，这里不是引号，而是`，就是键盘左上角的那个键。也可以使用`rpm -qilf`，同时输出软件包信息和文件列表。

7、某个文件是哪个软件包安装的，或者哪个软件包包含这个文件。

注意，前一个问题中的方法，只适用与可执行的程序，而下面的方法，不仅可以用于可执行程序，也可以用于普通的任何文件。前提是知道这个文件名。首先获得这个程序的完整路径，可以用[whereis](http://man.linuxde.net/whereis)或者which，然后使用`rpm -qf`例如：

```
whereis ftptop
ftptop: /usr/bin/ftptop /usr/share/man/man1/ftptop.1.gz

rpm -qf /usr/bin/ftptop
proftpd-1.2.8-1

rpm -qf /usr/share/doc/proftpd-1.2.8/rfc/rfc0959.txt
proftpd-1.2.8-1
```



> [rpm命令_Linux rpm 命令用法详解：RPM软件包的管理工具](http://man.linuxde.net/rpm "rpm命令_Linux rpm 命令用法详解：RPM软件包的管理工具")





### yum

Yum（全称 Yellow Dog Updater）是一个在 Fedora 和 RedHat 以及 CentOS 中的 Shell 前端软件包管理器。基于 RPM 包管理，能够从指定的服务器自动下载RPM包并且安装，可以自动处理依赖性关系，并且一次安装所有依赖的软件包。

**选项：**

```
-h：显示帮助信息；
-y：对所有的提问都回答“yes”；
-q：安静模式；
-v：详细模式
-C：完全从缓存中运行，而不去下载或者更新任何头文件。
```

参数：

```
install：安装rpm软件包；
update：更新rpm软件包；
check-update：检查是否有可用的更新rpm软件包；
remove：删除指定的rpm软件包；
list：显示软件包的信息；
search：检查软件包的信息；
info：显示指定的rpm软件包的描述信息和概要信息；
clean：清理yum过期的缓存；
shell：进入yum的shell提示符；
resolvedep：显示rpm软件包的依赖关系；
localinstall：安装本地的rpm软件包；
localupdate：显示本地rpm软件包进行更新；
deplist：显示rpm软件包的所有依赖关系。
```



**安装**

```
yum install              #全部安装
yum install package1     #安装指定的安装包package1，也可以是 .rpm 包
yum groupinsall group1   #安装程序组group1
```

**更新和升级**

```
yum update               #全部更新
yum update package1      #更新指定程序包package1
yum check-update         #检查可更新的程序
yum upgrade package1     #升级指定程序包package1
yum groupupdate group1   #升级程序组group1
```

**查找和显示**

```
yum info package1      #显示安装包信息package1
yum list               #显示所有已经安装和可以安装的程序包
yum list package1      #显示指定程序包安装情况package1
yum groupinfo group1   #显示程序组group1信息yum search string 根据关键字string查找安装包
```

**删除程序**

```
yum remove &#124; erase package1   #删除程序包package1
yum groupremove group1             #删除程序组group1
yum deplist package1               #查看程序package1依赖情况
```

**清除缓存**

```
yum clean packages       #清除缓存目录下的软件包
yum clean headers        #清除缓存目录下的 headers
yum clean oldheaders     #清除缓存目录下旧的 headers
```





- 自动搜索最快镜像插件：`yum install yum-fastestmirror`
- 安装yum图形窗口插件：`yum install yumex`
- 查看可能批量安装的列表：`yum grouplist`





> [yum命令_Linux yum 命令用法详解：基于RPM的软件包管理器](http://man.linuxde.net/yum "yum命令_Linux yum 命令用法详解：基于RPM的软件包管理器")
>
> [dnf命令_Linux dnf 命令用法详解：新一代的RPM软件包管理器](http://man.linuxde.net/dnf "dnf命令_Linux dnf 命令用法详解：新一代的RPM软件包管理器")







### dnf

DNF包管理器克服了YUM包管理器的一些瓶颈，提升了包括用户体验，内存占用，依赖分析，运行速度等多方面的内容。DNF使用 RPM, libsolv 和 hawkey 库进行包管理操作。 

先检查系统中是否安装有dnf

```shell
dnf --version
```

如果提示没有此命令，则当前系统没有预装dnf，需要先自行安装dnf。

```shell
yum install epel-release -y
yum install dnf
```

如果上述方法提示没有找到 dnf ，则尝试下面的方法：

```
DNF 的最新稳定发行版版本号是 1.0，发行日期是2015年5月11日。 这一版本的额 DNF 包管理器（包括在他之前的所有版本） 都大部分采用 Python 编写，发行许可为GPL v2.

安装
wget http://springdale.math.ias.edu/data/puias/unsupported/7/x86_64/dnf-conf-0.6.4-2.sdl7.noarch.rpm
wget http://springdale.math.ias.edu/data/puias/unsupported/7/x86_64//dnf-0.6.4-2.sdl7.noarch.rpm
wget http://springdale.math.ias.edu/data/puias/unsupported/7/x86_64/python-dnf-0.6.4-2.sdl7.noarch.rpm
yum install python-dnf-0.6.4-2.sdl7.noarch.rpm dnf-0.6.4-2.sdl7.noarch.rpm dnf-conf-0.6.4-2.sdl7.noarch.rpm

```





常用命令：

```shell
# 搜索软件包
dnf search nano
# 查看软件包详情
dnf info nano
# 安装软件包
dnf install nano

# 查看系统中可用的dnf软件库
dnf repolist

# 列出系统中已经安装的rpm包
dnf list installed
```





### yum源



centos 有下面的插件，可以自动寻找最快的镜像站点：

```
已加载插件：fastestmirror
```





国内有名的镜像站点，都有相关操作的说明；比如 ： 

- 中科大：[USTC Open Source Software Mirror](http://mirrors.ustc.edu.cn/ "USTC Open Source Software Mirror")
- 网易开源镜像的 [CentOS镜像使用帮助](http://mirrors.163.com/.help/centos.html "CentOS镜像使用帮助")



当更新软件源后记得更新缓存：

`sudo yum clean all`

运行 `sudo yum makecache` 生成缓存 



```shell
# ######### 配置 yum 源 ############
cd /etc/yum.repos.d/
mv CentOS-Base.repo CentOS-Base.repo.backup
# CentOS 5
http://mirrors.163.com/.help/CentOS5-Base-163.repo
# CentOS 6
wget http://mirrors.163.com/.help/CentOS6-Base-163.repo
# CentOS 7
http://mirrors.163.com/.help/CentOS7-Base-163.repo
# 生成缓存
yum makecache
```







> [yum源配置及详解 - CSDN博客](https://blog.csdn.net/qq_27754983/article/details/73693061 "yum源配置及详解 - CSDN博客")
>
> [Linux yum源问题基础分析和排查-博客-云栖社区-阿里云](https://yq.aliyun.com/articles/508030 "Linux yum源问题基础分析和排查-博客-云栖社区-阿里云")
>
> [深入理解yum工作原理 - firefoxbug](http://www.firefoxbug.com/index.php/archives/2777/ "深入理解yum工作原理 - firefoxbug")







## Fedora

[Fedora 22/23升级到 Fedora 24 - Linux大神博客](https://www.linuxdashen.com/upgrade-fedora-23-workstation-fedora-24 "Fedora 22/23升级到 Fedora 24 - Linux大神博客")

```shell
# 查看当前系统版本
cat /etc/redhat-release
Fedora release 23 (Twenty Three)

# 升级原有系统的软件
sudo dnf upgrade --refresh
# 安装升级插件
sudo dnf install dnf-plugin-system-upgrade
# 指定要升级到 fedora 26 
sudo dnf system-upgrade download --releasever=26
```





直接从 Fedora 23 升级到 Fedora 26。出现错误：

```shell
$ sudo dnf system-upgrade download --releasever=26 --allowerasing

总计                                                                                    1.3 MB/s | 1.0 GB     13:21     
警告：/var/lib/dnf/system-upgrade/js-coffee-script-1.10.0-7.fc26.noarch.rpm: 头V3 RSA/SHA256 Signature, 密钥 ID 64dab85d: NOKEY
Curl error (37): Couldn't read a file:// file for file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-i386 [Couldn't open file /etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-i386]
下载的软件包保存在缓存中，直到下次成功执行事务。
您可以通过执行 'dnf clean packages' 删除软件包缓存。

```



进入 [软件包签名密钥](https://getfedora.org/keys/ "软件包签名密钥") 网站下载公钥文件，点击对应版本的主要按钮，在弹出的对话框中点击 "Fedora Project"  

```shell
cd /etc/pki/rpm-gpg/

# 下载fedora 26对应的 公钥文件
wget https://getfedora.org/static/64DAB85D.txt

cp 64DAB85D.txt RPM-GPG-KEY-fedora-i386

# 再次运行
sudo dnf system-upgrade download --releasever=26 --allowerasing
```





## CentOS



### eth0配置

eth 表示以太网卡。

安装CentOS 6.6 时建议在安装过程中记得到时点击网络配置，勾选`自动连接`，这样可以方便你连接网络；如果你在虚拟机中安装，这样也可以方便你与主机进行通信。

如果没有勾选可参考下面的解决方法：

Centos 6的Minimal下，网卡默认`onboot="no"`，并且设置了依赖 NetworkManager 的选项，`NM_CONTROLLED="yes"`，因为minimal的情况下并没有安装 系统默认提供的网络管理工具NetworkManger。需要编辑 `vi /etc/sysconfig/network-script/ifcfg-eth0`文件，

```shell
ONBOOT="yes" 
MM_Controlled="no" #如果没有就不改
```

最后重启网络服务：

```shell
service network restart     # centos 6
systemctl restart network.service  # centos 7
```





[centos minimal 网络配置详细解读 - CSDN博客](https://blog.csdn.net/yangzaiqiu1986814/article/details/50739060 "centos minimal 网络配置详细解读 - CSDN博客")

[CentOS 7 minimal 版本安装后网络配置 - hfyfpga - 博客园](https://www.cnblogs.com/hfyfpga/p/6262057.html "CentOS 7 minimal 版本安装后网络配置 - hfyfpga - 博客园")





### 升级到最新内核





>  [如何在 CentOS 7 中安装或升级最新的内核](https://linux.cn/article-8310-1.html "技术|如何在 CentOS 7 中安装或升级最新的内核")
>
> [CentOS 7 升级 Linux 内核 - CSDN博客](https://blog.csdn.net/kikajack/article/details/79396793 "CentOS 7 升级 Linux 内核 - CSDN博客")





### 安装各种JDK



[How To Install Java on CentOS and Fedora | DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-install-java-on-centos-and-fedora "How To Install Java on CentOS and Fedora | DigitalOcean")