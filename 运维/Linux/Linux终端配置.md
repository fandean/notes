# Linux下的终端配置



## Powerline字体安装

先配置主题

- 打开 [Powerline](https://github.com/powerline/fonts) ，并参照上面的安装方法进行安装



## shell选择



### bash

略



### zsh 或 Oh My Zsh

 Zsh 兼容 Bash，据传说 99% 的 Bash 操作 和 Zsh 是相同的。

安装方法，需要 git

```
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
```



```shell
# 查看当前有哪些shell
cat /etc/shells
# 当前使用的shell
echo $SHELL
# 当前可用主题（一大把）
ls ~/.oh-my-zsh/themes
# 插件目录 ~/.oh-my-zsh/plugins

# 安装autojump(还需要配置见链接，windows中居然有个Clink见autojump的github页面)
yum install autojump-zsh
```



- 在以 **root 用户为前提**下，oh-my-zsh 的安装目录：/root/.oh-my-zsh
- 在以 root 用户为前提下，Zsh 的配置文件位置：/root/.zshrc
- 为 root 用户设置 zsh 为系统默认 shell：`chsh -s /bin/zsh root`
- 如果你要重新恢复到 bash：chsh -s /bin/bash root



zshrc的配置：

```shell
# 从上到下，尽量把这些配置放在相应位置

# zhs的主题，需要终端配置为 256 ...
ZSH_THEME="ys"
# 使用随机主题
ZSH_THEME="random"

# 插件需要提前下载
# z命令快速跳转目录     x命令解压一切文件         命令行可以直接google  
plugins=(
  git z zsh-autosuggestions extract web-search zsh-syntax-highlighting 
)
 
# 自动更新的时间间隔，单位是天，这里设置 30 天更新一次
export UPDATE_ZSH_DAYS=30
```



[Linux | zsh+on-my-zsh 配置 | 醉渔小站](https://zuiyu1818.cn/posts/zsh.html)

### fish shell

可以通过输入`fish_config` 命令会启动web管理界面，比如可以在该配置界面选择主题

优势：

- 语法高亮：错误命令显示红色
- 通配符：集成find命令，搜索方便。比如 `ls **.json` 同时会搜索非本目录
- 智能建议：选择建议的方法是 按 右箭头
- set赋值：通过set代替 = 对应变量赋值。没有`export`需要用`set -x`代替

缺点：

- 对 bash 脚本兼容性差。

> 靠不想用

其配置文件位于 `~/.config/fish` 目录下，其配置方式和 bash 不同。



