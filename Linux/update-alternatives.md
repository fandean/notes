# update-alternatives 命令

>参考：[update-alternatives学习笔记](http://blog.csdn.net/HEYUTAO007/article/details/5441482)
[使用update-alternatives工具配置可选系统](http://man.chinaunix.net/linux/debian/debian_learning/ch08s21.html)
[使用update-alternatives切换Ubuntu默认java命令](http://blog.csdn.net/xyzxyzxz/article/details/6920346)
[Ubuntu-gcc版本切换](http://www.cnblogs.com/little-ant/p/3291175.html)
[update-alternatives命令详解](http://coolnull.com/3339.html)




一个参考操作: 
```shell
sudo add-apt-repository ppa:ubuntu-toolchain-r/testsudo 
apt-get update
sudo apt-get install gcc-4.9 g++-4.9
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 60 --slave /usr/bin/g++ g++ /usr/bin/g++-4.9
```


