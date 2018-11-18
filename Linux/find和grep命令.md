# find和grep命令



## find命令

```
# 基本命令形式
find 路径  比较准则  搜索词

# 基本示例
find ./test -name "abc.txt"

# 忽略某文件
find ./test -iname "*.Php"

# 指定搜索的目录深度
find ./test -maxdepth 2 -name "*.php"
```


参考：  

- [25 simple examples of Linux find command](http://www.binarytides.com/linux-find-command-examples/)
- [35 Practical Examples of Linux Find Command](https://www.tecmint.com/35-practical-examples-of-linux-find-command/) 



## grep命令

参考：  

- [15 Practical Grep Command Examples In Linux / UNIX](http://www.thegeekstuff.com/2009/03/15-practical-unix-grep-command-examples)
- [12 Practical Examples of Linux grep Command](https://www.tecmint.com/12-practical-examples-of-linux-grep-command/)
- [11 Advanced Linux ‘Grep’ Commands on Character Classes and Bracket Expressions](https://www.tecmint.com/linux-grep-commands-character-classes-bracket-expressions/)


```
# 在文件中查找
grep "string" FILE_PATTERN

# 通过管道，其中 -i 表示忽略大小写
dpkg -l | grep -i python
```

