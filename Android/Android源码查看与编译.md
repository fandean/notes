# Android源码查看与编译

标签（空格分隔）： Android

---

[大牛们是怎么阅读 Android 系统源码的？](https://www.zhihu.com/question/19759722)
[自己动手编译Android源码(超详细)](http://www.jianshu.com/p/367f0886e62b)

## 在线阅读Android源码
几个网站和方法：

- [GrepCode android](http://grepcode.com/project/repository.grepcode.com/java/ext/com.google.android/android/) GrepCode.com 一个专注于几个著名Java项目的在线源码网站，当然也包括Android框架层
- [AndroidRef](http://androidxref.com/)
- 一个chrome内核浏览器插件：[Android SDK Reference Search](https://chrome.google.com/webstore/search/Android%20SDK%20Reference%20Search%20)安装了这个插件之后就可以直接到[android api官方网：](http://developer.android.com/reference/packages.html)
  随便查找一个类：例如[Activity：](http://developer.android.com/reference/android/app/Activity.html)
  然后我们就可以看到在Aitivity后面多了个（**view source**）
- [omapzoom.org 比较乱](http://omapzoom.org/)



## 离线下载源码

上清华镜像站：[清华大学开源软件镜像站  Tsinghua Open Source Mirror](https://mirrors.tuna.tsinghua.edu.cn/help/AOSP/ "清华大学开源软件镜像站| Tsinghua Open Source Mirror")   
科大镜像：[AOSP(Android) 镜像使用帮助](https://lug.ustc.edu.cn/wiki/mirrors/help/aosp "AOSP(Android) 镜像使用帮助 ")


[史上最简单Android源码编译环境搭建方法 - Weishu's Notes](http://weishu.me/2016/12/30/simple-way-to-compile-android-source/index.html "史上最简单Android源码编译环境搭建方法 - Weishu's Notes")

[进击的程序员](http://0xcc0xcd.com/p/index.php "进击的程序员")


[Android 系统全套源代码分享](https://testerhome.com/topics/2229)






## 编译源码

电脑硬件要求：


## 源码查看工具

### vim + ctags + cscope

[Linux 平台下阅读源码的工具 | ShareHub](http://blog.xiaohansong.com/2015/08/24/Linux%E6%BA%90%E7%A0%81%E5%88%86%E6%9E%90%E5%B7%A5%E5%85%B7%E9%93%BE/# "Linux 平台下阅读源码的工具 | ShareHub")

ctags的添加：  
```
set tags=/home/RT288x_SDK/source/linux-2.6.36.x/tags  
```

[【转】使用 vim + ctags + cscope + taglist 阅读源码 - 相关文章](https://www.bbsmax.com/R/ZOJPjg7Pdv/ "【转】使用 vim + ctags + cscope + taglist 阅读源码 - 相关文章")    
通过这篇文章来了解Ctags和taglist [vim Ctags 和taglist安装和使用](https://www.bbsmax.com/A/KE5QOWj4zL/ "vim Ctags 和taglist安装和使用")


### Source Insight

[Android源码阅读工具——在Ubuntu下使用Source Insight-IT大道](http://www.itdadao.com/articles/c15a455979p0.html "Android源码阅读工具——在Ubuntu下使用Source Insight-IT大道")


