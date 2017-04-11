《Linux 命令行和Shell脚本编程宝典》 
===============================
<font face=楷体>        
《Linux Command Line and shell Scripting Bible》    
[美] Richard Blum  著   	
苏丽 张妍婧 候晓敏   译     	
北京：人民邮电出版社，2009.6   		
	ISBN 978-7-115-19777-1			
</font>

搜索“时间”，查看笔记日期。


目录
------
[toc]


术语
----------------

distribution			发行版			
kernel					内核		
init process			初始程序			
Virtual File System,	VFS		
`GUN's Not Unix ` 		
OOS						开源软件		
GNOME	GUN Network Object Model Environment		GUN网络对象模型环境		
Command Line Interface , CLI  				命令行界面			


<font color=green>时间 2015.8.1</font>

第二章：了解shell		
--------------------------

Command Line Interface , CLI  				命令行界面			

开机进入的文本模式称为**Linux 控制台**			



>**补充：**	
《UNIX操作系统设计》shell的内部命令不仅使shell是命令解释程序，而且是一种程序设计
语言，它包括用于循环的命令（for-in-do-done和while-do-done),用于条件执行的命令
（if-then-else-fi）,一个选择（case）语句命令，cd命令和其他一些命令。  





第八章：基本脚本编程 
------------------------------

 


###使用变量

**用户变量：**    	

用户变量在 20 个字符以内，    
区分大小写，  
赋值时在变量、等号、变量值之间不允许有空格。   

也可使用 `${variable}`来引用变量。  



**反引号：**

 允许将 shell命令的输出赋值给变量。   

如： testing=`date`   		
testing变量的值为 date 命令的输出  

这个常用例子，说明如何用反引号类捕获当前日期，并用它自爱脚本中创建唯一的文件名：  

```shell
#!/bin/bash
#copy the  /usr/bin directory listing to a log file
today=`date + %y%m%d`         #一种为日志文件提取日期信息的常用技术
ls /usr/bin -al > log.$tody
```





**内置输入重定向**（inline input redirection）       

该方法允许在命令行中而非文件中为输入重定向指定数据。  

内置输入重定向符号是 `<<	` 和 一个指定的文本标记 （用来说明输入数据的开始和结尾，
该文本标记可以是任何字符串值，但是在数据的开始和结尾处必须相同）      





###数学计算



**expr命令**		

**expr 命令操作符 **

| 操作符                              |           描述                                                   |
|----------------------------------|----------------------------------------------------------|
| ARG1 ｜ ARG2                 | 如果两个参数都不为空或都不为0，返回 AEG1；否则，返回ARG2|
| ARG1 & ARG2                |  如果两个参数都不为空或都不为0，返回 AEG1；否则，返回0  |
|   条件表达式					|					为真返回 1；为假返回0 |
 | 算术运算`+ - * / %` 		 |返回计算结果| 
| STRINT:REGEXP           | 如果REGEXP匹配STRING中的一个模式，返回该模式 |
| match STRING REGEXP | 如果REGEXP匹配STRING中的一个模式，返回该模式 |
| substr STRING POS LENGTH | 从POS位置起始（始于1），返回长度为LENGTH的字符|
| index STRING CHARS | 返回在 STRING中到 CHARS的位置，否则返回0 |
|length STRING | 返回字符串 STRING的长度 |
| + TOKEN   |  将 TOKEN解释为一个字符串，即使它是一个关键字 | 
| (EXPRESSION) | 返回EXPRESSION的值 |


有些运算符需要使用转义字符。  



**使用方括号**		

为变量指定一个数学值时，可以使用 美元符号`$` 和 方括号`[]` 把数学等式括起来：    

```shell
$ var1=$[1 + 5]
$ echo $var1
```

###浮点数解决方案	

Bash shell 的数学操作只支持整数算法。（Z shell支持浮点算术运算）		
有几种克服 bash 整数限制的解决方案。最普遍的是使用内置的 bash 计算器（称为 bc）。  

**1.bc的基本知识**

bash 计算器实际上是一种编程语言，该语言允许在命令行中输入浮点表达式，
然后解释表达式并计算它们，最后返回结果。    

bash 计算器可以识别：    
- 数字（整数和浮点）
- 变量（简单变量和数组）
- 注释（以#开始的行或c语言的/* */对）
- 表达式
- 编程语句（如if-then语句）
- 函数



>疑惑 ? ?
什么是浮点算术？		
bc 可以直接 计算 `12*5.4` 这样的表达式，而计算 `3.44/5 `这样的表达式时需要另行设置？     

浮点算术被称为` scale` 的内置变量控制。必须把这个值设置为想要的十进制小数位，否则得不到想要的结果：   

```shell
$ bc -q   			#关闭 bc 启动时的 欢迎标语
3.44/5
0						# scale变量的默认值是0 。作用是规定小数位数
scale=4
3.44/5
.6880
```

bash计算器也识别变量：   

```shell
$ bc -q
var1=10
var1*4
40
var2 = var1 / 5
print var2
2
```


**2.在脚本中使用bc**		

方法：使用反引号运行 bc 命令，并把输出赋值给一个变量。 

基本格式： 		``variable=`echo "options; expression"  | bc` ``


第一部分 options 允许设置变量。如果需要设置多个变量，使用分号将其隔开。		
expression 参数定义了使用 bc 计算的数学表达式。		

```shell
 #!/bin/bash                                                                  
var1=`echo "scale=4; 3.44 / 5" | bc`
echo The answer is $var1
```

用上面这种方法时表达式只在一行，当表达式复杂时可读性差。
可利用内置重定向的方法解决问题。 		
也可使用文件重定向，将表达式从文件中导入，但这种方法还需要在脚本文件之外另外新建文件，在此不做说明。  


```shell
#!/bin/bash
var1=10.46
var2=43.67
var3=33.2
var4=71

var5=`bc << EOF
scale = 4
a1 = ( $var1 * $var2)
b1 = ($var3 * $var4)
a1 + b1
EOF
`

echo The final answer for this mess is $var5
```

使用该技术，可在脚本中把每个操作和表达式放在单独的行中，使其更加
清晰并便于阅读。EOF字符串标明要重定向到 bc 命令的数据的开始和结束。并将其放在反引号中。   




###退出脚本

shell中的命令的退出状态介于 0 ~ 255之间的整数，命令完成后，就将退出状态传递给 shell 。  

使用 `$?` 保存最后一条命令执行结束的退出状态。   可使用 `echo $?`查看。  


**Linux退出状态代码** 

| 代码		| 描述				|| 代码   | 描述		|
|------------|-------------------|-|---------|------------|
|0           | 成功完成		| | 128| 无效的退出参数|
|1           | 通常的未知错误||128 + x | 使用Linux信号 x 的致命错误|
|2      	  | 误用shell命令| | 130 | 使用 Ctrl - C 终止的命令  |
| 126 	 | 命令无法执行  | | 255 | 规范外的退出状态|
|127 	| 	没有找到命令 		|| 		|							|

*linux退出状态码没有标准约定，但有些准则可用。*



**退出命令**		

在shell脚本最后一条命令可使用 命令`exit`指定自己设定的退出状态码，
但须记住在0~255之间，超出值将被取模。  







第9章：使用结构化命令 
-------------------------------------

###使用if-then语句

格式：		

```shell
if command
then
	commands
fi
```

说明：if 语句运行在 if 行定义的命令。如果命令的退出状态是 0 ，则执行 then 后面的所有命令，否则跳过。

另一种格式：		

```shell
if command; then
	commands
fi
```



###使用if-then-else语句

格式：		

```shell
if	command
then
	commands
else
	commands
fi
```




###嵌套if语句

elif 以另一个 if-then 语句继续 else 部分：	

```shell
if 	command1
then
	commands
elif 	command2
then
	more command3
fi
```


###test命令

bash的 if-then 语句只能测试 一条命令的退出状态码 		

`test`命令提供一种检测 `if=then`语句中不同条件的方法。	
如果 `test`命令列出的条件评估值为 `true`，`test`命令以`0`退出。



test 命令能够评估以下 3 类条件：		
- 数值比较
- 字符串比较
- 文件比较


格式： `test condition`

将其放入 if-then 语句中，如下：		

```shell
if test condition
then
	commands
fi
```

bash shell提供一种在 if-then 语句中声明 test 命令的另一种方法：	

```shell
if	[ condition ]
then 
	commands
fi
```

**注意**：前半个方括号的后面和后半个方括号的前面必须都有一个空格。



**数值比较**		

| 比较    |	描述		||	比较		|	描述		|
|---------|	------------	|-|	-----------|	-----------|
|n1 -eq n2|	  n1 = n2	||n1 -le n2	|	n1 <= n2|
|	n1 -ge n2	|	n1 >= n2	||n1 -lt n2	|n1 < n2	|
|	n1 -gt n2	|	n1 > n2	||n1 -ne n2	|n1 != n2	|


（使用文本代码进行比较）

*test 命令不能用于由 bc 处理而来的浮点数 *		

记住，bash shell 只能处理整数数字。使用 bash 计算器时，我们只是
把浮点值作为字符串值存储于一个变量来欺骗 shell。   
此法（即使用bc来处理浮点数）可用于 echo 语句 ，但不适于面向数值的函数。		




**字符串比较**		

test命令字符串比较		（使用数学比较符）

|比较	| 描述	||比较	| 描述	|  
|	---	|	---	|-|	---	|---	|
|	str1 = str2	|		||	str1 > str2	|		|
|	str1 != str2	|		||	-n	|	检查str1的长度是否大于0	|
|	str1 < str2	|		||	-z	|	检查str1的长度是否为0	|


使用test命令的大于或小于功能时的两个问题。			
- 大于和小于符号一定要转义
- test命令使用标准的ASCII排序，sort 命令使用为系统当前语言设置定义的排列顺序。



**警告：**空变量和没有初始化的变量可能会对shell脚本测试产生灾难性的影响。如果
不确定变量的内容，在数值比较或者字符串比较中使用它之前，最好使用 -n 或者 -z 测试一下
它是否有值。   


 
 
 

**文件比较**		

test 命令能够测试 Linux 文件系统上的文件状态和路径。		

test命令文件比较		

| 比较			 | 描述							  |
|---------------|--------------------------------|
|	-d file		|		检查 file 是否存在并且是一个目录  |
|	-e file		|		检查 file 是否存在  |
|	-f file		|		检查 file 是否存在并且是一个文件  |
|	-r file		|		检查 file 是否存在并且可读  |
|	-s file		|		检查 file 是否存在并且不为空  |
|	-w file		|		检查 file 是否存在并且可写  | 
|	-x file		|		检查 file 是否存在并且可执行 | 
|	-O file		|		检查 file 是否存在并且被当前用户拥有  | 
 |	-G file		|		检查 file 是否存在并且默认组是否为当前用户组  |
|	 file	-nt file2	|		检查 file1 是否比 file2 新  | 
 |	 file	-ot file2	|		检查 file1 是否比 file2 旧  | 
 
 
 
 
 
 

###复合条件检查

if-then 语句可以使用布尔逻辑来合并检查条件。可使用两个布尔操作符：		
- [ condition1 ] && [ condition2 ]
- [ condition1 ] || [ condition2 ]




###if-then的高级特性

bash shell 新添加了两个比较新的功能，它们提供了可以在 if-then 语句中使用的高级功能：		

- 双圆括号表示数学表达数
- 双方括号表示高级字符串处理函数






**使用双圆括号**

双圆括号命令允许在比较中包含高级数学公式。		

test 命令只允许在比较中进行简单的算术操作。 双圆括号命令提供更多的数学符号。  

格式：		`(( expression )) `


双圆括号命令符号		

|	符号 | |  符号 | 
|	-----	|-|	-----	|
|	val++	||	<<	|
|	val- -	||	>>	|
|	++val	|| &		|
|	- -val	||	｜ 	|
|	!	||	&&	|
|	~	||	｜｜	|
|	**	（取幂）||		|

（碍于makedown表格的格式，表格中的 `||`只能使用两个全角字符`｜｜`代替）



**使用双方括号**		

双方括号命令为字符串比较提供高级功能。  

格式：  `[[ expression ]] 

双括号包围的 expression 使用在 test 命令中使用的标准字符串比较。   
但它提供了 test 命令没有的另一个功能， 即**模式匹配**

在模式匹配中，可以定义与字符串值相匹配的正则表达式。   （或者 shell 所用匹配，自己猜测）		



	



###case命令

case 命令以列表导向格式检查单个变量的多个值：		

```shell
case variable in
pattern1 | pattern2)  commands1; ;
pattern3)  commands2; ;
*)  default commands; ;
esac
```

case 命令将指定的变量与不同的模式进行比较。如果变量与模式匹配， shell 执行为该模式指定的命令。   
可以在一行中列出多个模式，使用 竖条操作符`|`将每个模式分开。 星号是与任何列出的模式都不匹配的所用值。







第10章：更多结构化命令
-------------------------------------

###for 命令

bash shell `for`命令的基本格式：		

```shell
for var in list
do 
	commands
done
```

>如果愿意，可以将do 语句与 for 语句放在同一行，但是必须使用分号将它与列表项分开。     
`for var in list; do`

```shell
#! /bin/bash
# basic for command
for test in Alabama Alaska Arizona Arkansas Califormia Colorado
do
    echo The next state is $test
done

echo "The next state is $test"                         #注意：在循环体外变量的作用域仍然有效               
test=Connecticut
echo "Wait, now we're visiting $test"
###############  运行示例  ###################
The next state is Alabama
The next state is Alaska
The next state is Arizona
The next state is Arkansas
The next state is Califormia
The next state is Colorado
The next state is Colorado  
Wait, now we're visiting Connecticut
```


*观察for中变量的作用域问题 *


**读取列表中的复杂值**		

```shell
#!/bin/bash
# another example of how not to use the for command                                                                                 

for test in I don't know if this'll work           # 将这对单引号内的的内容看作单一的数据值  
do
    echo "bad word:$test"
done

echo "#################"

for test in I don\'t kown if "this'll" work     	 #使用转义字符或双引号 
do
    echo "word:$test"
done

##################  运行示例 ##################
bad word:I
bad word:dont know if thisll        
bad word:work
#################
word:I
word:don't
word:kown
word:if
word:this'll
word:work
```


列表中的每个值都用空格分隔，如果某个值要包含空格，可用`" "`将其括起。  
shell 不会将双引号作为值的一部分。  

>**内部字段分隔符(Intermal Field Separator, IFS)**		
shell 中有一个 IFS 环境变量，保存当前shell环境使用的默认界定字符串（空白字符）   
IFS 可更改		
参考：《Linux shell 脚本攻略》    
书中还有关于 数组和关联数组的介绍		



**从变量读取列表**		

```shell
#!/bin/bash                                                           
# using a variable to hold the list

list="Alabama Alaska Arizona Arkansas Colorado"
list=$list" Connecticut"    		# 为list添加值的一种方法

for state in $list
do
    echo "Have you ever visited $state?"
done
#################  运行示例 #################
Have you ever visited Alabama?
Have you ever visited Alaska?
Have you ever visited Arizona?
Have you ever visited Arkansas?
Have you ever visited Colorado?
Have you ever visited Connecticut?
```

注意，向列表添加值所用的方法。   这是一种将文本添加到一个
以存在的、存储在一个变量中的文本字符串末尾的常用方法。		




####读取命令中的值

生成列表使用的另一种方法是使用命令的输出。
可以使用反引号字符来执行生成输出的任何命令。		

```shell
#!/bin/bash
# reading values from a file

file="states"       #文件在当前目录

for state in `cat $file`            #使用反引号                                  
do
    echo "Visit beautiful $state"   
done
######## states文件内容 ################
Alabama                                                               
Alaska
Arizona
Arkansas
Colorado
Connecticut
Delaware
Florida
Georgia

```


**改变字段分隔符**

见上文


####使用通配符读取目录

可以使用 for 自动迭代文件的目录。		
文件通配（file globbing）：是生成指定通配符匹配的文件或路径的过程。  

当不知道目录中所有的文件名时，可使用这个功能。		

```shell
#! /bin/bash                                                          
# iterate through all files in a directory

for file in /home/rich/test/*
do
    if [ -d "$file"]
    then
        echo "$file is a directory"
    elif [ -f "$file"]
    then
        echo "$file is a file"
    fi
done
```

**注意：**文件名或路径中可能包含空格，所有将变量 $file 放在双引号`" "`内。


### C形式的for命令

###while 命令

###until 命令

###嵌套循环

###文件数据的循环

###控制循环

###处理循环的输出


第11章：处理用户输入
--------------------------------

















