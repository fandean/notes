"""""""""""""""""""""""""""""""""""""""""""""""""""""
"   快捷键帮助     
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"1. 帮助文档之间链接跳转方式 `CTRL-]` ; 回到前一个位置 `^0`
"2. 新建标签页 `:tabnew` :tabe  ， tab切换gt gT    
"3. 新建窗口 `^W` 加 `v 竖直 s 水平` 
"4. 折叠 z开头 za  
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""
"spf13-vim 终极vim配置,可参考其使用的插件  http://spf13.com/post/ultimate-vim-config

" 递归映射命令：  *map   ； * 号代表 i n v 
" 映射：  map 和 nmap 表示 “normal-mode key mapping ；    imap: insert模式
" 使用nmap、vmap和imap命令分别指定映射仅在normal、visual、insert模式有效 。 nunmap删除映射
" 
" 非递归映射命令:  *noremap   
" inoremap   vnoremap  nnoremap 

"vim 脚本语言  学习网站：http://www.kancloud.cn/kancloud/learn-vimscript-the-hard-way/49321
" http://www.ibm.com/developerworks/cn/linux/l-vim-script-1/index.html?ca=drs-cn-0601
"let 命令为一个变量赋值  :let {variable} = {expression}
" 函数名必须以一个大写字母开头,要重新定义一个已经定义过的函数名，
" 则在函数命令 function 后加一个 !  
"注释使用 " 而 字符串也可使用 " 避免同时使用，优先看做字符串，如下面错误： vim会认为缺少一个 "
" 错误 :echo ">" "Print generic prompt
"可以通过使用 | 分隔多个语句，使其可以在单行中  
" echo ">"  |"Print generic prompt
" 使用 :source 命令 执行某一脚本文件(*.vim)
"set 设置选项， let 设置变量

"切换插件 Autoclose (配对) 的开关状态  <leader>a 

"生成会话文件命令 ":mksession 文件名"   , 默认文件名为 Session.vim 
"vim -S Session.vim 启动vim时使用-S 选项加会话文件.或者在启动之后执行命令 ":source 会话文件" (其实质就是使用Ex命令执行脚本）
"生成viminfo文件命令 ":wviminfo 文件名" 
"在打开vim的情况执行 ":rviminfo 文件名" 加载viminfo文件。
"配置session.vim 和 viminfo 中保存的内容见帮助。

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  windows linux 共同的 快捷键 映射 键盘映射无法使用 "注释"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set mapleader
"mapleader默认为 \  
let mapleader = ","
let g:mapleader = ","

"""""""""定义两个映射键，用于调整窗口大小""""""""""
"用shift加- 减小行数
map _ -		
"用 shift 加 + 增加行数
map + +
""高手设置的，退出插入模式,还有移动光标理由，减少左手负担
inoremap jk <esc>  
" 高手支招， 重新学习一个 mapping 的窍门是强制之前的按键不可用
"<nop> 代表 no operation ，关闭插入模式下按键<esc>不做任何事情
"inoremap <esc> <Right>


"""""""""""""快速访问更新 vimrc 文件 "已经更改"""""" 
"说明：下面的 "<leader>"代表 "mapleader" , ~/.vimrc 的环境变量为 MYVIMRC
"含义是，按下 "<leader> 加 ss"   就代表执行 "source ~/.vimrc" ,即重新加载.vimrc文件, 打开.vimrc文件使用",ee"
map <silent> <leader>svimrc :source $MYVIMRC<cr>
"Fast editing of .vimrc
map <silent> <leader>vimrc :tabe $MYVIMRC<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source $MYVIMRC





" Platform 确定， has()函数检查当前vim是否支持某个特性
function! MySys()
	if has("win32")
		return "windows"
	else
		return "linux"
	endif
endfunction

""MySys函数使用
"if MySys() == 'linux'  
"	...
"elseif MySys() == 'windows'
"	...
"endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  文件 、 制表、 退格
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"1.自动识别文件类型 2.用文件类型 plugin脚本 3.使用缩进定义文件
filetype plugin indent on
set autoread					"不理解，设置当文件被改动时自动载入

"设置文件类型识别
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=mkd
au BufRead,BufNewFile *.{go}   set filetype=go
au BufRead,BufNewFile *.{js}   set filetype=javascript
"set nobackup						"禁止生成临时文件
"set noswapfile						"禁止临时文件
"备份原文件，vms 系统除外，备份文件名由当前文件加后缀 ~ 
"if has("vms")
"   set nobackup
"else
"    set backup
"endif

"编码设置、语言设置
"参考：http://www.cnblogs.com/xuxm2007/archive/2012/07/18/2556653.HTML
set langmenu=zh_CN.UTF-8
set encoding=utf-8
language message zh_CN.UTF-8   "解决输出提示乱码
set fileencoding=utf-8
" windows下运行vimcdoc-setup.exe该程序就只是将文件解压出来，选择一个临时文件夹保存文件，之后像安装插件一样复制文件到
"vimfiles中即可。 再设置 set helplang=ch 
set helplang=cn
"推荐的文件解码顺序
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"解决Gvim菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"另可安装FencView自动识别文档编码的插件，但每次打开文件时会花时间检查文件
"可以将其留作备用，当乱码时使用命令： :Fencview_autodetect
"检查编码，使用命令:FencView 查看当前文件编码格式,输入F + tab 即可,然后将encoding临时设置成该文件编码值。
let g:fencview_autodetect=0   "禁止FencView自动检查文件编码




set clipboard+=unnamed						"共享剪贴板
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l

set tabstop=4   "让一个tab等于4个空格
"统一缩进为4
set softtabstop=4
set shiftwidth=4
"set noexpandtab					"不用空格代替制表符
"set smarttab						"在行和段开始处使用制表符

   

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch						"搜索逐字符高亮
set incsearch						"
set ignorecase						"搜索忽略大小写
"开启增强模式  关掉 compatible
set nocompatible
"增强模式中的命令行自动完成操作
set wildmenu
"自动缩进
set autoindent
"带有如下符号的单词不被换行分割
""set iskeyword+=_,$,@,%,#,-
"设置命令的历史列表长度
set history=500
" 去掉输入错误的提示声音
set noeb
"可以通过使用 :command 命令，告诉我们文件的哪一行被改变过
set report=0		" 查看帮助 :h report 
"保存全局变量
"set viminfo+=!

"折叠 以z 开头 当z后字母变为相应的大写字母时 有递归含义 如 zA 
"za			切换一个折叠的状态
"zc			关闭一个折叠
"zd			删除一个折叠
"zi			切换foldenable选项的值
"zj，zk		移动光标至下一个折叠开始的地方(zj),或前一个折叠的结尾处(zk)
"zm, zr		递减(zm) 或递增(zr)foldlevel 选项的值
"zo			打开一个折叠
set foldenable							"允许折叠
setlocal foldlevel=1						"允许折叠层次 级别 
set foldmethod=manual						"手动折叠


" 设置字体。
" 字体名称可以通过前一节介绍的语句获得，
" 如果字体名称中含有空格，
" 需要在空格前面加上一个反斜杠，如下：

" 这是 Linux 风格的字体设置语法
"set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
" 这是 Windows 风格的字体设置语法
"set guifont=Bitstream_Vera_Sans_Mono:h9:cANSI

if MySys() == 'linux'  
	set guifont=Source\ Code\ Pro\ for\ Powerline\ Medium\ 13
elseif MySys() == 'windows'
	set guifont=Courier_New:h13		"设置字体
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"显示相关   
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"设置vim的配色方案,背景主题
"colorscheme desert
"或将colorscheme简写为color
"color torte


set textwidth=200					"当一行的长度到达 200 字符时自动换行  
"set wrap							"自动折行，相当于根据窗口大小调整行的显示
set nowrap							"禁止自动折行

"显示一个完整的命令已经完成的部分。见vim用户手册
set showcmd
set cul 									"高亮光标所在行
"autocmd InsertLeave * se nocul 			"用浅色高亮当前行
"autocmd InsertEnter * se cul				"用浅色高亮当前行
set ruler 									"显示标尺,即当前光标的行列信息
"set showcmd									"输入的命令显示出来，看的清楚些


"开启关闭行号  set nu  ;  set nonu
set number									"显示行号
set smarttab								"在行和段开始处使用制表符
set guioptions-=T							"隐藏工具栏
"set guioptions-=m							"隐藏菜单栏
"set go=   									"直接不要图形按钮
"set wm=5
""设置与右边边界的距离，以便自动插入换行符，这个选项是wrapmaigin(简写wm)这里设置为5个字符

"这段脚本打开语法高亮功能, "可以不用这么麻烦
if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif

"启动显示状态栏（1）；总是显示状态栏（2）
set laststatus=2
"状态行显示的内容  
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}  



"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL 
"    Linux 独有插件设置
if MySys() == 'linux'
"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL 
source ~/.vim/bundles.vim   | "引入bundles.vim, 使用 source命令执行该脚本,需在最前


""""""""""""""""""YCM: YouCompleteMe 插件配置""""""""""""""""""""
" 
" 跳转到定义  GoToDefinition
" 跳转到声明  GoToDeclaration
" 跳转两者的结合体 GoToDefinitionElseDeclaration
"
" 为上述功能配置快捷键 , normal模式下
"nnoremap <leader>gf :YcmCompleter GoToDefinition<cr>
"nnoremap <leader>gl :YcmCompleter GoToDeclaration<cr>
"定义这一个即可:
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<cr>

"设置使用 Ctrl-n 选择补全 ... 默认为Shift键，也挺好的
"let g:ycm_key_list_select_completion = ['<c-n>','<Down>']	"默认 '<TAB>','<Down>'
"let g:ycm_key_list_previous_completion = ['<c-p>','<Up>']	"默认 '<S-TAB>','<Up>'


let g:ycm_collect_identifiers_from_tags_files=1		" 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2			" 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0					" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1			" 语法关键字补全

"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0


""""""""""""""""vim-airline 状态栏插件 """"""""""""""""
"正确显示箭头的第一前提是 安装相关补丁字体，并设置终端使用相关字体
"主题名：base16, simple, light, badwolf,powerlineish,solarized,luna,wombat,murmur,
"tomorrow,ubaryd,raven,lucius
"let g:airline_theme='base16'		"或直接设置主题, 默认根据vim的主题自动设置,可使用命令:AirlineTheme 设置

set t_Co=16		"明确设置vim颜色设置，airline状态栏对比度更好.可设置为 16 或 256
let g:airline#extensions#tabline#enabled = 1    "显示上方的 tab 标题栏

"airline有两种符号symbols. 1.是 powerline symbols。2.是 unicode symbols。
"详见 :help airline   章节：*airline-customization*
" powerline symbols  有:'' '' '' '' ...
"unicode symbols 有： '▶' '¶' '⎇'' 'Ξ' ...
let g:airline_powerline_fonts=1   "设置为使用 powerline symbols

"自定义符号设置，可覆盖默认值
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
  " powerline symbols
  let g:airline_left_sep = '»'
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = '«'
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''

  " unicode symbols
  "let g:airline_left_sep = '▶'
  "let g:airline_right_sep = '◀'
"let 设置你想自定义的符号 ， 事先要通过上面的if语句定义 g:airline_symbols变量


"LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL
endif

" WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW 
"  windows 独有插件设置
if MySys() == 'windows'
" WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW 
"1.  HTML 插件：
"3. autocomplpop代码补全插件：http://www.vim.org/scripts/script.php?script_id=1879



"1.  HTML 插件：
"下载地址和帮助：http://www.vim.org/scripts/script.php?script_id=453
"查看帮助：` :help HTML.txt `
"输入 `; + 标签名`  即可自动补全。如： `;html`  
"例如： ;ah  便可 <a href=""></a>
"map leader 为 分号 ; 
"更改默认的分号 (map leader) 为其它符号
"`:let g:html_map_leader='其它符号'  

"禁用 工具条 ; 启用的话有一个bug请上前述网站寻求帮助
let g:no_html_toolbar='yes'
"以小写字母插入
let g:html_tag_case='lowercase'
"禁止所有 mapping ： `g:no_html_maps`
"let g:no_html_maps




"反斜杠\代表延续行，通常放在行首
"                                autocomplpop 自动补全, 增强配置
let g:AutoComplPop_Behavior = {
\ 'c': [ {'command' : "\\",
\ 'pattern' : ".",
\ 'repeat' : 0}
\ ]
\}

"autocomplpop 支持 PHP , 输入 $ 弹出自动补全框 
if !exists('g:AutoComplPop_Behavior')
let g:AutoComplPop_Behavior = {}
let g:AutoComplPop_Behavior['php'] = []
call add(g:AutoComplPop_Behavior['php'], {
\ 'command' : "\\",
\ 'pattern' : printf('\(->\|::\|\$\)\k\{%d,}$', 0),
\ 'repeat' : 0,
\})
endif


"WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
endif

"############################################################################################## 
"		Windows Linux 共同**插件**设置
"############################################################################################## 
"# javascript语法高亮：http://www.vim.org/scripts/script.php?script_id=1491			 
"打开javascript折叠
let b:javascript_fold=1
"打开javascript对dom html 和 css 的支持
let javascript_enable_domhtmlcss=1


"""""""插件 netrw 浏览文件夹： vim默认安装 """""""""""
"let g:netrw_winsize = 30
"nmap <silent> <leader>fe :Sexplore!<cr>
let g:netrw_winsize = 30
nmap <silent> <leader>fe :Sexplore!<cr> 

" <silent> 选项使得映射不能回传它所执行的任何命令,默默完成命令
"<cr> 代表回车，更多特殊符号完整列表 :help keycodes

"""""""""""""""""""""主题插件solarized"""""""""""""""""""""""
" 该主题可用于多个程序， vim emacs NetBeans Xcode  tmux  qtcreator  putty  gedit... 
" vim 版下载地址： https://github.com/altercation/vim-colors-solarized
syntax enable
color solarized			"选择solarized主题
"根据是否为 gvim 设置主题
"设置dark主题，都需设置 set background=dark 对应的另一个为 light
if has('gui_running')
    set background=dark		      
    let g:solarized_termcolors = 256
	set t_Co=256						
else
    set background=dark
    "let g:solarized_termcolors = 256	" 设置的是solarized而已, 效果不好
	"set t_Co=256						"设置vim的  ; 如果在终端，对solarized似乎无影响
    let g:solarized_termcolors = 16		
	set t_Co=16							
endif

"""""""""""""""设置 molokai 主题 """"""""""""
"color molokai
"let g:molokai_original=1
"let g:rehash256=1
