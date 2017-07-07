# Android定位技术LBS - 麦子学院

[android原生态地图APIKey的申请视频教程-Android 定位技术 LBS-麦子学院](http://www.maiziedu.com/course/69-3069/ "android原生态地图APIKey的申请视频教程-Android 定位技术 LBS-麦子学院")

## 相关概念

GIS的定义：

地理信息系统（Geographic Information System），GIS是一种基于计算机的工具，它可以对空间信息进行分析和处理（
简言之，就是对地球上存在的现象和发生的事件进行成图和分析）

LBS的定义：

Location Based Services，又称定位服务，指通过移动终端和移动网络的配合，确定移动用户的实际地理位置，从而提供用户所需要的
与位置相关的服务信息的一种移动通信与导航融合的服务形式。



> 深入学习可参考《Android 4 高级编程》第13章：地图地理编码和基于位置的服务



定位服务提供商： 

Google、百度、高德、SOSO


## Google Map

[Google APIs Console](https://code.google.com/apis/console/)

新建一个Project名称为Api Project，打开Api Project，然后点击“API Manager”--> “Library”--> “Google Maps Android API”--> 点击 “Enable”

然后他会提示你“To use this API, you may need credentials. Click "Create credentials" to get started.”点击旁边的“Create credentials”创建凭据。


创建凭据的过程Google会指引你完成：

- 选择你需要创建哪种类型的凭据，这里之前我们已经选好的Google Maps Android API
- 直接获取你的凭据即API key： AIzaSyCd4ecKBO7mI9xi7ipklP-VZrGBh_mPkD8
- （下面为可选步骤）对API key进行限制：点击 “Restrict key”
- 在“Key restriction”下选择Android apps，然后添加你的package name和SHA-1 signing-cretificate fingerprint


Google提供的命令：`keytool -list -v -keystore mystore.keystore`的作用是列出密钥库mystore.keystore中的密钥，这就要看你之前有没有生成过密钥，还需指定你自己的密钥库。

This API key can be used in this project and with any API that supports it. To use this key in your application, pass it with the key=API_KEY parameter.

> Google的提示是：我们建议您在生产中使用该键之前限制此键。限制限制哪些网站，IP地址或应用程序可以使用此密钥调用API。
> 而之前申请凭据的时候需要生成ssh key的指纹，和你的包名的。建议设置只有某应用程序可以使用该凭据。使用包名：com.fandean.zhihudaily

关于证书，参考：[签署您的应用 | Android Studio](https://developer.android.com/studio/publish/app-signing.html?hl=zh-cn#certificates-keystores "签署您的应用 | Android Studio")

这里讲到可以使用Google Play签名或自行管理您的密钥和密钥库。




## 高德地图

[Android开发之高德地图实现定位 - 简书](http://www.jianshu.com/p/c3dc0cea0a2d "Android开发之高德地图实现定位 - 简书")

[利用高德地图API打造基于LBS的Android应用 - 简书](http://www.jianshu.com/p/6a4d17a342b7 "利用高德地图API打造基于LBS的Android应用 - 简书")

官网文档很详细：

[入门指南-Android 定位SDK | 高德地图API](http://lbs.amap.com/api/android-location-sdk/gettingstarted "入门指南-Android 定位SDK | 高德地图API")


先测试2D地图SDK和定位SDK，在开发包定制下载处选择好这两个功能，然后下载合并代码的定制开发包，这样可以减小包的体积。

然后下载示例代码。开发文档可在线查看，[文档](http://a.amap.com/lbs/static/unzip/Android_Map_Doc/index.html "概览")

添加高德SDK的两种方法： 

1.  拷贝jar文件至libs文件夹下
2.  在build.gradle中添加依赖


定位SDK：使用比较简单     


地图SDK：     

长按地图时可以弹出对话框显示长按的位置点的详细信息。这里需要说明一下，长按地图时会得到长按的位置的经纬度，这里需要高德地图的搜索SDK，进行逆地理编码。      

天气查询：     

通过天气查询，可获取城市的实时天气、今天和未来3天的预报天气，可结合定位和逆地理编码功能使用，查询定位点所在城市的天气情况。    

[获取天气数据-获取地图数据-开发指南-Android 地图SDK | 高德地图API](http://lbs.amap.com/api/android-sdk/guide/map-data/weather )     

请注意：使用上述功能需要下载地图SDK，导入搜索功能的jar包。       

高德地图中的天气返回的数据较少： 
 [天气对照表-实用工具-开发指南-Android 地图SDK | 高德地图API](http://lbs.amap.com/api/android-sdk/guide/map-tools/weather-code "天气对照表-实用工具-开发指南-Android 地图SDK | 高德地图API")





