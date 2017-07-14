# Android相关框架

标签（空格分隔）： Android

---

[Testing Support Library](https://developer.android.com/topic/libraries/testing-support-library/index.html)  

Android框架简介

第三方框架

[Android 流行框架查速表 - Android开发社区 | CTOLib码库](http://www.ctolib.com/cheatsheets-Android-ch.html "Android 流行框架查速表 - Android开发社区 | CTOLib码库")

## 图片加载库
[Future Studio](https://futurestud.io) 上有关于Picasso、Glide、Retrofit、Gson的系列教程；其中Glide另有中文翻译版。


图片加载框架发展历程：  

```
UniversalImageLoader  -->  Volley  -->  Picasso、Glide、Fresco
```


### Picasso
Picasso: Square出品

从易用性上来讲，Glide和Picasso应该都是完胜其他框架的


### Glide

#### Glide介绍

[Google推荐的图片加载库Glide介绍](http://www.jcodecraeer.com/a/anzhuokaifa/androidkaifa/2015/0327/2650.html)  

Google推荐的

Glide和Picasso有90%的相似度，准确的说，就是Picasso的克隆版本。

Glide远比Picasso快，虽然需要更大的空间来缓存。

Glide可以加载GIF动态图，而Picasso不能。

Glide和Activity/Fragment的生命周期是一致的  

Glide可以配置图片显示的动画，而Picasso只有一种动画：fading in。

Glide加载图像以及磁盘缓存的方式都要优于Picasso，速度更快，并且Glide更有利于减少OutOfMemoryError的发生，GIF动画是Glide的杀手锏。不过Picasso的图片质量更高。

Glide也支持webp图片。

Glide缓存相关介绍，见一个项目笔记Readme.md。

#### Glide使用
详细介绍：      
[Glide入门教程——9. 缩略图 - 简书](http://www.jianshu.com/p/db30bb036b89 "Glide入门教程——9. 缩略图 - 简书")   
网上有系列教程。比如[Glide最全解析](http://blog.csdn.net/column/details/15318.html)     

最终总结：       
[Glide的一些用法（一）（写了一下午，其实几乎涵盖完了，欢迎收藏） - 简书](http://www.jianshu.com/p/c9efd313e79e "Glide的一些用法（一）（写了一下午，其实几乎涵盖完了，欢迎收藏） - 简书")



提示：注意一个事实，对于相同的 URL ，如果你的初始请求没调用 .skipMemoryCache(true) 方法，你后来又调用了 .skipMemoryCache(true) 这个方法，这个资源将会在内存中获取缓存。当你想要去调整缓存行为时，确保对同一个资源调用的一致性。

#### Glide注意点
提高用户体验的方法：

缓存：





优先级：





略缩图：        

必须理解

.thumbnail()方法的目的就是让用户先看到一个低解析度的图，点开后，再加载一个高解析度的图。
Thumbnails跟我们之前讲的占位符还不太一样，占位符在app里面是指定好的某些资源文件。Thumbnails的话则是一个动态的占位符，它也可以从网络上加载得来。
Thumbnails会在实际的请求和处理之前显示出来，不管什么原因，如果Thumbnails在原图加载后才出现，它会自动消失而不会替换原图。

为了更加时更加流畅，另一个非常好的方式是用一种颜色来替换占位符的背景色，这个颜色是从目标图里提取出来的，可以看看我们写的一个[文档](https://futurestud.io/tutorials/how-to-get-dominant-color-code-for-picture-with-nodejs "文档")。   

Glide提供了两种不同的缩略图：

第一种比较简单，就是在加载原图的时候显示一张更小尺寸的图片。这种方式尤其适用于ListView和详情页面的组合当中。 如果你早已经在ListView中加载了图片，就像我们刚才假设的，250x250像素的图片，在进入其详情页面的时候，需要一张更大尺寸的图。然而，对于用户而言。他们早早就已经看到一张图片（小图）了，为什么还会出现先显示占位符，过了几秒后显示大图的情况？

对于这种情况，我们更应该在详情页面继续显示那张250x250的图片，然后在后台加载所需要的大图。Glide使用.thumbnail()就可以做到，这是传入的参数是一个浮点数，它代表尺寸的倍数。

第二种：高级略缩图（原图与略缩图完全不同）    

为.thumbnail()传入一个浮点类型的参数，非常简单有效，但并不是总是有意义。如果缩略图需要从网络加载同样全分辨率图片，可能根本都不快。这样，Glide提供了另一个方法去加载和显示缩略图。

```
private void loadImageThumbnailRequest() {  
    // setup Glide request without the into() method
    DrawableRequestBuilder<String> thumbnailRequest = Glide
        .with( context )
        .load( eatFoodyImages[2] );

    // pass the request as a a parameter to the thumbnail request
    Glide
        .with( context )
        .load( UsageExampleGifAndVideos.gifUrl )
        .thumbnail( thumbnailRequest )
        .into( imageView3 );
}
```
区别在于第一个缩略图请求是完全独立于第二个原始请求的。缩略图可以来自不同资源或者图片URL，你可以在它上面应用不同的变换。











### Fresco
Facebook出品，的强大的图片加载组件。

[Fresco中文文档](https://www.fresco-cn.org/)




## 网络请求库



### OkHttp

介绍：

khttp是高性能的http库，支持同步、异步，而且实现了spdy、http2、websocket协议，api很简洁易用，和volley一样实现了http协议的缓存。



#### OkHttp理解
这两篇文章中的示例真的很棒，用来入门：  
[A Guide to OkHttp](http://www.baeldung.com/guide-to-okhttp)  
[OkHttp Android Example Tutorial](http://www.journaldev.com/13629/okhttp-android-example-tutorial)   

至少理解下面的的语句。get请求一般只包含请求行和请求头，而url包含在请求行中；post请求还包含了请求正文(所以需要requestBody)部分。

在浏览器中输入一个网址，回车后，此时浏览器向发送了一个Get请求(用于获取页面的源代码？？)，而浏览器为了加载页面中的脚本和图片等(解析源代码？？)又会自行发起请求。比如打开一个Github上的仓库，共发起了100次请求。

**同步GET:**   
```
@Test
public void whenGetRequest_thenCorrect() throws IOException {
    Request request = new Request.Builder()
      .url(BASE_URL + "/date")	//最基本的get请求，无body
      .build();
 
    Call call = client.newCall(request);
    Response response = call.execute();
 
    assertThat(response.code(), equalTo(200));
}
```
**同步GET，并添加查询参数:** 
```
@Test
public void whenGetRequestWithQueryParameter_thenCorrect() 
  throws IOException {
     //get请求直接在url中添加参数
    HttpUrl.Builder urlBuilder 
      = HttpUrl.parse(BASE_URL + "/ex/bars").newBuilder();
    urlBuilder.addQueryParameter("id", "1");
 
    String url = urlBuilder.build().toString();
 
    Request request = new Request.Builder()
      .url(url)
      .build();
    Call call = client.newCall(request);
    Response response = call.execute();
 
    assertThat(response.code(), equalTo(200));
}
```
**基本的Post:**
```
@Test
public void whenSendPostRequest_thenCorrect() 
  throws IOException {
  	//post请求是有请求正文的，所以需要ReqestBody
    RequestBody formBody = new FormBody.Builder()
      .add("username", "test")
      .add("password", "test")
      .build();
 
    Request request = new Request.Builder()
      .url(BASE_URL + "/users")
      .post(formBody)
      .build();
 
    Call call = client.newCall(request);
    Response response = call.execute();
     
    assertThat(response.code(), equalTo(200));
}
```

以上是入门内容



**HTTPS相关：**  

首先要了解的事，okhttp默认情况下是支持https协议的网站的，比如<https://github.com/hongyangAndroid/okhttputils>等，你可以直接通过okhttp请求试试。不过要注意的是，支持的https的网站基本都是CA机构颁发的证书，默认情况下是可以信任的。    

1. [Android Https相关完全解析 当OkHttp遇到Https - Hongyang - 博客频道 CSDN.NET](http://blog.csdn.net/lmj623565791/article/details/48129405)
2. OKHttp HTTPS 请求支持所有Https服务器 证书验证忽略客户端证书


OKHttp进阶: 

可查看该系列文章的代码：  

[Android okHttp网络请求之Get/Post请求 - 总李写代码 - 博客园](http://www.cnblogs.com/whoislcj/p/5526431.html "Android okHttp网络请求之Get/Post请求 - 总李写代码 - 博客园")




### Retrofit

1. [Retrofit – Java(Android) 的REST 接口封装类库](http://www.tuicool.com/articles/NnuIva)  
2. [Retrofit 2.0：有史以来最大的改进](http://www.jcodecraeer.com/a/anzhuokaifa/androidkaifa/2015/0915/3460.html)  
3. [Android Retrofit 2.0使用](http://wuxiaolong.me/2016/01/15/retrofit/)  
4. [使用Retrofit请求API数据－codepath教程](http://www.jcodecraeer.com/a/anzhuokaifa/androidkaifa/2015/1016/3588.html)  
5. [深入浅出 Retrofit](https://dev.qq.com/topic/591aa71ae315487c53deeca9)  
6. [Retrofit — Getting Started and Creating an Android Client](https://futurestud.io/tutorials/retrofit-getting-started-and-android-client)
7. [Android Retrofit 2.0 使用-补充篇 | 吴小龙同學](http://wuxiaolong.me/2016/06/18/retrofits/ "Android Retrofit 2.0 使用-补充篇 | 吴小龙同學")
8. [Retrofit--使用Retrofit时怎样去设置OKHttp](http://blog.csdn.net/lyhhj/article/details/51388147 "Retrofit--使用Retrofit时怎样去设置OKHttp - Hankkin的博客小园")
9. [Retrofit+OKHttp 教你怎么持久化管理Cookie](http://blog.csdn.net/lyhhj/article/details/51345386 "Retrofit+OKHttp 教你怎么持久化管理Cookie - Hankkin的博客小园") 


> 以上参考中有几篇文章中包含了推荐阅读的文章，比如8推荐了几篇好文章。
>

Retrofit  是一个 RESTful 的 HTTP 网络请求框架的封装。注意这里并没有说它是网络请求框架，主要原因在于网络请求的工作并不是 Retrofit 来完成的。Retrofit 2.0 开始内置 OkHttp，前者专注于接口的封装，后者专注于网络请求的高效。

而Retrofit 把REST API返回的数据转化为Java对象方便操作。同时还封装了网络代码的调用。


参考4，摘要：  

**自定义converter：**   

Retrofit在默认情况下只能将Http的响应体反序列化到OkHttp的ResponseBody中，加入Converter可以将返回的数据直接格式化成你需要的样子。现成的一个Converter，`Gson:com.squareup.retrofit2:converter-gson`，当然还有其它的Converter。

通过实现[Converter.Factory](https://github.com/square/retrofit/blob/master/retrofit/src/main/java/retrofit/Converter.java "Converter.Factory")接口来创建一个自定义的converter  





Retrofit 2.0使用了新的URL定义方式。见。

即使response存在问题onResponse依然被调用。在Retrofit 2.0中，不管 response 是否能被解析。
onResponse总是会被调用。但是在结果不能被解析的情况下，response.body()会返回null。别忘了处理这种情况。

缺少INTERNET权限会导致SecurityException异常

现在我们必须转而使用OkHttp里面的[OkHttp Interceptors](https://github.com/square/okhttp/wiki/Interceptors "OkHttp Interceptors")





**Retrofit设置缓存** 

见另一篇文章： **OkHttp缓存控制**




**持久化Cookie** 

持久化管理你的Cookie，也就是实现用户免登陆过程。

>  这是Cookie，这是缓存cache

**Retrofit源码：** 





### Volley

#### Volley介绍

[网络请求库Volley介绍](http://www.jcodecraeer.com/a/anzhuokaifa/androidkaifa/2015/0526/2934.html)

非常适合进行数据量不大，但通信频繁的网络操作。  
对大文件下载 Volley的表现非常糟糕    
只支持http请求  
图片加载性能一般  



- volley是一个简单的异步http库，仅此而已。缺点是不支持同步，这点会限制开发模式；不能post大数据，所以不适合用来上传文件



用okhttp替代


## JSON解析



### Gson





## 数据库相关

### LitePal
LitePal是一款开源的Android数据库框架，它采用了对象关系映射(ORM)的模式。


[ Android数据库高手秘籍](http://blog.csdn.net/guolin_blog/article/details/38556989)  


### ORMLite
数据库相关框架



### Room ORM 数据库框架
2017.5  google io

[Room ORM 数据库框架](http://www.jianshu.com/p/c0c91f4226a6#) 
[【翻译】安卓架构组件(6)-Room持久化类库](http://www.jianshu.com/p/587f48dccf0a)

### sqlbrite
[sqlbrite源码解析](https://blog.saymagic.tech/2016/05/01/sqlbrite-source-code-parsing.html)  

sqlbrite是对Android中SQLiteOpenHelper的轻量级包装，可以响应式的对SQL语句进行操作。


## 地图

如何使用百度地图的API，来完成导航、搜索、路径规划


Content Provider面试技巧



## 依赖注入(di)

> 事先了解什么是[控制反转](http://baike.baidu.com/item/控制反转) (IoC)、什么是依赖注入(DI)。

### Dagger2

- [Android：dagger2让你爱不释手-基础依赖注入框架篇](http://www.jianshu.com/p/cd2c1c9f68d4#)  
- [Android：dagger2让你爱不释手-重点概念讲解、融合篇](http://www.jianshu.com/p/1d42d2e6f4a5)  
- [Android：dagger2让你爱不释手-终结篇](http://www.jianshu.com/p/65737ac39c44)  



### [Butter Knife](http://jakewharton.github.io/butterknife/ "Butter Knife")
用于View注入的ButterKnife也是属于DI的一种。专业解决各种findViewById

[Android Butter Knife 框架——最好用的View注入](http://www.jianshu.com/p/9ad21e548b69)

[Android – Get more out of Butter Knife](http://engineering.letsnurture.com/android-get-butter-knife/)  

 for binding fields and methods of Android views. 进行View注入



ButterKnife不能在私有类或私有方法中使用



Butterknife相关的Android Studio插件：  
[ButterKnifeZelezny](https://github.com/avast/android-butterknife-zelezny) Android Studio plug-in for generating ButterKnife injections from selected layout XML.



注意：必须将这同时添加下面的两个依赖

```
compile 'com.jakewharton:butterknife:8.5.1'
annotationProcessor 'com.jakewharton:butterknife-compiler:8.5.1'
```




## 缓存
缓存分为：内存缓存+存储设备缓存(磁盘缓存)，在Android中对应：LruCache+DiskLruCache.   
[Android缓存机制&一个缓存框架推荐](http://blog.csdn.net/shakespeare001/article/details/51695358 "推荐")    
[Android缓存策略——打造最全的缓存](http://blog.csdn.net/hao54216/article/details/52413975)  
[Android学习系列(27)--App缓存管理](http://www.cnblogs.com/qianxudetianxia/archive/2012/02/20/2112128.html)  

**存储设备缓存(磁盘缓存)：**  

这里的缓存管理的原理很简单：通过时间的设置来判断是否读取缓存还是重新下载。

两种比较常见的缓存管理方法是:数据库法和文件法。

- 数据库法：实现起来比较复杂。这种方法是在下载完数据文件后，把文件的相关信息如url，路经，下载时间，过期时间等存放到数据库，下次下载的时候根据url先从数据库中查询，如果查询到当前时间并未过期，就根据路径读取本地文件，从而实现缓存的效果。
- 文件法：使用File.lastModified()方法得到文件的最后修改时间，与当前时间判断是否过期，从而实现缓存效果。


>众多的分类：  

>分类一：  文字缓存和多媒体文件缓存   
>分类二：  数据库法和文件法          

>Android缓存分为内存缓存和文件缓存（磁盘缓存）;（那么上面两种就是属于磁盘缓存了）     

Android推出了LruCache这个内存缓存类。Android提供的类。
磁盘缓存（文件缓存）——DiskLruCache分析。非Google官方编写，但获得官方认证。




### 轻量级缓存框架——ACache（ASimpleCache）
[ASimpleCache缓存框架之简单使用](http://blog.csdn.net/dayongxin/article/details/47011683 "ASimpleCache缓存框架之简单使用 - dayongxin的博客 - 博客频道 - CSDN.NET")    
[android轻量级缓存框架ASimpleCache分析](http://blog.csdn.net/superjunjin/article/details/45096805 )      
[ASimpleCache使用感受](http://www.cnblogs.com/weidiao/p/5378942.html "ASimpleCache使用感受 - weiyinfu - 博客园")     




## 测试框架

### JUnit






## 其他

### EventBus
[Greenrobot EventBus vs Otto Bus](http://www.jianshu.com/p/76c7bf5da3c8)


- Greenrobot EventBus
- Otto Bus




## 视频框架

### Vitamio

[Android视频框架--Vitamio](http://blog.csdn.net/hao54216/article/details/52437252)  

[Android 如何直播RTMP流 | 开发技术前线](http://www.devtf.cn/?p=405 "Android 如何直播RTMP流 | 开发技术前线")



## 日志库



### LogUtils



### [Logger](https://github.com/orhanobut/logger)  

推荐

[开源日志库Logger的使用 - 简书](http://www.jianshu.com/p/21902079e88f "开源日志库Logger的使用 - 简书")

对于 android，做初始化的最佳地方是 [Application.onCreate()](https://link.juejin.im/?target=http%3A%2F%2Fdeveloper.android.com%2Freference%2Fandroid%2Fapp%2FApplication.html%23onCreate())。

Logger: 2.1.1 发生了两处改动，见 [Logger](https://github.com/orhanobut/logger)  

- Initialization is changed. No backward compatibility support. Use Logger.addLogAdapter
- LogLevel is removed. Use the new isLoggable approach



> 新采用了构造器模式  
> 另android自带了一个Logger类

### XLog

试一下这个怎么样？用的人少。

[史上最强的 Android 日志库 XLog - Android - 掘金](https://juejin.im/entry/5827a2172f301e00584f948f "史上最强的 Android 日志库 XLog - Android - 掘金")



### log4j

log4j这类的日志系统

### 微信Mars——xlog使用全解析

- 效率、效率、效率：这是最重要的，通过C层去写日志
- 低内存、低CPU：性能优势大，不占内存CPU
- 功能丰富：与原生Log使用几乎一致，但增加了写入文件功能，同时自带加密





## RxJava



异步，观察者模式，响应式编程（响应式代码的基本组成部分是Observables和Subscribers）



- [给 Android 开发者的 RxJava 详解](https://gank.io/post/560e15be2dca930e00da1083 "给 Android 开发者的 RxJava 详解")
- [彻底了解RxJava（一）基础知识 | 更上一层楼－Android研发工程师高级进阶](https://asce1885.gitbooks.io/android-rd-senior-advanced/content/che_di_le_jie_rxjava_ff08_yi_ff09_ji_chu_zhi_shi.html "彻底了解RxJava（一）基础知识 | 更上一层楼－Android研发工程师高级进阶")







>  MVP + Retrofit + Rxjava 



## Android 版 Google Analytics 

[高级配置  - Android 版 Google Analytics（分析）](https://developers.google.com/analytics/devguides/collection/android/v4/advanced?hl=zh-cn )












## 软件开发流程

```graph
    A[需求分析] --> B[UI界面设计]
    B --> C[编码开发]
    C --> D[测试]
    D --> E[上线]
```



