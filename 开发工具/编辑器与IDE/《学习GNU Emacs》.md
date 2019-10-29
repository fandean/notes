《学习GNU Emacs》
================
标签：开发工具

---


<font face=楷体>
《Learning GNU Emacs, Second Edition》  
[美] Debra Gameron, Bill Rosenblatt & Eric Raymond 著  
杨涛 杨晓云 王建桥 译   
2002.2      
由于中文版PDF不明显，建议同时下载英文版PDF。		
</font>



<font color=green>时间 2015.8.2</font>


前言
----------------

按程序员路线：
前言 - 5章	1~183页
10-12章  	334页 ~ 405页
共254页


###Emacs的版本

Emacs有许多不同的版本，提供了丰富多彩的功能。   
单就 UNIX 操作系统来说，Emacs最重要的版本包括
GNU Emacs、Unipress、JOVE、MicroEmacs、Freemacs、MG、Epsilon和CCA。		

本书讨论的是GNU Emacs 第19.30版  



###学习Emacs的方法  

本书开篇的头两章向大家介绍应该了解的基本概念，其余各章都是建立在这些基本概念之上。

你可以参考下面列出的阅读顺序进行学习：

|  如果        |  请阅读     |
|--------------|------------|
| 你是系统管理员| 前言、第一 〜 三章、第十六章 |
| 你是非专业用户 | 前言、第一 〜 三章、第十六章|
| 你是一位程序员 | 前言、第一 〜 五章、第十 〜 十二章 |
|你是作家或专业人士|前言、第一 〜 四章、第八 〜 九章、第十六章|
| ... | ... |





下面列出了一些大家可能打算在闲暇时间学习的功能：

- 单词简写模式 （第3章）
- 如何使用宏编辑命令 （10）
- 如何把键盘上的功能键映射为Emacs命令 （11）
- 如何发出（和编辑）shell命令 （5）
- 如何使用多个窗口 （4）
- 如何在图形模式（picture mode）里绘制简单的图形 （8）
- 如何访问因特网（7）
- 如何发送电子邮件和阅读 Usenet 新闻  （6）
 



Emacs 底部是 Emacs模式条（mode line）






第一章 Emacs的基本概念
----------------------

###Emacs简介



###理解文件与编辑缓冲区

编辑器先把文件的内容复制到一个临时性的缓冲区里，然后对缓冲区里的东西进行编辑。  
文件本身只有在执行了存盘操作时才会发生变化。

Emacs的编辑缓冲区和文件一样也有名字。缓冲区的名字通常就是正在编辑的文件的名字，
但也有例外的情况。  

有的缓冲区没有与它们关联的文件，   
如：`*scratch*` 就是一个临时性的辅助缓冲区，它的作用有点像草稿薄。   
而帮助功能会把帮助信息显示在一个名为`*Help*`的缓冲区里。







###编辑模式

Emacs有各种各样功能略有差异的编辑模式。
编辑模式将使 Emacs 成为能满足你不同工作任务要求的“专用”编辑器。  

一个编辑缓冲区每次只能处于一种主模式，退出一种主模式的方法是进入另一个主模式。  





Emacs编辑器的主模式：

|  模式          |  功能                 |
|---------------|------------------------|
|基本模式 fundamental mode | 默认模式，无特殊行为 |
|文本模式 text mode       | 书写文字材料       |
|邮件模式 mail mode       |  书电子邮件消息    |
|RMAIL模式 RMAIL mode    |  阅读和组织电子邮件 |
|只读模式 view mode      | 查看文件           |
|shell模式 shell mode    | 在Emacs里运行一个shell |
|FTP模式  ange-ftp mode  | 下载或者查看远程系统上的文件 |
|Telnet模式 telnet mode  | 登录到远程系统     |
|大纲模式 outline mode   |  书写大纲        |
|缩进文本模式 indented text mode | 自动缩进文本   |
|图形模式 picture mode   | 绘制简单的线条图形   |
|nroff模式 nroff mode   | 按nroff的要求对文件进行排版|
|TEX模式 tex mode       |   ...              |
|LATEX模式 LATEX mode  | ...  |
|C模式 C mode          |  书写C语言程序  |
|C++模式               |     ...         |
| FORTRAN模式          | ...             |
|Emacs LISP模式        | 书写Emacs LISP函数 |
|LISP模式              | 书写LISP程序    |
|LISP互动模式 LISP interaction mode | 书写和求值LISP表达式 |




Emacs会根据后缀名进入相关模式；有时，Emacs会根据文件的内容而不仅仅是后缀名来作出判断，如果编辑一个按 TEX 格式排版的文件，它会转入 TEX模式。   
如果它判断不出应该放到哪个编辑模式，将会转入基本编辑模式。  








Emacs还有副模式（minor mode）   
副模式定义的是Emacs某些特定的行为，可以在某个主模式里打开或者关闭。   
如：  自动换行模式 (auto-fill mode)。   




*Emacs编辑器的副模式：*

| 模式            |     功能            |
|-----------------|---------------------|
|自动换行模式 auto-fill mode | 开启自动换行（word wrap）功能|
|改写模式 overwrite mode    | 打字时替换而不是插入字符|
|自动保存模式 auto-save      |  ...  |
|行号模式 line number      |  在状态栏上显示当前文本的行号 |
|临时标记模式 transient mark | 对被选择的文本区做高亮反显 |
|缩略语模式 abbrev         | 允许使用单词的简写形式   |
|大纲模式 outline         |   ...  |
|VC模式                   | 在Emacs下使用各种版本控制系统 |


大纲模式既是主模式(major mode)又是副模式(minor mode)。  








###启动Emacs

当在命令行中只输入 emacs 而为指定任何文件时，打开后屏幕上显示版本信息、帮助、提示
信息等。
这些信息会在开始输入第一个字符的时候消失；而Emacs将把输入内容放在一个叫`*scratch*`
的缓冲区，这是一个试做各种练习的好地方。   






###Emacs的编辑画面

光标也叫“插入点”。（万一遇到麻烦请按 C-g组合键）

底部包含状态栏（mode line）和辅助输入区（minibuffer）;

状态栏中显示 两个星号则表示文档已被编辑，缓冲区名字，当前所处的主模式(major mode)
副模式（minor mode）,amount of buffer displayed 。

打开多个缓冲区时，每个缓冲区都对应有一个状态栏。

辅助缓冲区用途：命令结果回显，在此输入文件名让Emacs查找，搜索替换，显示错误信息。
当困在辅助缓冲区时可按 C-g 组合键。    
在辅助缓冲区中输入命令后按 回车键发送命令。   





###Emacs命令

Emacs把命令与一个 Ctrl或META开头的组合键关联起来。   
命令与组合键之间的这种关联叫做“绑定（binding）”。  





各种组合键如下所示：			

- 最常用的命令都被绑定为 “C-n”（n可以是任意字符）的形式；
  意思：按住Ctrl键再按下“n”键。
  
- 次常用的命令被绑定为“M-n”的形式；在没有META的键盘上使用Alt代替，
  输入方式：按下Alt键再按住“n”键。
  还可已使用ESC键代替META键，然而此时，输入方式为：按下 ESC 键，释放，再按 “n”键。

  **注意**：有些组合键只能用 ESC 键代替。（用Alt键代替的也应该都可以用ESC代替）

- 其他常用命令绑定为“C-x something” 的形式。如文件操作类命令。

- 某些特殊命令绑定为“C-c something” 的形式；这类命令通常与某些特殊的编辑模式有关。
  比如：图形模式或邮件模式。
  
- 有些命令无法绑定为上述几种情形。这类命令输入方式是：
  “ESC x long-command-nam RETURN”,这种方法其实适用于全部的命令，但组合键更易使用。







**使用基于文本的菜单**		



举例：假设想使用“find-file(查找文件)”选项，则按下 F10 或 ``ESC ` ``键，将打开
一个列出菜单选项的编辑缓冲区。   

选择菜单的方法有3种：  



- 使用 PgUp 键切换到 `*Completions*`缓冲区中，然后使用方向键移动到想执行的
  选项上，再按回车键。		

- 可以使用上下方向键轮流显示选项。  

- 输入各选项的开头的字母，即可选择该选项。









<font color=green>时间 2015.8.3</font>

###打开一个文件

`C-x, C-f` (对应于find-file)的作用是创建一个新的缓冲区；
然后选择或新建一个文件，在此编辑。  


**如果读入了错误的文件**   

按 `C-x C-v` 组合键（对应于 find-alternate-file 命令）意思是：
读取另一个文件来替代刚才读入的那个。   


**Emacs的自动补全功能**  

使用 TAB 键；类似与 shell 中的 TAB 。  


（实际上 shell 中的自动补全功能是借鉴于 Emacs）




**插入和追加文件**   

先将光标移到合适的位置，如移到文件结尾（按 `ESC >`），然后按下`C-x i`，选择文件。








###保存文件

保存文件： `C-x C-s` （save-buffer 命令） 

另存文件： `C-x C-w` （write-file命令）   

如果在保存文件时出现死机现象，这时就需要将`C-s`和`C-q`当作流控制符使用，
这里`C-s`的意思变为“停止接受输入”，而`C-q`相当于重启此次会话。   


write-file命令可以用来编辑没有权限的文件。




###退出 Emacs

`C-x C-c`  

输入`y`和`yes`是有区别的。   





###获取帮助


`C-h` 进入帮助功能    

`C-h t`将启动Emacs教程   

Emacs把光标称为"pont"（插入）






|  键盘操作    | 命令名称      |
|--------------|--------------|
|c-x c-f      | find-file |
|c-x c-v      | find-alternate-file|
|c-x i        | insert-file   |
|c-x c-s      | save-buffer   |
|c-x c-w      | write-file    |
|c-x c-c      | save-buffers-kill-emacs|
|c-h          | help-command  |
|c-h f        | describe-function|
|c-h k        | describe-key  |
|c-h t        | help-with-tutorial|
|c-h i        |info-goto-emacs-command-node|










第二章 文件编辑
---------------


###光标的移动


`ESC x goto-line n RETURN` 把光标移动到文件的第 n 行。    

Emasc24版有所不同：`ESC x goto-line RETURN n RETURN ` 要按两次回车。   





**命令的重复执行**   

Emacs的任何命令都允许重复执行多次。  

有两种方法：   

1. 在准备重复执行的命令前加上`ESC n`，其中的 n 是重复次数；这个命令被称为
   digit-argument命令。  例如：`ESC 500 C-n`光标向下移动500行。 

2. 另一个是在前面加上`C-u n`（命令名是 universal-argument）。不同之处在于
   即使 `C-u`没有指定 n ，它也会默认重复 4 次，按两次 `C-u`将重复 16 次，以此类推。







**重新绘制屏显画面**   

使用组合键`C-l` 重新绘制屏显画面，并且将当前行放在窗口中心位置。  






|  键盘操作|  命令名称 |
|----------|----------|
|C-f   | forward-char |
|C-b   | backward-char|
|C-p   | previous-line|
|C-n   | next-line    |
|M-f   | forward-word |
|M-b   | backward-word|
|C-a   | beginning-of-line|
|C-e   | end-of-line  |
|M-e   | forward-sentence|
|M-a   | backward-sentence|
|M-}   | forward-paragraph|
|M-{   | backward-paragraph|
|C-v   | scroll-up|
|M-v   | scroll-down|
|C-x } | forward-page|
|C-x { | backward-page|
|Esc < | beginning-of-buffer|
|Esc > | end-of-buffer|
| 无   | goto-line |
| `C-l `  | recenter |
|Esc n | digit-argument |
|C-u n | universal-argument |





  




###文本的删除

撤销（undo）命令`C-x u`   


`C-d` (delete-character)  删除光标所在位置处的字符

`ESC d` （kill-word） 删除下一个单词

一些删除命令会根据当前光标所在的位置不同而有所不同。   

`C-k` （kill-line） 删除光标到行尾的文本,在空白行上使用此组合键可将该行删除;
因此想要删除一行，则将光标移到行首，再按`C-k`删除文本，再按`C-k`删除空行。 

`ESC - C-k` 先按 `ESC` 再跟一个`-` 然后按 `C-k` ：删除光标到行首部分。  





**恢复已删除的文本**   

被删除的文本并没有消失，它们被隐藏在一个称为“删除环（kill ring）”中。  

要恢复已删除的东西，可以按下 `C-y` （命令名是 yank）


如果连续执行多次删除操作，则这些删除的文本Emacs会把它们收集起来做为一个整体放到删除环中，
此时使用一个`C-y`就可全部恢复。   
（Emacs中的yank和vi中的yank含义正好相反）



使用DEL键和使用`C-d`删除的单个字符，不会被保存到删除环中，这种情况可以使用undo撤销。






| 键盘操作  |   命令名称   |
|-----------|-------------|
|C-d       | delete-char  |
|DEL       | delete-backward-char|
|ESC d     | kill-word    |
|ESC DEL   | backward-kill-word |
|C-k       | kill-line    |
|ESC k     | kill-sentence|
|C-x DEL   | backward-kill-sentence|
|C-y       | yank         |
|C-w       | kill-region  |
| 无       |kill-paragraph|
| 无       | backward-kill-paragraph|







###文本块及其编辑操作


用标记的方法来标记一个文本块。   

要对文本块进行定义，要用到一个称为“文本标记（mark）”的辅助指针。


把光标移到文本块的一端，按`C-@`或`C-SPACE`组合键设置一个文本标记；然后移动
光标，文本标记和光标当前位置之间的文本构成了一个文本块


光标显示在字符上；而Emacs的插入点实际是在光标位置处字符与其前一个字符之间的夹缝里。

`C-x C-x` （命令名是 exchange-point-and-mark）组合键，作用是换插入点和文本标记的位置。

选择好文本块之后可使用 `C-w`组合键删除文本块。   


标记一个段落的方法，按下`ESC h`(命令名是mark-paragraph)，它会自动地将文本标记放到段落的
结束位置，把光标放到段落的开始位置。   

`C-x h` （mark-whole-buffer）会把整个缓冲区标记为一个文本块，光标在缓冲区的开始位置，文本标记
在缓冲区的结束位置。    





>**X技巧：用鼠标标记文本块**

>按住鼠标左键并拖动鼠标，就可选取文本块。

>启用Emacs的“临时标记模式（transient mark mode）”后选取的文本块高亮显示（如果没有开启应该不会高亮）。      
称其为“临时”标记模式是因为只要对缓冲区做了修改，它就会取消文本标记。    
输入`ESC x transient-mark-mode RETURN`启用该模式。    （Emacs24默认应该已经开启）

>用鼠标标记的另一种方法是：把光标移到文本块的开始，按住鼠标左键并释放，
然后把光标移动到文本块结束的地方，按住鼠标右键一次即可。   





**文本的复制**   

先选择一个文本块，按下 `ESC w`(命令名是 kill-ring-save) 组合键，然后使用`C-y`恢复。 


`ESC w`的一个优势是它可以对只读文件或只读缓冲区进行操作。 如从在线帮助复制文本。   




**恢复更早的删除操作**    

使用`C-y`可将最新删除的文本恢复，继续按`ESC y`恢复删除环中倒数第二次删除的文本，可一直继续按
`ESC y` ；当到达删除环的末尾时，再按`ESC y` 此时又将回到删除的开始（称为环的原因）。
环的大小默认为30      




**文本块的选取和粘贴**     

从 Edit 菜单，选择 Paste from kill Menu 即可看见以前删除的文本，供你选择。   
进入 菜单的方法 `` ESC ` ``或使用鼠标。     



文本块操作命令速查表：   


|键盘操作                |  命令名称                  |
|--------------------|------------------------|
| C-@ 或 C-SPACE | set-mark-command|
|C-x C-x                | exchange-point-and-mark|
|C-w                      | kill-region                 |
|C-y                       | yank                           |
|ESC w                  | kill-ring-save            |
|ESC h                   | mark-paragragh      |
|C-x C-p               | mark-page               |
|C-x h                   | mark-whole-buffer |
|ESC y                  | yank-pop                  |




###段落重排

略

###编辑技巧和快捷键


**交换位置**   

`C-t`  与前一个字符交换位置。    

交换两个单词的位置，先将光标放在两个单词的中间，然后按下 `ESC t` 组合键。   

交换两行文本的方法：把光标放在第二行，按下 `C-x C-t` 组合键。   




位置交换命令表：

| 键盘操作   | 命令名称  |
|-------------|------------|
| C-t            | transpose-chars |
| ESC t         | transpose-words|
|C-x C-t      | transpose-lines  |
| 无              | transpose-sentences |
| 无              | transpose-paragraphs|




**改变字母的大小写**   

| 键盘操作       | 命令名称          |
|---------------|------------------|
|ESC c             | capitalize-word|
|ESC u             | upcase-word  |
|`ESC l`              | downcase-word|
|ESC - ESC c             |negtive-argument; capitalize-word|
|ESC - ESC u             |negtive-argument; upcase-word  |
|`ESC - ESC l    `          |negtive-argument; downcase-word|






**文本的改写模式**    

要覆盖文本需先进入改写模式（overwrite mode）的副模式。   

进入改写模式的方法是按下 INSERT 键，状态栏上将出现 Ovwrt 字样。       
还可通过输入命令 `ESC x overwrite-mode RETURN` 第二次输入后将退出改写模式。   







###命令的中止和修改的撤销


<font color=green>时间 2015.8.4</font>


中文版PDF在此处少了大概一页，补充英文版。  


**Stopping Commands**

press `C-g` , The word Quit appears in the command area.    



**Undoing Changes**

You can undo your changes by pressing `C-x u , C-_ , or C-/ ` (for undo)

What if you'd like to redo a command after you type undo? There is no formal redo 
command, but you can use undo in the following way. Just move the cursor in any 
direction, and type `C-x u` again. Emacs redoes the last command you undid. You can
repeat it to redo previous undo s. 	 




**Reverting a Buffer from a File**   

如果想让文件回到上次存盘时的状态，请输入 `ESC x revert-buffer RETURN` 





**返回文件某个以前的版本：备份文件**   

Emacs会在第一次保存某个文件的时候创建一个备份文件，备份文件的文件名是在原文件末尾
添加了一个 `~` 。   

Emacs没有提供从备份文件恢复编辑缓冲区的专用命令。最简单的办法是直接编辑备份文件，
然后在把它保存为一个正式文件；（先退出Emacs，然后再打开 text~ 直接编辑，再另存文件）



Emacs还有一种编号备份功能。如果启用该功能，Emacs会在每次对文件进行存盘时都会创建
一个备份功能（后缀是 .~n~）,n是一个数字。但这样会造成磁盘空间浪费。    折中的办法是只
保存最近的n个版本。   




Stopping and Undoing Commands:    

| Keystrokes   |   Command Name |    
|----------------|-----------------------|
| C-g                | keyboard-quit        |
| C-x u             | advertised-undo    |
|C-_ 或 C-/       | undo                        |
| ( none)          | revert-buffer          |







**恢复丢失的编辑修改**     

当突然断电，计算机死机等，和在非正常退出Emacs的时候，可能会丢失所做的编辑修改。
Emacs的应对措施是，定期把文件保存在“自动保存(auto-save)”文件里，自动保存文件的文件名
是在正在编辑的文件名前后都加上一个 # 号，比如： #text#  。   


从自动保存文件恢复文本的方法是输入`ESC x recover-file RETURN`      


Emacs创建自动保存文件的时间： 会在每敲了几百次键盘之后或者每当电源被切断或者Emacs
正常结束时创建一个自动保存文件。       


Emacs 的自动保存文件有一个重要的注意事项：如果文件里进行了一次大规模的删除操作，
Emacs将停止自动保存这个文件并显示一条消息通知用户。    
要想让Emacs再次开始自动保存这个文件，请用 `C-x C-s`组合键给这个文件存一次盘，或者
输入`ESC 1 ESC x auto-save RETURN`       








###对Emacs进行定制



初始化文件 位于 主目录的 .emacs 文件。   



**自动启用文本模式和自动换行模式**

	(setq default-major-mode 'text-mode)
	(add-hook 'text-mode-hook 'turn-on-auto-fill)



自动启用临时标记模式

	(setq-default transient-mark-mode t)


解决流控制问题     

	(enable-flow-control)


关闭按键提示功能    

	(setq suggest-key-bindings nil)





**疑难解答**


略





第三章 查找和替换操作
--------------------



###查找操作



###查找和替换操作


###拼写检查



###单词简写模式



第四章 使用编辑缓冲区和窗口
---------------------------

<font color=green> 时间 2015.8.4 </font>




###文件、编辑缓冲区和窗口

窗口是显示器屏幕上用来显示编辑缓冲区内容的区域；缓冲区是文件的一个工作副本。   











###同时使用多个编辑缓冲区进行工作




使用 `C-x C-f` 打开一个文件，并创建缓冲区。     

使用 `C-x b` 在编辑缓冲区之间进行切换，后要跟一个编辑缓冲区名。   



You can do the following with C-x b :      

| If you type C-x b followed by  |  Emacs            |
|-------------------------------------|-----------------|
|A new buffer name             | 新创建一个与任何文件都没有联系的编辑缓冲区并转移到那里|
| The name of an existing buffer| 进入该编辑缓冲区|



表格中的第一种情况应该掌握。     

`C-x b` 的其它应用场景：

如果没有记住当前正在编辑的缓冲区名，而突然按了某个键使得其消失了，此时
在没有进行其他操作之前，立即按下 `C-x b`组合键，此时默认的编辑缓冲区正好是刚才消失的那个。   



<big>**多个编辑缓冲区的保存**</big>

一个一个保存缓冲区使用 `C-x C-s` 组合键。     
如果正在使用多个编辑缓冲区，此时按下 `C-x s` （save-some-buffers）组合键可全部保存。 
然后Emacs会一个一个询问是否保存，按下` !` 可无条件的保存所有编辑缓冲区。   
更多细节看相关提示。     
此时若不确定是否需要保存某个编辑缓冲区，可按下 ` C-r` 组合键进入查看模式（view mode）
查看内容以决定是否保存。    




<big> **编辑缓冲区的删除** </big>


删除一个编辑缓冲区的方法是 按 `C-x k` （kill-buffer）组合键。   


命令 `ESC x kill-some-buffers`  Emacs将依次列出每个编辑缓冲区的名字，进行询问是否删除。



<big>**编辑缓冲区的重新命名 **</big>

重新命名编辑缓冲区的方法是： 输入 `ESC x rename-buffer` Emacs提示输入新名字。  


一种情况是两个不同目录中有两个相同的文件名，而且都在Emacs中打开，此时Emacs会将后
一个文件对应的编辑缓冲区的名字后加上一个 `<2>` 并依次类推。      
此时可以通过重新命名使其更好区分。   




<big>**只读编辑缓冲区 **</big>

使用 `C-x C-q` 组合键把编辑缓冲区设置为只读属性。   
在只读编辑缓冲区中状态行左边会出现两个百分号 %% 。再次按下该组合键则可取消只读属性。


此操作不改变 UNIX 文件的权限。








###使用窗口进行编辑





可以使用一个以上的窗口来显示同一个编辑缓冲区里的内容，在一个窗口中所做改变，在其它窗口中
的内容也会改变。    


文件标记是与编辑缓冲区而不是窗口关联，每个编辑缓冲区只能有一个文本标记。   




<big>**创建上下排列的窗口 **</big>    

**水平分割当前窗口**      
  `C-x 2` 组合键，重复这个操作将分割出更多窗口。   


**垂直分割窗口**    

`C-x 3` 组合键         
垂直分割后，屏显画面的宽度通常不够Emacs显示一个完整的文本行，此时会显示一个小箭头。




<big>**在窗口之间移动 **</big>


`C-x o` 组合键，（o 代表 other） Emacs 将按顺时针方向移动到下一个窗口中。   
注意：Emacs没有提供移动到指定的窗口中去的方法。         
但提供了一次移动多个窗口的方法： `ESC n C-x o` 一次移动 n 个窗口。   





<big>**窗口的删除 **</big>

- 删除所在窗口 `C-x 0` 组合键    

- 删除其它窗口 `C-x 1` 组合键

- 还可使用`ESC x delet-windows-on RETURN buffername RETURN`来删除某个特定编辑
     缓冲区上的全部窗口。    





<big>**调整窗口的大小尺寸 **</big>

`C-x ^` 加高当前窗口，它下方的窗口将被相应的压低。   

`C-x } `  加宽这个窗口，它右方窗口将变窄。   

`ESC x shrink-window` 压低当前窗口。   

`C-x { ` 在水平方向收缩窗口。    

以上操作可结合重复组合键一起操作。    

`C-x -` 收缩到缓冲区大小（如缓冲区只要几行而已），如果缓冲区大于当前窗口尺寸，则不变。

`C-x +` 使所有窗口都变成同样的大小。     



<big>**窗口大小的上下限 **</big>

最大不能超过屏幕，而最小则要看Emacs变量 `window-min-height`（默认是4行）和 
`window-min-width`(默认是10个字符)的取值情况。       

当扩大某个窗口时，其它被压缩的窗口宽度小于10个字符或高度小于4行时，该窗口将被删除。




<big>**对其它窗口进行操作的快捷命令 **</big>


执行这些命令，就能不必移动到另一个窗口中就能对它进行操作。     

其中最常用的是卷动其它窗口里的内容，`ESC C-v` 组合键。     

在另一个窗口里查找并打开一个文件，按下 `C-x 4 f `     

在另一个窗口里选择另一个编辑缓冲区，按下 `C-x 4 b`       




<big>**对比两个窗口中的文件 **</big>


需分别在两个窗口打开文件，然后都将光标移到文件开头，输入命令
`ESC x compare-windows`，然后就会找到两个缓冲区的第一个不同之处。   

该命令只有在两个编辑缓冲区的插入点都处于精确位置时才能工作，要查找第二个不同之处，
可能需要适当移动光标。     








中文版缺少124页 

Window Commands:  

|   Keystrokes    |  Command Name  | Action       |
|------------|-----------------------|-------------------|
|C-x 2      |  split-window-vertically|  one above the other |
| C-x 3     |   split-window-horizontally| side-by-side windows |
|`C-x o`    | other-window        | ...                           |
|C-x 0      | delete-window      | Delete the current window   |
|C-x 1      | delete-other-windows| Delete all windows but this one |
|(none)   | delete-windows-on      | Delete all windows on a given buffer |
|C-x ^     | enlarge-window            | Make window taller     |
|(none)   | shrink-window               | Make window shorter |
| C-x }     | enlarge-window-horizontally | Make window wider |
|C-x {      | shrink-window-horizontally    | Make window narrwer |
|C-x -      | shrink-window-if-larger-than-buffer | Make window smaller if buffer is smaller than window|
|C-x +     | balance-windows            | Make windows the same size |
|ESC C-v | scroll-other-window      | Scroll other window           |
|C-x 4 f   | find-file-other-window  | Find a file in the other window |
|C-x 4 b  | switch-to-buffer-other-window | Select a buffer in the other window |
|(none)   | compare-windows         | Compare two buffers and show |






<big>**Getting a List of Buffers **</big>

按下` C-x C-b` Emacs就会把编辑缓冲区清单表列出来。    

它会在屏幕上创建一个新的 `*Buffer List*` 窗口，	        





<font color=green>时间 2015.8.5</font>



编辑缓冲区中第一列中代码含义：

|  符号  | 含义   ||  符号  | 含义   ||  符号  | 含义   |
|--------|-------|-|--------|-------|-|--------|-------|
| .        |已显示|  | %   | 只读   | | > |标记为待显示|
|*        | 已修改| | D    | 标记为待删除| | S | 标记为待存盘 |




在`*Buffer List*` 中还可以按`空格`来下移一行。     

可以通过一系列单字符命令来对列在清单里的编辑缓冲区进行操作。       

1. 如果想删除编辑缓冲区，在改行按下 `d` 或者 `k` ；大写字母 `D`将出现在该列；可以标记多个，在按下
   `x`（表示 execute 执行）键之后，它们才会删除。     
   如果在按下`x`之前不想删除该列，则在该列按下`u`即可取消，更简便的方法式用 `DEL`键。     

2. 如果想存盘 则按 `s` ，后续操作与 删除 相同。  
3. 按下百分号 `%`  标记只读。     
4. 按`~`标记未修改标记，作用是欺骗Emacs此文件尚未修改，此时无需自动保存，直到下次改变。    
5. 按下数字`1`将把所在行的编辑缓冲区满屏显示。        
6. `2` 把这个编辑缓冲区和下一个编辑缓冲区显示到两个水平窗口里。       
7. 按`f`将编辑缓冲区替换编辑缓冲区清单，（以后 编辑缓冲区 指当前光标所在的编辑缓冲区）       
8. 按`o`将编辑缓冲区放在编辑缓冲区清单外的另一个窗口 。      
9. 按下`m`（mark）出现一个 > ，再按下 `v`键，将创建水平窗口显示 > 标记的编辑缓冲区。      
10. 删除`*Buffer List*`窗口，按下`C-x 0`或`C-x 1` 。              
11. `q`退出编辑缓冲区清单。  







###在文档中使用书签

利用书签，可让Emacs自动查找并打开这个文件，然后把光标放到当初设置这个书签时所指定的位置。   

在第7章还将介绍通过 ange-ftp 模式来查找远程系统上的文件。     

创建书签时，Emacs将在主目录里创建一个名为“.emacs.bmk” 的书签文件。  
书签是按用户分别保存的。   





<big>**书签的设置**</big>    

`C-x r m ` （命令名是 bookmark-set）组合键，    
如果还没有在这次编辑工作中使用过书签，Emacs会把文件名放置在一对括号里作为默认书签，
如果使用过书签，括号里放的就是书签的名字）。


**注意：**可以将老书签设置新位置，不管它是不是在另一个文件里。



<big>**移动到书签指示的位置**</big>    


`C-x r b` （bookmark-jump）组合键，再输入书签名。   





<big>**书签的重新命名和删除**</big>    

输入`Esc x bookmark-rename` 重新命名。    


输入`Esc x bookmark-delete` 删除书签。     

* 因为设置书签时书签指向的是文件中此时光标所在的位置，而与此时光标下的文本内容无关。  

* 如果书签指向的文件被删除或被重命名，访问书签时将提示 `是否 Relocate`（重定位） 信息，
  如果选择 `y` 则重新指定文件路径或文件名（原文件并没有删除），选择`n`将删除书签（原文件已经删除）    




<big>**与书签清单有关的操作**</big>    

`C-x r l` 打开`*Bookmark List*`缓冲区。   




书签清单编辑命令速查表：

| 命令  |         动作                    |
|-------|------------------------|
| d       | 给书签加上待删除标记 |
| r        | 对书签重新命名          |
| s       | 保存清单里的全部书签|
| f        | 显示光标位置上的书签|
| m      | 给书签加上待显示标记 |
|v        | 显示加有待显示标记的书签，或显示该行书签|
|t        | 切换书签关联文件的路径的显示/不显示状态 |
| w      | 显示书签关联文件的存放位置 |
|x        | 删除加有待删除标记的书签    |
|u        | 去掉书签上的待操作标记        |
|DEL    | 去掉上一行书签上的待操作标记 |
|q        | 退出书签清单                           |




<big>**与书签有关的其他编辑命令**</big>    

书签还有一些奇妙的操作命令 


* bookmark-insert   :  把书签文件中的文件插入到光标位置上。   
* bookmark-write   ： 把书签全部保存到一个指定的文件中。    
* bookmark-load     ：从指定文件里加载书签。      






书签命令速查表：

| 键盘操作    |      命令名称     |
|--------------|-----------------|
| C-x r m      | bookmark-set |
| C-x r b       | bookmark-jump|
| 无               | bookmark-rename|
| 无               | bookmark-delete |
| 无               | bookmark-save |
|C-x r l         | bookmark-menu-list|
| 无               | bookmark-insert |
| 无               | bookmark-write  |
| 无               | bookmark-load   |



###临时性的挂起Emacs

`C-z` 组合键把 Emacs 暂停运行，在控制台中就是将 Emacs 至于后台运行，输入 `fg`置于前台。   


该功能很容易导致用Emacs打开同一个文件的多个版本，而产生混乱。   

可用`jobs`查看是否已经有挂起的Emacs。






###使用多个X窗口进行编辑


Emacs把X窗口称为“窗格（frame）” ，这是为了把其与前面介绍过的Emacs窗口区别开来。    

Emacs关于窗格的操作和Emacs窗口的操作有些类似。
如窗口操作`C-x 4 f` ，对应窗格的操作为`C-x 5 f` 。        



<big>**窗格操作命令**</big>    

打开一个新窗格的方法是 `C-x 5 2` （make-frame）组合键。  

如果新窗格完全遮盖当前窗格，则可能需要对新窗格的大小进行调整。       

还可在 .emacs文件里添加一下语句：
       (setq initial-frame-alist '((width . 75) (height . 34)))
       (setq default-frame-alist '((width . 60) (height . 20)))

这些语句对Emacs窗格尺寸进行了设置。第一个窗格的尺寸采用 initial-frame-alist 中的设置值。  
后续窗格将采用 default-frame-alist 中的设置值。    


请注意：新窗格的顶部。Emacs默认情况下会把编辑缓冲区的名字放在那里
（如果只有一个窗格，Emacs会把系统的名字放在顶部）     


输入：`C-x 5 newfile RETURN`  将在新窗格中打开新的文件 newfile 。 


在窗格之间移动 `C-x 5 o` 组合键，进入另外一个窗格。    

删除一个窗格，`C-x 5 0` 组合键。    


以只读方式打开一个窗格， `C-x 5 r `      



<big>**窗格与编辑缓冲区的关系**</big>    

在多个窗格中，Emacs 会给窗格起一个与编辑缓冲区同名的名字。   


窗格命令速查表：

|  键盘操作   |  命令名称              |
|-------------|---------------------|
| C-x 5 o      | other-frame        |
| C-x 5 0      | delete-frame      |
| C-x 5 2      | make-frame        |
|C-x 5 r        | find-file-read-only-other-frame |
|C-x 5 f        | find-file-other-frame |
|C-x 5 b       | switch-to-buffer-other-frame  |









第五章 Emacs工作环境
--------------------


运行UNIX的shell的方式是，进入shell编辑缓冲区。  


###在shell编辑缓冲区里执行UNIX命令


<big>**一次执行一条UNIX命令**</big>    

按下` ESC ! ` 组合键，输入shell命令，回车；将打开一个`*Shell Command Output*` 的窗口；   
并把执行结果显示在其中。按下` C-x 1` 组合键关闭这个窗口。    




Emacs 的shell命令工具有一个很有意思的功能，即可以用某个编辑缓冲区的一个文本块，作为命令的
输入。先选择一个文本块（一般用 `ESC h` ，光标在这个段落的开头，文本标记在段落末尾）    
然后按下 `ESC l` （命令名是 shell-command-on-region）组合键，然后输入shell命令。  



按下 `C-u ESC !` 将执行一条 shell 命令，并把其输出放到当前编辑缓冲区里。  


可以修改Emacs的变量`shell-file-name` 的值来控制 执行UNIX命令所使用的 shell （如换成csh）
该变量的值必须是新shell的可执行文件的完整路径。   
将其添加到 .emacs 文件中：  `(setq explicit-shell-file-name "/bin/sh")   




<big>**使用 shell 模式**</big>    

Emacs 编辑器的 shell 模式：用来执行 UNIX 命令的互交式功能组件。     

启动 shell 编辑缓冲区的方法是给出 `ESC x shell` 命令， 这将创建一个名为 `*shell*` 的编辑缓冲区。  






###文件和目录操作


###Emacs中的打印操作


###用Emacs查阅UNIX的在线文档


###时间管理工具的使用



###用好Emacs工作环境






第八章  
-----------------


###绘制简单的图形


Emacs有一个图形模式（picture mode），它允许使用键盘字符绘制简单的图形。  

图形模式相当于把被编辑区域变成一块按行、列划分的绘图板。在图形模式中，可以用键盘字符创建出简单的图形，并且不让它们被自动换行模式（auto-fill mode）的字环绕功能“重新排版”   


进入图形模式的命令是` ESC x edit-picture` 状态栏上将出现 "Picture" 字样，跟在它后面的是
默认绘制方向。   

按下 `C-c C-c` 组合键退出图形模式。   



<big>**在图形模式中绘制图形**</big>  

在图形模式里，可以沿 8 个方向中的任何一个用任何一种字符“画图”。   
但每次只有一个方向是可用的，这个方向就叫做 “默认绘制方向（default direction）” 。   
刚进入图形模式的时候，默认绘制方向是“右”。     
默认绘制方向会显示在状态行上；如 ： ` (picture:right)`       
















第十章 Emacs中的宏
-----------------

10-12章  	334页 ~ 405页


###什么是宏


###定义宏



###向现有的宏里增加编辑命令


###命名并保存宏



###执行一个已命名的宏



###建立复杂的宏


###LISP函数——宏的补充







第十一章 对Emacs进行定制
----------------------

###键盘的定制



###终端支持



###Emacs变量


###Emacs的LISP程序包


###自动模式的定制





第十二章 程序员的Emacs
----------------------


###语言编辑模式


###C和C++模式



### LISP模式



### FORTRAN模式



### 对程序进行编译











