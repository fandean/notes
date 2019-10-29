#!/bin/bash


#项目主页:https://github.com/Valloric/YouCompleteMe#options

#必须先安装 Vundle 插件管理器，通过他下载 YouCompleteMe 。下载之后还需要编译

#Ubuntu 中的编译依赖
sudo apt-get install build-essential cmake 
sudo apt-get install python-dev python3-dev


cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer


安装后的配置：
-----------------------------------------------

安装完成后进行一些简单的配置就可以使用。
YouCompleteMe 的补全配置文件在/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py，这是个隐藏文件。
默认会使用这个文件，也可以把这个文件copy到工程的根目录中作修改，打开工程文件时会优先使用当前目录下的配置文件。
如果找不到，会根据配置中的ycm_global_ycm_extra_conf 进行查找。

 

在.vimrc 中添加

let mapleader = ","  " 这个leader就映射为逗号“，”

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'   “配置默认的ycm_extra_conf.py
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>   “按,jd 会跳转到定义
let g:ycm_confirm_extra_conf=0    “打开vim时不再询问是否加载ycm_extra_conf.py配置
let g:ycm_collect_identifiers_from_tag_files = 1 "使用ctags生成的tags文件




或参考这个的配置：
----------------------------------------------
<http://blog.jobbole.com/58978/>
该网页已经下载。  
较详细


或参考这个的配置：
----------------------------------------------
<http://www.linuxidc.com/Linux/2014-04/99719.htm>
详细


最后设置.ycm_extra_conf.py文件。
在.vimrc中添加配置：

" 自动补全配置
set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"


"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2	" 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>	"force recomile with syntastic
"nnoremap <leader>lo :lopen<CR>	"open locationlist
"nnoremap <leader>lc :lclose<CR>	"close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处


