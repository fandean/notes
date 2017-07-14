# SSH key的生成与使用

## 参考

如果要详细了解请认真参考：[SSH keys (简体中文)](https://wiki.archlinux.org/index.php/SSH_keys_%28%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87%29)  
[实战：Connecting to GitHub with SSH](https://help.github.com/articles/connecting-to-github-with-ssh/)  

强烈建议学习的几篇SSH文章：  
阮一峰  
[SSH原理与运用（一）：远程登录](http://www.ruanyifeng.com/blog/2011/12/ssh_remote_login.html)   
[SSH原理与运用（二）：远程操作与端口转发](http://www.ruanyifeng.com/blog/2011/12/ssh_port_forwarding.html)   
Asrchlinux wiki:   
[Secure Shell (简体中文)](https://wiki.archlinux.org/index.php/Secure_Shell_(简体中文))   
[SSH keys (简体中文)](https://wiki.archlinux.org/index.php/SSH_keys_(简体中文))  




## 生成密钥对

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
```shell
[fan 16:10:57]~$ ssh-keygen -t rsa -C "Fan@outlook.com" -b 4096
Generating public/private rsa key pair.
Enter file in which to save the key (/home/fan/.ssh/id_rsa): /home/fan/.ssh/FDGitHub_rsa
Enter passphrase (empty for no passphrase): 
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
|+..  E.=So .     |
|..    o== =      |
|     .=..+oo     |
|       +=o+= .   |
|      .++=.o*    |
+----[SHA256]-----+
```



公钥加密指纹fingerprint有两种形式：  

- 之前的十六进制形式：`16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48`
- 现在使用sha256哈希值并且使用base64进行格式：`SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8`


指纹的用处之一是在使用SSH第一连接到某主机时，会返回该主机使用的公钥的指纹让你识别。示例：  
```
The authenticity of host '某主机名' can't be established.
RSA key fingerprint is SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.
Are you sure you want to continue connecting (yes/no)?
```


>**简单介绍一下：**

> 公钥用于给别人用来加密文件。公钥就是一把锁，你把锁给别人，他用锁锁住东西后，除了你自己外其他人是没有钥匙(私钥)的，都无法打开。配对的私钥就是钥匙。

> 必须保证使用你的公钥的人明确知道这个公钥一定是你的。你可以在网站或通过其它方式公布你的公钥，以便他人进行对照确认。由于公钥很长，所以有了对应的指纹(指纹更易辨别，位数更少)，可以通过指纹进行对照(公布指纹)。



## 如何创建多个ssh key而不是覆盖默认文件

在创建ssh key时自行输入路径和文件名称，而非使用默认路径和文件名即可。

```shell
# 比如，输入绝对路径加文件名来指定
/home/fan/.ssh/gitlab_rsa
```




## 使用非默认的密钥对 
[Working with non-default SSH key pair paths](https://docs.gitlab.com/ce/ssh/README.html#working-with-non-default-ssh-key-pair-paths)

比如：你在GitLab上粘贴的公钥(Public SSH keys)不是默认的密钥对；此时要想让你的ssh client正常与安装了GitLab的服务器通信，必须对ssh client进行配置，当通信对象为安装了GitLab的服务器主机时，使用哪个私钥(SSH private key)。

For `OpenSSH clients` this is configured in the `~/.ssh/config` file. Below are two example host configurations using their own key:

```shell
# GitLab.com server
Host gitlab.com
RSAAuthentication yes
IdentityFile ~/.ssh/config/private-key-filename-01

# Private GitLab server
Host gitlab.company.com
RSAAuthentication yes
IdentityFile ~/.ssh/config/private-key-filename
```

**对于GitLab等：** Public SSH keys need to be unique（唯一的）, as they will bind to your account. Your SSH key is the only identifier you'll have when pushing code via SSH. That's why it needs to uniquely map to a single user (这就是为什么它需要唯一地映射到一个用户).


**GitHub使用非默认密钥对:**  
```shell
Host github.com
RSAAuthentication yes
IdentityFile ~/.ssh/FDGitHub_rsa.pub
```


## SSH agent

**如果您的私钥使用密码短语来加密了的话，每一次使用 SSH 密钥对进行登录的时候，您都必须输入正确的密码短语。**    
而 SSH agent 程序能够将您的已解密的私钥缓存起来，在需要的时候提供给您的 SSH 客户端。这样子，您就只需要将私钥加入 SSH agent 缓存的时候输入一次密码短语就可以了。这为您经常使用 SSH 连接提供了不少便利。   
SSH agent 一般会设置成在登录会话的时候自动启动，并在整个会话中保持运行。有不少的 SSH agent 供您选择，我们将为您介绍几种常用的 SSH agent，您可以根据您的需要进行选择。


- ssh-agent 是 OpenSSH 自带的一个 SSH agent
- GnuPG agent也许想要 GnuPG 来缓存您的私钥。当然咯，有些用户比较喜欢在 GnuPG 对话框来输入 PIN 码，这样子管理密码短语也是不错的选择。
- Keychain 是一个用来方便管理 SSH 密钥对的程序，它能尽最大努力去减少对用户的打扰。


[Pro Git: 7.14 Git 工具 - 凭证存储](https://git-scm.com/book/zh/v2/Git-%E5%B7%A5%E5%85%B7-%E5%87%AD%E8%AF%81%E5%AD%98%E5%82%A8) Git自带有一个独立的凭证辅助工具。



## Git中使用ssh key



与远程仓库之间的通信使用到ssh key进行加密。




git仓库之间的代码传输协议主要使用ssh协议。ssh与git是两个不同的程序，不同的用途。

SSH Key导入：(生成秘钥所使用的邮箱是否需要和本地git设置的邮箱相同？)  
(本地git中的用户名和邮箱会随同提交日志被公开到GitHub上，而非生成ssh key时使用的邮箱)  


> git是如何使用ssh key的？   
> 将公钥上传到github，
> Working with non-default SSH key pair paths，见SSH系列文章


**安装GitLab后的操作步骤(已配置好了ssh服务)：**

- 在GitLab上新建项目（新建时可以选择从GitHub中导入）
- SSH Key生成与导入（见SSH系列文章）
- 上传本地git库到GitLab
- 或Clone GitLab库到本地

主要参考:[Gitlab的使用](https://blog.cnbluebox.com/blog/2014/04/15/gitlabde-shi-yong/)  




### SSH为非标准port时的解决办法    



ssh使用标准的port: 

```shell
$ git remote add origin git@localhost:TestGroup/Test.git
```



ssh使用非标端口时的方法: 

```shell
# ssh使用非标准端口时的方法(这里是2200端口)
# 方法1 (失败)
$ git remote add origin git@localhost:2200/TestGroup/Test.git
# 方法2：使用ssh的形式；root为操作系统账号，端口与路径之间没有空格，路径为完整路径
$ git remote add origin ssh://root@127.0.0.1:2200/var/opt/gitlab/git-data/repositories/TestGroup/Test.git
# 方法3：使用http；输入该仓库用户的GitLab的用户名和密码
$ git remote add origin http://127.0.0.1:8081/TestGroup/Test.git
# 方法4：在配置文件中配置
```



[git remote add with other SSH port](http://stackoverflow.com/questions/3596260/git-remote-add-with-other-ssh-port)

示例：  
```shell
################## 实际操作 ################
[fan 23:31:12]~/backup$ git remote add origin git@127.0.0.1:TestGroup/Test.git
[fan 23:32:24]~/backup$ git push -u origin --all
ssh: connect to host 127.0.0.1 port 22: Connection refused
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.

[fan 23:37:38]~/backup$ git remote add origin git@127.0.0.1:2200/TestGroup/Test.git
fatal: 远程 origin 已经存在。
[fan 00:33:38]~/backup$ git remote rm origin

-----

[fan 00:32:59]~/backup$ git remote add origin ssh://root@127.0.0.1:2200/TestGroup/Test.git
[fan 00:33:25]~/backup$ git push -u origin --all
fatal: '/TestGroup/Test.git' does not appear to be a git repository
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
[fan 00:33:38]~/backup$ git remote rm origin
[fan 00:34:12]~/backup$ git remote add origin ssh://root@127.0.0.1:2200/var/opt/gitlab/git-data/repositories/TestGroup/Test.git
[fan 00:34:21]~/backup$ git push -u origin --all
对象计数中: 131, 完成.
Delta compression using up to 4 threads.
压缩对象中: 100% (129/129), 完成.
写入对象中: 100% (131/131), 1.26 MiB | 0 bytes/s, 完成.
Total 131 (delta 15), reused 0 (delta 0)
remote: GitLab: You are not allowed to upload code for this project.
To ssh://root@127.0.0.1:2200/var/opt/gitlab/git-data/repositories/TestGroup/Test.git
 ! [remote rejected] master -> master (pre-receive hook declined)
error: 无法推送一些引用到 'ssh://root@127.0.0.1:2200/var/opt/gitlab/git-data/repositories/TestGroup/Test.git'

# 莫非是我的ssh key有问题？尝试重新按照官方教程生成ssh key。还是说是下面链接中说的git版本问题？
# 最终原因： 是使用git协议有问题，而使用http则可以（那么ssh key还有用吗？）

[fan 01:05:30]~/backup$ git remote add origin http://127.0.0.1:8081/TestGroup/Test.git
[fan 01:08:25]~/backup$ git push -u origin master
Username for 'http://127.0.0.1:8081': Fan
Password for 'http://Fan@127.0.0.1:8081': 
对象计数中: 131, 完成.
Delta compression using up to 4 threads.
压缩对象中: 100% (129/129), 完成.
写入对象中: 100% (131/131), 1.26 MiB | 0 bytes/s, 完成.
Total 131 (delta 15), reused 0 (delta 0)
remote: Resolving deltas: 100% (15/15), done.

To http://127.0.0.1:8081/TestGroup/Test.git
 * [new branch]      master -> master
分支 master 设置为跟踪来自 origin 的远程分支 master。
```

[remote rejected错误原因](https://github.com/gitlabhq/gitlabhq/issues/10405)


**最终原因：** 是GitHub使用git协议有问题，而使用http则可以。（那么ssh key还有用吗？）


