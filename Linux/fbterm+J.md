# Fbterm

## Fbterm簡介
Fbterm (Frame buffer terminal)是內核終端的直接替代：一個沒有Xorg也能使用的終端模擬器。

更具體的介紹見：  
​	
<https://wiki.archlinux.org/index.php/Fbterm_(简体中文)>  
<http://bbs.chinaunix.net/thread-1921227-1-1.html>  
<http://blog.csdn.net/xiajian2010/article/details/9625131>  
<http://blog.csdn.net/flytreeleft/article/details/6679638>  


安装fbterm:  
<https://wiki.archlinux.org/index.php/Fbterm_(简体中文)>  
<https://zh.opensuse.org/index.php?title=SDB:Fbterm&variant=zh-cn>

安装fbv  
<http://www.cnblogs.com/makefile/p/3952393.html>  
<http://askubuntu.com/questions/278863/how-do-i-set-up-a-background-image-for-console-in-ubuntu>  

利用fbterm可在tty终端显示和输入汉字,另安装fbv还可显示背景图片。

终端截屏也可利用程序ImageMagic的一个import命令 




安装fbv
```
apt-get install checkinstall				
//通过checkinstall打包源码,方法先./configure && make && sudo checkinstall  此法便于卸载
//checkinstall的相关配置见 http://www.ibm.com/developerworks/cn/linux/l-cn-checkinstall/
//如果不用checkinstall则直接 ./configure && make && sudo make install
```



编译fbv需依赖这三个 libungif libjpeg-dev libpng12-dev 其中libungif需另行下载源码编译
```
sudo apt-get install libjpeg-dev libpng12-dev
```


下载libungif并安装
```
http://sourceforge.net/projects/giflib/files/libungif-4.x/
解压文件，再 ./configure && make && sudo checkinstall  
```

下载fbv源码并安装
```
http://www.eclis.ch/fbv/
解压文件， 再 ./configure && make && sudo checkinstall  

在最后 sudo checkinstall 的时候可能出现: 
/bin/sh: 1: cannot create  /usr/local/man/man1/fbv.1.gz: Directory nonexistent 
解决办法： 查看 ll /usr/local/man  原来这个软链接指向 /usr/local/share/man 
现在在 /usr/local/share/man/ 中建立一个目录 man1 即可。  
```

安装运行 fbv ***.jpg 测试，如若出现不能打开文件或目录等消息，则先执行命令 `sudo ldconfig`

安装fbv 完成




安装fbterm
略

要支持中文输入如果使用的是 fcitx 则还要安装：  fcitx-frontend-fbterm  



建立脚本文件用于打开fbterm调用fbv图形查看器，显示背景图片。
```shell
#!/bin/bash

# fbterm-bi: a wrapper script to  enable  background image with fbterm
# usage: fbterm-bi /path/to/image fbterm-options

 echo -ne "\e[?25l" # hide cursor
				  
#或fbv -ciuker "$1" << EOF  但要在启动脚本时同时指定图片路径，见上面的usage;
#fbv -ciuker "这里是你的图片的完整路径" << EOF
fbv -ciuker "/$HOME/backup/fbterm-bi.jpg" << EOF
q
EOF
												   
shift
export FBTERM_BACKGROUND_IMAGE=1
exec fbterm "$@"
```

**实际的运行脚本:**

```shell
#!/bin/bash

# fbterm-bi: a wrapper script to  enable  background image with fbterm
# usage: fbterm-bi /path/to/image fbterm-options

 echo -ne "\e[?25l" # hide cursor
				  
#或fbv -ciuker "$1" << EOF  但要在启动脚本时同时指定图片路径，见上面的usage;
#fbv -ciuker "这里是你的图片的完整路径" << EOF

# 文件路径
filepath="~/.local/bin"

fbv -ciuker ${filepath}/fbterm-bi.jpg << EOF
#fbv -ciuker "/$HOME/.bin/.fbterm-bi.jpg" << EOF
#fbv -ciuker "/$HOME/.bin/.haizeiwangLufei.jpg" << EOF
#fbv -ciuker "/$HOME/.bin/.HaiZeiWangKuLou1.png" << EOF
q
EOF
												   
shift
export FBTERM_BACKGROUND_IMAGE=1
exec fbterm "$@"
```

