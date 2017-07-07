"开启增强模式  关掉 compatible
set nocompatible

"自动缩进
set autoindent

"备份原文件，vms 系统除外，备份文件名由当前文件加后缀 ~ 
"if has("vms")
"   set nobackup
"else
"    set backup
"endif

"设置命令的历史列表长度
set history=500

"显示当前光标的行列信息
set ruler

"显示一个完整的命令已经完成的部分。见vim用户手册
set showcmd

"这段脚本打开语法高亮功能
if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif

"1.自动识别文件类型 2.用文件类型 plugin脚本 3.使用缩进定义文件
filetype plugin indent on

set tabstop=2   "让一个tab等于4个空格
"统一缩进为4
set softtabstop=2
set shiftwidth=2


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"显示相关
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"设置vim的配色方案,背景主题
colorscheme desert
"或将colorscheme简写为color
"color torte


set cul 									"高亮光标所在行

set guifont=Courier_New:h13:cANSI  	   	"设置字体
"set guifont=Bitstream_Vera_Sans_Mono:h11:cANSI "另一种字体设置
"set gfw=幼圆:h10:cGB2312
"set guifont=黑体:h14:cGB2312

"autocmd InsertLeave * se nocul 			"用浅色高亮当前行
"autocmd InsertEnter * se cul				"用浅色高亮当前行
set ruler 									"显示标尺
set showcmd									"输入的命令显示出来，看的清楚些
"set foldenable								"允许折叠
"set foldmethod=manual						"手动折叠
set number									"显示行号
set smarttab								"在行和段开始处使用制表符
set guioptions-=T							"隐藏工具栏
"set guioptions-=m							"隐藏菜单栏
"set go=   									"直接不要图形按钮
"set wm=5
""设置与右边边界的距离，以便自动插入换行符，这个选项是wrapmaigin(简写wm)这里设置为5个字符


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set fileencoding=utf-8
"set fileencodings=ucs-bom,utf-8,chinese
"set enc=utf8

"set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" 设置字体。
" 字体名称可以通过前一节介绍的语句获得，
" 如果字体名称中含有空格，
" 需要在空格前面加上一个反斜杠，如下：

" 这是 Linux 风格的字体设置语法
"set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
" 这是 Windows 风格的字体设置语法
"set guifont=Bitstream_Vera_Sans_Mono:h9:cANSI



"开启关闭行号  set nu  ;  set nonu
"
"
```


## vim 的一个初级配置示例

```

""""""""""""""""""""""""""""""""""""""""""""""""""
"			 插件设置	
"		用 Vundle 插件管理(Vim bundle)
"Vundle基于Git架构，每个插件都是一个项目的Repository，
"通过Vundle可以用简单的指令，一键安装/更新/删除所有插件
"其Github地址为：https://github.com/gmarik/vundle
""""""""""""""""""""""""""""""""""""""""""""""""""			 

set nocompatible			"be iMproved 开启增强模式关掉 compatible;设置vim为不兼容vi模式
filetype off				"required ! 必须的

set rtp+=~/.vim/bundle/vundle/	"此处规定Vundle的路径
"set rtp+=$VIM/VIMfiles/bundle/vundle/	"Windows中的设置
call vundle#rc()

" let Vundle manage Vundle
"  required !
Bundle 'gmarik/vundle'		"bundle 意思是：软件包


" My Bundles here:				"要安装的插件写在下面，分3个来源
"
"------------------------------
"  original repos on github
"插件来自 github 非vim-scripts仓库，只要写 '作者名/项目名' 即可
"Bundle 'tpope/vim-fugitive'	"如这里安装了 vim-fugitive这个插件


"------------------------------
" vim-script repos			Vim-Script.org
" Vim Scripts仓库的， 只要在配置中写脚本的名字

Bundle 'AutoClose'				"自动补全配对符号
Bundle 'FencView.vim'			" 自动识别文件编码



"------------------------------
" non github repos
" 指定一个完整的 git repos 地址
"或 git repos on your local machine (ie. when working on your own plugin)


filetype plugin indent on		"使用插件时也必须设置
"命令
"BundleList		显示vimrc里面填写的所有插件名称
"BundleInstall	自动下载安装vimrc中的插件
"BundleInstall!	更新插件
"BundleClean	从vimrc中删除/注释掉插件后，删除插件




"设置命令的历史列表长度
set history=500


"if &t_Co > 2 || has("gui_running")
"	syntax on
"	set hlsearch
"endif
syntax on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   缩进设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"1.自动识别文件类型 2.用文件类型 plugin脚本 3.使用缩进定义文件
"filetype plugin indent on		"使用插件时也必须设置


set tabstop=4   			"让一个tab等于4个空格
set softtabstop=4			"退格
set shiftwidth=4			"每层缩进
set sta						"详见

set cindent					"类似C语言的缩进
set smartindent				"基于autoindent的一些改进

set autoindent				"自动缩进


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"显示相关
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"设置vim的配色方案,背景主题
"colorscheme desert
"或将colorscheme简写为color
"color torte



"set guifont=Courier_New:h13:cANSI  	   	"设置字体
"set guifont=Bitstream_Vera_Sans_Mono:h11:cANSI "另一种字体设置
"set gfw=幼圆:h10:cGB2312
"set guifont=黑体:h14:cGB2312

"autocmd InsertLeave * se nocul 			"用浅色高亮当前行
"autocmd InsertEnter * se cul				"用浅色高亮当前行

set cul 									"高亮光标所在行
set ruler 									"显示标尺
set showcmd									"输入的命令显示出来，看的清楚些
"set foldenable								"允许折叠
"set foldmethod=manual						"手动折叠
set number									"显示行号
set smarttab								"在行和段开始处使用制表符
set guioptions-=T							"隐藏工具栏
"set guioptions-=m							"隐藏菜单栏
"set go=   									"直接不要图形按钮
"set wm=5
""设置与右边边界的距离，以便自动插入换行符，这个选项是wrapmaigin(简写wm)这里设置为5个字符


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set fileencoding=utf-8
"set fileencodings=ucs-bom,utf-8,chinese
"set enc=utf8

"set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" 设置字体。
" 字体名称可以通过前一节介绍的语句获得，
" 如果字体名称中含有空格，
" 需要在空格前面加上一个反斜杠，如下：

" 这是 Linux 风格的字体设置语法
"set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
" 这是 Windows 风格的字体设置语法
"set guifont=Bitstream_Vera_Sans_Mono:h9:cANSI



"开启关闭行号  set nu  ;  set nonu

```







