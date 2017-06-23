# PGP加密与GPG软件

标签（空格分隔）： 安全

---

## PGP

> **1.PGP**
> PGP加密軟件，加密郵件，加密磁盤，加密文件。PGP Desktop軟件。
> [PGP.cn](http://www.pgp.cn/)  PGP中國：创建一个在中国可以让人信任的公钥发布/查询/下载网站，我们承诺，公钥发布/查询/下载的功能将永远免费。



## GPG
实际操作看这三篇就够了:

[GPG入门教程](http://www.ruanyifeng.com/blog/2013/07/gpg.html)  
[Signing commits with GPG](https://help.github.com/articles/signing-commits-with-gpg/)  
[Pro Git:7.4 Git工具-签署工作](https://git-scm.com/book/zh/v2/Git-%E5%B7%A5%E5%85%B7-%E7%AD%BE%E7%BD%B2%E5%B7%A5%E4%BD%9C)    

[GnuPG (简体中文) - ArchWiki](https://wiki.archlinux.org/index.php/GnuPG_(简体中文) "GnuPG (简体中文) - ArchWiki")  推荐    

## GnuPG

- [GPG入门教程](http://www.ruanyifeng.com/blog/2013/07/gpg.html)   

- [使用 GnuPG 实现电子邮件加密和数字签名——PGP 30分钟简明教程(1)](http://archboy.org/2013/04/18/gnupg-pgp-encrypt-decrypt-message-and-email-and-digital-signing-easy-tutorial/)  

- [Gnu 隐私卫士 (GnuPG) 袖珍 HOWTO (中文版)](https://www.gnupg.org/howtos/zh/index.html "官网HOWTO文档")

- [RSA算法原理（一）](http://www.ruanyifeng.com/blog/2013/06/rsa_algorithm_part_one.html)   




与SSH一样，GPG也有 gpg-agent。



## 安装 

ubuntu安装gnupg： 

```shell
$ sudo apt install gnupg
```

默认配置文件：

> 默认的配置文件是 `~/.gnupg/gpg.conf` 和 `~/.gnupg/dirmngr.conf`.





## 创建密钥对

```shell
$ gpg --gen-key 
```



操作示例：  
```sh
[fan 18:58:33]~$ gpg --gen-key 
gpg (GnuPG) 1.4.20; Copyright (C) 2015 Free Software Foundation, Inc.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

请选择您要使用的密钥种类：
   (1) RSA and RSA (default)
   (2) DSA and Elgamal
   (3) DSA (仅用于签名)
   (4) RSA (仅用于签名)
您的选择？ 
RSA 密钥长度应在 1024 位与 4096 位之间。
您想要用多大的密钥尺寸？(2048) 4096
您所要求的密钥尺寸是 4096 位
请设定这把密钥的有效期限。
         0 = 密钥永不过期
      <n>  = 密钥在 n 天后过期
      <n>w = 密钥在 n 周后过期
      <n>m = 密钥在 n 月后过期
      <n>y = 密钥在 n 年后过期
密钥的有效期限是？(0) 
密钥永远不会过期
以上正确吗？(y/n) y

您需要一个用户标识来辨识您的密钥；本软件会用真实姓名、注释和电子邮件地址组合
成用户标识，如下所示：
    “Heinrich Heine (Der Dichter) <heinrichh@duesseldorf.de>”

真实姓名： Fan
电子邮件地址： fan@qq.com
注释： github
您选定了这个用户标识：
    “Fan(github) <fan@qq.com>”

更改姓名(N)、注释(C)、电子邮件地址(E)或确定(O)/退出(Q)？ O
您需要一个密码来保护您的私钥。

我们需要生成大量的随机字节。这个时候您可以多做些琐事(像是敲打键盘、移动
鼠标、读写硬盘之类的)，这会让随机数字发生器有更好的机会获得足够的熵数。
....+++++

随机字节不够多。请再做一些其他的琐事，以使操作系统能搜集到更多的熵！
(还需要184字节)
+++++
我们需要生成大量的随机字节。这个时候您可以多做些琐事(像是敲打键盘、移动
鼠标、读写硬盘之类的)，这会让随机数字发生器有更好的机会获得足够的熵数。

随机字节不够多。请再做一些其他的琐事，以使操作系统能搜集到更多的熵！
(还需要231字节)
...+++++

随机字节不够多。请再做一些其他的琐事，以使操作系统能搜集到更多的熵！
(还需要170字节)
+++++
gpg: 密钥 2EBC87DF 被标记为绝对信任
公钥和私钥已经生成并经签名。

gpg: 正在检查信任度数据库
gpg: 需要 3 份勉强信任和 1 份完全信任，PGP 信任模型
gpg: 深度：0 有效性：  1 已签名：  0 信任度：0-，0q，0n，0m，0f，1u
pub   4096R/2EBC87DF 2017-04-11
      密钥指纹 = 3C00 AC7B 3D06 E22E AEDE  72B0 B28F ACA4 2EBC 87DF
uid                  Fan (github) <fan@qq.com>
sub   4096R/878287E9 2017-04-11

gpg key已经生成
----------------------------------------------
# 后续操作
# 列出密钥
[fan 19:24:44]~$ gpg --list-secret-keys --keyid-format LONG
# 最好制作一张撤销证书，用于密钥作废，请求外部公钥服务器撤销你的公钥
# 将二进制的公钥(私钥)导出为ASSCII码
# 上传公钥到公钥服务器。这里使用阮一峰的命令有一些问题，但可以正常工作
gpg --send-keys [用户ID]
# 生成用于公布的公钥指纹（用于他人校验）
gpg --fingerpint [用户ID]
密钥指纹 = 3C00 AC7B 3D06 E22E AEDE  72B0 B28F ACA4 2EBC 87DF
```



"用户ID"的Hash字符串，可以用来替代"用户ID"，比如这里`gpg: 密钥 2EBC87DF 被标记为绝对信任`的2EBC87DF就是我的用户ID。对应于 `pub   4096R/2EBC87DF 2017-04-11`中的该串数字。

指纹的作用见ssh key。



- 用户名和电子邮件。可以给同样的密钥不同的身份，比如给同一个密钥关联多个电子邮件。
- 任何导入密钥的人都可以看到这里的用户名和电子邮件地址。




## 常用命令



查看公钥：

```shell
$ gpg --list-keys
```

查看私钥：

```shell
$ gpg --list-secret-keys
```



## gpg key用途

常见的两种用途： 加密、签名




> PGP的一些作用：（利用公鑰進行加密和簽名）
>
- 對Email進行加密
- 加密一些文本信息，比如（註冊信息），使用PGP加密這些信息后可將加密后的密文發佈到自己的Blog上，什麼時候需要就取回密文進行解密。
- 簽名功能：可以利用PGP的簽名功能對你在網絡上的言論進行簽名，防止他人篡改你的原文（具體原理略）。

> 对文字内容及文件进行加密、解密、签名的方法見該網站。
> OpenPGP
> [Symantec Encryption (PGP) Documentation](https://support.symantec.com/en_US/article.TECH202483.html) 客户端/服务器架构。



### 1.加密



比如加密你的密码文件。

解密


### 2.签名

验证签名


### 3.加密并签名



## 在GitHub和GitLab中的使用



**与SSH KEY的关系是什么？**  

GitHub中，使用SSH连接到GitHub时使用ssh key，另可选择使用gpg key认证每次提交。

我的具体操作就是按照 [Authenticating to GitHub](https://help.github.com/categories/authenticating-to-github/)  所说的方法进行设置。

其中有一步， 是要告诉Git你的GPG key id是多少，步骤如下： 



```
# 使用此命令列出我的key id，顾名思义LONG 这种形式的id 比一般的id要长
$ gpg --list-secret-keys --keyid-format LONG
# 我的是 B28FACA42EBC87DF
$ git config --global user.signingkey B28FACA42EBC87DF
```


而后面的两个命令，列出的2EBC87DF也都是key id，只是比上面的短：

```
$ gpg -K fan@outlook.com
sec   4096R/2EBC87DF 2017-04-11
...
# 或使用命令
$ gpg --list-keys
sec   4096R/2EBC87DF 2017-04-11
```








> 对提交签名和对Tag进行签名

GitHub中可以使用gpg key进行Signing commits using GPG和Signing Tags using GPG这两项操作。

**注意：在GitHub中使用的gpg key的邮件地址必须是经过GitHub认证过的邮箱地址**。    
Your GPG key must be associated with a GitHub verified email that matches your committer identity.



> Tips小贴士:
>
> To set all commits for a repository to be signed by default, in Git versions 2.0.0 and above, run `git config commit.gpgsign true`. To set all commits in any local repository on your computer to be signed by default, run `git config --global commit.gpgsign true`.
>
> To store your GPG key passphrase so you don't have to enter it every time you sign a commit, we recommend using the following tools:
>
> For Mac users, the GPG Suite allows you to store your GPG key passphrase in the Mac OS Keychain.
> For Windows users, the Gpg4win integrates with other Windows tools.
> You can also manually configure gpg-agent to save your GPG key passphrase, but this doesn't integrate with Mac OS Keychain like ssh-agent and requires more setup.


### 设置 Signed commits

对单次提交进行签名： `git commit -S -m "-S选项表示对此次提交使用gpg进行签名"`




[Signed commits · Wiki · akwizgran / briar · GitLab](https://code.briarproject.org/akwizgran/briar/wikis/signed-commits "Signed commits · Wiki · akwizgran / briar · GitLab")



好吧，原来上面的小贴士中也有相关方法。



Steps for enabling GPG signed commits in **Android Studio**:   

- Find the ID of your signing key
  - Run` gpg -K you@example.com`
  - Look at the line starting with `sec`。（找到以sec开始的行）
  - The hex digits after the slash are the key ID(斜杠后面的十六进制数字是key ID), e.g. `ABCD0123`
- Add the key ID to your global ` .gitconfig`: 
  ```
  [user]
        name = you
        email = you@example.com
        signingkey = ABCD0123
  ```
- Add the following lines to your `.gnupg/gpg.conf`: 
  ```
  use-agent
  no-tty
  ```
- Enable signed commits in the project's `.git/config`:  （对应于某个工程）
  ```
  [commit]
      gpgsign = true
  ```
  和这个命令作用一样： `git config commit.gpgsign true`


也可尝试在git的全局配置文件中进行配置，以用于所有提交。也可以直接使用命令  
`git config --global commit.gpgsign true`




> GPG 的配置文件 `.gnupg/gpg.conf `







## gpg-agent

[GnuPG (简体中文) - ArchWiki](https://wiki.archlinux.org/index.php/GnuPG_(简体中文) "GnuPG (简体中文) - ArchWiki")  推荐



需要备份的文件: 

**gpg-agent.conf**和**trustlist.txt**（This is the list of trusted keys. You should backup this file.）





配置起来比较麻烦，这里只介绍，个人电脑个人用户的简单配置。  

[Using the GNU Privacy Guard: Invoking GPG-AGENT](https://www.gnupg.org/documentation/manuals/gnupg/Invoking-GPG_002dAGENT.html "Using the GNU Privacy Guard: Invoking GPG-AGENT")，在此网站在下面的 “Option Index”列表中列出了一些信息。  

手动停止：  `gpgconf --kill gpg-agent`

您应该总是将以下行添加到.bashrc： 
```shell
export GPG_TTY=$(tty)
```


### 1. 配置

在配置文件`~/.gnupg/gpg-agent.conf`中添加：

```shell
# 3600 = 60秒 × 60分钟 设置缓存的有效时间，默认为600秒。每次访问都重新开始计时，前提是没有超出最大缓存时间，该时间通过 max-cache-ttl设置默认为2小时
default-cache-ttl 3600
```

[Using the GNU Privacy Guard: Agent Options](https://www.gnupg.org/documentation/manuals/gnupg/Agent-Options.html#index-default_002dcache_002dttl "Using the GNU Privacy Guard: Agent Options") 在这里查看配置文件中各配置的含义

> `ignore-cache-for-signing`  
> This option will let gpg-agent bypass the passphrase cache for all signing operation. Note that there is also a per-session option to control this behavior but this command line option takes precedence.

一个示例：

```shell
# 5小时  24小时
default-cache-ttl 18000
max-cache-ttl 86400
ignore-cache-for-signing
```


### 2.重新加载agent

更改配置后需要重新加载agent。
```shell
$ gpg-connect-agent reloadagent /bye
```
该命令将会打印出 OK 



### 3.pinentry

最后agent需要知道如何向用户索要密码，默认是使用一个 gtk dialog (gtk对话框)。

在`~/.gnupg/gpg-agent.conf`配置文件中，可以通过`pinentry-program`配置你要采用的程序：  

```shell
# PIN entry program
# pinentry-program /usr/bin/pinentry-curses
# pinentry-program /usr/bin/pinentry-qt
# pinentry-program /usr/bin/pinentry-kwallet

pinentry-program /usr/bin/pinentry-gtk-2
```


**仍然重新加载agent**



### 4.Start gpg-agent with systemd user（可选）



这里使用的是 archlinux

Create a systemd unit file:   

```shell
# 文件 ~/.config/systemd/user/gpg-agent.service 中
[Unit]
Description=GnuPG private key agent
IgnoreOnIsolate=true

[Service]
Type=forking
ExecStart=/usr/bin/gpg-agent --daemon
Restart=on-abort

[Install]
WantedBy=default.target
```



### 5.无人值守的密码短语（可选）


为了具有与旧版本相同类型的功能，必须完成两件事情：



1. edit the gpg-agent configuration to allow *loopback* pinentry mode:

   ```shell
   # ~/.gnupg/gpg-agent.conf 
   allow-loopback-pinentry
   ```
     然后重启 gpg-agent，以生效。
2. 需要更新应用程序，最好使用命令行加参数的形式，来使用环回模式，如下：
  ```shell
  $ gpg  --pinentry-mode loopback
  ```
  如果这样不行，则尝试在配置文件中添加相应配置项：
  ```shell
  # ~/.gnupg/gpg.conf
  pinentry-mode loopback
  ```

> `gpg  --pinentry-mode loopback`命令不能执行，没有这个选项。后面的没有做了。配置了前面的已经可以了。


### 6. SSH agent （可选）

如果你已经安装了GnuPG套件，你可能考虑使用gpg-agent去缓存你的SSH key。一些用户可能更喜欢GnuPG代理提供的PIN输入对话框，作为其密码短语管理的一部分。

略

