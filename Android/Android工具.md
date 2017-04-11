# Android工具

标签（空格分隔）： Android

---

## adb调试工具
> 参考《Android群英传》

adb (Android Debug Bridge)  

adb是Android SDK自带的调试工具，它位于sdk的`platform-tols`目录下。

直接在电脑使用ADB连接手机：  

- 直接使用adb，在Windows系统中还要下载对应的手机驱动，Linux则不用。该驱动可以到手机品牌官网下载。
- 另外还需在手机的"setting"选择"about my phone"，再不断点击"内部版本号"来激活开发者选项。进入开发者选项后，选择"USB Debug"。然后将手机连上电脑，此时手机上会显示"是否需要对这台电脑授权" 点击"OK"后，电脑就可以通过ADB连上手机。




打开命令行，使用 adb shell，就会进入到设备的控制台。

在Android系统目录中，`/system`和`/data`两个目录是开发者非常关心的两个目录。

- `/system/app`里面放的是一些系统的App
- `/system/bin/`主要放的是Linux自带的组件
- `/system/build.prop`记录系统的属性信息
- `/system/fonts/`存放系统字体，root后可下载TTF格式字体替换原字体。
- `/system/framework/`系统的核心文件、框架层
- `/system/lib/` 存放几乎所有的共享库(.so)
- `/system/media/` 保存系统提示音；其中 audio目录保存系统默认铃声
- `/system/usr/` 保存用户的配置文件；如键盘布局、共享、时区文件
- `/data/app/` 包含用户安装的App
- `/data/data/` 包含了App的数据信息，文件信息，数据库信息；以包名方式来区分
- `/data/system/` 包含了手机的各项系统信息
- `/data/misc/` 保存大部分的wi-fi、vpn信息



### ADB常用命令
参考书籍






## 抓取Http请求



## 抓取Https请求

[charles 下抓取 https 请求 (IOS 和 Android 教程)](https://testerhome.com/topics/7925)


