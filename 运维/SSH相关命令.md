# SSH相关命令

已发布 

rz 命令上传文件

## ssh命令

**ssh命令**是openssh套件中的客户端连接工具，可以给予ssh加密协议实现安全的远程登录服务器。 

### 语法 

```
ssh(选项)(参数)
```

### 选项 

```
-1：强制使用ssh协议版本1；
-2：强制使用ssh协议版本2；
-4：强制使用IPv4地址；
-6：强制使用IPv6地址；
-A：开启认证代理连接转发功能；
-a：关闭认证代理连接转发功能；
-b：使用本机指定地址作为对应连接的源ip地址；
-C：请求压缩所有数据；
-F：指定ssh指令的配置文件；
-f：后台执行ssh指令；
-g：允许远程主机连接主机的转发端口；
-i：指定身份文件；
-l：指定连接远程服务器登录用户名；
-N：不执行远程指令；
-o：指定配置选项；
-p：指定远程服务器上的端口；
-q：静默模式；
-X：开启X11转发功能；
-x：关闭X11转发功能；
-y：开启信任X11转发功能。
```

### 参数 

- 远程主机：指定要连接的远程ssh服务器；
- 指令：要在远程ssh服务器上执行的指令。





## ssh-keygen命令

**ssh-keygen命令**用于为“ssh”生成、管理和转换认证密钥，它支持RSA和DSA两种认证密钥。

### 语法 

```
ssh-keygen(选项)
```

### 选项 

```
-b：指定密钥长度；
-e：读取openssh的私钥或者公钥文件；
-C：添加注释；
-f：指定用来保存密钥的文件名；
-i：读取未加密的ssh-v2兼容的私钥/公钥文件，然后在标准输出设备上显示openssh兼容的私钥/公钥；
-l：显示公钥文件的指纹数据；
-N：提供一个新密语；
-P：提供（旧）密语；
-q：静默模式；
-t：指定要创建的密钥类型。
```



## ssh-agent命令

**ssh-agent命令**是一种控制用来保存公钥身份验证所使用的**私钥**的程序。在Linux中ssh-agent 在**X会话**或**登录会话**之初启动，所有其他窗口或程序则以客户端程序的身份启动并加入到ssh-agent程序中。通过使用环境变量，可定位代理并在登录到其他使用ssh机器上时使用代理自动进行身份验证。

其实ssh-agent就是一个密钥管理器，运行ssh-agent以后，使用ssh-add命令将私钥交给ssh-agent保管，其他程序需要身份验证的时候可以将验证申请交给ssh-agent来完成整个认证过程。

另外如果您的私钥使用密码短语来加密了的话，每一次使用 SSH 密钥对进行登录的时候，您都必须输入正确的密码短语。而 SSH agent 程序能够将您的已解密的私钥缓存起来，在需要的时候提供给您的 SSH 客户端。这样子，您就只需要将私钥加入 SSH agent 缓存的时候输入一次密码短语就可以了。这为您经常使用 SSH 连接提供了不少便利。   

SSH agent 一般会设置成在登录会话的时候自动启动，并在整个会话中保持运行。有不少的 SSH agent 供您选择，我们将为您介绍几种常用的 SSH agent，您可以根据您的需要进行选择。

- ssh-agent 是 OpenSSH 自带的一个 SSH agent
- GnuPG agent也许想要 GnuPG 来缓存您的私钥。当然咯，有些用户比较喜欢在 GnuPG 对话框来输入 PIN 码，这样子管理密码短语也是不错的选择。
- Keychain 是一个用来方便管理 SSH 密钥对的程序，它能尽最大努力去减少对用户的打扰。

> [Pro Git: 7.14 Git 工具 - 凭证存储](https://git-scm.com/book/zh/v2/Git-%E5%B7%A5%E5%85%B7-%E5%87%AD%E8%AF%81%E5%AD%98%E5%82%A8) Git自带有一个独立的凭证辅助工具。
>
> [如何使用 Seahorse 管理 PGP 和 SSH 密钥](https://linux.cn/article-9451-1.html)









### 语法 

```
ssh-agent [-c | -s] [-d] [-a bind_address] [-t life] [command [arg ...]]
ssh-agent [-c | -s] -k
```

### 选项 

```
-a bind_address：bind the agent to the UNIX-domain socket bind_address.
-c：生成C-shell风格的命令输出。
-d：调试模式。
-k：把ssh-agent进程杀掉。
-s：生成Bourne shell 风格的命令输出。
-t life：设置默认值添加到代理人的身份最大寿命。
```

### 实例 

运行ssh-agent，它会打印出来它使用的环境和变量：

```shell
$ ssh-agent
SSH_AUTH_SOCK=/tmp/ssh-U91ObneiXkoL/agent.4608; export SSH_AUTH_SOCK;
SSH_AGENT_PID=1392; export SSH_AGENT_PID;
echo Agent pid 1392;
```





**启动与关闭ssh-agent**

```
方法一：
ssh-agent bash
在子shell中打开ssh-agent，退出子shell自动结束代理

方法二：
eval `ssh-agent`
在当前shell中打开ssh-agent，退出当前shell时最好使用ssh-agent -k关闭对应代理
```

**方式一：**

在子shell中打开ssh-agent，执行该命令后我们也会进入到子shell中；退出子shell自动结束代理（这是一种安全机制）。

```shell
# 这里 $SHELL可以为bash、csh等各种shell
ssh-agent $SHELL
```



**方式二：**

通过当前shell另外开启一个ssh-agent进程，为了安全考虑退出当前shell**之前**可以使用`ssh-agent -k`关闭对应代理（只有在当前shell中还可使用上述命令关闭对应代理，在其它shell中就只能使用kill命令了）。

```shell
# 启动
eval `ssh-agent`
# 关闭
ssh-add -D
ssh-agent -k
```



> 这两种启动方式了另一种解释：启动ssh-agent，您可以创建一个继承SSH_AUTH_SOCK环境变量的子进程，也可以将其作为守护进程运行。 





在linux中：

```
eval `ssh-agent`
```

在Windows中的git-bash中：

```
eval $(ssh-agent)
```



> 因为我在Debian上运行gdm，所以当我登录时会自动启动ssh-agent。如果你没有这个好处，可以通过在.xsession文件的末尾添加以下行来获取它（你可以替换你的窗口gnome-session的经理，如果你使用的话）： 
>
> ```
> ssh-agent gnome-session
> ```
>
> 这基本上意味着ssh-agent启动，创建套接字，设置几个环境变量然后启动gnome-session。这样，在Gnome中运行的所有程序都可以访问代理。 
>
> 如果您想将它放在.profile中，那么您可以参考该文章。 





## ssh-add命令

**ssh-add命令**是把专用密钥添加到[ssh-agent](http://man.linuxde.net/ssh-agent)的高速缓存中。该命令位置在`/usr/bin/ssh-add`。

### 语法 

```
ssh-add [-cDdLlXx] [-t life] [file ...]
ssh-add -s pkcs11
ssh-add -e pkcs11
```

### 选项 

```
-D：删除ssh-agent中的所有密钥.
-d：从ssh-agent中的删除密钥
-e pkcs11：删除PKCS#11共享库pkcs1提供的钥匙。
-s pkcs11：添加PKCS#11共享库pkcs1提供的钥匙。
-L：显示ssh-agent中的公钥
-l：显示ssh-agent中的密钥
-t life：对加载的密钥设置超时时间，超时ssh-agent将自动卸载密钥
-X：对ssh-agent进行解锁
-x：对ssh-agent进行加锁
```

### 实例 

1、把专用密钥添加到 ssh-agent 的高速缓存中：

```
ssh-add ~/.ssh/id_dsa
```

2、从ssh-agent中删除密钥：

```
ssh-add -d ~/.ssh/id_xxx.pub
```

3、查看ssh-agent中的密钥：

```
ssh-add -l
```







## ssh-copy-id命令

**ssh-copy-id命令**可以把本地主机的公钥复制到远程主机的authorized_keys文件上，ssh-copy-id命令也会给远程主机的用户主目录（home）和`~/.ssh`, 和`~/.ssh/authorized_keys`设置合适的权限。

### 语法 

```
ssh-copy-id [-i [identity_file]] [user@]machine
```

### 选项 

```
-i：指定公钥文件
```

### 实例 

1、把本地的ssh公钥文件安装到远程主机对应的账户下：

```
ssh-copy-id user@server
ssh-copy-id -i ~/.ssh/id_rsa.pub user@server
```





## ssh-keyscan命令

**ssh-keyscan命令**是一个收集大量主机公钥的使用工具。

### 语法 

```
ssh-keyscan(选项)(参数)
```

### 选项 

```
-4：强制使用IPv4地址；
-6：强制使用IPv6地址；
-f：从指定文件中读取“地址列表/名字列表”；
-p：指定连接远程主机的端口；
-T：指定连接尝试的超时时间；
-t：指定要创建的密钥类型；
-v：信息模式，打印调试信息。
```

### 参数 

主机列表：指定要收集公钥的主机列表。





## 摘抄至



Linux命令大全上的ssh相关命令：

- [ssh-agent命令_Linux ssh-agent 命令用法详解：ssh密钥管理器](http://man.linuxde.net/ssh-agent "ssh-agent命令_Linux ssh-agent 命令用法详解：ssh密钥管理器")
- [ssh命令_Linux ssh 命令用法详解：openssh套件中的客户端连接工具](http://man.linuxde.net/ssh "ssh命令_Linux ssh 命令用法详解：openssh套件中的客户端连接工具")
- ...



朱双印个人日志上的ssh系列内容：

- [ssh | 朱双印博客](http://www.zsythink.net/archives/tag/ssh/ "ssh | 朱双印博客")

- [ssh代理详解，ssh-agent详解](http://www.zsythink.net/archives/2407 "ssh代理详解，ssh-agent详解")
- [ssh代理转发详解，openssh代理转发详解，ssh-agent ForwardAgent AllowAgentForwarding](http://www.zsythink.net/archives/2422 "ssh代理转发详解，openssh代理转发详解，ssh-agent ForwardAgent AllowAgentForwarding")
- [ssh隧道详解，ssh端口转发详解](http://www.zsythink.net/archives/2450 "ssh隧道详解，ssh端口转发详解")



免密登录的过程

- [ssh-agent 与 Centos 基于key的免密码登录-金色之谜-51CTO博客](http://blog.51cto.com/191226139/2061323 "ssh-agent 与 Centos 基于key的免密码登录-金色之谜-51CTO博客")



国外文章：

- [Using ssh-agent with ssh](http://mah.everybody.org/docs/ssh "Using ssh-agent with ssh")
- [An Illustrated Guide to SSH Agent Forwarding](http://www.unixwiz.net/techtips/ssh-agent-forwarding.html "An Illustrated Guide to SSH Agent Forwarding")