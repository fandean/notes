---
layout: post
title: "update-alternatives"
description: "update-alternatives命令的使用；更改Ubuntu默认程序"
date: 2017-07-22
tags: [Linux命令]
category: Linux
last_updated: 2017-07-30
comments: true
chare: true
---

* Kramdown table of contents
{:toc .toc}



# update-alternatives 命令

## update-alternatives简介

容我引用 [update-alternatives学习笔记](http://blog.csdn.net/HEYUTAO007/article/details/5441482 "update-alternatives学习笔记 - - CSDN博客") 
>  Linux 发展到今天，可用的软件已经非常多了。这样自然会有一些软件的功能大致上相同。例如，同样是编辑器，就有 nvi、vim、emacs、nano，而且我说的这些还只是一部分。大多数情况下，这样的功能相似的软件都是同时安装在系统里的，可以用它们的名称来执行。例如，要执行 vim，只要在终端下输入 vim 并按回车就可以了。不过，有些情况下我们需要用一个相对固定的命令调用这些程序中的一个。例如，当我们写一个脚本程序时，只要写下 editor，而不希望要为“编辑器是哪个”而操心。Debian 提供了一种机制来解决这个问题，而 update-alternatives 就是用来实现这种机制的。  
[update-alternatives学习笔记 - - CSDN博客](http://blog.csdn.net/HEYUTAO007/article/details/5441482 "update-alternatives学习笔记 - - CSDN博客")



`update-alternatives --help` 命令输出：
```
用法：update-alternatives [<选项> ...] <命令>

命令：
  --install <链接> <名称> <路径> <优先级>
    [--slave <链接> <名称> <路径>] ...
                           在系统中加入一组候选项。
  --remove <名称> <路径>   从 <名称> 替换组中去除 <路径> 项。
  --remove-all <名称>      从替换系统中删除 <名称> 替换组。
  --auto <名称>            将 <名称> 的主链接切换到自动模式。
  --display <名称>         显示关于 <名称> 替换组的信息。
  --query <名称>           机器可读版的 --display <名称>.
  --list <名称>            列出 <名称> 替换组中所有的可用候选项。
  --get-selections         列出主要候选项名称以及它们的状态。
  --set-selections         从标准输入中读入候选项的状态。
  --config <名称>          列出 <名称> 替换组中的可选项，并就使用其中
                           哪一个，征询用户的意见。
  --set <名称> <路径>      将 <路径> 设置为 <名称> 的候选项。
  --all                    对所有可选项一一调用 --config 命令。

<链接> 是指向 /etc/alternatives/<名称> 的符号链接。
    (如 /usr/bin/pager)
<名称> 是该链接替换组的主控名。
    (如 pager)
<路径> 是候选项目标文件的位置。（程序的实际路径）
    (如 /usr/bin/less)
<优先级> 是一个整数，在自动模式下，这个数字越高的选项，其优先级也就越高。

选项：
  --altdir <目录>          改变候选项目录。
  --admindir <目录>        设置 statoverride 文件的目录。
  --log <文件>             改变日志文件。
  --force                  就算没有通过自检，也强制执行操作。
  --skip-auto              在自动模式中跳过设置正确候选项的提示
                           (只与 --config 有关)
  --verbose                启用详细输出。
  --quiet                  安静模式，输出尽可能少的信息。不显示输出信息。
  --help                   显示本帮助信息。
  --version                显示版本信息。
```



## 以editor为例来讲解
editor编辑器。一般系统中都会安装有多个具有编辑功能的程序， 比如ed、vi、vim、emacs24 ...


我们这里把 `editor` 称作为一个 `名称` 或者 `name`。

查看editor当前包含的候选项： 
```shell
[fan 10:48:25]~$ update-alternatives --display editor 
editor - 自动模式
  link best version is /usr/bin/vim.basic
 链接目前指向 /usr/bin/vim.basic
  link editor is /usr/bin/editor
  slave editor.1.gz is /usr/share/man/man1/editor.1.gz
  slave editor.fr.1.gz is /usr/share/man/fr/man1/editor.1.gz
  slave editor.it.1.gz is /usr/share/man/it/man1/editor.1.gz
  slave editor.ja.1.gz is /usr/share/man/ja/man1/editor.1.gz
  slave editor.pl.1.gz is /usr/share/man/pl/man1/editor.1.gz
  slave editor.ru.1.gz is /usr/share/man/ru/man1/editor.1.gz
/bin/ed - 优先级 -100
  次要 editor.1.gz：/usr/share/man/man1/ed.1.gz
/bin/nano - 优先级 40
  次要 editor.1.gz：/usr/share/man/man1/nano.1.gz
/usr/bin/code - 优先级 0
/usr/bin/emacs24 - 优先级 0
  次要 editor.1.gz：/usr/share/man/man1/emacs.emacs24.1.gz
/usr/bin/vim.basic - 优先级 60
  次要 editor.1.gz：/usr/share/man/man1/vim.1.gz
  次要 editor.fr.1.gz：/usr/share/man/fr/man1/vim.1.gz
  次要 editor.it.1.gz：/usr/share/man/it/man1/vim.1.gz
  次要 editor.ja.1.gz：/usr/share/man/ja/man1/vim.1.gz
  次要 editor.pl.1.gz：/usr/share/man/pl/man1/vim.1.gz
  次要 editor.ru.1.gz：/usr/share/man/ru/man1/vim.1.gz
/usr/bin/vim.nox - 优先级 40
  次要 editor.1.gz：/usr/share/man/man1/vim.1.gz
  次要 editor.fr.1.gz：/usr/share/man/fr/man1/vim.1.gz
  次要 editor.it.1.gz：/usr/share/man/it/man1/vim.1.gz
  次要 editor.ja.1.gz：/usr/share/man/ja/man1/vim.1.gz
  次要 editor.pl.1.gz：/usr/share/man/pl/man1/vim.1.gz
  次要 editor.ru.1.gz：/usr/share/man/ru/man1/vim.1.gz
/usr/bin/vim.tiny - 优先级 10
  次要 editor.1.gz：/usr/share/man/man1/vim.1.gz
  次要 editor.fr.1.gz：/usr/share/man/fr/man1/vim.1.gz
  次要 editor.it.1.gz：/usr/share/man/it/man1/vim.1.gz
  次要 editor.ja.1.gz：/usr/share/man/ja/man1/vim.1.gz
  次要 editor.pl.1.gz：/usr/share/man/pl/man1/vim.1.gz
  次要 editor.ru.1.gz：/usr/share/man/ru/man1/vim.1.gz
[fan 10:48:43]~$ 
```

涉及到的路径： 

- `/usr/bin/名称`
- `/etc/alternatives/名称`
- 程序实际可执行文件的路径

查看这些路径： 
```shell
[fan 10:48:43]~$ ll /usr/bin/editor 
lrwxrwxrwx 1 root root 24 7月  20 16:42 /usr/bin/editor -> /etc/alternatives/editor*
[fan 10:54:21]~$ ll /etc/alternatives/editor
lrwxrwxrwx 1 root root 18 7月  23 11:11 /etc/alternatives/editor -> /usr/bin/vim.basic*
[fan 10:54:31]~$ ll /usr/bin/vim.basic 
-rwxr-xr-x 1 root root 2.4M 11月 25  2016 /usr/bin/vim.basic*
```



`/var/lib/dpkg/alternatives`目录为管理目录，包含的相关文件就相当于配置文件吧。一个名称占用一个文件。


查看配置文件： `less /var/lib/dpkg/alternatives/editor`

```shell
auto
/usr/bin/editor
editor.1.gz
/usr/share/man/man1/editor.1.gz
editor.fr.1.gz
/usr/share/man/fr/man1/editor.1.gz
editor.it.1.gz
/usr/share/man/it/man1/editor.1.gz
editor.ja.1.gz
/usr/share/man/ja/man1/editor.1.gz
editor.pl.1.gz
/usr/share/man/pl/man1/editor.1.gz
editor.ru.1.gz
/usr/share/man/ru/man1/editor.1.gz

/bin/ed
-100
/usr/share/man/man1/ed.1.gz

/bin/nano
40
/usr/share/man/man1/nano.1.gz

/usr/bin/code
0

/usr/bin/emacs24
0
/usr/share/man/man1/emacs.emacs24.1.gz

/usr/bin/vim.basic
60
/usr/share/man/man1/vim.1.gz
/usr/share/man/fr/man1/vim.1.gz
/usr/share/man/it/man1/vim.1.gz
/usr/share/man/ja/man1/vim.1.gz
/usr/share/man/pl/man1/vim.1.gz
/usr/share/man/ru/man1/vim.1.gz

/usr/bin/vim.nox
40
/usr/share/man/man1/vim.1.gz
/usr/share/man/fr/man1/vim.1.gz
/usr/share/man/it/man1/vim.1.gz
/usr/share/man/ja/man1/vim.1.gz
/usr/share/man/pl/man1/vim.1.gz
/usr/share/man/ru/man1/vim.1.gz

/usr/bin/vim.tiny
10
/usr/share/man/man1/vim.1.gz
/usr/share/man/fr/man1/vim.1.gz
/usr/share/man/it/man1/vim.1.gz
/usr/share/man/ja/man1/vim.1.gz
/usr/share/man/pl/man1/vim.1.gz
/usr/share/man/ru/man1/vim.1.gz
```

### 更改editor的候选项

```shell
[fan 10:48:43]~$ update-alternatives --config editor 
有 7 个候选项可用于替换 editor (提供 /usr/bin/editor)。

  选择       路径              优先级  状态
------------------------------------------------------------
* 0            /usr/bin/vim.basic   60        自动模式
  1            /bin/ed             -100       手动模式
  2            /bin/nano            40        手动模式
  3            /usr/bin/code        0         手动模式
  4            /usr/bin/emacs24     0         手动模式
  5            /usr/bin/vim.basic   60        手动模式
  6            /usr/bin/vim.nox     40        手动模式
  7            /usr/bin/vim.tiny    10        手动模式

要维持当前值[*]请按<回车键>，或者键入选择的编号：1
update-alternatives: 使用 /bin/ed 来在手动模式中提供 /usr/bin/editor (editor)
update-alternatives: 错误: 新建符号链接 /etc/alternatives/editor.dpkg-tmp 时出错: 权限不够 （需添加sudo）
```

以上说明，它会删除原来的/etc/alternatives/editor软链接，再创建一个新的/etc/alternatives/editor软链接来指向ed程序的实际路径。


```shell
[fan 11:06:36]~$ ll /usr/bin/editor 
lrwxrwxrwx 1 root root 24 7月  20 16:42 /usr/bin/editor -> /etc/alternatives/editor*
[fan 11:03:49]~$ ll /etc/alternatives/editor*
lrwxrwxrwx 1 root root  7 7月  24 11:03 /etc/alternatives/editor -> /bin/ed*
lrwxrwxrwx 1 root root 27 7月  24 11:03 /etc/alternatives/editor.1.gz -> /usr/share/man/man1/ed.1.gz
```

/var/lib/dpkg/alternatives/editor 文件的改变：

仅将 auto 改为 manual


### 总结 

> 以下为个人理解，如有错误请指正，不胜感激。详见 `man update-alternatives`

通用名称(generic name)和名称(name)的区别：

generic name (or alternative link)：通用名称指的是 `/usr/bin/name` 



简单的理解update-alternatives的机制： 

```
            /usr/bin/名称 (软链接)
                      |
                      V
  /etc/alternatives/名称  (软链接)  [每次更改就使它指向另一个程序的实际地址，并在配置文件中说明当前是自动还是手动]
                      |
                      V
                  程序实际路径
```

还存在一个配置文件：

```
/var/lib/dpkg/alternatives/名称
```

配置文件中指出该通用名称包含哪些可用的程序(候选程序)，并指出了每个程序的优先级和可用的附加文件路径。


#### 另还有个 slave 的概念
slave: 从属，次要

slave对应有 slave link（次要链接）。

在上面的editor的配置文件中我们可以看到多个slave其中的一个就是 editor.1.gz 

单从editor来看，sleve link指向的是相关的man手册文档。每当候选项一更改，sleve link也会跟着更改。

更改editor的候选项之前(为vim.basic时)：

```shell
[fan 11:38:50]~$ ll /etc/alternatives/editor*
lrwxrwxrwx 1 root root 18 7月  24 11:16 /etc/alternatives/editor -> /usr/bin/vim.basic*
lrwxrwxrwx 1 root root 28 7月  24 11:16 /etc/alternatives/editor.1.gz -> /usr/share/man/man1/vim.1.gz
lrwxrwxrwx 1 root root 31 7月  24 11:16 /etc/alternatives/editor.fr.1.gz -> /usr/share/man/fr/man1/vim.1.gz
lrwxrwxrwx 1 root root 31 7月  24 11:16 /etc/alternatives/editor.it.1.gz -> /usr/share/man/it/man1/vim.1.gz
lrwxrwxrwx 1 root root 31 7月  24 11:16 /etc/alternatives/editor.ja.1.gz -> /usr/share/man/ja/man1/vim.1.gz
lrwxrwxrwx 1 root root 31 7月  24 11:16 /etc/alternatives/editor.pl.1.gz -> /usr/share/man/pl/man1/vim.1.gz
lrwxrwxrwx 1 root root 31 7月  24 11:16 /etc/alternatives/editor.ru.1.gz -> /usr/share/man/ru/man1/vim.1.gz

[fan 11:38:50]~$ man editor 
# 查看到的是vim的man手册 
```

更改editor的候选项为ed之后：
```shell
[fan 11:03:49]~$ ll /etc/alternatives/editor*
lrwxrwxrwx 1 root root  7 7月  24 11:03 /etc/alternatives/editor -> /bin/ed*
lrwxrwxrwx 1 root root 27 7月  24 11:03 /etc/alternatives/editor.1.gz -> /usr/share/man/man1/ed.1.gz

[fan 11:38:50]~$ man editor 
# 查看到的是ed的man手册 
```


### 安装一个候选项

> 以 vim 为例

使用`--install`

```shell
# 链接  名称  (实际)路径   优先级
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/vim.nox 40
```

man update-alternatives查看手册： `--install link name path priority [--slave link name path]...`


使用apt-get安装vim-nox程序时的部分输出:
```shell
正在设置 vim-nox (2:7.4.1689-3ubuntu1.2) ...
update-alternatives: 使用 /usr/bin/vim.nox 来在自动模式中提供 /usr/bin/vim (vim)
update-alternatives: 使用 /usr/bin/vim.nox 来在自动模式中提供 /usr/bin/vimdiff (vimdiff)
update-alternatives: 使用 /usr/bin/vim.nox 来在自动模式中提供 /usr/bin/rvim (rvim)
update-alternatives: 使用 /usr/bin/vim.nox 来在自动模式中提供 /usr/bin/rview (rview)
update-alternatives: 使用 /usr/bin/vim.nox 来在自动模式中提供 /usr/bin/vi (vi)
update-alternatives: 使用 /usr/bin/vim.nox 来在自动模式中提供 /usr/bin/view (view)
update-alternatives: 使用 /usr/bin/vim.nox 来在自动模式中提供 /usr/bin/ex (ex)
```

使用apt-get卸载 vim-nox的部分输出:
```shell
正在卸载 vim-nox (2:7.4.1689-3ubuntu1.2) ...
update-alternatives: 使用 /usr/bin/vim.basic 来在自动模式中提供 /usr/bin/vi (vi)
update-alternatives: 使用 /usr/bin/vim.basic 来在自动模式中提供 /usr/bin/view (view)
update-alternatives: 使用 /usr/bin/vim.basic 来在自动模式中提供 /usr/bin/ex (ex)
update-alternatives: 使用 /usr/bin/vim.basic 来在自动模式中提供 /usr/bin/rvim (rvim)
update-alternatives: 使用 /usr/bin/vim.basic 来在自动模式中提供 /usr/bin/rview (rview)
update-alternatives: 使用 /usr/bin/vim.basic 来在自动模式中提供 /usr/bin/vimdiff (vimdiff)
update-alternatives: 使用 /usr/bin/vim.basic 来在自动模式中提供 /usr/bin/vim (vim)
```

安装和卸载时都会执行update-alternatives命令。



## Eclipse示例

> 翻译 [update-alternatives - William DeMeo](http://williamdemeo.github.io/linux/update-alternatives.html "update-alternatives - William DeMeo")  

有三个版本的Eclipse，并且分别创建了三个启动脚本：  

版本一： `$HOME/opt/Eclipse/luna/eclipse-luna` ，脚本内容： 
```shell
#!/bin/bash
export UBUNTU_MENUPROXY=0
$HOME/opt/Eclipse/luna/eclipse
```
版本二： `$HOME/opt/Eclipse/kepler/eclipse-kepler` ，脚本内容： 
```shell
#!/bin/bash
export UBUNTU_MENUPROXY=0
$HOME/opt/Eclipse/kepler/eclipse
```
版本三： `$HOME/opt/Eclipse/scala/eclipse-scala` ，脚本内容： 
```shell
#!/bin/bash
export UBUNTU_MENUPROXY=0
$HOME/opt/Eclipse/scala/eclipse
```
这里使用脚本而不是直接使用`$HOME/opt/Eclipse/***/eclipse`，是为了添加启动参数。


现在可以通过在命令行中调用以下命令来配置Eclipse的各种版本：
```shell
sudo update-alternatives --install /usr/bin/eclipse eclipse $HOME/opt/Eclipse/scala/eclipse-scala 400
sudo update-alternatives --install /usr/bin/eclipse eclipse $HOME/opt/Eclipse/luna/eclipse-luna 300
sudo update-alternatives --install /usr/bin/eclipse eclipse $HOME/opt/Eclipse/kepler/eclipse-kepler 200
```
eclipse-scala 优先级为 400 是最高值，所以他就是默认程序。

你可以删除任何 alternative: 
```shell
sudo update-alternatives --remove eclipse $HOME/opt/Eclipse/scala/eclipse-scala
```
The command `update-alternatives --query eclipse` should now print something like this:
```shell
Name: eclipse
Link: /usr/bin/eclipse                                      # 1个 符号链接
Status: auto
Best: /home/williamdemeo/opt/Eclipse/scala/eclipse-scala
Value: /home/williamdemeo/opt/Eclipse/scala/eclipse-scala

Alternative: /home/williamdemeo/opt/Eclipse/kepler/eclipse-kepler   # 可选的程序所在的路径
Priority: 200

Alternative: /home/williamdemeo/opt/Eclipse/luna/eclipse-luna     # 可选的程序所在的路径
Priority: 300

Alternative: /home/williamdemeo/opt/Eclipse/scala/eclipse-scala   # 可选的程序所在的路径
Priority: 400
```

可通过如下命令来手动选择候选项：`update-alternatives --config eclipse`，命令输出：
```
There are 3 choices for the alternative eclipse (providing /usr/bin/eclipse).

  Selection    Path                                                  Priority   Status
------------------------------------------------------------
* 0            /home/williamdemeo/opt/Eclipse/scala/eclipse-scala     400       auto mode
  1            /home/williamdemeo/opt/Eclipse/kepler/eclipse-kepler   200       manual mode
  2            /home/williamdemeo/opt/Eclipse/luna/eclipse-luna       300       manual mode
  3            /home/williamdemeo/opt/Eclipse/scala/eclipse-scala     400       manual mode
```
前面加`*`号的表示当前选择的程序。然后可根据命令提示进行更改。

> 在使用`--config`选项之前，可以先使用`--display`替换该参数，先进行查看。  

如果你想为它们创建应用启动器(application launcher)可使用如下方法(也可以通过创建相关文档创建)：
```shell
mkdir -p ~/.local/share/applications
gnome-desktop-item-edit --create-new ~/.local/share/applications/
```

## Java示例
java就比较麻烦了点，因为java相关的命令比较多，要改的地方多。

还好有个`update-java-alternatives`命令。

可以查看另一篇文章: [Ubuntu安装java和使用update-java-alternatives进行切换](/blog/2017/07/22/ubuntu%E5%AE%89%E8%A3%85%E5%92%8C%E5%88%87%E6%8D%A2JDK/)




## 图形工具 Gnome alternatives
 Gnome Alternatives 
 ```
 sudo apt-get install galternatives
 ```

不推荐。


## 更改优先级

使用root权限编辑`/var/lib/dpkg/alternatives`下的相关文件，更改优先级后保存。

然后运行如下命令` sudo update-alternatives --auto 名称`，将“名称”替换成相应值。


比如： 
- 修改某网页浏览器的优先级，编辑文件`/var/lib/dpkg/alternatives/x-www-browser`然后运行如下命令` sudo update-alternatives --auto x-www-browser`使其生效。
- 修改编辑器的优先级，编辑文件`/var/lib/dpkg/alternatives/editor`然后运行如下命令` sudo update-alternatives --auto editor`使其生效。


> `--auto`选项，根据优先级设置回默认值(优先级最高的候选项)。 
> 
> 命令输出（在确实更改了editor后）：
> ```
> [fan 11:06:00]~$ update-alternatives --auto editor 
> update-alternatives: 使用 /usr/bin/vim.basic 来在自动模式中提供 /usr/bin/editor (editor)
> update-alternatives: 错误: 新建符号链接 /etc/alternatives/editor.dpkg-tmp 时出错: 权限不够
> [fan 11:07:39]~$ sudo update-alternatives --auto editor 
> [sudo] fan 的密码： 
> update-alternatives: 使用 /usr/bin/vim.basic 来在自动模式中提供 /usr/bin/editor (editor)
> ```


## 参考

[update-alternatives学习笔记](http://blog.csdn.net/HEYUTAO007/article/details/5441482)    
[update-alternatives - William DeMeo](http://williamdemeo.github.io/linux/update-alternatives.html "update-alternatives - William DeMeo")    
   
