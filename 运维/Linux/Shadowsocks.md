# Shadowsocks
2016.09.13 获得小康赠送的一个帐号。他自己买的。

[Shadowsocks download](https://shadowsocks.org/en/download/clients.html)
[Shadowsocks Quick Guide](https://shadowsocks.org/en/config/quick-guide.html)
[Shadowsocks GitHub wiki](https://github.com/shadowsocks/shadowsocks-qt5/wiki/Installation "参考这个")

他发给我的是一张二维码，扫描后得到类似如下形式的字符：  
```
ss://1jZmI6c3Bhcmt2cHNANDUuMzluMTI4LjI1Mzo4Mzg4YWVzLTI1Ni
```

这是使用BASE64编码过的URI,而其解码后得到如下的格式的一串字符：

	解码方法： 
	echo ss://1jZmI6c3Bhcmt2cHNANDUuMzluMTI4LjI1Mzo4Mzg4YWVzLTI1Ni | base64 -d
	解码后得到如下格式的字符串(只是一个示例)：
	ss://method[-auth]:password@hostname:port

例如：

	ss://bf-cfb-auth:test@192.168.100.1:8888

那么它在图形配置窗口中代表的意思： bf-cfb 代表加密方式；auth代表可选的一次验证；test为密码；192.168.100.1为服务器地址；8888为服务器端口。


## Shadowsocks的安装

### Command-line Client

- pip install shadowsocks
- apt-get install shadowsocks-libev

好吧在Ubuntu 16中并没有发现shadowsocks-libev，但发现了 shadowsocks 。

### GUI Client

1. Ubuntu 16

```
sudo add-apt-repository ppa:hzwhuang/ss-qt5
sudo apt-get update
sudo apt-get install shadowsocks-qt5
```

安装Shadowsocks-Qt5后点击 "连接" --> "添加" --> "URI" 然后直接将扫描出来的字符串粘贴上它会自动进行解码并进行设置。


默认
本地地址为： 127.0.0.1
本地端口为： 1080

为了与XX-Net的一致，我将本地端口改为 8087
更改的是 .profile文件


### SwitchyOmega配置
之前使用XX-Net的配置都下载备份到 Download 目录，它使用的规则列表网址为：
https://autoproxy-gfwlist.googlecode.com/svn/trunk/gfwlist.txt

然后参考了[此处](https://aitanlu.com/ubuntu-shadowsocks-ke-hu-duan-pei-zhi.html)
新增了一个情景模式：Shadowsocks-qt5 
规则列表网址改为：
https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt
