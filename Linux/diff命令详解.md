## cmp

cmp(compare的缩写)命令，比较两个文件

```shell
$ cmp chap01 chap02
chap01 chap02 differ: char 9, line 1 （表示在第一行，第九个字符不同）
```

cmp逐个字符的比较两个文件，找到第一个不相等字符时，输出其位置。默认情况cmp不考虑其后的情况，可以使用 `-l`详细列出所有不同。

如果两个文件完全相同，则不显示任何信息。



## comm

查找两个文件的相同之处。

略



## diff

diff是基于行的差异比较。

使用diff的惯例是：将旧文件作为第一个参数。

```shell
[fan 19:58:01]~/workspace/shell$ echo Test 1 >test.1
[fan 20:09:54]~/workspace/shell$ echo Test 2 > test.2
[fan 20:10:03]~/workspace/shell$ diff test.[12]
1c1
< Test 1
---
> Test 2
```

`1c1`为输入文件行编号的简洁表示方式，指出不同之处以及需要进行的操作：这里，`c`表示改变(change)；其它还有 `a`表示增加(add)，`d`表示删除(delete)。

不同的行会以前置左角`<`括号的方式，对应到左边的（第一个）文件。

而前置右角`>`括号则指的是右边（第二个）文件。

`---` ：用于分隔两个文件



常用选项：

- `-b`：不检查空格字符的不同
- `-B`：不检查空白行
- `-w`：忽略全部的空格字符
- `-i`：不检查大小写的不同
- `-q`：仅显示有无差异，不显示详细信息





可以直接比较两个文件夹:



- `-r`选项递归比较子目录中的文件

  



如何带颜色输出





### diff的四种输出格式



#### 正常格式

无需添加任何参数，默认格式。

```shell
fan 19:58:01]~/workspace/shell$ echo Test 1 >test.1
[fan 20:09:54]~/workspace/shell$ echo Test 2 > test.2
[fan 20:10:03]~/workspace/shell$ diff test.[12]
1c1
< Test 1
---
> Test 2
```







#### 并列格式

使用选项`-y`，同时也可以使用`-W` 来指定并列的宽度。更方便观察。

```shell
[fan 20:55:32]~/workspace/shell$ diff test.[12] -y
Test 1							      |	Test 2
```





#### 上下文格式

使用参数`-c`，上下文格式可以显示变化的上下文。

```shell
[fan 20:55:41]~/workspace/shell$ diff test.[12] -c
*** test.1	2018-06-07 20:55:08.260616107 +0800
--- test.2	2018-06-07 20:55:18.556608549 +0800
***************
*** 1 ****
! Test 1
--- 1 ----
! Test 2
```


- 前两行表示两个文件的一些信息
- `***************`，15个*号将文件信息和下文分离
- `*** 1 ****`：表示第一个文件的第一行，`--- 1 ---`表示第二个文件的第一行。补充（ `***1,5***`则表示第一个文件的1-5行）
- `!`表示此行内容有变动
- 补充： `+`表示新增，`-`表示删除



#### 合并格式

使用`-u`参数。两个文件大量内容重复，上下文格式显示很多无用的干扰信息，后来就推出了合并格式。

```shell
[fan 20:55:52]~/workspace/shell$ diff test.[12] -u
--- test.1	2018-06-07 20:55:08.260616107 +0800
+++ test.2	2018-06-07 20:55:18.556608549 +0800
@@ -1 +1 @@
-Test 1
+Test 2
```



`-`代表 test.1第一个文件，`+`代表test.2第二个文件。同上下文一样，合并格式也是默认显示修改前后3行的内容，同样可以使用 `-num`来设置显示前后的行数。




- 前两行表示两个文件的一些信息
- `@@ -1 +1 @@` 表示修改的位置，`-1`表示第一个文件的第1行，`+1`表示第二个文件的第2行
- 合并显示变动的具体内容，`-`表示第1个文件，  `+`表示第2个文件







**diff 和 diff3的区别：**diff3的作用是比较三个文件，例如比较基本版本与两个不同的人所做的两个修改文件。它还会产生一个 ed 命令的脚本，让用户将两组修改文件合并到基本版本里。







### diff 输出乱码

- 方法一：设置Terminal的编码为UTF-8，重新启动Terminal

- 方法二：如果是`git diff`，则运行如下命令`git config --global core.quotepath false`或直接在 gitconfig 文件中配置。





### patch工具程序

patch工具程序可以利用diff的输出，结合原始文件，以重建另一个文件。

示例：

```shell
# 产生补丁
# 使用 -c 选项同时输出上下文差异（冗长的报告），让patch知晓更多的信息（不加-c也行）
[fan 20:10:15]~/workspace/shell$ diff -c test.[12] > test.dif

# 列出文件内容
[fan 20:23:41]~/workspace/shell$ cat test.dif
*** test.1	2018-06-07 20:09:54.558608270 +0800
--- test.2	2018-06-07 20:10:03.358601811 +0800
***************
*** 1 ****
! Test 1
--- 1 ----
! Test 2

# 打补丁
[fan 20:23:51]~/workspace/shell$ patch < test.dif
patching file test.1

# 显示修补后的文件
[fan 20:24:26]~/workspace/shell$ cat test.1
Test 2

# 取消补丁
[fan 20:24:34]~/workspace/shell$ patch -R < test.dif 
patching file test.1
[fan 20:32:09]~/workspace/shell$ cat test.1
Test 1
```





## git diff

