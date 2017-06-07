# PGP加密与GPG软件

标签（空格分隔）： 安全

---

## PGP

> **1.PGP**
PGP加密軟件，加密郵件，加密磁盤，加密文件。PGP Desktop軟件。
[PGP.cn](http://www.pgp.cn/)PGP中國：创建一个在中国可以让人信任的公钥发布/查询/下载网站，我们承诺，公钥发布/查询/下载的功能将永远免费。
PGP的一些作用：（利用公鑰進行加密和簽名）
>
- 對Email進行加密
- 加密一些文本信息，比如（註冊信息），使用PGP加密這些信息后可將加密后的密文發佈到自己的Blog上，什麼時候需要就取回密文進行解密。
- 簽名功能：可以利用PGP的簽名功能對你在網絡上的言論進行簽名，防止他人篡改你的原文（具體原理略）。

> 对文字内容及文件进行加密、解密、签名的方法見該網站。
OpenPGP
[Symantec Encryption (PGP) Documentation](https://support.symantec.com/en_US/article.TECH202483.html) 客户端/服务器架构。




**与SSH KEY的关系是什么？**  

GitHub中，使用SSH连接到GitHub时使用ssh key，另可选择使用gpg key认证每次提交。

具体操作见[Authenticating to GitHub](https://help.github.com/categories/authenticating-to-github/)  



## GPG
实际操作看这三篇就够了:

[GPG入门教程](http://www.ruanyifeng.com/blog/2013/07/gpg.html)  
[Signing commits with GPG](https://help.github.com/articles/signing-commits-with-gpg/)  
[Pro Git:7.4 Git工具-签署工作](https://git-scm.com/book/zh/v2/Git-%E5%B7%A5%E5%85%B7-%E7%AD%BE%E7%BD%B2%E5%B7%A5%E4%BD%9C)  

### GnuPG

- [GPG入门教程](http://www.ruanyifeng.com/blog/2013/07/gpg.html)   

- [使用 GnuPG 实现电子邮件加密和数字签名——PGP 30分钟简明教程(1)](http://archboy.org/2013/04/18/gnupg-pgp-encrypt-decrypt-message-and-email-and-digital-signing-easy-tutorial/)  

- [Gnu 隐私卫士 (GnuPG) 袖珍 HOWTO (中文版)](https://www.gnupg.org/howtos/zh/index.html "官网HOWTO文档")

- [RSA算法原理（一）](http://www.ruanyifeng.com/blog/2013/06/rsa_algorithm_part_one.html)   



GitHub中可以使用gpg key进行Signing commits using GPG和Signing Tags using GPG这两项操作。

**注意：在GitHub中使用的gpg key的邮件地址必须是经过GitHub认证过的邮箱地址**。
Your GPG key must be associated with a GitHub verified email that matches your committer identity.



> Tips小贴士:
>
>To set all commits for a repository to be signed by default, in Git versions 2.0.0 and above, run `git config commit.gpgsign true`. To set all commits in any local repository on your computer to be signed by default, run `git config --global commit.gpgsign true`.
>
>To store your GPG key passphrase so you don't have to enter it every time you sign a commit, we recommend using the following tools:
>
>For Mac users, the GPG Suite allows you to store your GPG key passphrase in the Mac OS Keychain.
>For Windows users, the Gpg4win integrates with other Windows tools.
>You can also manually configure gpg-agent to save your GPG key passphrase, but this doesn't integrate with Mac OS Keychain like ssh-agent and requires more setup.



与SSH一样，GPG也有 gpg-agent。



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


## gpg key用途

### 加密

#### 解密


### 签名

#### 验证签名


### 加密并签名


