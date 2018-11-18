《Python 编程入门》第3版 （上）
========================

<font face=楷体>
书籍原名：Python: Visual Quickstart Guide, third edition    
[加] Toby Donaldson 著   
袁国忠 译  
人民邮电出版社，2013.12  
我把它简称 PVQG
</font>


<font size=6>目录</font>     

[TOC]
































































































第二章：算术、字符串与变量
--------------------------



###整数算术

python支持4种基本算术运算：      

*  `+` 加
*  `-` 减
*  `*` 乘
*  `/` 除

python还支持：    

- `**`	表示乘方(如 `2 ** 640` 表示2的640次方)
- `%`		表示取余
- `//`	整除（直接丢弃小数点后的数）


**Python中整数的长度可以是任意长度**





###浮点数算术


**所以整数的算术符都可用于浮点数**

注意：存在近似误差很常见，因此显示的通常不是准确值。


**浮点数字面量：**  

对于非常大或非常小的浮点数，通常用科学记数法表示  
 
如：	2.3e02


** 小数点的使用方面非常灵活**

如：  

	3.
	3.0
	.5
	0.5


**溢出**

与整数不同，浮点数存在上限和下限。

对于溢出错误Python 可能并不提示错误。


**精度有限**

无论在哪种计算机，浮点数的精度都是一个无法解决的难题.

可表示小数点后17位小数



** 复数 **

Python 中提供了内置的复数支持。  
复数是涉及 -1 的平方根的数字;  
Python用 `-1j` 表示 -1 的平方根。  



###其他数学函数

math 模块中包含一些最常用的函数



**导入模块**

任何模块在使用时都须先导入

导入模块math

1. 导入方式一： 

	```python
	import math  
	```
	
	导入之后可通过 . 运算符使用函数  

	如： ` >>> math.sqrt(5)`    

2. 导入方式二：  
		
	```python
	from math import *  
	```
	
	意义：从模块 math 中导入 它的所有函数（*号代表所有，也可只调用某一个）
	
	这样在调用math模块中的任何函数时，都无需在前面加上math.

	如 ` >>> sprt(5) `

	存在的问题：可能存在与模块名同名的函数，则会将其覆盖。






###字符串


**标识字符串**

使用下面3种主要方式来表示字符串字面量：

- 单引号   
	如： `'http'`
	
- 双引号    
	如：` "http"`
	
- 三引号   
	如：  
	
```python
		"""    
		Me and may monkey
		Have something to hide
		"""  
```

单引号中可包含双引号，双引号中可包含单引号。


** 字符串长度 **

要确定字符串包含多少个字符，可使用函数 ` len(s) ` 




###字符串拼接


```python
>>> 'hot' + ' ' + 'dog'
'hot dog'

>>> 5 * 'ha'     #将 'ha' 连续拼接5次
'hahahahaha'
```


###获取帮助

从很大程度上说，Python是一种自文档化语言，大多数函数和模块  
都包含简短的解释。


**列出模块中的函数**

*导入模块*后可利用函数 ` dir(m) ` 列出模块m所有函数  

```python
>>>import math  	#先导入 math 再使用 dir(math)
>>>dir(math)
```

查看完整的Python内置函数清单，在命令行下输入 ` dir(__builtins__) ` 

使用函数 help(f) 来查看函数 f 的文档字符串

要运行Python实用程序 help ，可在提示符下输入 ` help() ` 



**打印文档字符串**


大多数Python 内置函数和 Python标准模块中的函数都有简短的文档字符串

访问方式：



```python
>>> print(math.tanh.__doc__)           #列出math.tanh() 文档字符串

>>> print(bin.__doc__)				#列出内置函数bin的文档字符串
```





###类型转换


**将整数和字符串转换为浮点数**    

```python
float(x)
>>> float(3)
3.0
>>> float("3.2")
```


** 将整数和浮点数转换为字符串**  

函数 ` str(n) ` 将指定的数字转换为相应的字符串  

```python
>>> str(85)
'85'
>>> str(-9.87)
'-9.87'
```


** 将浮点数转换为整数**  

函数 ` int(x) ` 将小数部分删除  

函数 ` round(x) ` 采用如下代码 标准圆整方式  
圆整策略：将小数部分为 ` .5 ` 的数字圆整到最接近的偶数。注意：因该只是` .5 `这种情况。

```python
>>> int(8.64)
8
>>> round(8.64)
9
>>> round(8.5)
8
>>> round(7.5)
8
>>> round(8.55)
9
```


**将字符串转换成数字 **  

使用函数    

` int(s) `    
` float(s) `    

我们假定字符串看起来像数字，否则出错。  


>模块math提供很多将小数部分删除的函数：  

> - math.trunc(x)  
> - math.ceil(x)
> - math.floor(x)



###变量和值

变量标记/指向一个值

遇到变量时，Python将其替换为指向的值  


**变量命名规则：**     

-  变量名长度不受限制，由字母、数字、下划线组成
- 变量名第一个字符不能为数字
- Python区分大小写
- 不能将关键字作为变量名




###赋值语句

赋值语句的两个用途：  
- 定义新的变量
- 让以定义的变量指向特定值

**如果你不对变量初始化，则将报错**



###变量如何引用值

对于没有任何变量指向的值，Python自动将其删除。   
一般而言，Python跟踪所有的值，并自动删除不再有变量指向的值。这称为**垃圾收集**  





**赋值时不复制**   

必须明白在Python中，赋值语句并不会复制指向的值，而只是标记和重新标记既有值。  
因此不论变量指向的值有多大、多复杂，赋值语句的效率都非常高。  

*python 不支持按值传递*


**数字和字符串是不可变的**   

Python中，不能以任何方式修改数字和字符串。    
看起来是修改数字或字符串的情况下，Python实际上是在创建修改版本的拷贝。    


```python
>>> s = 'apple'
>>> s + 's'
'apples'
>>> 5  = 1
"SyntaxError: can't assign to literal"
```



###多重赋值

```python
>>> x, y, z = 1, 'two', 3.0 
>>> x
1
>>> y
'two'
>>> x, y, z 
(1, 'two', 3.0)
```

最后一条语句，让一行显示多个值。   
方法是将它们作为元组。  
元组在圆括号中。  


**交换变量的值**   

多重赋值的语句一个很实用的用途是交换两个变量的值：  
 
```python
>>> a, b = 5, 9
>>> a, b
(5, 9)
>>> a, b = b, a 
>>> a, b
(9, 5)
```










第3章：编写程序
---------------

###编译源代码

源代码 .py 文件

**目标代码**    

当运行 .py 文件时， Python会自动创建相应的 .pyc 文件    

.pyc文件包含目标代码   

Python程序是使用名为**虚拟机**的特殊软件运行，这个软件模拟计算机。



###从键盘读取字符串


**跟踪程序**

```python
#name.py
name = input('What is your first name?')
print('Hello ' + name.capitalize() + '!')
```

` input() `函数：用于从键盘读取*字符串*的标准内置函数。  

在此它将输出括号中的字符串，并等待用户输入；返回用户输入，让` name `最终指向输入的字符串。

`name.capitalize()`*更改*字符串的第一个字符为大写，而其它字符为小写。  
在命令行中输入 dir('') 可查看字符串包含的函数  `capitalize`属于其中。  


>**提示**
从键盘读取字符串时，另一种常见的实用技巧是，使用函数 `strip()`将开头和末尾的空白字符删除  

```python
>>> '  oven  '.strip()
'oven'

name = input('Enter age: ').strip()        #常这样调用 input 
```



**从键盘读取数字**

函数 `input()` 只能返回字符串，如果你需要数字，则需要使用数值转换函数。

```python
#age.py
age = input('How old are you today? ')
age10 = int(age) + 10
print('In 10 years you will be ' + str(age10) + ' years old.')
```

`str()`函数将数字转换成字符串，这样才能字符串相加（数字不能与字符串相加）。  

字符串可以在屏幕上显示


###在屏幕上打印字符串

`print`用于将字符串打印到屏幕的标准内置函数  
它非常灵活，有很多功能可用于正确的设置字符串和数字的格式。  

你可以将任意数量的字符串传递给 `print`：  

```python
>>> print('jack', 'ate', 'no', 'fat')   #以逗号分隔不同字符串
jack ate no fat
```

默认，`print`在标准输出窗口中打印每个字符串，并用空格分隔它们。  

**修改分隔字符串**，可以向下面这样做：   

```python
>>> print('jack', 'ate', 'no', 'fat', sep = '.')
jack.ate.no.fat
```


默认，`print`打印指定内容后添加一个换行符：`\n`    

**更改换行符方法**  

下面将结束字符指定为空字符串

```python
#jack2.py
print('jack ate ', end = '')
print('no fat')
#程序将输出：jack ate no fat
```



###源代码注释

使用 `#` 号


###程序的组织

程序通常采用相同的结构。  

人们常按如图方式组织程序：  包扩输入部分、处理部分和输出部分  



	+-----------------+			
	|       输入      |		
	+-----------------+		
	           |		
	           V		
	+----------------+		
	|     处理       |		
	+----------------+		
			   |		
			   V		
	+-----------------+		
	|       输出      |		
	+-----------------+		

当程序越来越复杂时，很容易偏离这种总体结构，其结果常常是代码混乱、难以理解。  

因此，应该养成良好的习惯——使用注释指出输入、处理和输出部分。  











第4章：流程控制
------------------------



###布尔逻辑

布尔逻辑就是操作真值

而在Python中，这些真值用 `True`和`False`表示。

我们使用4个主要的逻辑运算符来组合布尔值：  

1. `not` 逻辑非
2. `and` 逻辑与
3. `or` 逻辑或
4. `==` 逻辑相等


```python
>>> False == False
True
>>> False or True
True
>>> False and True
False 
>>> not True
False
```

布尔运算的优先级（从高到低排列）:   

- `p == q`
- `p != q`
- `not p`
- `p and q`
- `p or q`


**短路求值**  

与大多数现代编程语言一样，Python也采用一个被称为*短路求值*的技巧   
这可以提高某些布尔表达式的计算速度。  

*与C语言类似*  





###if语句

**if/else语句**   

```python
 #password1.py                                                                           
   pwd = input('What is the password? ')
   if pwd == 'apple': #note use of == 
       # instead of =
       print('Logging on ...')
   else:
       print('Incorrect password.')
   print('All done!')
```

Python 将 `:` 用作 if 语句头、循环头、函数头的结束标记。  

从 `if`  到 `:` 的部分称为 if 语句头。




###代码块和缩进

Python使用缩进来标识代码块。  

典型缩进量为 4 个空格   

在同一个代码块中，所有的语句的缩进量必须相同。  

Python语句块中，多一个或少一个空格都可能导致错误或意外。  



**if/elif 语句**

*if/elif*语句是 if 语句推广版本，它包含多个条件，用于作出复杂的决策。  

`elif` 是 `else if` 的缩写，可根据需要使用任意数量的 elif 语句块  

```python
#airfare.py
age = int(input('How old are you? '))
if age <= 2:
	print(' free')
elif 2 < age <13:
	print(' child fare')
else:
	print('adult fare')
```


**条件表达式**  

```python
food = input(" What's your favorite food? ")
reply = 'yuck' if food == 'lamb' else 'yum'   
# = 等号左边的表达式称为条件表达式，结果要么是‘yuck’ 要么是 ‘yum’
```




###循环

>**术语说明**   
>程序员经常使用变量`i`，因为它是索引（index）的缩写，  
>且经常用于数学中  
>使用循环时，通常将 `j` 和`k`用作其它循环变量名  



**for循环**    

```python
# count10.py
for i in range(10):
	print(i)
```

for循环的第一行被称为for循环头。    
循环以关键字`for`开头，接下来是循环变量（这里是`i`）    
然后是关键字 `in`     
关键字后通常（但非总是）是`range(n)`和   
结束符号 :    
for循环重复执行循环体（循环头后面的语句块）`n`次。   

查看帮助     
`>>> help(range)`



>后期补充     

>range ：n.值域，范围; v.包括(从…到…)之间的各类事物        

>range(stop) -> range object       
 >range(start, stop [, step]) -> range object

>Return a virtual sequence(序列) of numbers from start to stop by step.
>值域用集合表示为` [start , stop)`



默认情况，循环变量初始值为`0`,并逐次递增到`n-1`   
如果要修改循环的初始值，可在`range`中添加初始值：    

```python
for i in range(5, 10):
	print(i)
```


>提示：   
>如果要打印数字 1～10, 有两种常见的方法   
>
>1. 方法一：    
>			
>			for i in range(1, 11):      
>
>				print(i)  
>  
>
>2. 方法二：   
> 
>			for i in range(10):      
>
>				print(i + 1)


>如果想按相反的顺序打印数字，也有两种做法：   
>
>1. 方法一：  
>
>			for i in range(10, 0, -1):
>					print(i)
>		
>		range的第三个参数被称为步长其值为 -1 
>
>2. 方法二：  
>
>			for i in rang(10):
>					print(10 - 1)






**while循环**     

```python
  1 #while10.py                                                                      
  2 i = 0
  3 while i < 10:
  4     print(i)
  5     i = i + 1 #add 1 to i
```


>**提示**
>很多python程序员都尽量使用for循环     
>仅在万不得已时才使用while循环    




>while循环还包含一个else语句块    
>但这是一种不同寻常的特性，很少使用   








###比较 for 循环和 while循环

略



###跳出循环和语句块

* break语句： 

	让你能够从循环体内的任何地方跳出循环。    

* continue语句： 

	跳到循环条件，进入下一次迭代。




###循环中的循环


略










第5章：函数
--------------------

*函数* 是一块可重用的代码。   
它是有名称的代码块，接受输入、提供输出并可存储在文件中供以后使用。   


###调用函数


**无返回值的函数**    

```python
>>> print('hello')
hello
>>> x = print('hello')
hello
>>> x				# None 不显示
>>> print(x)
None
```

特殊值`None` 表明“无返回值”    
它既不是字符串，也不是数字。   



**给函数名赋值**    

必须小心，以避免无意间让内置函数名指向其他函数或值。  

不幸的是，Python并不会阻止你编写类似下面的代码   

```python
>>> dir = 3     # dir()是内置函数
>>> dir
3
>>> dir()
#提示出错，要恢复原样，需要重启Python
```





###定义函数

编写一个计算圆面积的函数：   

```python
#  area.py
import math
def area(radius):
    """ Returns the area of a circle
    with the given radius.
    For example:
    >>> area(5.5)
    95.033177771091246
    """
    return math.pi * radius ** 2
```

运行： 将area.py文件在IDLE编辑器中打开，并按F5运行,接着调用该函数 `输入area(2) `回车 (Windows中)。


>**后期补充**		
在linux命令行下的方法：     
在保存 area.py的文件夹下启动Python命令行，输入`python3`； 			
再将其导入 ` from area import * `		
使用示例： >>> area(10)			
如果使用 import area 导入，则使用示例为： >>> area.area(10)      
注意：1. 要在同一文件夹下。   2. 作为模块导入时不用加上后缀名 `.py`。   






**函数的组成部分**   
看看area函数的各个组成部分。   

第1行：（以 def 开头的那行）被称为函数头   

函数头后面所有缩进的代码被称为函数体。  

函数头总是以关键字 `def ` （definition 的缩写）开头，接下来是空格，然后是函数名。   

接着是参数列表，  最后函数头以冒号 `:`结尾。  

函数头后面是可选的文档字符串。  

文档字符串后是函数体，这是一个缩进的代码块。   
 

> **一种格式约定**    
>
> Python 文档字符串通常遵循一种标准格式约定：   
>
>>  用三引号 `"""`   `"""`标识文档字符串的开始和结束位置     
>> 第一行是函数的简要概述，对程序员很有帮助；  
>> 接下来是详情和示例  


>**文档字符串的其他好处**
>
>与内置函数一样，你也可以轻松查看自己编写的   
>函数的文档字符串，如下所示：   
>
>> 				>>>print(area.__doc__)
>>				#此处显示文档字符串
>
>Python 还有一个佷重要的工具 `doctest`   
>可用于自动运行文档字符串中的Python示例代码  



>**术语说明**   
>
>除返回值外，函数以其他任何方式所做的修改都被称为副作用（side eefect）





如果函数没有包含 return 语句，    
python将认为它以下述代码行结束：   

	return None

特殊值 None 用于指出函数不返回值。   





###变量的作用域

* 局部变量    
	首次赋值发生在函数内的变量被称为局部变量。      

* 全局变量   
	在函数外声明的变量称为全局变量。   
	
	在函数中给全局变量赋值时需要使用关键字 **`global`**
	
	如：    
	
		global name              #假设name是全局变量
		name = new_name






###使用main函数


在编写的任何Python程序中，通常使用一个函数：`main()`    

根据约定，main() 函数被认为是程序的起点。

Python中main只是一种约定，完全是可选的。   

```python
  1 # password2.py
  2 def main():
  3     pwd = input('what is the password? ')
  4     if pwd == 'apple':
  5         print('Logging on ...')
  6     else:
  7         print('Incorrect password.')
  8     print('All done!')       
```

注意：所有代码都位于函数头main后面，并都有缩进。  

使用main函数的优点是，可以更轻松的反复运行程序，还可以传递输入值。  





###函数的参数

**按引用传递**     

向函数传递参数时，Python 采用按引用传递的方式。   

这意味着当你传递参数时，函数将使用新变量名来引用原始值。		

<font color=red >*python 不支持按值传递*</font>


**一个重要示例**   

```python
#函数，目的：想将传入的变量的值设置为1
#reference.py
def set1(x):
	x = 1
	
#运行示例
>>> m = 5
>>> set1(m)
>>>m					
5
```

将这个示例分解成下面几步：   

1. 将5赋给m
2. 调用set1(m) ： 将m的值赋给x，这样m和x都指向5。
3. 将1赋给x
4. 函数set1结束后，x被删除

在函数set1中，根本不能访问变量m，因此无法修改它指向的值。   



**默认值**   

给函数的参数指定默认值通常很有帮助。    

例如下面的函数，给参数 greeting 指定了默认值 'Hello' :   

```python
#greetings.py
def greet(name, greeting = 'Hello'):
	print(greeting, name + '!')
```

这让你可以以两种不同的方式调用函数 greet :    

```python
>>> greet('Bob')
Hello Bob!
>>> greet('Bob', 'Good morning')
Good morning Bob!
```

>**提示**      
>带默认值的参数不能位于没有默认值参数的前面    

>**提示**		
>有关默认参数的一个要点是：   
>只在第一次调用函数时给默认参数赋值。    
在复杂的程序中，这可能成为微妙 bug 的根源。


**关键字参数**     

```python
# shopping.py
def shop(where = 'store',
         what = 'pasta',
         howmuch = '10 pounds'):                    	 #注意格式 也可以这样
    print('I want you to go to the', where)
    print('and buy', howmuch, 'of', what + '.')

```

调用使用关键字参数时，以 **`param = value`**的方式传递数据。    

如：

```python
>>> shop()
>>> shop(what = 'towels')
>>> shop(howmuch = 'a ton', what = 'towels')
>>> shop(howmuch = 'a ton', what = 'towels', where = 'bakery')
#代码省略输出
```


关键字参数有两大好处：

1. 清晰的指出了参数，有助于提高程序的可读性    
2. 关键字参数的顺序无关紧要

>对于包含大量参数的函数来说，这两点都很有帮助，    
因为很难记住这些函数的参数的顺序和含义    






###模块

模块是一系列相关的函数和变量。   


**创建Python模块**   

要创建模块，可创建一个 `.py` 文件，在其中包含用于完成任务的函数。   

例如：   

```python
# shapes.py
"""A collection of functions
   for printing basic shapes.
"""

CHAR = '*'
def rectangle(height, width):
    """ Prints a rectangle."""
    for row in range(height):
        for col in range(width):
            print(CHAR, end = '')
        print()

def square(side):
    """ Prints a square."""
    rectangle(side, side)

def triangle(height):
    """ Prints a right triange. """
    for row in range(height):
        for col in range(1, row + 2):
            print(CHAR, end = '')
        print()
```

模块与常规python程序之间唯一的差别是用途不同：   
模块是一个由函数组成的工具箱，用于编写其他程序。   
因此模块通常没有 main() 函数。   

要使用模块，只需将其存放在默认路径，然后在python shell中将其导入即可。   

```python
>>> import shapes
>>> dir(shapes)
['CHAR', '__builtins__', '__cached__', '__doc__', '__file__', '__loader__', '__name__', '__package__', '__spec__', 'rectangle', 'square', 'triangle']
>>> print(shapes.__doc__ )
A collection of functions
   for printing basic shapes.

>>> shapes.CHAR
'*'
>>> shapes.square(5)
*****
*****
*****
*****
*****
>>> shapes.triangle (3)
*
**
***
>>> shapes.rectangle (3,8)
********
********
********
```

>**Python之禅**      
> 从互交式命令行中导入模块 `this`   
可看到一个有趣的Python复活节彩蛋   

**名称空间**    

对于模块，它们形成名称空间（即命名空间）   
名字空间基本上就是一组独特的变量名和函数名。   

要让模块中的名称在模块外可见，可使用 `import`语句。   


>后期补充      

>语句`import html.parer as pa`  
>`as`的意思是为导入的模块重命名为 `pa`    










第6章：字符串
----------------------

在Python中，字符串是除数字外最重要的数据类型。   

文件通常被视为大型字符串。   
可将万维网视为一个网页集合，而这些网页大部分是由文本组成。   


>字符串是一种聚合数据结构，这让我们有机会初探索引和切片 ——用于从字符串中提取子串的方法。  



###字符串索引

```python
>>> s = 'apple'
>>> s[0]
'a'
>>> s[1]
'p'
>>> s[4]
'e'
>>> s[-1]
'e'
>>> s[-2]
'l'
>>> s[-3]
'p'
>>> s[-5]
'a'
```


如果索引超出了字符串末尾，将导致“超出范围”错误    


**负数索引**     

Python字符串有正索引和负索引   

假设你要访问 s 的最后一个字符，而不是第一个字符。  
可以使用复杂难看的表达式 `s[len(s) - 1]`   
而使用*负数索引*  更方便     

沿从右向左的方向，用负数表示字符串中字符的索引，最后一个字符为 `s[-1]`  





**使用for循环访问字符**    

下面的两个程序计算给定字符串的字符编码总和：    

1. 程序一：  

```python
# codesum.py
def codesum1(s):
    """ Returns the sums of the
    character codes of s.
    """	
    total = 0
    for c in s:
        total = total + ord(c)
    return total		
    
    
>>> codesum1('Hi there!')				#调用实例
778
>>> codesum1('Fan')
277
```

for 循环的每次迭代开头，都会将循环变量c 设置为 s 中的下一个字符。   
使用索引访问 s 中字符的工作由 for 循环自动处理。   



下面是另一种实现，它使用了常规字符串索引。

2. 程序二：

```python
def codesum2(s):
    """ Returns the sums of the
    character codes of s.
    """	
    total = 0
    for i in range(len(s)):
    		total = total + ord(s[i])
    return toral
```


>**Unicode 的崛起**    
>Unicode 提供了一个大的编码集。    
出于方便，Unicode的前256个字母为 ASCII码，     
因此如果你只处理英文字符，几乎不用考虑Unicode的细节。   
有关Unicode可上其[主页](http//:www.unicode.org)了解     






###字符

字符串由字符组成，而字符本身实际上是一个非常复杂的问题。   
所有字符都有对应的字符编码    

可使用函数 `ord` 来获悉某字符对应的字符编码：

	>>> ord('a')
	97

给定字符编码，可使用函数`chr`来获悉对应的字符：  

	>>> chr(97)
	'a'

**Python中字符的编码是根据Unicode分配**     



**转义字符**   

为处理空白字符以及其他不可打印的字符，可使用*转义序列* （也称 转义字符）  

 一些常见的转义字符      
 
 |     字符    |        含义         |
 |:------------| --------------------|
 |    \\         |      反斜杠        |
 |    \'          |       单引号        |
 |     \"        |      双引号        |
 |   \n         |       换行符        |
 |     \r        |     回车            |
 |    \t         |    水平制表符  |
 
 
 
 >**行尾**      
 在表示文本末尾方面，不同操作系统遵循的标准也不同。   
 例如，  Windows使用  `\r\n` 表示行尾，   
 OS X 和 Linux 使用 `\n`     
 
>大多数优秀编辑器都至少能够识别 `\r\n` 和 `\n`。  
你偶尔遇到不能识别行尾标记的程序    
(如：Windows 记事本 ） ，因此可能出现     
这样的情形：所有内容都出现在一行、 增加了换行或     
每行末尾看都有` ^M `字符。 




###字符串切片

在Python中，可以使用切片从字符串中提取子串。    

要对字符串执行切片操作，可指定两个索引：   第一个字符和最后一个字符的索引。   

格式： `s[begin:end]`

要访问索引 `i` 对应的字符，可使用 `s[i]` 或 `s[i:i+1]`   

```python
>>> food = 'apple pie'
>>> food[0:5]
'apple'
>>> food[6:9]
'pie'
```


**获取切片的捷径**     

```python
>>> food = 'apple pie'
>>> food[:5]
'apple'
>>> food[6:]
'pie'
>>> food[:]
'apple pie'
```


下面是一个很有用的切片示例，这个函数返回               
文件名中的扩展名：    

```python
# extension.py
def get_ext(fname):
    """ Return the extension of file fname."""

    dot = fname.rfind('.')
    if dot == -1:   # fname 中没有
        return ''
    else:
        return fname[dot + 1:]
        
        
>>> get_ext('pizza.old.py')			#一些示例
'py'
```








** 使用负数索引的切片 **   

```python
>>> food = 'apple pie'
>>> food[-9:-4]
'apple'
>>> food[:-4]
'apple'
>>> food[-3:]
'pie'
```







###标准字符串函数


Python字符串自带了大量的函数，     
要查看所有这些函数，可调用`dir`并将参数指定为任何字符串（如：`dir('')`)      


 <big>** 测试函数 **</big>   

首先介绍检测字符串是否为特定格式的函数；         
如下表所示的测试函数都返回 True 或 False。      
测试函数有时也叫 *布尔函数* 或 *谓词*。     

|      函数名                         |              什么情况下返回 True           |
|:---------------------------| :--------------------------------------|
| s.endswith(t)                   |    s以字符串t 结束                            |
| s.startswith(t)                  |     s以字符串 t 开头                           |
| s.isalnum()                       |   s只包含字母或数字                          |
| s.isalpha()                       |    s 只包含字母                                  |
| s.isdecimal()                    |   s只包含表示十进制数字的字符		|
| s.isdigit() 						|	s只包含数字字符							|
| s.isidentifier()					|     s是合法的标识符							|
| s.islower()						|    s 只包含小写字母							|
| s.isnumeric()						|   s 只包含可打印字符						|
| s.isspace()						|    s 只包含空白字符							|
| s.istitle()							|   s是个大小写符合头衔要求(title-case)的字符串|
| s.isupper()						|   s 只包含大写字母							|
| `t  in  s	`							|    s 包含字符串 t 								|




 <big>** 搜索函数 **</big>    

在字符串中查找子串的方式有多种。		

字符串搜索函数		

|	函数名				|				返回值							|
| -----------------| ----------------------------------|
| s.find(t)				| 如果没有找到子串 t ，返回-1；否则返回 t 在 s 中的起始索引位置|
| s.rfind(t)			| 与 find 相同，但从右往左搜索 	|
| s.index(t)			| 与 find 相同，但如果在 s 中找不到 t ，则引发 ValueError异常|
| s.rindex(t)			| 与index 相同，但从右往左搜索  |



函数 `index` 和 `find` 之间的差别在于没有找到指定子串的情形。 	

函数 `find` 引发异常 ValueError     

函数`index`返回 `-1`


```python
>>> s = 'cheese'
>>> s.index('eee')
Traceback (most recent call last):
  File "<pyshell#5>", line 1, in <module>
    s.index('eee')
ValueError: substring not found
>>> s.find('eee')
-1
```




 <big>** 改变大小写的函数 **</big>   

别忘了，Python绝不会修改字符串：  
在所有这些函数中，Python都创建并返回一个新字符串。    

|  函数名     			 |  返回的字符串 					 |
|--------|--------|
| s.capitalize()    |  将 s[0] 改为大写      |
| s.lower()			 |  让 s 的所有字母都小写 |
| s.upper()			|  让 s 的所有字母都大写  |
| s.swapcase()   |  将小写字母改为大写，并将大写字母改为小写 |
| s.title()				|  让 s 的大小写符合头衔的要求 |




 <big> **设置格式的函数 **</big>

| 函数名				 | 	 返回的字符串					 |
|--------				|								--------|
|    s.center(n, ch)    |  包含 n 个字符的字符串，其中 s 位于中央，两边用字符 ch 填充      |
| s.ljust(n, ch) 	    |  包含 n 个字符的字符串，其中 s 位于左边，右边用字符 ch 填充 |
| s.rjust(n, ch)	   |  包含 n 个字符的字符串，其中 s 位于右边，左边用字符 ch 填充 |
| s.format(vars)    | 见正文 |


字符串函数 `format` 功能非常强大，包含用于设置字符串格式的微型语言。      

使用它时需要给他提供变量或值。      

示例：     


```python
>>> '{0} likes {1}'.format('Jack','ice cream')
'Jack likes ice cream'
```

字符串在的`{0}` 和 `{1}` 引用 `format` 的参数：     	
它们将被替换为相应字符串或变量的值。			


你还可以使用关键字参数的名称：   	

```python
>>> '{who} {pet} has fleas'.format(pet = 'dog', who = 'my')
'my dog has fleas'
```

在此只演示 `format` 最基本的用法，还有很多其他的选项，   
可用于指定字符串间距、将数字转换为字符串等。    





 <big>** 剥除函数 ** </big>  
 
剥除函数用于删除字符串开头或末尾多余的字符。		
默认，将剥除空白字符；如果指定了一个字符串参数，将剥除该字符串中的字符。		




|  函数名					|		返回的字符串							|
|---------------------|------------------------------------|
| s.strip(ch)				| 从 s 开头和末尾删除所有包含在字符串 ch 中的字符 |
| s.lstrip(ch)			   |  从 s 开头（左端）删除所有包含在字符串 ch 中的字符 |
| s.rstrip(ch)			   |  从 s 末尾（右端）删除所有包含在字符串 ch 中的字符 |


例如：		

```python
>>> name = ' Gill Bates '
>>> name.lstrip()
'Gill Bates '
>>> name.rstrip()			#注意结果
' Gill Bates'
>>> name.strip()
'Gill Bates'
```




<big>** 拆分函数 **</big>		

拆分函数将字符串拆分成多个子串。			


|  函数名					| 返回的字符串							|
| -------------------|------------------------------------|
| s.partiton(t)			| 将 s 拆分为三个字符串 （head、t 和 tail），其中 head 为 t 前面的子串，tail为后面的子串 |
| s.rpartition(t)		| 与 partition 相同，但从 s 的右端开始搜索 t |
| s.split(t)				|  以 t 为分隔符，将 s 划分成一系列子串，并返回一个由这些子串组成的列表 |
| s.rsplit(t)				| 与 split 相同，但从 s 的右端开始搜索 t |
| s.splitlines()		  | 返回一个由 s 中的各行组成的列表 |



函数 `partition` 和 `rpartition`    
示例：

```python
>>> url = 'www.google.com'
>>> url.partition('.')
('www', '.', 'google.com')
>>> url.rpartition('.')
('www.google', '.', 'com')
```

>这两个函数总是返回一个这样的值：    	
>它由3个字符串组成，		
>形式为 `(head, sep, tail) `		
>这种返回值为**元组**。			






函数 `split` 以指定字符串为分隔符，将字符串划分为一系列子串。   

示例：   

```python
>>> url = 'www.google.com'
>>> url.split('.')
['www', 'google', 'com']
>>> story = 'A long time ago, a princess ate an apple.'
>>> story.split()
['A', 'long', 'time', 'ago,', 'a', 'princess', 'ate', 'an', 'apple.']
>>> 
```



>函数`split`总是返回一个字符串列表；		
Python中列表总是分别以 ` [  ` 和 ` ] ` 打头和结尾，		
并用逗号 ` , `分隔元素。		
列表和元组很像，主要差别在于列表是可以修改的，而元组是常量。		



<big>** 替换函数 **	</big>	


|   函数名					|			返回的字符串				|
| --------------------| -------------------------------|
| s.replace(old, new) |  将 s 中的每个 old 替换为 new |
| s.expandtabs(n)      |  将 s 中的每个制表符替换为 n 个空格|




使用替换函数可以轻松的删除字符串中的子串：   

```python
>>> s = 'up, up and away'
>>> s.replace('up', 'down')
'down, down and away'
>>> s.replace('up', '')
',  and away'
```



<big>** 其它函数 **</big>   


|    函数名		| 					返回的值				|
|---------------|--------------------------------|
| s.count(t)   |     t 在 s 中出现的次数				|
| s.encode()	| 设置 s 的编码，更详细的信息请参阅 [在线文档](http://docs.python.org/3/library/stdtypes.html3str.encode)|
| s.join(seq)    |  使用 s 将 seq 中的字符串连接成一个字符串   |
| s.maketrans(old, new)  |  创建一个转换表，用于将 old 中的字符改为 new 中相应的字符；请**注意**：s 可以是任何字符串，它不影响返回的转换表|
| s.translate(table)  | 使用指定转换表（使用maketrans创建的）对 s 中的字符进行替换|
| s.zfill(width)    | 在 s 左边添加足够多的 0 ，让字符串的长度为 width |



需要将一组字符转换为另一组字符时，函数 `translate`和`madetrans`很实用。		

例如下面是一种将字符串转换为”脑残体”（leet-speak）的方式：		
[在线文档](http://docs.python.org/3/library/stdtypes.html#str.maketrans)还解释了如何替换多个字符。


```python
>>> leet_table = ''.maketrans('EIOBT', '31087')					# E --> 3  ，I --> 1，O --> 0   ...
>>> 'BE COOL. SPEAK LEET!'.translate(leet_table)
'83 C00L. SP3AK L337!'
```


函数`zfill`用于设置数值字符串的格式：     

```python
>>> '23'.zfill(4)
'0023'
>>> '-85'.zfill(5)
'-0085'
```

但是该函数不是很灵活，大多数程序员使用其他方式设置字符串的格式。 	





函数`join`很有用，它将一系列字符串拼接起来，其中包含分隔字符串，如下所示：  


```python
>>> ' '.join(['once', 'upon', 'a', 'time'])
'once upon a time'
>>> '-'.join(['once', 'upon', 'a', 'time'])
'once-upon-a-time'
>>> ''.join(['once', 'upon', 'a', 'time'])
'onceuponatime'
```








###正则表达式



实际处理字符串时，常常需要使用更强大的工具。    

程序员开发了一种用于复杂字符串处理的微型语言 -- 正则表达式。    


>实际上，正则表达式就是一种简练描绘一组字符串的方式，    
>可用于高效的执行常见的字符串处理任务，如匹配，分拆和替换。  


一些常用的运算符：		

|     运算符        |          描述的字符串       |
|:---------------:|:------------------------|
|    xy?				|  x , xy							|
|   x1y  #某符号用1代替		|       x , y							|
|  x*      #见下表：      |       ' ' , x , xx , xxx , xxxx , 等|
|  x+                   |    x , xx , xxx , xxxx , 等  |


<table>
	<tr>
		<td>运算符</td>
		<td>描述的字符串</td>
 	</tr>
	<tr>
		<td>xy?</td>
		<td>x,  xy</td>
 	</tr>
	<tr>
		<td>x|y</td>
		<td>x, y</td>
 	</tr>
	<tr>
		<td>x*</td>
		<td> ' ' , x , xx , xxx , xxxx , 等</td>
 	</tr>
	<tr>
		<td>x+</td>
		<td>x , xx , xxx , xxxx , 等</td>
 	</tr>
</table>




<big>** 简单的正则表达式**</big>		

正则表达式运算符：  

- ？
	意思是它的左边那个字符是可选的。   
	 因此 'cats?'描述了两个字符串 'cat' 和 'cats'  
- | 
	或者   
	


在正则表达式中，可用圆括号来指出要将运算符用于哪个字符串     

如：    

'(ha)+!'描述了如下字符串：  
	'ha!'     
	'haha!'    
	'hahaha!'      
 


要在Python中使用正则表达式需要导入模块`re`   





其他章节见文件PythonPVQG_2
----------------------

（文件太大haroopad吃不消）
