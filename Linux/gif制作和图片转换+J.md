# Linux制作gif方法

> [8 BEST SCREEN RECORDERS FOR LINUX IN 2017](https://itsfoss.com/best-linux-screen-recorders/)


## 图片转换命令convert
convert 命令是由 ImageMagick 包提供。

> 选择转换为jpg图片会比转换为png图片小很多。 jpg 图片比 png小。

缩放：
```
convert -sample 80x60 input.jpg output.jpg
```
缩放后图像保持原来的长宽比例(也可同时转换格式，好用法)： 
```sh
convert -sample 25%x25% input.jpg output.jpg
```
类型转换
```
convert 1.jpg 1.png
```
特殊效果
```
convert -charcoal 2 input.jpg output.jpg   #炭笔
convert -colorize 255 input.jpg output.jpg   #着色 可以指定三种颜色 red/green/blue
convert -implode 4 input.jpg output.jpg   #内爆效果
convert -solarize 42 input.jpg output.jpg   #曝光，模拟胶片曝光
convert -spread 5 input.jpg output.jpg     #随机移动，参数是位移大小
```
加边框
```
convert -raise 5x5 input.jpg output.jpg
convert +raise 5x5 input.jpg output.jpg
```

## 使用ImageMagick的如下命令

1. 执行如下命令將单帧图片压缩成 gif 图片:
```
convert -delay 120 -loop 0 *.png  out.gif
```

2. 执行如下命令將 gif 图片进行压缩:
```
convert out.gif -fuzz 10% -layers Optimize optimized.gif
```

3. 一个复杂一点的命令
```
convert -delay 50 frame1.gif -delay 100 frame1.gif -delay 150 frame1.gif -loop 0 -pause 200 animated.gif
```





## 利用ffmpeg将mp4转换为gif

参考：

- [使用 ffmpeg 实现 MP4 与 GIF 的互转](http://note.rpsh.net/posts/2015/04/21/mac-osx-ffmpeg-mp4-gif-convert/)  
- [Convert video (.mp4 or other) to high quality animated gif](http://www.alecjacobson.com/weblog/?p=2102)  


方法一： 直接将视频转换为gif

```
# 将整个small.mpr转换为gif
ffmpeg -i small.mp4 small.gif

# 从视频第2秒开始，截取3秒片段为gif
ffmpeg -t 3 -ss 00:00:02 -i small.webm small-clip.gif

# 转换为高质量的gif
ffmpeg -i small.mp4 -b 2048k small.gif
```

方法二： 先转换为图片，再利用convert转换为gif

```
# 每10帧每秒
ffmpeg -i input.mp4 -r 10 output%05d.png

# 在利用Imagemagick的convert工具转换为gif
convert output*.png output.gif
```

在第一步时指定目录： 
```
mkdir /tmp/gif/

ffmpeg -i input.mp4 -r 10 /tmp/gif/output%04d.png
```


## 在GitHub上找到的几个shell工具

都依赖于ffmpeg； makes creating high-quality gifs from video files

### gifgen

<https://github.com/lukechilds/gifgen>

### make-gif

<https://github.com/shmibs/make-gif>



## 安装Peek

Peek是一个gif记录工具。缺点：录制后不能进行调整；优点：安装方便

```
sudo add-apt-repository ppa:peek-developers/stable
sudo apt update && sudo apt install peek
```

>然后安装了 Peek，这个软件无法捕捉到图像，是全黑的。


## 安装Gifine

Gifine可以录制简短的Gifs或者videos。优点：录制后能进行调整；缺点：安装麻烦，


>尝试了一次Gifine，制作全屏gif，时间大概40s，占用了我10G内存，3.3G交换分区。制作小的gif还是可以。
>
>原因：当时帧率默认为30；总共录制的图片多达1238张，每张图有100KB，总共有136MB。
>解决办法：录制前改小帧率；录制后适当删除一些帧。


>然后安装了 Peek，这个软件无法捕捉到图像，是全黑的。
> 然后怀疑是不是我电脑有问题？

制作长gif：可以选择使用Gifine，录制多段小gif，再利用convert命令进行合并。

总体来说Gifine还是不错的。

> **每一帧，对应一张图片**

### Gifine使用说明



> 使用技巧：录制前先将要录制的界面**缩小**，帧率设置为4，录制后删除效果不佳的帧；这样会大大减小最后生成的gif的大小。



**录制前：**  
打开Gifine后，你可以进行两种操作：录制视频帧或者加载视频帧。

设置帧率"Framerate"为5或10；设置成2也行




**录制后：**  
录制视频帧后，可以进行裁剪，可以设置帧延迟、帧率以及循环次数的选项。

- Trim left of : 剪切掉左侧的帧(每一帧，对应一张图片)
- Trim right of: 剪切掉右侧的帧
- Delete frame：删除当前帧
- Halve frame： 将帧的数量减半（删除一半的图片）
- Reset cuts：恢复所有裁剪的图片
- Delay：延时。一般设置为8或9，延时太小图片变化的太快，看不清楚。


>技巧： 在gif的开头和结尾不要切换的太快，保留一定图片，有助于提升gif的表达效果。



录制的视频帧不会自动清除，它们保存在`/tmp/gifine_**`文件夹下，你还可以重新加载；在初始界面选择"Load directory"加载目录来加载。



### 非Ubuntu系统安装
It requires a few external commands to be present to function: (必须安装)

* [ffmpeg](https://ffmpeg.org/) — for creating mp4, and recording from desktop
* [GraphicsMagick](http://www.graphicsmagick.org/) — for creating gif
* [gifsicle](https://www.lcdf.org/gifsicle/) — for optimizing gifs
* [luarocks](https://luarocks.org) — to install the thing

In order to select a record area you need one of the following:(两者选其一)

* [slop](https://github.com/naelstrof/slop) — Recommended(推荐)
* [xrectsel](https://github.com/lolilolicon/xrectsel)

Install:  

    luarocks install --server=http://luarocks.org/dev gifine

Run the command `gifine` to use.



### Ubuntu 16.04安装

完整安装所有依赖：  
[GitHub Gifine](https://github.com/leafo/gifine)这里介绍了Installation on Ubuntu 16.04 LTS的的方法。


**Installation on Ubuntu 16.04 LTS**

This has been tested on a fresh install of Ubuntu 16.04 LTS.

Install git:

    $ sudo apt install git

Next, install all of the `gifine`'s dependencies and sub-dependencies:

    $ sudo apt install -y \
    ffmpeg \
    graphicsmagick \
    gifsicle \
    luarocks \
    libxext-dev \
    libimlib2-dev \
    mesa-utils \
    libxrender-dev \
    glew-utils \
    libglm-dev \
    cmake \
    compiz \
    gengetopt \
    libglu1-mesa-dev \
    libglew-dev \
    libxrandr-dev \
    libgirepository1.0-dev

Install `slop` using the instructions in the `slop` [README.md](https://github.com/naelstrof/slop) file.
或参考下文介绍的通过添加ppa安装slop的方法。

Install LGI:

	$ sudo luarocks install lgi

Install `gifine`.

	$ sudo luarocks install --server=http://luarocks.org/dev gifine


**以上就是Gifine的完整安装步骤**。



只安装必要依赖：  
[如何在 Linux 桌面上使用 Gifine 录制 GIF 动画？](https://linux.cn/article-8343-1.html)







### 依赖项slop的安装方法
[3rd Party Repository: Webupd8 包含了slop](https://www.ubuntuupdates.org/ppa/webupd8?dist=xenial)
```
sudo add-apt-repository ppa:nilarimogard/webupd8 
sudo apt-get update
sudo apt-get install slop
```

> 或者参考上文介绍的直接使用cmake编译的方法


### 依赖项xrectsel的安装方法
[Github xrectsel](https://github.com/lolilolicon/xrectsel) 

而xrectsel又依赖libx11，这可以通过安装libx11-dev来解决。

```
sudo apt install libx11-dev -y
cd /tmp
git clone https://github.com/lolilolicon/xrectsel.git
cd xrectsel
sudo ./bootstrap
sudo ./configure && sudo make && sudo checkinstall
# 然后输入一些信息，(必须输入版本号才能生成xrectsel的deb安装包)
sudo dpkg -i xrectsel-***.deb
```



