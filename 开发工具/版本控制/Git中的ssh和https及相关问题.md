## Git中SSH和HTTPS协议的使用



访问远程仓库时可以选择 SSH 或者 HTTPS 协议进行访问。

(比如，与gitlab 远程仓库进行进行安全认证可选择使用ssh或者https)，两者的表现形式：

```
SSH  git@gitlab.com:faner/test01.git
HTTPS  https://gitlab.com/faner/test01.git
```


当你选择HTTPS时，会看到它有下面的一段提示"Create a personal access token on your account to pull or push via Https"简单的翻译一下就是"在您的帐户上**创建个人访问令牌**，以通过Https进行pull或push"，并且在你第一次将本地仓库push到远程仓库时会要求你输入gitlab的用户名和密码。

在一次错误中发现了这个问题：由于我的ssh的config文件出现配置错误，当我选择`git@gitlab.com:faner/test01.git`时提示有有误，我就尝试使用了https的`https://gitlab.com/faner/test01.git`路径，之后就让我输入密码并成功连接。



> 从用户操作上来看，HTTPS需要用户输入远程仓库的用户名和密码，比如需要输入gitlab的帐号和密码；SSH无需输入用户和密码。





### 路径错误



> 错误内容：
>
> ```
> $ git push -u origin --all
> /c/Users/Fan/.ssh/config line 4: garbage（垃圾） at end of line; "Dean/.ssh/github_rsa.pub".
> fatal: Could not read from remote repository.
> 
> Please make sure you have the correct access rights
> and the repository exists.
> ```
> 错误原因是在我的Windows中，ssh配置文件中的路径`/c/Users/Fan/.ssh/config`包含空格，需要使用`""包含路径`，改成如下形式`"/c/Users/Fan/.ssh/config"`



尝试通过SSH进行身份验证时，您可能会看到以下错误消息 ：

当尝试使用Git并通过SSH协议进行 clone, push,或 pull时，如果Bitbucket无法使用SSH agent提供的密钥进行身份验证，则可能会收到下面的某一条消息：

- Permission denied (publickey)
- No suitable response from remote 
- repository access denied 

可能的原因：

- 在Linux中，你不应该使用`sudo`进行上述操作，因为 ssh-agent 是在用户级别运行而非root级别运行。

- 你的 公钥 并没有添加到服务器端。

- 您的密钥未加载到ssh agent中 。（如果您的SSH代理不知道为Bitbucket提供密钥，则连接将失败。如果您最近重新启动了系统，则可能会遇到此问题。 ）解决方法：

  - 检查相应的 ssh key 是否被加载：

    ```
    ssh-add -l
    ```

  - 如果没有被加载，则使用下面的命令加载私钥

    ```shell
    #后面可以同时跟多个私钥
    ssh-add ~/.ssh/<private_key_file>  
    ```

  - 如果提示 "Could not open a connection to your authentication agent." 说明你的ssh agent并没有运行；使用下面的命令运行ssh agent，再使用`ssh-add`命令添加你的ssh key。

    ```shell
    # macOS/Linux
    $ eval `ssh-agent`
    
    # Windows
    $ eval $(ssh-agent) 
    ```

    

  还有个注意点，就是不要同时运行多个 ssh agent，可通过任务管理器或 `ps`命令进行查看。



下面两个命令的区别：第一个是后台运行ssh-agent，第二个是。

```
eval $(ssh-agent) 
```

```
$ ssh-agent /bin/bash
# 或
$ ssh-agent bash
```









### Permission denied (publickey)





> 之后遇到了第二个问题：Permission denied (publickey)
>
> ```shell
> Fan@Fan-ASUS-DT MINGW64 /d/新建文件夹/Test (master)
> $ git push -u origin master
> Warning: Permanently added the RSA host key for IP address '52.167.219.168' to the list of known hosts.
> Enter passphrase for key 'C:/Users/Fan/.ssh/github.pub':
> Permission denied (publickey).
> fatal: Could not read from remote repository.
> 
> Please make sure you have the correct access rights
> and the repository exists.
> 
> Fan@Fan-ASUS-DT MINGW64 /d/新建文件夹/Test (master)
> $ ssh -T git@github.com
> The authenticity of host 'github.com (13.250.177.223)' can't be established.
> RSA key fingerprint is SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.
> Are you sure you want to continue connecting (yes/no)? yes
> Warning: Permanently added 'github.com,13.250.177.223' (RSA) to the list of known hosts.
> Enter passphrase for key 'C:/Users/Fan/.ssh/github_rsa.pub':
> Permission denied (publickey).
> ```
> 解决方法：
>
> ssh准备连接远程服务器却遭提示” Permission denied (publickey) “, 这是由于您没有将公钥( publickey ) 添加到本地 ssh 环境造成的，或者是由于多日未进行ssh 登录操作，本地 publickey 失效造成的。我的mac os x 环境隔几天没有登录ssh 就会报 “Permission denied ” 啦。只要 使用 ssh-add 命令再次添加一下公钥即可。 [Permission denied (publickey). - CSDN博客](https://blog.csdn.net/blog_jihq/article/details/78523513 "Permission denied (publickey). - CSDN博客")
>
> ```shell
> # 这里需要是私钥
> $ ssh-add ~/.ssh/id_rsa
> ```
>





### Could not open a connection to your authentication agent.



> 但是当我执行ssh-add命令后又出现下面的问题：Could not open a connection to your authentication agent.
>
> 解决方法：[git:could not open a connection to your authentication agent问题的解决（重新绑定私钥） - CSDN博客 ](https://blog.csdn.net/lizhikang2009/article/details/52188607 "git:could not open a connection to your authentication agent问题的解决(重新绑定私钥) - CSDN博客") 执行如下命令即可：
>
> ```shell
> ssh-agent bash
> ```
>
> 然后在执行上面的 `ssh-add`命令。
>
> 由于我是直接将Linux中的.ssh文件夹复制到Windows下，并且在Git Bash中进行上述操作（ssh应该是安装git时git自带的），然后就出现了上面一系列的问题。



**测试连接：**

```shell
$ ssh -T git@github.com
```



显示调试信息`-v`：

```shell
$ ssh -T -v git@github.com
```





### ssh agent



ssh-agent是一种控制用来保存公钥身份验证所使用的私钥的程序，其实ssh-agent就是一个密钥管理器，运行ssh-agent以后，使用ssh-add将私钥交给ssh-agent保管，其他程序需要身份验证的时候可以将验证申请交给ssh-agent来完成整个认证过程。 



在linux中，后台运行ssh-agent：

```
eval "$(ssh-agent -s)"
```

在Windows中，后台运行ssh-agent：

```
eval $(ssh-agent)
```



添加生成的 SSH key 到 ssh-agent

```
 $ ssh-add ~/.ssh/id_rsa
```





git for windows 的 cmd文件夹下的 start-ssh-agent.cmd 又该如何使用？





[git-ssh 配置和使用 - fedl - SegmentFault 思否](https://segmentfault.com/a/1190000002645623 "git-ssh 配置和使用 - fedl - SegmentFault 思否")

[Connect to your Git repos with SSH | Microsoft Docs](https://docs.microsoft.com/en-us/vsts/git/use-ssh-keys-to-authenticate "Connect to your Git repos with SSH | Microsoft Docs") 这篇文章中开头有如下内容（应该只是只git中ssh url发生了改变吧）：

SSH URLs have changed. Old SSH URLs will continue to work through December 1, 2017. If you have already set up SSH, you will need to update your remote URLs:

- Verify which remotes are using SSH by running `git remote -v` in your Git client.
- Visit your repository on the web and select the **Clone** button in the upper right.
- Select **SSH** and copy the new SSH URL.
- In your Git client, run: `git remote set-url <remote name, e.g. origin> <new SSH URL>`. Alternatively, in Visual Studio, go to **Repository Settings**, and edit your remotes.





[windows设置ssh-agent - CSDN博客](https://blog.csdn.net/zhujunhua_2010/article/details/55253483 "windows设置ssh-agent - CSDN博客")








## 添加远程仓库

### Command line instructions

Git global setup

```
git config --global user.name "Fan"
git config --global user.email "fan@gmail.com"
```

Create a new repository

```
git clone https://gitlab.com/faner/itheima01.git
cd itheima01
touch README.md
git add README.md
git commit -m "add README"
git push -u origin master
```

Existing folder

```
cd existing_folder
git init
git remote add origin https://gitlab.com/faner/itheima01.git
git add .
git commit -m "Initial commit"
git push -u origin master
```

Existing Git repository

```
cd existing_repo
git remote rename origin old-origin
git remote add origin https://gitlab.com/faner/itheima01.git
git push -u origin --all
git push -u origin --tags
```



### 严重问题

```
.ssh/config line 3: Unsupported option "rsaauthentication"
Load key "C:/Users/Fan/.ssh/GitHub_rsa.pub": invalid format
git@github.com: Permission denied (publickey).
fatal: Could not read from remote repository
```



**two different public key formats：** 

[git - key_load_public: invalid format - Stack Overflow](https://stackoverflow.com/questions/42863913/key-load-public-invalid-format "git - key_load_public: invalid format - Stack Overflow")   **two different public key formats** 

这里说，有两种格式的公钥，一种是 putty 生成的，一种是 Openssh生成的，但是之前使用 git bash时是没有问题的，后来使用了 cmder 后就就出现了问题。

public key 格式可以转换。

- OpenSSH Private Key （**我的key一直就是这种格式**）

  ```
  ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAhl/CNy9wI1GVdiHAJQV0CkHnMEqW7+Si9WYFi2fSBrsGcmqeb5EwgnhmTcPgtM5ptGBjUZR84nxjZ8SPmnLDiDyHDPIsmwLBHxcppY0fhRSGtWL5fT8DGm9EfXaO1QN8c31VU/IkD8niWA6NmHNE1qEqpph3DznVzIm3oMrongEjGw7sDP48ZTZp2saYVAKEEuGC1YYcQ1g20yESzo7aP70ZeHmQqI9nTyEAip3mL20+qHNsHfW8hJAchaUN8CwNQABJaOozYijiIUgdbtSTMRDYPi7fjhgB3bA9tBjh7cOyuU/c4M4D6o2mAVYdLAWMBkSoLG8Oel6TCcfpO/nElw== github-example-key
  ```

  

- `.ppk` (PuTTY Private Key) 

  ```
  ---- BEGIN SSH2 PUBLIC KEY ----
  Comment: "github-example-key"
  AAAAB3NzaC1yc2EAAAABJQAAAQEAhl/CNy9wI1GVdiHAJQV0CkHnMEqW7+Si9WYF
  i2fSBrsGcmqeb5EwgnhmTcPgtM5ptGBjUZR84nxjZ8SPmnLDiDyHDPIsmwLBHxcp
  pY0fhRSGtWL5fT8DGm9EfXaO1QN8c31VU/IkD8niWA6NmHNE1qEqpph3DznVzIm3
  oMrongEjGw7sDP48ZTZp2saYVAKEEuGC1YYcQ1g20yESzo7aP70ZeHmQqI9nTyEA
  ip3mL20+qHNsHfW8hJAchaUN8CwNQABJaOozYijiIUgdbtSTMRDYPi7fjhgB3bA9
  tBjh7cOyuU/c4M4D6o2mAVYdLAWMBkSoLG8Oel6TCcfpO/nElw==
  ---- END SSH2 PUBLIC KEY ----
  ```

  

排除上面的可能性。

[key_load_public: invalid format with scp or git clone on Ubuntu 15.10 - Ask Ubuntu](https://askubuntu.com/questions/698997/key-load-public-invalid-format-with-scp-or-git-clone-on-ubuntu-15-10 "key_load_public: invalid format with scp or git clone on Ubuntu 15.10 - Ask Ubuntu")

The public part is probably corrupted, so you can recreate it from private one using this command:

```
ssh-keygen -f ~/.ssh/id_rsa -y > ~/.ssh/id_rsa.pub
```

试用了上面的方法还是不行。



**解决过程：**

配置文件内容：

```
Host github.com
RSAAuthentication yes
# 注意下面的路径中的空格需使用引号包含，不能使用\转义，那是Linux中的做法
IdentityFile "C:/Users/Fan/.ssh/GitHub_rsa.pub"
```



查看调试内容：

```shell
$ ssh -T git@github.com
/c/Users/Fan/.ssh/config line 7: Unsupported option "rsaauthentication"
/c/Users/Fan/.ssh/config line 24: Unsupported option "rsaauthentication"
/c/Users/Fan/.ssh/config line 30: Unsupported option "rsaauthentication"
/c/Users/Fan/.ssh/config line 36: Unsupported option "rsaauthentication"
debug1: Connecting to github.com [192.30.253.112] port 22.
debug1: Connection established.
debug1: identity file C:/Users/Fan/.ssh/github_rsa.pub type 0
debug1: key_load_public: No such file or directory
debug1: identity file C:/Users/Fan/.ssh/github_rsa.pub-cert type -1
debug1: Local version string SSH-2.0-OpenSSH_7.7
debug1: Remote protocol version 2.0, remote software version libssh_0.7.0
debug1: no match: libssh_0.7.0
debug1: Authenticating to github.com:22 as 'git'
debug1: SSH2_MSG_KEXINIT sent
debug1: SSH2_MSG_KEXINIT received
debug1: kex: algorithm: curve25519-sha256@libssh.org
debug1: kex: host key algorithm: ssh-rsa
debug1: kex: server->client cipher: aes128-ctr MAC: hmac-sha2-256 compression: n                                                                    one
debug1: kex: client->server cipher: aes128-ctr MAC: hmac-sha2-256 compression: n                                                                    one
debug1: expecting SSH2_MSG_KEX_ECDH_REPLY
debug1: Server host key: ssh-rsa SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5                                                                    SY8
debug1: Host 'github.com' is known and matches the RSA host key.
debug1: Found key in /c/Users/Fan/.ssh/known_hosts:5
debug1: rekey after 4294967296 blocks
debug1: SSH2_MSG_NEWKEYS sent
debug1: expecting SSH2_MSG_NEWKEYS
debug1: SSH2_MSG_NEWKEYS received
debug1: rekey after 4294967296 blocks
debug1: SSH2_MSG_SERVICE_ACCEPT received
debug1: Authentications that can continue: publickey
debug1: Next authentication method: publickey
debug1: Offering public key: RSA SHA256:GcK7ORvFzH6fzA7qPmnzBr1DOWho5cCVgIpLkh6V                                                                    Gb8 C:/Users/Fan/.ssh/github_rsa.pub
debug1: Server accepts key: pkalg ssh-rsa blen 535
Load key "C:/Users/Fan/.ssh/github_rsa.pub": invalid format
debug1: No more authentication methods to try.
git@github.com: Permission denied (publickey).
```



对于下面的提示，在config文件中取消`rsaauthentication`的选项（可以忽略该提示）：

```
.ssh/config line 3: Unsupported option "rsaauthentication"
```

> 可以忽略该提示，不影响最终连接。





然后再查看调试内容：

```shell
$ ssh -T -v git@github.com
OpenSSH_7.7p1, OpenSSL 1.0.2o  27 Mar 2018
debug1: Reading configuration data /c/Users/Fan/.ssh/config
debug1: /c/Users/Fan/.ssh/config line 6: Applying options for github.com
debug1: Reading configuration data /etc/ssh/ssh_config
debug1: Connecting to github.com [192.30.253.112] port 22.
debug1: Connection established.
debug1: identity file C:/Users/Fan/.ssh/github_rsa.pub type 0
debug1: key_load_public: No such file or directory
debug1: identity file C:/Users/Fan/.ssh/github_rsa.pub-cert type -1
debug1: Local version string SSH-2.0-OpenSSH_7.7
debug1: Remote protocol version 2.0, remote software version libssh_0.7.0
debug1: no match: libssh_0.7.0
debug1: Authenticating to github.com:22 as 'git'
debug1: SSH2_MSG_KEXINIT sent
debug1: SSH2_MSG_KEXINIT received
debug1: kex: algorithm: curve25519-sha256@libssh.org
debug1: kex: host key algorithm: ssh-rsa
debug1: kex: server->client cipher: aes128-ctr MAC: hmac-sha2-256 compression: none
debug1: kex: client->server cipher: aes128-ctr MAC: hmac-sha2-256 compression: none
debug1: expecting SSH2_MSG_KEX_ECDH_REPLY
debug1: Server host key: ssh-rsa SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8
debug1: Host 'github.com' is known and matches the RSA host key.
debug1: Found key in /c/Users/Fan/.ssh/known_hosts:5
debug1: rekey after 4294967296 blocks
debug1: SSH2_MSG_NEWKEYS sent
debug1: expecting SSH2_MSG_NEWKEYS
debug1: SSH2_MSG_NEWKEYS received
debug1: rekey after 4294967296 blocks
debug1: SSH2_MSG_SERVICE_ACCEPT received
debug1: Authentications that can continue: publickey
debug1: Next authentication method: publickey
debug1: Offering public key: RSA SHA256:GcK7ORvFzH6fzA7qPmnzBr1DOWho5cCVgIpLkh6VGb8 C:/Users/Fan/.ssh/github_rsa.pub
debug1: Server accepts key: pkalg ssh-rsa blen 535
Load key "C:/Users/Fan/.ssh/github_rsa.pub": invalid format
debug1: No more authentication methods to try.
git@github.com: Permission denied (publickey).
```



执行下面两条命令：

```
$ ssh-agent bash
$ ssh-add "C:/Users/Fan/.ssh/github_rsa"
```

继续调试：

```
Fan@DESKTOP-HPTG5F6 MINGW64 ~/Documents/fandean.github.io (master)
$ ssh -T -v git@github.com
OpenSSH_7.7p1, OpenSSL 1.0.2o  27 Mar 2018
debug1: Reading configuration data /c/Users/Fan/.ssh/config
debug1: /c/Users/Fan/.ssh/config line 6: Applying options for github.com
/c/Users/Fan/.ssh/config line 7: Unsupported option "rsaauthentication"
debug1: Reading configuration data /etc/ssh/ssh_config
debug1: Connecting to github.com [192.30.253.112] port 22.
debug1: Connection established.
debug1: identity file C:/Users/Fan/.ssh/github_rsa.pub type 0
debug1: key_load_public: No such file or directory
debug1: identity file C:/Users/Fan/.ssh/github_rsa.pub-cert type -1
debug1: Local version string SSH-2.0-OpenSSH_7.7
debug1: Remote protocol version 2.0, remote software version libssh_0.7.0
debug1: no match: libssh_0.7.0
debug1: Authenticating to github.com:22 as 'git'
debug1: SSH2_MSG_KEXINIT sent
debug1: SSH2_MSG_KEXINIT received
debug1: kex: algorithm: curve25519-sha256@libssh.org
debug1: kex: host key algorithm: ssh-rsa
debug1: kex: server->client cipher: aes128-ctr MAC: hmac-sha2-256 compression: none
debug1: kex: client->server cipher: aes128-ctr MAC: hmac-sha2-256 compression: none
debug1: expecting SSH2_MSG_KEX_ECDH_REPLY
debug1: Server host key: ssh-rsa SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8
debug1: Host 'github.com' is known and matches the RSA host key.
debug1: Found key in /c/Users/Fan/.ssh/known_hosts:5
debug1: rekey after 4294967296 blocks
debug1: SSH2_MSG_NEWKEYS sent
debug1: expecting SSH2_MSG_NEWKEYS
debug1: SSH2_MSG_NEWKEYS received
debug1: rekey after 4294967296 blocks
debug1: SSH2_MSG_SERVICE_ACCEPT received
debug1: Authentications that can continue: publickey
debug1: Next authentication method: publickey
debug1: Offering public key: RSA SHA256:GcK7ORvFzH6fzA7qPmnzBr1DOWho5cCVgIpLkh6VGb8 C:/Users/Fan/.ssh/github_rsa.pub
debug1: Server accepts key: pkalg ssh-rsa blen 535
debug1: Authentication succeeded (publickey).
Authenticated to github.com ([192.30.253.112]:22).
debug1: channel 0: new [client-session]
debug1: Entering interactive session.
debug1: pledge: network
debug1: client_input_channel_req: channel 0 rtype exit-status reply 0
Hi fan! You've successfully authenticated, but GitHub does not provide shell access.
debug1: channel 0: free: client-session, nchannels 1
Transferred: sent 3328, received 2032 bytes, in 0.6 seconds
Bytes per second: sent 5300.3, received 3236.2
debug1: Exit status 1
```

可以看到：

```
Hi fan! You've successfully authenticated, but GitHub does not provide shell access.

debug1: Exit status 1
```

连接成功。





### ssh config配置文件详解

```
Host *
选项“Host”只对能够匹配后面字串的计算机有效。“*”表示所有的计算机。

ForwardAgent no
“ForwardAgent”设置连接是否经过验证代理（如果存在）转发给远程计算机。

ForwardX11 no
“ForwardX11”设置X11连接是否被自动重定向到安全的通道和显示集（DISPLAY set）。

RhostsAuthentication no
“RhostsAuthentication”设置是否使用基于rhosts的安全验证。

RhostsRSAAuthentication no
“RhostsRSAAuthentication”设置是否使用用RSA算法的基于rhosts的安全验证。

RSAAuthentication yes
“RSAAuthentication”设置是否使用RSA算法进行安全验证。

PasswordAuthentication yes
“PasswordAuthentication”设置是否使用口令验证。

FallBackToRsh no
“FallBackToRsh”设置如果用ssh连接出现错误是否自动使用rsh。

UseRsh no
“UseRsh”设置是否在这台计算机上使用“rlogin/rsh”。

BatchMode no
“BatchMode”如果设为“yes”，passphrase/password（交互式输入口令）的提示将被禁止。当不能交互式输入口令的时候，这个选项对脚本文件和批处理任务十分有用。

CheckHostIP yes
“CheckHostIP”设置ssh是否查看连接到服务器的主机的IP地址以防止DNS欺骗。建议设置为“yes”。

StrictHostKeyChecking no
“StrictHostKeyChecking”如果设置成“yes”，ssh就不会自动把计算机的密匙加入“$HOME/.ssh/known_hosts”文件，并且一旦计算机的密匙发生了变化，就拒绝连接。

IdentityFile ~/.ssh/identity
“IdentityFile”设置从哪个文件读取用户的RSA安全验证标识。

Port 22
“Port”设置连接到远程主机的端口。

Cipher blowfish
“Cipher”设置加密用的密码。

EscapeChar ~
“EscapeChar”设置escape字符。
```







### ssh相关命令















### SSH服务器使用非标准port时的解决办法



> 这里是对于自建的git服务



sshd使用标准的port: 

```shell
$ git remote add origin git@localhost:TestGroup/Test.git
```



sshd使用非标端口时的方法: 

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
# 最终原因： 是使用git协议有问题，而使用http则可以

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

**最终原因：** 是GitHub使用git协议有问题，而使用http则可以。



