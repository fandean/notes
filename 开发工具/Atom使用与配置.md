## Atom介绍

Atom 是 GitHub 在 2014 年发布的一款基于 Web 技术构建的文本编辑器。

Atom 是基于 Electron，这是一个帮助开发者使用 Web 技术构建跨平台的桌面应用的工具，实际上 Electron 原本叫 Atom Shell，是专门为 Atom 设计的，后来才成为了一个独立的项目。Electron 将 Chromium 和 Node.js 结合到了一起：Chromium 提供了渲染页面和响应用户交互的能力，而 Node.js 提供了访问本地文件系统和网络的能力，也可以使用 NPM 上的几十万个第三方包。



> [Atom 背后的故事 - 工具资源 - 掘金](https://juejin.im/entry/5822f4b867f3560058bc3a41 "Atom 背后的故事 - 工具资源 - 掘金")
>
> [Atom飞行手册（中文版） · GitBook](https://www.gitbook.com/book/wizardforcel/atom-flight-manual-zh-cn/details "Atom飞行手册（中文版） · GitBook")
>
> [现在可以将 Atom 编辑器变成 IDE 啦！](https://linux.cn/article-8909-1.html)



## Atom 安装

上官网下载 Atom 安装包进行安装。

或者在 Atom安装包的国内镜像站点 <https://npm.taobao.org/mirrors/atom> 进行下载。

通过PPA在Ubuntu上安装Atom：

```shell
sudo add-apt-repository ppa:webupd8team/atom  
sudo apt-get update   
sudo apt-get install atom
```



查看Atom的版本：
```shell
$ atom -v
Atom    : 1.19.3
Electron: 1.6.9
Chrome  : 56.0.2924.87
Node    : 7.4.0     # 这个 node 应该是atom自带的
```


查看包管理工具的版本：
```shell
$ apm -v
apm  1.18.4
npm  3.10.10
node 6.9.5 x64
python 2.7.12
git 2.7.4
```



## Atom基本用法

### 打开文件或文件夹

从终端打开文件： `atom fileName`

打开文件夹：你可以在菜单栏 File >> Open 弹出的对话框中选择一个目录，或者你也可以通过 File >> Add Project Folder…  或快捷键  cmd-shift-O 在一个窗口中打开**多个目录**。



### 命令面板(Palette)

可以通过命令面板来执行各种动作。按下快捷键`ctrl + shift + p` 即可打开命令面板。



### 设置Settings

打开设置界面的方法：

* 通过菜单"编辑"->"Preferences"
* 通过快捷键`ctrl + ,`
* 在命令面板中搜索`settings-view:open`




核心设置：

* 自动升级
* 不加载'.gitignore'指定的文件
* 文件编码
* 忽略的文件（这里额外添加: `.idea, .node_modules, .vscode`）
* 默认项目目录





编辑器设置：

* Tab的长度
* Tab的类型：soft表示用空格代替tab；hard表示直接插入tab；auto代表自动选择。
* 显示行数
* 显示缩进指示线
* 自动换行
* 设置字体和字体大小
* 设置自动缩进
* 粘贴时自动缩进




### 主题

主题在Settings页中配置。主题分为 

* UI主题：UI主题会修改UI元素的颜色
* 语法主题：语法主题会修改你加载进编辑器的文本的语法高亮。









## Atom快捷键

环境：XUbuntu 16.04

| 快捷键                               | 描述                                 |
| --------------------------------- | ---------------------------------- |
| `ctrl + ,`                        | 打开设置界面                             |
| `ctrl + \`                        | 打开目录树                              |
| `ctrl + t`或`ctrl+p`               | 查找文件                               |
| `ctrl + del`                      | 删除单词末尾                             |
| `ctrl + shift + k`                | 删除行                                |
| `ctrl + shift + d`                | **复制当前行到下一行**                      |
| `ctrl + j`                        | 合并行                                |
| `shift + del`                     | Cut(行)                             |
| `ctrl + Ins`                      | Copy(行)                            |
| `shift + Ins`                     | 粘贴(行)                              |
| `ctrl + /`                        | 切换注释                               |
| `ctrl + ]/[`                      | 添加/减少 缩进                           |
| `ctrl + shift + c`                | 复制路径                               |
| `ctrl + Up/Down Arrow`            | **向上/下 移动行**                       |
| `ctrl + l`                        | 选择行                                |
| `ctrl + shift + Left/Right Arrow` | 选择到单词起始/结束                         |
| `ctrl + shift + t`                | 打开上一个关闭的文件                         |
| `ctrl + d`                        | 选择下一个相同的单词                         |
| `alt + F3`                        | 选择所有相同的单词（与系统快捷键发生冲突，可通过"查找"-"全选"） |
| `ctrl + shift + 鼠标点击`             | 增加新关标                              |
| `alt + shift + Up/Down Arrow`     | 增加上（下）一行光标                         |
| `ctrl + enter`                    | 在当前行之下插入一行                         |
| `alt + ctrl + ,`                  | 选择括号内容                             |
| `ctrl + m`                        | 跳转到匹配的括号                           |
| `ctrl + 空格`                       | 自动补全                               |


## Atom Packages(插件)

插件在Atom这里应该叫作 Packages ，Package的安装方法：

* Edit -> Preferences -> Packages；在打开的输入框中进行搜索某个关键字。
* 或者通过在终端使用命令安装：`apm install PackageName`，可事先在[atom安装包搜索页面搜索插件](https://atom.io/packages)进行搜索。（有人说要先切换到 `~/.atom/packages`下再使用安装命令，其实不用）。

**apm**(Atom Package Manager)是atom的包管理工具，可以方便的管理Atom的Package。

packages安装位置： `~/.atom/packages`

查看已经安装的 packages： `apm ls`



> 这里需要注意，大多数的package无法正常下载，请事先设置代理，比如：
>
> 1. 在 ~/.bashrc 文件中设置
>
> ```shell
> # 在 ~/.bashrc 文件中设置代理，之后用 apm 命令进行插件下载安装
> # https必须设置
> https_proxy=127.0.0.1:1080
> http_proxy=127.0.0.1:1080
> ```
> 2. 在 .apmrc 文件中配置
>
> ```shell
> # 创建配置文件
> touch ~/.atom/.apmrc
>
> # 设置代理
> https_proxy=127.0.0.1:1080
> http_proxy=127.0.0.1:1080
> strict-ssl=false
> ```
>
> 3. 或者与npm一样更改镜像地址；
>
> ```shell
> echo 'registry = https://registry.npm.taobao.org' > ~/.atom/.apmrc
> ```
> 同时也把系统中的 npm 也设置一下。



这里维护一个安装脚本：

```shell
#! /bin/bash
# 文件 apmPackages.sh

######### 命令行 ############
apm install platformio-ide-terminal

########## 汉化 #############
apm install simplified-chinese-menu

######## 高亮所选 #########
apm install highlight-selected

###### minimap #######
apm install minimap

####### 高亮所选内容 #######
apm install minimap-highlight-selected

###### 高亮 #########
apm install quick-highlight

##### 代码大括号范围提示 #######
apm install indent-guide-improved

###### 格式化代码，支持多种语言 ######
apm install atom-beautify

####### 取色器 #########
apm install color-picker

####### 颜色显示插件 ########
apm install pigments

####### 工程管理 #######
apm install project-manager

######### 自动保存 #######
apm install autosave

####### 图标工具栏 #######
apm install tool-bar

# 自定义工具栏图标点击事件
apm install flex-tool-bar

###### 路径补全 #######
apm install autocomplete-paths

####### 在单独的一个标签面板中查看文档 ############
apm install api-docs

#################### linter：检查代码语法和风格 #################
# 基础linter：检查代码语法和风格。另可安装特定的语言插件
#apm install linter

# You have both linter and atom-ide-diagnostics enabled, which will both display lint results for Linter-based packages.
# To avoid duplicate results, please disable one of the packages.
# 安装时提示 linter和atom-ide-diagnostics(在扩展中搜索一下该插件)之间只能二选一。
# 所以这里我还是不安装linter

# 另外linter还需要下面的依赖
# apm install intentions busy-signal linter-ui-default 

# 与特定语言相关的 liinter
# css html js
# apm install linter-csslint linter-htmlhint linter-eslint

################ markdown相关packages #################
# 预览
# apm install markdown-preview-plus
# vs code中也安装了这个预览插件
apm install markdown-preview-enhanced
# 同步滚动
apm install markdown-scroll-sync
# 高亮md中的代码
# apm install language-markdown
# 表格编辑
apm install markdown-table-editor
# 图片粘贴 相比vs code的 Paste Image 要差很多
# apm install markdown-image-paste
# Markdown-img-paste支持上传文件到ss.ss和七牛云
apm install markdown-img-paste
# 为markdown配置工具栏，需要安装三个package。之后还需要进行配置
apm install tool-bar markdown-writer

# markdown语法检查
#apm install linter-markdown

########### 主题 ##############
# 推荐
apm install atom-material-ui
apm install atom-material-syntax-dark

apm install monokai-flat
apm install monokay

# 文件图标
#apm install file-icons


###### 运行脚本,支持多种语言 #####
apm install script

###### 正则表达式图形化 ########
regex-railroad-diagram

######## 局部选择插件 ######
apm install sublime-style-column-selection



############ JS相关插件 #############
# JavaScript和Node自动补全插件
apm install atom-ternjs

# 跳转到js函数定义处
apm install hyperclick js-hyperclick

apm install es6-javascript

apm install esformatter

apm install js-func-viewer

apm install language-javascript-jsx


####### Bootstrap #########
apm install atom-bootstrap


##########  react 相关 ##########
# apm install react
apm install react-es6-snippets
apm install react-native-snippets
apm install react-snippets
# facebook 提供的 nuclide 包含了众多插件
apm install nuclide


########## Vue.js 相关 #########
apm install language-vue

########### html 相关插件 ###########
# emmet
apm install emmet

apm install emmet-jsx-css-modules

# autoprefixer：用来补充 css 前缀，会自动生成多个浏览器的前缀
apm install autoperfixer

# 编辑器内置浏览器(推荐)
apm install browser-plus

# 在浏览器中打开
#apm install open-in-browsers


######## Git 相关 #######
# 处理产生合并冲突的文件
apm install merge-conflicts
# git-plus
apm install git-plus
# git 面板
apm install git-control
# 图形化git提交记录
apm install git-log
# 快速分享代码到gist
apm install git-it

```





## 参考



[使用Atom打造无懈可击的Markdown编辑器 - Florian - 博客园](http://www.cnblogs.com/fanzhidongyzby/p/6637084.html "使用Atom打造无懈可击的Markdown编辑器 - Florian - 博客园")


[工具推荐-atom插件terminal,CMD命令行 | 黄国才个人博客](http://www.hgcv5.com/2016/11/21/%E5%B7%A5%E5%85%B7%E6%8E%A8%E8%8D%90-atom%E6%8F%92%E4%BB%B6platformio-ide-terminal/ "工具推荐-atom插件terminal,CMD命令行 | 黄国才个人博客")

这里有介绍有很多插件：  
[Atom编辑器的使用技巧 - ntscshen](http://www.ntscshen.com/2016/10/08/Atom%E7%BC%96%E8%BE%91%E5%99%A8%E7%9A%84%E4%BD%BF%E7%94%A8%E6%8A%80%E5%B7%A7.html "Atom编辑器的使用技巧 - ntscshen")

[插件主题推荐 - Atom 使用教程 - 极客学院Wiki](http://wiki.jikexueyuan.com/project/atom/plug-in.html "插件主题推荐 - Atom 使用教程 - 极客学院Wiki")

这里最全：  
[atom必备插件及主题 - 简书](http://www.jianshu.com/p/eac1879cb2e9 "atom必备插件及主题 - 简书")


[react-native开发工具-atom及插件 - 简书](http://www.jianshu.com/p/d005c2cd17fb "react-native开发工具-atom及插件 - 简书")



