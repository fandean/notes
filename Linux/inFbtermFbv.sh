#!/bin/bash
#安装 fbterm 和 fbv 

echo 安装时不要离开

#安装 fbterm 
sudo apt-get install fbterm -y


echo 如果安装的输入法是 fcitx 则需安装 以下程序，以在fbterm中支持中文输入法
echo 如果不是 fcitx 则选择 n ，在脚本执行之后，记得还要安装此项。 
sudo apt-get install fcitx-frontend-fbterm 


#若想使非root用户 fbterm 和 fbv 需要把自己加入 video 组
sudo gpasswd -a $USER video 

#若想非root用户可使用键盘快捷方式，(如切换输入法的快捷方式)需要：  
sudo chmod u+s /usr/bin/fbterm 



#安装fbv 的依赖项 libjpeg-dev  libpng12-dev  
sudo apt-get install libjpeg-dev libpng12-dev  -y

#下载安装另一个fbv 的依赖项 libungif-4.x.tar.gz 保存到目录 /tmp 
wget http://nchc.dl.sourceforge.net/project/giflib/libungif-4.x/libungif-4.1.4/libungif-4.1.4.tar.gz -P /tmp

#编译libungif , 使用 checkinstall ,则需安装该程序(使用其更易于卸载)
#如不使用 checkinstall 则直接 make install 即可
sudo apt-get install checkinstall -y 

cd /tmp
tar -xzvf libungif-4.1.4.tar.gz 
cd libungif-4.1.4 
./configuer && make && sudo checkinstall
# 然后 手动运行(根据生成的deb软件包)  dpkg -i libungif-4.1.4.xxx.deb 


#下载 fbv-1.0b.tar.gz   
wget http://s-tech.elsat.net.pl/fbv/fbv-1.0b.tar.gz -P /tmp

cd /tmp 
tar -xzvf fbv-1.0b.tar.gz
cd fbv-1.0   

#运行下一步，可能出现错误： man1 目录不存在 ； 解决办法： 
sudo mkdir /usr/share/man/man1 
#完成 上次手动安装后，执行 ：  
#./configuer && make && sudo checkinstall  

#在手动安装 fbv.xxx.deb 包 
#sudo dpkg -i fbv.xxx.deb 


#安装fbv 后还要执行这一步 
#sudo ldconfig 



#之后再进行相关配置，  fbterm 的配置文件位于 ~/.fbtermrc 


# 最终配置好的fbterm命令，位于 ~/.local/bin/cfbterm  中

#最后在编写 运行脚本，以使 fbterm 运行时 调用 fbv 显示图片 等等  


#最后两项可参考如下连接： https://zh.opensuse.org/index.php?title=SDB:Fbterm&variant=zh-cn
# 和 ：  https://wiki.archlinux.org/index.php/Fbterm_(简体中文)
#注意: 第二个链接要包含"(简体中文)"


