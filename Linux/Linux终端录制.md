# Linux终端录制

## Script
参考： [Linux终端录屏与播放 script 命令](http://zhang789.blog.51cto.com/11045979/1840257)  

简单说下命令的参数:  

- -t 是把时间数据输出到标准错误(standard error), 所以要用 2>/tmp/time.txt 把数据重定向到文件中, 一些情况下不需要重放，只要记录操作和输入输出，就可以不指定这个参数 
- -a 追加内容到文件，不会覆盖之前的记录 
- -q 安静模式，不会提示用户script在运行 
- -f 在每次写入后清屏，在配合管道使用时很有用 
- -c 这些非交互式的运行命令或脚本 在一些程序或脚本在后台运行时很有用



### 使用script录制
```
# 直接使用script命令，使用默认文件typescript来保存录制内容
script
# 指定文件名test
script test
```

只有同时保存时间文件才可以用scriptreplay进行回放。

使用如下命令同时输出时间文件：  

```
script -t timingfile -a scriptfile
```


### 使用scriptreplay回放
```
script timingfile scriptfile
```



## asciinema
优点：  

- 可以上传到网站，进行分享
- 可以直接复制，录制影像中的命令

缺点：  

- 不能快进


参考：[asciinema.org录制终端演示，支持实时复制代码](http://51.ruyo.net/p/3705.html)  



### Ubuntu 16.04安装asciinema
一定通过如下方式安装最新版：  

```
sudo apt-add-repository ppa:zanchey/asciinema
sudo apt-get update
sudo apt-get install asciinema
```

如果使用`sudo apt install asciinema`安装的只是0.9版本，功能不全，不能保存到本地。

### 将录制文件保存在本地
指定文件名：  
```
asciinema rec test.json
```

### 上传到网站

- 先在网站上注册asciinema用户：直接填写邮箱名称，然后点击邮箱接收到的链接即可。（保持登录状态）
- 关联asciinema用户：在本地电脑运行：`asciinema auth`会产生一个链接，在浏览器中打开此链接，即可关联用户。
- 上传本地已经录制好的文件： `asciinema upload testFile.json`
- 或者直接上传本次录制：`asciinema rec -t "My First ..."`，`-t`选项用于设置上传到asciinema网站时使用的标题。


### 播放录制内容

播放本地录制文件中的内容：  
```
asciinema play test.json
```

播放asciinema网站上的录制内容：  
```
asciinema play https://....
```

