《UNIX操作系统设计》
========================

<font face=楷体>
The Design of the UNIX Operating System		
[美]Maurice J. Bach 著
Copyright &copy; 1986 by Bell Telephone Laboratories, Incorporated.	 
Copyright &copy; 1990 by Prentice Hall PTR.     
Copyright &copy; 2000 by China Machine Press.   
机械工业出版社，2000.4    
</font>



[toc]




<font color=green> 时间 2015.8.3 </font>

第1章 系统概貌
----------------

###系统结构



###用户看法

路径名是一个分量名序列，各分量名之间用斜杠隔开。分量是一个字符序列。  


在UNIX系统中，程序不了解核心按怎样的内部格式存储文件，而把数据作为无格式的字节流看待。    
程序可以按自己的意愿去介绍字节流，但这种解释与操作系统如何存储数据无关。			
因此，对文件中数据进行存取的语法是由系统决定，并且对于所有的程序都相同；但是数据的语义是由程序加上去的。


思考以下命令：  

```
cp /dev/tty  terminalread  
cp /dev/tty  /dev/tty
```






shell的内部命令不仅使shell是命令解释程序，而且是一种程序设计
语言，它包括用于循环的命令（for-in-do-done和while-do-done),用于条件执行的命令
（if-then-else-fi）,一个选择（case）语句命令，cd命令和其他一些命令。  


通常shell 是同步的执行一个命令，要等候一个命令执行完毕再去读下一个命令。   
它也允许异步执行，当它不等待前一个命令执行完毕就去读下一个命令行；异步执行的命令
被说成是在后台执行的。   


  


###操作系统服务




###关于硬件的假设




第2章 内核导言
-----------------



###UNIX操作系统的体系结构





###系统概念介绍



###内核数据结构





###系统管理








第3章  数据缓冲区高速缓冲
-----------------------

###缓冲头部




###缓冲池的结构




###缓冲区的检索




###读磁盘块与写磁盘块




###高速缓冲的优点与缺点












