# bash



Bash学习可参考：阮一峰github上的相关文章。



### 检查Ubuntu版本

方法一：

```
lsb_release -a
```



```shell
[fan 11:30:57]/mnt/c/Users/Fan Dean$ lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 18.04 LTS
Release:        18.04
Codename:       bionic
```





方法二： 

使用Neofetch命令行工具，显示更详细的信息，并且其能够适用于各种Linux版本。

安装：

```
sudo apt install neofetch
```

运行:

```shell
neofetch
```





### script记录会话过程



```shell
# 在原有typescript文件后追加，而不是默认的覆盖
script -a

# 将会话记录存放在filename文件中
script filename	
```



### cal显示日历





### wc统计行数、字数和字符数

选项：

- `l`：统计行数
- `w`： 统计字数
- `c`： 统计字符数





### date



### who 检查当前用户



### bc 计算器



### uname 了解系统特性



### tty 获取终端名称



### stty 显示和设置终端特性

选项：

- `a` : 显示当前设置





### cp 复制



选项： 

- `R`：复制目录树（递归）
- `i`  :  互交式复制





### rm 删除

选项：

- `r` :  递归删除
- `f` : 强制删除
- `i` :  互交





### file 文件类型识别





### od 数据的八进制显示

选项：

- `b`: 单独显示每个字符的ASCII码
- `c` : 显示对应字符



### top : 用来实时显示与ps命令相似的进程信息



### ls

选项: 

- `x`  : 分列显示
- `X` : 根据扩展名排序
- `a` : 显示所有
- `h` : 人性化显示

文件大小，日期排序问题





### ps 

- `e`  : 列出所有进程 
- `x`  : 显示所有程序，不以终端机来区分。



### unzip 

完整语法：

```
unzip [-cflptuvz][-agCjLMnoqsVX] [-P <密码>][.zip文件] [文件][-d <目录>] [-x <文件>] 或 unzip [-Z]
```
对于大文件分包压缩的，unzip解压时按顺序一个一个解压就行，之前的oracle database 11g 就是这样。
[参考](http://racoguo.blog.51cto.com/2309068/1288050)



### chmod





### chown

改变指定目录以及其子目录下的所有文件的拥有者和群组 

```shell
chown -R fan:fan testdir
```





### du命令

`du：`disk usage 的简称

```
# -h 人类可读方式，-s目录的总磁盘大小
du -hs 目录
```







