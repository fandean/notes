# base64

在GitHub上看到有人这样写自己的联系方式:

`echo aXp6eWxpYW5nQGdtYWlsLmNvbQo= | base64 --decode`

于是查询了一下`base64`这个命令的用法.

编码自己的邮箱如:  

`echo fan@gmail.com | base64`

得到如下结果: 

	ZmFuQGdtYWlsLmNvbQo=

解码方法: 

`echo ZmFuQGdtYWlsLmNvbQo= | base64 -d`


