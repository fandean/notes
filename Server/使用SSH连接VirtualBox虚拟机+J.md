# 使用SSH连接VirtualBox虚拟机

标签（空格分隔）： 安全 Server

---

[TOC]



**步骤：**

- 配置虚拟机网络，添加端口转发规则
- 测试服务器端ssh是否安装
- 测试远程主机是否可以连接；注意提示信息
- 服务器安装ssh
- 配置服务器防火墙
- 远程主机生成密钥对
- 导入远程主机公钥至服务器(无密登录)


## 1. 配置虚拟机网络，添加端口转发规则

### 1.1 桥接模式


虚拟机的网络就相当于主机一样并行存在，所以当前主机要连接到路由器或交换机等设备，以使两个系统处于同一局域网。  


### 1.2 网络地址转换NAT


NAT模式即虚拟机的网络是完全依赖于物理主机的网络。此时两个系统并不是处于同一局域网，不能简单的ping通；
但是可以设置Virtualbox在NAT模式(网络地址转换NAT)下的端口转发规则，通过设置规则可使主机连接虚拟机。    

`设置` -> `网络` -> `网络地址转换(NAT)` -> `高级` -> `端口转发` -> `添加规则` :  

1. 名称可随便填写，如ssh   
2. 主机IP可以不填，或者填写127.0.0.1   
3. 主机端口随意填写一个不会产生冲突的端口，如2222   
4. 子系统端口可以不填，或者填写子系统当前IP地址  
5. 子系统端口如果是要进行ssh连接，则填写22 ; ftp就填写21  

示例：  

| 名称     | 协议   | 主机IP      | 主机端口 | 子系统IP     | 子系统端口 |
| ------ | ---- | --------- | ---- | --------- | ----- |
| ftp    | TCP  |           | 2121 |           | 21    |
| ssh    | TCP  |           | 2222 |           | 22    |
| http   | TCP  |           | 8080 |           | 80    |
| mysql  | TCP  | 127.0.0.1 | 3306 | 10.0.2.15 | 3306  |
| oracle | TCP  |           | 1521 |           | 1521  |


>参考： 
><http://reverland.bitbucket.org/VirtualBox_net.html>         
><http://www.myhack58.com/Article/48/66/2014/46228.htm>         
>设置两个网卡，一个NAT，一个桥接 <http://my.oschina.net/dmdgeeker/blog/229044>     
>[centos7 虚拟机相互访问的网卡设置](https://www.zybuluo.com/flyily/note/544688)  
>[VirtualBox下虚拟机和主机内网互通+虚拟机静态IP的网络配置](http://xintq.net/2014/09/05/virtualbox/)   
>[VirtualBox虚拟机网络环境解析和搭建-NAT、桥接、Host-Only、Internal、端口映射](http://blog.csdn.net/yxc135/article/details/8458939)    
>[A short guide to networking in Virtual Box with Oracle Linux inside](https://technology.amis.nl/2014/01/27/a-short-guide-to-networking-in-virtual-box-with-oracle-linux-inside/)



>**详细介绍**
><http://www.cnblogs.com/adforce/archive/2013/10/11/3363373.html>







## 2. 测试服务器端ssh是否安装

测试是否安装ssh：  

	ssh localhost 
	//使用该命令后，如果已经安装，会提示你是否接收服务器发给你的公钥，并让你输入yes/no，此时输入 yes 。这样才能对你发给服务器的信息进行加密。



## 3. 测试远程主机是否可以连接

>如果已经安装，则进行这一步。

测试是否可以使用SSH连接  ：使用密码登录(设置好端口转发后)   

因为端口不是常规默认的，所以需要指定 port  

如进行ssh连接则在shell中输入：   

	$ ssh -p 2222 username@127.0.0.1
	或将上面的 127.0.0.1 改为localhost  

进行sftp连接(其端口与ssh是一样的,因为它是ssh的一部分)：   

	$ sftp -o port=2222 username@127.0.0.1 


>**由于SSH是使用非对称密钥来进行安全认证，所以在第一次与某主机通信时会提示你，连接的主机是不是可靠的。**
>所谓"公钥登录"，原理很简单，就是用户将自己的公钥储存在远程主机上。登录的时候，远程主机会向用户发送一段随机字符串，用户用自己的私钥加密后，再发回来。远程主机用事先储存的公钥进行解密，如果成功，就证明用户是可信的，直接允许登录 shell，不再要求密码。


ftp连接：  

	$ ftp  host-name [port]
	或 
	$ ftp
	ftp> open host-name [port] 

可能并不成功，不知是不是防火墙的问题，使用sftp就好了，更安全。 


将上面的 username 改为自己的。  


**前提是虚拟机中的Linux安装了ssh服务并开启，且关闭了防火墙(或添加了相应规则)。**

>如果测试不成功则跳转到第5节



## 4. 服务器安装ssh  

安装ssh: 

	sudo apt-get install openssh-server 

启动服务： 

	sudo /etc/init.d/ssh start 

查看是否启动： 

	ps -e | grep sshd 



**配置防火墙**

此时在远程客户端进行连接测试，如果可行

[Linux 上安装 ssh (Ubuntu & RedHat)](http://blog.csdn.net/zxs9999/article/details/6930736)  



## 5. 配置服务器防火墙

###  5.1 配置动态防火墙firewalld 

**使用了动态防火墙：变更后无需重启系统。它不能与静态防火墙共存。**

可以选择开启某个端口，或完全关闭防火墙

> 配置好防火墙后，跳转到第3节，进行远程测试。

#### 5.1.1 为服务器防火墙开启22端口或开启ssh服务

> 在CentOS7上默认是开启了 ssh 服务的。如果不行就试一下同时开启端口。


	firewall-cmd --permanent --add-port=22/tcp
	或选择
	firewall-cmd --permanent  --add-service=ssh
	然后重新加载防火墙
	systemctl reload firewalld

查看是否已经开启：

	firewall-cmd --list-all

在列出的信息中，查看port开头的行是否包含 22 。

#### 5.1.2 关闭服务器防火墙

查看防火墙状态：   

	systemctl status firewalld  

临时关闭防火墙：   

	systemctl stop firewalld 

永久关闭防火墙： 

	systemctl disable firewalld  

打开防火墙： 

	systemctl enable firewalld   

注意需要root权限。  




### 5.2 配置静态防火墙 iptables  (不必)

> fedora，centos等，基本都已经使用动态防火墙(两者不能共存)了。此处是否有效未知。


关闭：

	service iptables stop  

开启：  

	service iptables start   

开机默认关闭防火墙：(即永久)   

	chkconfig iptables off  

开机默认开启防火墙：   

	chkconfig iptables on  


*fedora不可用*
参考： <http://my.oschina.net/u/217959/blog/38051>







# 生成SSH key

[SSH原理与运用（一）：远程登录](http://www.ruanyifeng.com/blog/2011/12/ssh_remote_login.html)     
[SSH原理与运用（二）：远程操作与端口转发](http://www.ruanyifeng.com/blog/2011/12/ssh_port_forwarding.html)     
Asrchlinux wiki:   
[Secure Shell (简体中文)](https://wiki.archlinux.org/index.php/Secure_Shell_(简体中文))     
[SSH keys (简体中文)](https://wiki.archlinux.org/index.php/SSH_keys_(简体中文))    




## 6. 远程主机生成密钥对

这部分不大全面。     
**公钥**是一串很长的字符，为了便于肉眼比对和识别，所以有了指纹这东西，指纹位数更便于识别且与公钥一一对应。

运行命令ssh-keygen采用rsa加密算法生成**密钥对**： 

	ssh-keygen -t rsa

生成密钥对时，有一个选项要求你设置密码passphrase，该密码是用来保护你的私钥的密码。如果设置了则在使用私钥时会要求你输入这个密码；**一般不设置，记不住**【之后还可更改此密码，使用ssh-keygen -p】。  


生成后最好将私钥进行备份。另还有` -C `选项，用于为指定注释**通常使用自己的邮件名作为注释**。  

`-b` bits选项    Specifies the number of bits in the key to create.  For **RSA keys**, the minimum size is 1024 bits and the default is 2048 bits.  Generally, 2048 bits is considered sufficient.  DSA keys must be exactly 1024 bits


示例：为了安全考虑使用RSA加密并设置 -b 4096

```sh
$ ssh-keygen -t rsa -C "your_email@example.com" -b 4096
Generating public/private rsa key pair.
Enter file in which to save the key
(/Users/your_user_directory/.ssh/id_rsa): 按回车键 （如果需要生成多对key，则输入/home/users/.ssh/filename）
Enter passphrase (empty for no passphrase): 输入密码(一般不输入密码，直接回车)
Enter same passphrase again: 再次输入密码
...

# 查看公钥文件中的内容
$ cat ~/.ssh/id_rsa.pub
ssh-rsa "公钥内容" your_email@example.com

# 注意在其他地方导入公钥时一定要将公钥文件中的*全部内容*都导入，包括末尾你的邮箱。（邮箱可能是由 -C 指定的？？）
```

实际操作的一次示例：  
```
[fan 16:10:57]~$ ssh-keygen -t rsa -C "Fan@outlook.com" -b 4096
Generating public/private rsa key pair.
Enter file in which to save the key (/home/fan/.ssh/id_rsa): /home/fan/.ssh/FDGitHub_rsa
Enter passphrase (empty for no passphrase):  （不要密码直接回车）
Enter same passphrase again: 
Your identification has been saved in /home/fan/.ssh/FDGitHub_rsa.
Your public key has been saved in /home/fan/.ssh/FDGitHub_rsa.pub.
The key fingerprint is:
SHA256:GcK7ORvFzH6fzA7qPmnzBr1DOWho5cCVgIpLkh6VGb8 Fan@outlook.com
The key's randomart image is:
+---[RSA 4096]----+
|   .+... .       |
|   +o.  o        |
| o.. oo..        |
|+o.   +*.o       |
|     .=..+oo     |
|       +=o+= .   |
|      .++=.o*    |
+----[SHA256]-----+
```




指纹的用处之一是在使用SSH第一连接到某主机时，会返回该主机使用的公钥的指纹让你识别。示例：  
```
The authenticity of host '某主机名' can't be established.
RSA key fingerprint is SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.
Are you sure you want to continue connecting (yes/no)?
```


>**简单介绍一下：**

> 公钥用于给别人用来加密文件。公钥就是一把锁，你把锁给别人，他用锁锁住东西后，除了你自己外其他人是没有钥匙(私钥)的，都无法打开。配对的私钥就是钥匙。

> 必须保证使用你的公钥的人明确知道这个公钥一定是你的。你可以在网站或通过其它方式公布你的公钥，以便他人进行对照确认。由于公钥很长，所以有了对应的指纹(指纹更易辨别，位数更少)，可以通过指纹进行对照(公布指纹)。


> 如需进一步了解SSH Key的更多用法见《SSH key的生成与使用.md》


## 7. 导入远程主机公钥至服务器，并进行配置(无密登录)

### 7.1 导入公钥

把公钥上传到服务器端有很多方法：

1. 使用sftp
2. 使用ssh-copy-id
3. 使用scp
4. ...

**使用sftp的示例：**
```
#先使用sftp进行连接
$ sftp -o port=2222 root@127.0.0.1
#连接之后，(可使用help命令查看帮助)。
sftp>  put ~/.ssh/id_rsa.pub  ~/
```

**使用ssh-copy-id的示例：**
默认上传到`~/.ssh/id_ecdsa.pub`
```
#简便形式；（如果名字为默认则可免去指定公钥名）
$ ssh-copy-id  -p 2222  root@127.0.0.1
#另一个示例
$ ssh-copy-id -i ~/.ssh/id_rsa.pub -p 221 username@remote-server.org
```



**上传之后:**
导入公钥内容到指定的文件中

	$ cat ~/路径/id_rsa.pub >> ~/.ssh/authorized_keys


**保证 authorized_keys 文件的安全**

	$ chmod 600 ~/.ssh/authorized_keys


### 7.2 配置ssh服务

sshd的配置文件位于: `/etc/ssh/sshd_config`
只需配置：
```
 GSSAPIAuthentication  no         #无需查询DNS，加快速度
 PermitRootLogin yes			#允许root的ssh登录；虚拟机图个方便而已，建议关闭
 PubkeyAuthentication yes 	#启用公钥验证
 AuthorizedKeysFile    .ssh/authorized_keys        #公钥的保存位置，记住即可之后需要用到
 PasswordAuthentication yes	#允许使用密码验证登录，实际建议关闭
 PermitEmptyPasswords no	#是否允许空密码登录，no
```

**关闭服务器中的SELinux服务:**
其配置文件是： `/etc/selinux/config`
在文件中添加: 

	SELINUX=permissive	

重启系统 或 使用root账户运行：`setenforce Permissive`

**服务器端重启ssh服务:**

`service sshd restart`









## 8  相关问题

连接时出现的提示信息

相关示例：

有一次出现：
```
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
@ WARNING: REMOTE HOST IDENTIFICATION(识别) HAS CHANGED(已改变)! @ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY(讨厌的)! Someone could be eavesdropping(窃听) on you right now (man-in-the-middle attack)! It is also possible that a host key has just been changed. The fingerprint for the RSA key sent by the remote host is 98:ab:2b:30:60:00:82:86:bb:85:db:87:22:c4:4f:b1. Please contact your system administrator.
```
这可能是我配置了两台虚拟机，虚拟机配置端口转发时设置的IP地址和端口都是相同的。才导致此提示该主机的指纹(也可能是指公钥)已经改变；更改了端口就没有问题了。（另一种做法是删除.ssh/known_hosts文件，以后连接时再全部重新导入）





后一次出现
```
[root]~ $ sftp -o port=2222 root@127.0.0.1
The authenticity of host '[127.0.0.1]:2222 ([127.0.0.1]:2222)' can't be established(建立).
ECDSA key fingerprint(指纹) is SHA256:JE63mxnefTg1Hc/x5BhF+rdWmkFN6FiOBRoye56odW4.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently(永久的) added '[127.0.0.1]:2222' (ECDSA) to the list of known hosts.
root@127.0.0.1's password:
```
这段提示用于提示你是否信任该主机(这里指服务器)，如果输入yes则信任该主机并且将该服务器的公钥追加到 .ssh/known_hosts文件中。


## SSH图片  
![enter image description here](https://i.imgur.com/ZL9V7IO.jpg)
