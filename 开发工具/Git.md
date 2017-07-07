# Git

标签（空格分隔）： 开发工具

---

> 使用git协议总是无法操作远程仓库；但是使用https协议可以。

> Linux上推荐的git图形工具: `sudo apt install git-cola`


## Git学习
可参考：

网上教程：       
- 阮一峰的github上的git相关文章
- [廖雪峰的Git教程](http://www.liaoxuefeng.com/)  
- 《Pro Git》、《GitHub入门与实践》、《Git权威指南》
- [Learn Git Branching](http://learngitbranching.js.org/)非常好的在线练习网站，可选择中文版。以此网站为基础进行学习。

- [手把手教你使用Git](http://blog.jobbole.com/78960/)；该篇文章讲解了日常需要用到的操作，特别是多人协作部分。  


![](http://www.ruanyifeng.com/blogimg/asset/2015/bg2015120901.png)

## 几个常用命令
> 更多命令见后面的： Git指令速查表
>
> 或
>
> [常用 Git 命令清单 - 阮一峰的网络日志](http://www.ruanyifeng.com/blog/2015/12/git-cheat-sheet.html "常用 Git 命令清单 - 阮一峰的网络日志")

查看git的某个命令的帮助


### git commit
对于小的提交，可以一步完成git add和git commit，利用-a选项即可，比如：
```
git commit -am "一次add加commit"

# 签署提交(使用gpg key) 使用 -S 选项
git commit -S -m 'signed commit签署提交'
```

修改上一次提交信息：  
```
git commit --amend
```
使用--amend参数后，会打开配置文件中设置的文本编辑器，让你修改提交信息。


在Android Studio中使用GPG对提交进行签名，见 PGP加密与GPG软件，或 [Signed commits · Wiki · akwizgran / briar · GitLab](https://code.briarproject.org/akwizgran/briar/wikis/signed-commits "Signed commits · Wiki · akwizgran / briar · GitLab")


该方法是对某工程设置 Signed commits，在该工程中的所有提交都使用GPG签名的方法。也可尝试在git的全局配置文件中进行配置，以用于所有提交。



### git log

```
//以图表形式查看分支
git log --graph
//精简显示...
git log –pretty=oneline
```

git log 只能查看以当前状态**为终点**的历史日志。

git reflog 可查看当前仓库的操作日志。


### git checkout切换分支
```
//创建并切换分支
git checkout -b 分支名称
//切换回上一个分支
git checkout -
```

利用git checkout撤销某文件的修改：
```
git checkout -- filename
/*
此时会有两种情况
1. 该文件还没有放入暂存区；此时撤销后内容与版本库中一样
2. 该文件已经放入暂存区；此时撤销后内容与添加到暂存区中时的一样
*/
```


利用git checkout 分离HEAD
```
git checkout 231333head
```


### git merge合并
```
//创建合并提交。在合并的时候进行提交  --no-ff
git merge --no-ff 要合并进来的分支名称
```


**合并冲突：**  



### git reset回溯

只要提供目标时间点的哈希值，即可进行回溯至该时间点的状态（包括：HEAD、暂存区、当前工作树）

git reset有多个模式，其中--herd是模式之一，另还有默认的--mixed(不改变当前工作树)；详见：git help reset

```
//回溯到 哈希值 指定的时间点
git reset --herd 某哈希值如82b9b79
//回溯到上一个版本
git reset --herd HEAD^
//回溯到上上一个版本，可以一直加 ^
git reset --herd HEAD^^
//回溯5个版本， 用 ~5 
git reset --herd HEAD~5
```



### git remote add 添加远程库

```
git remote add origin http://127.0.0.1:8081/TestGroup/Test.git
```

使用`git remote add`将路径中的仓库设置为本地仓库的远程仓库；并将远程仓库的名称(别名)设置为 origin （默认就是这个名称）


### git push 推送到远程仓库  
```
//在上一条命令的基础上(第一次push)
git push -u origin master
//之后的push: 上传本地指定分支到远程仓库
git push [remote] [branch]
```
将当前分支内容推送给远程仓库origin的master分支。`-u`将origin仓库的master分支设置为本地仓库当前分支的upstream(上游)。

### git clone 获取远程仓库
```
git clone https://github.com/github-book/git-tutorial.git
```

执行该命令后，我们默认是处于master分支（**只**获取了master分支），同时系统会自动将origin设置成该远程仓库的标识符。

`git branch -a` 同时查看本地和远程仓库的分支信息。


**之后**再获取其他分支的命令：
```
//获取远程仓库的feature-D分支
// -b 选项设置本地仓库中的对应分支名称也为 feature-D
git checkout -b feature-D origin/feature-D
```

### git pull 获取最新的远程仓库分支


```
//基于之前的命令
git pull origin feature-D
```



> [What is the difference between 'git pull' and 'git fetch'? - Stack Overflow](https://stackoverflow.com/questions/292357/what-is-the-difference-between-git-pull-and-git-fetch "What is the difference between 'git pull' and 'git fetch'? - Stack Overflow")



## 多人协作

多人协作工作模式一般是这样的：

- 首先，可以试图用git push origin branch-name推送自己的修改.  
- 如果推送失败，则因为远程分支比你的本地更新早，需要先用git pull试图合并。  
- 如果合并有冲突，则需要解决冲突，并在本地提交。再用git push origin branch-name推送。   




## Git相关概念
> 见《Pro Git》第1章：Git起步，git基础 （必看），讲述了需要理解的Git概念。第3章：Git分支， 分支简介 （必看）。 第10章：Git内部原理。

> 另见《Git权威指南》


### Git起步：Git基础

**这些概念是理解Git的思想和基本工作原理的关键**  

#### 直接记录快照，而非差异比较
比较下面两个图：   

![存储每个文件与初始版本的差异](https://git-scm.com/book/en/v2/images/deltas.png)  
 图1：↑ 其它VCS存储每个文件与*初始版本*的*差异*


![Git存储项目随时间改变的快照.png](https://ooo.0o0.ooo/2017/03/27/58d90dc38c54a.png)
图2：↑ Git存储项目随时间改变的*快照*.(此图片在黑色背景显示效果更好，但是托管网站可能倒闭)

```
图2的另一个链接：   
![Git存储项目随时间改变的快照](https://i.imgur.com/bT1YwGe.png "不见图需FQ")    
```

每次你提交更新,或在 Git 中保存项目状态时,
它主要对当时的全部文件制作一个快照并保存这个快照的索引。    
为了高效,如果文件没有修改,Git 不再重新存储该文件,而是只保留一个*链接*指向之前存储的文件 （图中的虚线部分体现了这一点；图中文件A的几个版本分别为 A、A1、A2，其它文件以此类推）。

>Git更像是一个小型的文件系统。


#### Git保证完整性
Git 中所有数据在**存储前**都计算校验和,然后**以校验和来引用**。 这意味着不可能在 Git 不知情时更改任何文件内容或目录内容。   

若你在传送过程中丢失信息或损坏文件，Git就能发现。（猜测：再次计算文件的hash值与之前保存的进行对比）

> Git 数据库中保存的信息都是以文件内容的**哈希值来索引**,而不是文件名。



#### Git一般只添加数据
你执行的 Git 操作,几乎只往 Git 数据库中增加数据。 很难让 Git 执行任何不可逆操作,或者让它以任何方式清除数据。

未提交的更新是有可能丢失或弄乱修改的内容；但是一旦你提交快照到Git中，就难以再丢失数据，特别是如果你定期推送到其它远程仓库的话。




#### 三种状态
Git有三种状态，你的(已跟踪的)文件可能处于其中之一：  
- 已提交（Committed）：数据已经安全的保存在本地数据库中。
- 已修改（modified）：修改了文件，但还没有保存到数据库中。
- 已暂存（staged）：对一个已经修改的文件的当前版本做了标记，使之包含在下次提交的快照中。


又此引入的三个工作区域的概念：   
- Git仓库：用来保存项目的元数据和对象数据库。克隆仓库时，拷贝的就是这里的数据。即`.git`目录。
- 工作目录：是对项目的某个版本独立提取出来的内容。
- 暂存区域：**是一个文件**，保存了下次将提交的文件列表信息。有时也叫作"索引"

![](https://git-scm.com/book/en/v2/images/areas.png)



---

Git

### Git暂存区
Git暂存区是Git中最重要的一个概念。  

结合.git目录结构学习。 HEAD在.git目录中也是一个文件，它默认指示当前被检出的分支。  

在版本库(`.git`目录)中有一个index文件。该文件实际上就是一个包含文件索引的目录树，像是一个虚拟的工作区。在这个虚拟工作区的目录树中，记录了文件名和文件的状态信息（时间戳和文件长度等）；文件的内容并没有存储在其中，而是保存在Git对象库 `.git/objects/`目录中，文件索引建立了文件和对象库中对象实体之间的对应。  



![工作区、版本库、暂存区原理图](https://i.imgur.com/15aITTg.png "不见图？需FQ")  
图：工作区、版本库、暂存区原理   

图中：  
- index的区域指暂存区，标记为master的是master分支所代表的目录树
- 图中，此时HEAD实际是指向master分支的一个”游标“，所以图示的命令中出现HEAD的地方可以用master来替换。
- objects为git的对象库，实际位于`.git/objects/`

> 该部分内容来自《Git权威指南》


git diff与版本库的关系：

![enter image description here](https://i.imgur.com/mLIyjFW.png)



未完， 。。。  继续看本节介绍的书中相关章节



### Git对象




### 分离HEAD
在网站Learn Git Branching上理解"分离HEAD"。

分离 HEAD 就是让其指向一个提交记录而不是分支名。

网站原话：  
我们首先看一下"HEAD". HEAD 是当前提交记录的符号名称 -- 其实就是你正在其基础进行工作的提交记录。

HEAD 总是指向最近一次提交记录，表现为当前工作树。大多数修改工作树的 Git 命令都开始于改变 HEAD 指向。

HEAD 通常指向分支名（比如 bugFix）。你提交时，改变了 bugFix 的状态，这一变化通过 HEAD 变得可见。


分离 HEAD 就是让其指向一个提交记录而不是分支名。这是命令执行之前的样子：

HEAD -> master -> C1

`git checkout C1`  

现在变成了：  HEAD -> C1  






## Git分支

### 分支简介



### 变基(rebase)











## Git最佳实践

> 使用Git的规范  


**版本控制最佳实践：**  
[Git指令速查表 & 版本控制最佳实践](https://www.git-tower.com/learn/cheat-sheets/git-cn)  

![](https://www.git-tower.com/learn/content/02-cheat-sheets/git-cn/git-cheat-sheet-large01-cn.png)  
![](https://www.git-tower.com/learn/content/02-cheat-sheets/git-cn/git-cheat-sheet-large02-cn.png)



**最佳实践：分支管理**   
[Git 最佳实践：分支管理](http://blog.jobbole.com/109466/)   
![](http://legendtkl.com/img/uploads/2016/git-model.png)    
从上图可以看到主要包含下面几个分支：   

- master: 主分支，主要用来版本发布。  
- develop：日常开发分支，该分支正常保存了开发的最新代码。  
- feature：具体的功能开发分支，只与 develop 分支交互。  
- release：release 分支可以认为是 master 分支的未测试版。比如说某一期的功能全部开发完成，那么就将 develop 分支合并- 到 release 分支，测试没有问题并且到了发布日期就合并到 master 分支，进行发布。
- hotfix：线上 bug 修复分支。




-------------------------------------



## git安装记录和配置问题

### Git安装后的配置
- 配置ssh key、gpg key见相关笔记  
- [多个GitHub账号的SSH KEY切换](http://stormzhang.com/other/2013/10/16/github-multiply-ssh-key/)

gitignore:  
 gitignore文件的配置，见.gitignore_global配置文件。

If you already have a file checked in, and you want to ignore it, Git will not ignore the file if you add a rule later. In those cases, you must untrack the file first, by running the following command in your terminal:
```
$ git rm --cached FileName
```



> 现在升级到ubuntu 16.04，不必在编译安装了



下次升级Git使用如下命令即可：  

```shell
git clone git://git.kerenl.org/pub/scm/git/git.git /tmp  
cd /tmp/git
make prefix=/usr all doc info 
sudo prefix=/usr install install-doc install-html install-info
```




安装参考：  
[Pro Git 第2版](https://git-scm.com/book/zh/v2)  
[从GitHub克隆的文件夹下的INSTALL文件](https://github.com/git/git/blob/master/INSTALL)  
[安装及安装后不能补全的介绍](https://www.ldsink.com/archives/ubuntu-compile-and-install-git.html)  

配置参考：  
[Git的中文支持](https://www.ldsink.com/archives/ubuntu-compile-and-install-git.html) 

在使用`git status`时出现中文显示为八进制字符时，如果是系统是使用UTF-8字符集则使用如下命令：
`git config --global core.quotepath false`



-------------------------------------------------

## 编译安装 git 2.9  记录：  

如果你想从源码安装 Git，需要安装 Git 依赖的库：curl、zlib、openssl、expat，还有libiconv。

```
$ sudo apt-get install libcurl4-gnutls-dev libexpat1-dev gettext \
libz-dev libssl-dev
```

为了能够添加更多格式的文档（如 doc, html, info），你需要安装以下的依赖包 (依赖包太大压缩700M没安装)：

`$ sudo apt-get install asciidoc xmlto docbook2x`

当你安装好所有的必要依赖，你可以继续从几个地方来取得最新发布版本的 tar 包。 你可以从 Kernel.org 网站获取，网址为 https://www.kernel.org/pub/software/scm/git，或从 GitHub 网站上的镜像来获得，网址为 https://github.com/git/git/releases。 通常在 GitHub 上的是最新版本，但 kernel.org 上包含有文件下载签名，如果你想验证下载正确性的话会用到。



实际步骤： 

```shell
$ make configure
$ ./configure --prefix=/usr
$ make all doc info
$ sudo make install install-doc install-html install-info
```

>另可参照下载的git目录中的INSTALL文档中介绍的使用如下命令安装： 
>(注意第二个是使用root身份)If you want to do a global install, you can do

	$ make prefix=/usr all doc info ;# as yourself
	# make prefix=/usr install install-doc install-html install-info ;# as root



有一个依赖关系未满足：  

```shell
[fan 12:09:31]/tmp$ sudo apt-get install libcurl4-gnutls-dev libexpat1-dev gettext \
> libz-dev libssl-dev
正在读取软件包列表... 完成
正在分析软件包的依赖关系树       
正在读取状态信息... 完成       
注意，选取 zlib1g-dev 而非 libz-dev
zlib1g-dev 已经是最新的版本了。
zlib1g-dev 被设置为手动安装。
gettext 已经是最新的版本了。
gettext 被设置为手动安装。
libexpat1-dev 已经是最新的版本了。
libexpat1-dev 被设置为手动安装。
libssl-dev 已经是最新的版本了。
libssl-dev 被设置为手动安装。
有一些软件包无法被安装。如果您用的是 unstable 发行版，这也许是
因为系统无法达到您要求的状态造成的。该版本中可能会有一些您需要的软件
包尚未被创建或是它们已被从新到(Incoming)目录移出。
下列信息可能会对解决问题有所帮助：

下列软件包有未满足的依赖关系：
 libcurl4-gnutls-dev : 依赖: libcurl3-gnutls (= 7.35.0-1ubuntu2.5) 但是 7.35.0-1ubuntu2.6 正要被安装
                       依赖: libgnutls-dev 但是它将不会被安装
                       依赖: libkrb5-dev 但是它将不会被安装
                       依赖: librtmp-dev 但是它将不会被安装
E: 无法修正错误，因为您要求某些软件包保持现状，就是它们破坏了软件包间的依赖关系。
```


之后出现如下几个错误，我直接忽视掉了： 

```
[fan 12:15:47]/tmp/git$ make all doc info
... ... 
make[2]:正在离开目录 `/tmp/git'
    ASCIIDOC git-add.html
/bin/sh: 2: asciidoc: not found
make[1]: *** [git-add.html] 错误 127
make[1]:正在离开目录 `/tmp/git/Documentation'
make: *** [doc] 错误 2
```


```shell
[fan 16:49:09]/tmp/git$ sudo make install install-doc install-info
[sudo] password for fan: 

。。。

make -C Documentation install
make[1]: 正在进入目录 `/tmp/git/Documentation'
make[2]: 正在进入目录 `/tmp/git'
make[2]: “GIT-VERSION-FILE”是最新的。
make[2]:正在离开目录 `/tmp/git'
sed "s|@@MAN_BASE_URL@@|file:///usr/share/doc/git/|" manpage-base-url.xsl.in > manpage-base-url.xsl
    ASCIIDOC git-add.xml
/bin/sh: 2: asciidoc: not found
make[1]: *** [git-add.xml] 错误 127
make[1]:正在离开目录 `/tmp/git/Documentation'
make: *** [install-doc] 错误 2
[fan 16:53:21]/tmp/git$ git --version
git version 2.9.1.275.g75676c8
```

















## GitBook

[GitBook Explore](https://www.gitbook.com/explore?lang=zh)
[GitBook 简明教程](http://www.chengweiyang.cn/gitbook/index.html)
[安装方法](https://toolchain.gitbook.com/setup.html)


GitBook依赖：`NodeJS (v4.0.0 and above is recommended)`
安装Node.js后运行如下语句安装：`npm install gitbook-cli -g`


### [基本使用](http://www.chengweiyang.cn/gitbook/basic-usage/README.html)
gitbook 的基本用法非常简单，基本上就只有两步：

1. 使用 gitbook init 初始化书籍目录
2. 使用 gitbook serve 编译书籍

下面将结合一个非常简单的实例，来介绍 gitbook 的基本用法。

<https://github.com/chengweiv5/gitbook>
