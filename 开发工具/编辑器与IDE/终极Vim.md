# 终极vim

懒得同步vim的配置，所以想找一个现成的已经配置好的vim或其他vim版本。下面是几个参考：

- space-vim（看到spacemacs太嚣张人气18.8K而产生）
- spf13-vim 
- Neovim ：准备尝试一下 [Home - Neovim](https://neovim.io/)



在这里可以搜索到流行的vim插件和主题，并查看其文档 ： [Vim Awesome](https://vimawesome.com/)

[wsdjeg/vim-galore-zh_cn: Vim 从入门到精通](https://github.com/wsdjeg/vim-galore-zh_cn)



## Neovim

安装后的启动命令为 ：nvim



## 配置

neovim可以使用vim的配置，但neovim的一些指令vim不兼容。一般来说两者共用配置是没有多大问题的。

neovim和vim共用配置，通过软件链接即可

```shell
ln -s ~/.vim .config/nvim
ln -s ./.vimrc .config/nvim/init.vim
```

或者，为neovim创建单独的配置文件

```shell
mkdir ~/.config/nvim
touch ~/.config/nvim/init.vim
```

如果某 neovim 的指令与vim不兼容，我们可以这样配置

```
if has(‘nvim’)
	...
endif
```





## 插件管理

 这里使用Vim-plug插件管理器。该插件管理器使用`git`来管理大多数插件 。

[vim-plug: Minimalist Vim Plugin Manager](https://github.com/junegunn/vim-plug)

官网所需要将其安装在  autoload  目录，这里我们将该目录放置在

```
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

创建插件安装目录

```
mkdir ~/.config/nvim/plugged
```

编辑 init.vim 文件

```
call plug#begin(插件安装目录)

"Plug 'https://github.com/hiberabyss/ProjectConfig'

" Sublime Text's vim-multiple-cursors多光标选择
Plug 'terryma/vim-multiple-cursors'

"主题
"" base16主题的颜色支持，
let base16colorspace=256
"" 另外还有One dark主题的斜体支持

""不错： One Dark syntax 主题，名称为: onedark
Plug 'joshdick/onedark.vim'

//按需加载插件，后面的 for go 来表示
Plug 'https://github.com/fatih/vim-go.git', {'for': 'go'}

"" 补全：从下面三个中选一个
" 功能全 比较大，下载好慢 0.5 ~ 1 小时，不是vim中毒用户无需安装。依赖python3
"Plug 'valloric/youcompleteme'
" neocomplete 补全
Plug 'shougo/neocomplete.vim'
" supertab 
" Plug 'ervandew/supertab'

"Coc is an 智能感知引擎 for Vim/Neovim. 国人开发有两篇介绍
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

call plug#end() " Should run at last

"显示行号
set nu

"" 开启语法高亮
syntax enable
"" 修改背景颜色后为dark后一篇漆黑，则需要同时把背景和主题关闭
"" 或者你应该先去配置一下终端的配色
""背景色用于切换当前主题的明暗配色方案
"set background=light
"set background=dark
colorscheme solarized
```



YouCompleteMe 的安装步骤有(包括了对C族语言的语义补全）：

- 确保你的 vim8 支持 python3

- 使用vim-plug下载 YouCompleteMe 

- Ubuntu 系统中安装 ` build-essential cmake python3-dev`

  - 对于cnetos7需要安装 ：`gcc-c++ cmake python-devel `

- 进入YouCompleteMe 安装目录执行下面的编译命令

  ```shell
  ./install.py --clang-completer
  # 或者
  python3 ./install.py --clang-completer
  ```

  

[Vim自动补齐插件YouCompleteMe安装指南(2019年最新)-Vim插件(15) | vim教程网](https://vimjc.com/vim-youcompleteme-install.html)



在nvim中输入 `:` 

- `:PlugInstall`  安装
- `:UpdateRemotePlugins`  更新



在这里可以搜索到流行的vim插件 ： [Vim Awesome](https://vimawesome.com/) 和查看相关插件（包括主题插件）的说明文档。



[VIM 插件管理工具 vim-plug 简明教程 | 始于珞尘](https://hiberabyss.github.io/2018/03/21/vim-plug-introduction/) 

> 之前在vim中使用的插件管理器为 Vundle 



## 主题配置



下面是主题 base16-vim 的**说明** 使用主题需要vim和终端的支持。主题页面有些有配置失败的说明

-  set `let base16colorspace=256` in your `~/.vimrc`
- use a non 256 terminal theme. 
- 主题名称：  base16-default-dark



```
""不错： One Dark syntax 主题，名称为: onedark
Plug 'joshdick/onedark.vim'
"" 主题名称：base16-default-dark
Plug 'chriskempson/base16-vim'
"" 名称： seoul256
""背景颜色和主题的调整和关系，见 seoul256 的介绍页面 
Plug 'junegunn/seoul256.vim'
```



**背景颜色和主题调整关系，见 seoul256 的介绍页面** ，[seoul256.vim - Vim Awesome](https://vimawesome.com/plugin/seoul256-vim)







