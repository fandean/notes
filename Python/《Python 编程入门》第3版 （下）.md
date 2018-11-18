《Python 编程入门》第3版 （下）
========================

标签：Python

---

第7章：数据结构
--------------------------

在Python中，两个主力数据结构是**列表** 和 **字典**   

列表按顺序存储数据，而字典像小型数据库，使用键高效的存储和检索数据。   




###type命令

内置命令`type`用于检查值或变量的数据类型。    

```python
>>> type(5.0)
"<class 'float'>"	#本来没有双引号，添加是为了正常识别语法高亮；后文相同。
>>> type(None)
"<class 'NoneType'>"
>>> type(print)
"<class 'builtin_function_or_method'>"
>>> type('5')
"<class 'str'>"
```



###序列

在Python中，序列是一组按顺序排列的值。   

有 3 种内置的序列类型： `字符串`、`元组`和`列表`。  

**序列具备的优点 ：**  

1. 第一个正索引为零，指向左端。  
2. 第一个负索引为-1,指向右端。  
3. 可使用切片表示法来复制子序列。  
4. 可使用`+`和`*`进行拼接。但序列的类型必须相同。  
5. 可使用函数`len`计算其长度。  
6. 表达式`x in s`检查序列`s`是否包含元素`x`；并返回`True`或`False`。



>**顺序很重要**		
>我们说序列是按顺序排列的，指的是序列中元素的排列顺序很重要。   
>字符串是按顺序排列的，因为`'abc'`不同于`'acb'`。  
>而字典和集合并不是按顺序排列。  


- 序列的长度没有限制，但其受制于计算机的可用内存量。  


>**后期补充**    
>可以使用 `in`来查看一个元素是否存在于序列、字典中。  


###元组(tuple)

元组是一种不可变序列，包含零个或更多个值。    

它可以包含任何Python值，甚至可以包含其他元组。  

```python
>>> items = (-6, 'cat', (1, 2))
>>> items
(-6, 'cat', (1, 2))
>>> len(items)
3
>>> items[-1]
(1, 2)
>>> items[-1][0]
1
```

元组用圆括号括起，其中的元素用逗号分隔。   

空元组用`()`表示，但只包含一个元素的元素（单元素元组）采用不同寻常的表示法`(x,)`。  

>**末尾的逗号**   
>在单元组中，末尾的逗号必不可少；  
>而在包含更多元组（和列表）中，末尾的逗号是可选的。


```python
>>> type(())
"<class 'tuple'>"
>>> type((5,))
"<class 'tuple'>"
>>> type((5))
"<class 'int'>"
```

>如果省略元素末尾的逗号，
>则其只是用圆括号括起的表达式。


<big>** 元组是不可变的 **</big>   

这意味着创建元组后就不能修改它。  

如果要修改元组，就必须创建一个体现更改的新元组。   

```python
>>> lucky = (6, 7, 21, 77)
>>> lucky
(6, 7, 21, 77)
>>> lucky2 = lucky[1:]
>>> lucky2
(7, 21, 77)
>>> lucky
(6, 7, 21, 77)
```


如果需要频繁的修改某个元组，就应该用列表代替它。   



<big>** 元组函数 **</big>   

|       函数名             |            返回值                          |
|--------------------|--------------------------------|
| x in tup                 |      如果 x 是元组 tup 的一个元素，则返回 True，否则返回 False |
| len(tup)                |  元组tup包含的元素数  |
| tup.count(x)         | 元素 x 在元组 tup 中出现的次数 |
| tup.index(x)          |  元组 tup 中地一个元素 x 的索引：如果没有 x 则引发 ValueError异常 |


使用`+`和`*`来拼接元组：    

```python
>>> tup1 = (1,2,3)
>>> tup2 = (4,5,6)
>>> tup1 + tup2
(1, 2, 3, 4, 5, 6)
>>> tup1 * 2
(1, 2, 3, 1, 2, 3)
```



###列表(list)

列表与元组基本相同，但列表是可变的。   

实际上，列表比元组用的多得多   
有些Python程序员只是隐约知道有元组这么回事，[看来学习编程要以实用为基准，不必面面具到]  

列表用放括号括起其中的元素用逗号分隔。   

>**注意：**  
>列表可包含任何类型的值：  
>数字、字符串、其它序列。   
>空列表用`[]`表示，  
>单列表写作`[x]`。



<big>** 列表是可变的 **</big>

```python
>>> pets = ['frog','dog','cow','hamster']
>>> pets
['frog', 'dog', 'cow', 'hamster']
>>> pets[3] = 'cat'
>>> pets
['frog', 'dog', 'cow', 'cat']
```

在上述示例中，字符串`'hamster'`被`'cat'`替换，并被Python自动删除。   


>与变量一样，列表元素指向（而不是包含）相应的值，  
>明白这一点很重要。   



```python
>>> snake = [1, 2, 3]
>>> snake
[1, 2, 3]
>>> snake[1] = snake
>>> snake
[1, [...], 3]
```


让一个列表元素指向列表本身，创建了一个自引用的数据结构。   
打印输出中的`[...]`表明，Python能够识别自引用，
没有愚蠢的不断打印列表。  




###列表函数

|      函数名                   |           返回值                                          |
|------------------------|--------------------------------------------|
| s.append(x)               |    在列表 s 末尾添加元素 x                    |
| s.count(x)                  | 返回元素 x 在列表 s 中出现的次数       |
| s.extend(lst)              | 将 lst 的所有元素都添加到列表 s 末尾  |
| s.index(x)                   |  返回第一次 x 元素的索引                |
| s.insert(i, x)               | 将元素 x 插入到索引 i 指定的元素前面，结果是 s[i] == x |
| s.pop(i)                     |   删除并返回 s 中索引为 i 的元素             |
| s.remove(x)               |  删除 s 中的第一个 x 元素                |
| s.reverse()                  | 反转 s 中元素的排列顺序              |
| s.sort()                       | 将 s 的元素按升序排列                   |



>**术语说明**   
>术语弹出(pop)通常指删除列表的最后一个元素。   
>与之相关的术语是压入(push),指的是在末尾添加一个元素。   
>对同一个列表执行弹出和压入时，通常将这个列表称为栈。  
>虽然栈很简单，却是众多高级编程行为（如递归和撤销）的基础  


函数 reverse 不会制作列表的拷贝，而是直接删除列表中的元素，   
因此我们说反转是 *就地完成* 。明白这一点很重要。   




###列表排序


在python中要对列表进行排序，最简单的方法是使用函数 sort()。   
sort () 也是*就地修改*列表。    


```python
>>> lst = [6, 0, 3, 9, 2]
>>> lst
[6, 0, 3, 9, 2]
>>> lst.sort()
>>> lst
[0, 2, 3, 6, 9]
```

函数 sort 总是按升序排列元素 --- 从最小到最大。   
如果要按从大到小的顺序来排列元素，则最简单的方法是    
先调用 sort 再调用 reverse    


```python
>>> lst = ['up', 'down', 'cat', 'dog']
>>> lst
['up', 'down', 'cat', 'dog']
>>> lst.sort()
>>> lst
['cat', 'dog', 'down', 'up']
>>> lst.reverse()
>>> lst
['up', 'down', 'dog', 'cat']
```



>**术语说明**  
>Python对序列进行排序的方式称为字典顺序（lexicographical ordering）。   
>这是一个通用术语，指的是“字母排序”，但适用于任何可排序的值序列，
>而不仅仅是字母。  
>其基本理念是，首先按第一项对元素排序，如果第一项相同，  
>则按第二项进行排序，如果第二项也相同，则按第三项进行排序，以此类推。  


Python还知道如何给包含元组的列表排序。    

```python
>>> pts = [(1,2),(1,-1),(3,5),(2,1)]
>>> pts
[(1, 2), (1, -1), (3, 5), (2, 1)]
>>> pts.sort()
>>> pts
[(1, -1), (1, 2), (2, 1), (3, 5)]         #(1,-1)最前 2 大于 -1
```





###列表解析

Python 提供了一种用于创建列表的特殊表示法： 列表解析。  

示例：如何用列表解析来创建一个由 1～10 的平方组成的列表：  

```python
>>> [n * n for n in range(1, 11)]
[1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
```

<big>** 使用列表解析进行筛选 **</big>

示例：

```python
>>> nums = [-1, 0, 6, -4, -3, 7]
>>> result = [n for n in nums if n > 0]
>>> result
[6, 7]
```

下面是使用常规循环实现相同功能：

```python
result = []
nums = [-1, 0, 6, -4, -3, 7]
for n in nums:
	result.append(n)
```

可见使用列表解析更简洁易读。   


下面的函数使用列表解析删除字符串中的所有元音：  

```python
# eatvowels.py
def eat_vowels(s):
    """Removes the vowels from s.
    """
    return ''.join([c for c in s if c.lower() not in 'aeiou'])
```


先看列表解析：  

	[c for c in s if c.lower() not in 'aeiou']

它以每次一字符的方式扫描 `s`，将每个字符转换为小写，    
再检查它是不是元音。   
如果是元音，则不将其加入最终的列表，否则加入。     

该列表解析的结果是一个字符串列表，因此我们使用 `join` 将所有字符串拼接成一个，再返回这个字符串。



>**生成器表达式**    
>可进一步简化函数 `eat_vowels`：   
>删除列表解析中的方括号：   
>`''.join(c for c in s if c.lower() not in 'aeiou')`  
>这样，传递给 `join`的表达式将是一个生成器表达式。在比较复杂的Python编程中，可使用生成器表达式
>高效的生成所需的列表或序列部分： 根据需要生成元素，而是不像列表解析那样一次性生成所有元素。








###字典(dict)

在存储`键 - 值`对方面，Python字典是一种效率极高的数据结构。    

>**术语说明**   
>字典也称为关联数组、映射或散列表。  


```python
>>> color = {'red':1, 'blue':2, 'green':3}
>>> color
{'blue': 2, 'green': 3, 'red': 1}     #注意顺序，在后面会见到顺序又会变化。
>>> type(color)
"<class 'dict'>"
>>> color['green']
3
>>> color['red']
1
```

字典 `color`包含3个成员。    
例如：   `'blue':2`其中`'blue'`为**键**，而`2`是与之关联的**值**。   

要访问字典中的 值，可使用相应的 键：   


字典也是可变的：可以添加或删除`键 - 值`对。   

```python
>>> color = {'red':1, 'blue':2, 'green':3}
>>> color
{'blue': 2, 'green': 3, 'red': 1}
>>> color['red'] = 0                #获取字典中值的方式 d[key] 
>>> color
{'blue': 2, 'green': 3, 'red': 0}
```


<big>** 对键的限制 **</big>  

1. 字典中的键必须是独一无二的。  
2. 键必须是不可变的。     
	字典键不能是列表和字典。  
	因为 键 - 值 对在字典中的存储位置是根据键计算得到的。  
	一旦键发生变化，键 - 对 在字典中的位置也将发生变化，可能导致 键 - 值 对丢失或无法访问。  



```python
>>> color = {'red':1, 'blue':2, 'green':3, 'red':4}
>>> color
{'blue': 2, 'green': 3, 'red': 4}
```


>**后期补充**		

		a_dict = {'Tom':'1', 'Jerry':'2', 'Cathy':'3'}
		#使用 for 打印字典的两种形式
		for ele in a_dict:
			print(ele)
			print(a_dict[ele])
			
		for key, elem in a_dict.items():
			print(key, elem)





<big>** 字典函数 **</big>  


要获取字典中的值，标准方式是使用方括号表示法： `d[key]`
返回与`key`相关的值。   
调用 `d.get(key)`可完成相同任务。   
无论采用哪种方式，如果 `key`没有包含在字典`d`中，都将引发`KeyError`异常。  



如果你预先不确定某个键是否包含在字典中，可使用`key in d`进行
检查。如果`key`包含在字典`d`则返回`True`否则返回`False`。  
这种检查的效率极高，与用于序列的 `in`相比尤其如此。    



|           函数名      |              返回的值                            |
|------------------| ------------------------------------|
| d.items()           | 返回一个由字典 d 的`键 - 值`对组成的视图（view） |
| d.keys()             | 返回一个由字典 d 的`键`组成的视图 |
| d.values()          | 返回一个由字典 d 的`值`组成的视图 |
| d.get(key)          | 返回与 key 相关联的值 |
| d.pop(key)         | 删除键 key 并返回与之相关联值|
| d.popitem()       |  返回字典 d 中的某一个键 - 值对|
| d.clear()             | 删除字典 d 的所有元素 |
| d.copy()            | 复制字典 d |
| d.fromkeys(s, t) | 创建一个新字典，其中的键来自 s ，值来自 t |
| d.setdefault(key, v) |如果键 key 包含在字典 d 中，则返回其值；否则，返回 v 并将(key, v)添加到字典 d 中|
| d.update(e)    |  将 e 中的键 - 值对添加到字典 d 中；e 可能是字典，也可能是 键 - 值对序列 |




```python
>>> color
{'red': 0, 'blue': 2, 'orange': 4, 'green': 3}        #字典中 元素排列顺序不确定
>>> k = color.keys()                                 # k 是一个视图
>>> for i in k: print(i)

red
blue
orange
green
>>> color.pop('red')
0
>>> color
{'blue': 2, 'orange': 4, 'green': 3}
>>> for i in k: print(i)

blue
orange
green
```


函数`items()`、`keys()`和`values()`都返回一个特殊对象 - - 视图。   

**视图**被链接到原始字典，因此如果字典发生变化，视图也相应变化。  






###集合 (set)


Python中，集合是一系列不重复的元素。   

集合类似与字典，但只包含键，而没有相关联的值。  



集合分两类：  *可变集合* 和 *不可变集合*  


集合最常见的用途可能是用于删除序列中的重复元素：   

```python
>>> lst = [1,1,6,3,4,8,8,3,6]
>>> s = set(lst)               
>>> s
{8, 1, 3, 4, 6}
>>> type(s)
"<class 'set'>"
```


>与字典一样，集合的元素排列顺序也是不确定的。   


要获悉所有集合都支持的函数，可在交互式命令行中调用 `dir(set)`查看。   


>**集合与字典**    
>在Python中，集合是相对较新的功能。   
>在还不支持集合的时候，程序员用字典来模拟集合。  
>如果使用了字典，但不关心其值，那么转而使用集合或许可提高可读性。 







第8章：输入和输出
-------------------------------

###设置字符串格式

有很多设置字符串格式的方法，介绍两种。较老的 字符串插入 和较新的 格式字符串。   


<big>** 字符串插入 **</big>

字符串插入 是一种设置字符串格式的简单方法，借鉴于 C 语言。

```python
>>> x = 1/81
>>> print(x)
0.012345679012345678
>>> print('value: %.2f' %x)
value: 0.01
>>> print('value: %.5f' %x)
value: 0.01235
```


** 转换说明符** 与 C 中的类似，  略。    


```python
>>> a, b, c = 'cat', 3.14, 6
>>> s = 'There\'s %d %ss older than %.2f years' %(c, a, b)
>>> s
"There's 6 cats older than 3.14 years"
```





###格式字符串

另一种设置美观字符串的方式是结合使用格式字符串和字符串函数 `format(value, format_spec)`    

其更适合与庞大而复杂的设置任务。  

```python
>>> 'My {pet} has {prob}'.format(pet = 'dog', prob = 'fleas')
'My dog has fleas'
```

在格式字符串中，用花括号括起的内容都将被替换，这称为**命名替换**(named replacement)     

还可以按位置替换值：   

```python
>>> 'My {0} has {1}'.format('dog', 'fleas')
'My dog has fleas'
```

还可以像字符串插入那样使用转换说明符：   

```python
>>> '1/81 = {x}'.format(x=1/81)
'1/81 = 0.012345679012345678'
>>> '1/81 = {x:f}'.format(x=1/81)
'1/81 = 0.012346'
>>> '1/81 = {x:.3f}'.format(x=1/81)
'1/81 = 0.012'
```



>模板包   
>在字符串插入和格式字符串都不够强大或灵活时，可能需要使用  
>模板包， 如： [Cheetah](http://www.cheetahtemplate.org)或 [Django](http://www.djangoproject.com)
>提供的模板包，在创建大量动态生成的网页时，是一个不错的选择。  





可以使用大括号来指定格式设置参数：    

```python
>>> '1/81 = {x:.{d}f}'.format(x=1/81,d=3)
'1/81 = 0.012'
```


>**提示**    
>如果要在格式字符串中表示字符`{` 或 `}`，可分别使用 `{{`  和 ` }}`  






###读写文件

** 文件是一个命名的比特集合 **    



** 文本文件具有如下特点**   

- 基本上是磁盘中的字符串。如源代码文件。
- 可使用任何文本编辑器进行编辑，因此对人类说相对容易阅读和修改。   
- 对程序来说，它们难以阅读。通常没中文本文件都需要使用相应的分析程序（parser）来阅读。  
- 通常比等价的二进制文件大。  


** 二进制文件 **   

- 通常是人类无法阅读的，至少使用常规文本编辑器无法查看。  
- 通常与特定的程序相关连。 有些流行的二进制文件的格式是公开的，
	可以自己编写读写它们的程序，但通常要花费很大功夫。




** 文件夹 **  

Windows路径名使用反斜杠（\）来分隔路径中的名称，并以盘符开头。    
Linux中，使用斜杠（/）来分隔名称。   



>要在Python 字符串中包含 `\`必须使用转义字符`\`：  
>`'C:\\home\\Desktop\\Python``   
>为避免使用两个反斜杠，可使用原始字符串：   
>`r'C:\home\Desktop\Python`     


>在Python程序中支持这两种风格的路径名有点棘手，详细信息参阅Python模块 os.path的文档。  



<big>**当前工作目录**</big>

很多程序都使用了**当前工作目录（cwd）**的概念，  这指的是**默认目录**。  

操作文件或文件夹时，如果你没有提供完整路径名，Python将假定你指的是当前工作目录中的
相应文件或文件夹。  








###检查文件和文件夹


Python提供了这样的函数：返回有关计算机文件系统中文件和文件夹的信息。    


|     函数名         |                    作用                      |
|-----------------| ---------------------------------|
| os.getcwd()     | 返回当前工作目录的名称           |
| os.listdir(p)      |  返回一个字符串列表，其中包含路径 p 中的文件和文件夹|
| os.chdir(p)      |  将当前工作目录设置为路径 p     |
| os.path.isfile(p) |  当前路径 p 指定 一个文件时返回True，否则返回False |
| os.path.isdir(p) | p指定的是文件夹时返回True ，否则返回False |
| os.stat(fname) | 返回有关 fname 的信息，如大小、修改时间 |


```python
# list.py

import os

def list_cwd(): #列出当前工作目录中的文件和文件夹，
                #代码os.listdir(os.getcwd())比较难看所以编写如下代码。
    return os.listdir(os.getcwd())

#列出当前工作目录中的文件
def files_cwd(): 
    return [p for p in list_cwd() if os.path.isfile(p)]

#列出当前工作目录中的文件夹
def folders_cwd(): 
    return [p for p in list_cwd() if os.path.isdir(p)]

#列出当前工作目录中的.py文件
def list_py(path = None):
    if path == None:
        path = os.getcwd()
        return [fname for fname in os.listdir(path) 		# 观察
                if os.path.isfile(fname)
                if fname.endswith('.py')]

# 下面的函数返回当前工作目录中所有文件的大小总和

def size_in_bytes(fname):
    return os.stat(fname).st_size  	#函数 os.stat()还未介绍

def cwd_size_in_bytes():
    total = 0
    for name in files_cwd():
        total = total + size_in_bytes(name)
    return total
```



###处理文本文件


<big>** 读取文本文件 **</big>   

Python文件打开模式  

|      字符   |              含义        |
|-----------|-------------------|
| ' r '          |   只读  （默认）   |
| ' w '   		|  写入     		 		 |
| ' a '			| 追加					 |
| ' b '			| 二进制模式			 |
| ' t ' 		| 文本模式（默认） |
| ' + '			| 读写 模式 见下文	|




```python
# printfile.py
def print_file1(fname):
    f = open(fname, 'r')
    for line in f:            #每次读取一行
        print(line, end = '')    # 思考使用 end=''的原因
    f.close()   #可选

def print_file2(fname):
    f = open(fname, 'r') 	#一次读取整个文件,大型文件占用大量内存
    print(f.read())     	#可将以上代码写为 print(open(fname,'r').read)   
    f.close()      
```


>默认为只读模式   
>如果你只想读取文本文件，可在调用函数 open 时只传递文件名。   
>例如：   `f = open(fname)`    





<big>**写入文本文件 **</big>    

```python
# write.py
def make_story1():
    f = open('story.txt','w')
    f.write('Mary had a little lamb,\n')
    f.write('and then she had some more.\n')


import os

def make_story2():  #先检查文件是否已存在
    if os.path.isfile('story.txt'):
        print('story.txt already exists')
    else:
        f = open('story.txt','w')
        f.write('Mary had a little lamb,\n')
        f.write('and then she had some more.\n')
```





<big>**将字符串插入到文件开头 **</big>   

方法：将文件读取到一个字符串中，再将新文本插入到字符串开头，再将字符串写入原来的文件。  


```python
def insert_title(title, fname = 'story.txt'):
    f = open(fname, 'r+')   #读写模式
    temp = f.read()
    temp = title + '\n\n' + temp
    f.seek(0)
    f.write(temp)
```







###处理二进制文件

```python
def is_gif(fname):
    f = open(fname, 'br')
    first4 = tuple(f.read(4))			#类型转换 成元组 tuple
    return first4 == (0x47, 0x49, 0x46, 0x38)
```

这个函数检查`fname`是不是 GIF 图像文件，方法是检查其前 4 个字节
是不是 `(0x47, 0x49, 0x46, 0x38)` （所有GIF图像文件都是以这4个字节开头）  





<big>**pickle **</big>   

在处理二进制文件方面， 使用模块pickle 通常是一种方便得多的方式。
它能够轻松的读写几乎任何数据结构。   


```python
# picklefile.py
import pickle

def make_pickled_file():
    grades = {'alan':[4,8,10,10],
              'dan':[5,None,7,7],
              'tom':[7,7,7,8],
              'may':[10,8,10,10]}
    outfile = open('grades.dat','wb')
    pickle.dump(grades, outfile)		#dump转存

def get_pickled_data():
    infile = open('grades.dat','rb')
    grades = pickle.load(infile)
    return grades
```

可以使用 pickle.dump 将数据结构转存到磁盘，以后再使用 pickle.load 从磁盘获取数据结构。 



>术语说明   
>Python 模块 pickle 执行的操作通常被称为对象串行化（简称串行化）。  
>其基本思想是，将复杂的数据结构转换为字节流，即创建数据结构的串行化表示。  

除数据结构外，还可使用 pickle 来存储函数。   

>pickle 不能用于读写特殊格式的二进制文件，如GIF文件。对于这样的文件
>必须逐字节处理。  


> Python 包含了一个名为 shelve 的模块，这个模块提供了存储和检索数据的更高级方式。   
> 模块 shelve 让你能够将文件视为字典。  


> Python 还有一个名为 sqlit3 的模块，提供用于访问 SQLite 数据库的接口。让你
> 能够编写 SQL命令。  





###读取网页

Python 为访问网络提供了强大的支持。   



一种常见的认为是让程序自动读取网页，使用模块 urllib 可轻松完成这种任务：   

```python
>>> import urllib.request
>>> page = urllib.request.urlopen('http://www.python.org')
>>> html = resp.read()
```

`html`包含了网页`www.python.org`的源代码，将网页作为字符串存储到计算机
后，便可使用 Python 字符串操作函数提取其中的信息。   




>模块urllib 还让你能够以编程方式发送数据。  

> 另一个绝妙的模块是 webbrowser ，它能让你以编程方式在浏览器中显示网页。  



>要将网页读取到字符串变量中，第一步是创建一个 Web 请求。
>接下来的一个重要步骤是分析字符串 -- 识别并提取标题、段落、表格等。
>Python 通过模块 html.parer 提供了一个基本的 HTML 分析库。  












第9章：异常处理
--------------------------

** 异常**为程序处理意料之外的错误提供解决方案。    

异常是一种特殊的错误  *对象*。  

在众多错误情况下，Python采取的措施是 `引发异常` 。 




###异常

出现异常后，如果不捕获或以任何其他方式进行处理，Python将立即停止运行程序，    
并显示栈跟踪 -- 异常发生前调用的函数清单。    
这对于确定导致错误的代码行很有帮助。  





<big>** 引发异常 **</big>

Python内置函数和库函数通常在出现意外情况时引发异常。  


在代码的任何地方都可使用 raise 语句故意引发异常。  

```python
>>> raise IOError('This is a test!')
Traceback (most recent call last):
  File "<pyshell#1>", line 1, in <module>
    raise IOError('This is a test!')
OSError: This is a test!
```


>Python包含大量的异常，这些异常被组织成层次结构。    





###捕获异常

发生异常时的选择：   

1. 忽略异常，让程序崩溃并显示栈跟踪。   
2. 捕获异常，并打印友好的错误消息乃至试图修复问题。  



```python
def get_age():
    while True:
        try:
            n = int(input('Hoe old are you?\n'))
            return n
        except ValueError:			#检查ValueError异常
            print('Please enter an integer value.')
```

while的循环体是 `try/except`块。可将可能引发异常的代码放在 `try`块中。  

只要 `try`块中的代码出现异常，就将跳过其他所有未执行的语句，立即跳转到	except`块。  
在上面的示例中，如果出现`ValueError`异常，将跳过`return`语句。   

如果`try`块没有引发异常，将忽略`exceptValueError`块。   






<big>** 捕获多种异常 **</big>   

```python
def convert_to_int1(s, base):	#注意在没有输入2个参数时将不会执行函数
    try:
        return int(s, base)
    except (ValueError, TypeError):
        return 'error'
```


如果要分别处理不同的异常，可使用多个`except`子句：   

```python
def convert_to_int2(s,base):
    try:
        return int(s,base)
    except ValueError:
        return 'value error'
    except TypeError:
        return 'type error'
```






<big>** 捕获所有异常 **</big>   


如果你在 except 子句中没有指定异常它将捕获所有异常：    


```python
def convert_to_int3(s, base):
    try:
        return int(s, base)
    except :
        return 'error'
```




###清理操作


在`try/except`块中，可包含执行清理操作的`finally`代码块。   


```python
def invert(x):
    try:
        return 1/x
    except ZeroDivisionError:
        return 'error'
    finally:
        print('invert(%s) done' %x )
		
>>> invert(3)
invert(3) done
0.3333333333333333
>>> invert(0)
invert(0) done
'error'
```

`finally`块肯定会执行，    
应用例如：通常将关闭文件的语句放在 finally 块中，这样文件肯定会被关闭，即便发生了 IOError 异常。   




<big>** with 语句**</big>   

为确保即便发生异常，也将尽早执行清理操作，还可使用 `with`语句。   

```python
# with.py
def withfile(fname):
    num = 1
    with open(fname,'r') as f:
        for line in f:
            print('%04d %s' %(num, line), end = '')
            num = num + 1
```











第10章：面向对象编程
-------------------------------

面向对象编程（Object-Oriented  简称OOP）。   

OOP是一种组织程序的方法，提倡仔细设计和代码重用。   




###编写类

```python
# person.py
class Person:  #定义一个Person类，通常首字母大写
    """class to repersent a person
    """
    #__init__相当于C++中的构造函数
    def __init__(self):
        self.name = ''
        self.age = 0
        
    #类中定义的函数被称为方法。方法的第一个参数必须是 self

##################### 运行示例 ######################
>>> p = Person()    			#创建Person对象，使用 Person()
>>> p								# 官方”(official)表示 （见下文）。
“<__main__.Person object at 0x01D6D8F0>”  
>>> p.age
0
>>> p.name
''
>>> p.age = 24
>>> p.age						#还只能以这种方式显示其值
24
>>> p.name = 'Fan'
>>> p.name
'Fan'
>>> p								 #与上面的 p 一样
“<__main__.Person object at 0x01D6D8F0>”
```

在上面的例子中，变量`p`指向一个 Person 对象。
Person对象包含变量`age`和`name`它们分别指向`24` `Fan` ，      
Python自动给每个对象添加特殊变量`self`，这个变量指向对象本身，
让类中的函数能够明确引用对象的数据和函数。  


方法`__init__(self)`用于在对象第一次调用时（在对象创建时）初始化对象。可根据需要给`__init__`指定其他参数。   

>self是一个约定，你也可以更改，但是可读性变差。self 相当与 C++ 中的 this 

在Python中，可像使用其他数据类型一样使用对象：可将它们传递给函数、存储到列表和字典中、保存
到文件中 ...     





###显示对象

下面给Person 类添加一个方法，用于打印Person 对象的内容。    

```python
# person.py
class Person:  
    """class to repersent a person
    """
    def __init__(self):
        self.name = ''
        self.age = 0
    
    def display(self):
        print("Person('%s',%d)" %(self.name, self.age))
        
############  运行示例 #################
>>> p = Person()
>>> p.display()
Person('',0)
```


方法`display`的效果很好，但还可以利用Python提供的一些特殊方法，让你
能够定制对象以支持天衣无缝的打印。      

例如：     
特殊方法 `__str__`用于生成对象的字符串表示：     

```python
#在文件 person.py中添加如下代码
    def __str__(self):
        return "Person('%s',%d)" %(self.name, self.age)

###############   运行示例  ################
>>> p = Person()
>>> str(p)
"Person('',0)"
```



还可用`str`来简化方法`display` ：     

```python
# person.py
class Person:  
    """class to repersent a person
    """
    def __init__(self):
        self.name = ''
        self.age = 0
        
#    def display(self):
#        print("Person('%s',%d)" %(self.name, self.age))

    def display(self):
        print(str(self))
        
    def __str__(self):
        return "Person('%s',%d)" %(self.name, self.age)
```




还可以定义特殊方法`__repr__`，它返回对象的“官方”(official)表示。     

Person对象的默认官方表示不太实用，如下：   

```python
>>> p = Person()
>>> p
"<__main__.Person object at 0x01D6D8F0>"
```

通过添加`__repr__`我们可控制上面打印的字符串。  

在大多数类中，方法`__repr__`都与方法`__str__`相同      



```python
#在文件 person.py中添加如下代码
    def __repr__(self):
        return str(self)
        
##########  运行示例 ################
>>> p = Person()
>>> p
Person('',0)
>>> str(p)
"Person('',0)"
```


>如果你定义了方法`__repr__`，但没有定义方法`__str__`则对对象调用`str()`时，将执行`__repr__`。   


添加方法`__repr__`后，可进一步简化`display`：  

	def display(self):
		print(self)

实际上没有必要编写`display`   








###灵活的初始化



在前面的代码中初始化Person类对象比较麻烦，一种更方便的方法是，在构造对象时
将姓名和年龄传递给`__init__` 即给其默认值 。     


```python
#将 person.py 文件中的 __init__ 对象该写成如下形式。    
    def __init__(self, name = '',age = 0):
        self.name = name
        self.age = age

######### 初始化示例 ###############
>>> p = Person('Fan',24)    #对照之前初始化简便很多（注意：仅仅是初始化）
>>> p									#此时可直接显示其值
Person('Fan',24)

########  不能执行如下操作 ##########
>>> p = Person()
>>> p
Person('',0)
>>> type(p)
"<class '__main__.Person'>"
>>> p = ('Fan',23)		 #执行这一步后
>>> type(p) 				#注意：更改了类型
"<class 'tuple'>"
```



由于其有了默认值，所以在创建时可以不给任何参数。     
但此时创建的Person对象没有任何意义。因此很多程序员不这样给`__init__`的参数指定默认值。  

 






###设置函数和获取函数

当前我们可以（只能）使用 `.`来读写Person对象的`name`和`age`的值。  


<big>**特性装饰器**</big>   

**装饰器搞不懂  略**

>装饰器   
>装饰器是Python中的一种通用结构，用于系统的修改既有函数。   
 饰器通常放在函数开头，并以 `@`字符开头。 在本书中，
将使用装饰器来创建设置函数和获取函数



以下代码抄至其它书籍

```python
#装饰器的典型用法之一
def decorator(F):				     	# On @ decoration
	def wrapper(*args):    		# On wrapped function call
		# Use F and args
		# F(*args) calls original function
return wrapper 

@decorator				# func = decorator(func)
def func(x, y):			# func is passed to decorator's F
	... 

func(6, 7)					 # 6, 7 are passed to wrapper's *args
```


<big>**私有变量**</big>   

将变量名开头包含`两个下划线`，则表明该变量是私有变量。

如：   
self.__age  

。。。 。。。


###继承

继承是一种**重用类**的机制    
让你能够这样创建全新的类：给*现有类的拷贝*添加变量和方法。  




我们设计一款游戏，其中涉及人类玩家和计算机玩家。  
为此可创建一个 Player 类，它包含所有玩家都有的东西，如得分和名词。  



```python
# players.py
class Player:
    def __init__(self, name):
        self._name = name
        self._score = 0
    def reset_score(self):
        self._score = 0
    def incr_score(self):
        self._score = self._score + 1
    def get_name(self):
        return self._name
    def __str__(self):
        return "name = '%s', score = %s" %(self._name, self._score)
    def __repr__(self):
        return 'Player(%s)' % str(self)
```


玩家计算机和人的区别主要在于，人通过键盘输入走法，而计算机使用函数生成走法。   

接下来编写一个 Human 类，用于表示人类玩家。   
一种方法是复制Player类，再添加让玩家走棋的方法 make_move(self)     
这种方法虽然可行但更佳的方法是使用继承。    

```python
class Human(Player):
	pass
```

`pass`语句表示”什么都不做“，对于Human类来说，这是一个完整而实用的定义，
它继承 Player 的代码。  



<big>**重写方法**</big>        

未知点： 

* `__repr__`方法的用途。   



>**术语说明**    
 类常被称为父类，而派生类常被称为子类。   





###多态




###更深入的学习

为组织面向对象的程序，一种流行的方式是使用*面向对象设计模式*。


推荐：在掌握OOP的所有技术细节后，如果要了解重要的设计问题，
可阅读《设计模式：可复用面向对象软件的基础》








第11章：案例研究：文本统计
------------------------------------------

**很显然我没有 凯文.米特尼克 那样强烈的挑战自我的心理**


程序编写工作很棘手，演示这一点也很难。  
有了清晰的问题描述后，我们就找到了简洁的解决方案；
但实际上绝不可能如此简单：   
需要反复试验；开始会遭遇失败，还常常需要推倒重来。    

通过编写程序，你将逐渐学会合并使用各种技术的最佳方式，并了解哪些解决方案通常对解决哪些问题行之有效。




###问题描述

受邀为解决重要问题而编写程序时，编程新手常常不知到从何处着手。   

至少从笼统的角度说，答案很简单：编写大型程序时，先得明白要解决的问题。

这看似简单，但未能正确认识要解决的问题是及其常见的编程错误。  

有时候，编写程序之所以很难，是因为你没有真正明白自己要做什么。  


<font color="#FF0000">(以下略)</font>

###保留想要的字母

###使用大型数据文件测试代码

###找出出现次数较多的单词

###将字符串转换为次数字典

###组织在一起

###练习







