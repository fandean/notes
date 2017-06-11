# Android相关框架

标签（空格分隔）： Android

---

[Testing Support Library](https://developer.android.com/topic/libraries/testing-support-library/index.html)  

Android框架简介

第三方框架



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

#### Glide使用

网上有系列教程。比如[Glide最全解析](http://blog.csdn.net/column/details/15318.html)  

提示：注意一个事实，对于相同的 URL ，如果你的初始请求没调用 .skipMemoryCache(true) 方法，你后来又调用了 .skipMemoryCache(true) 这个方法，这个资源将会在内存中获取缓存。当你想要去调整缓存行为时，确保对同一个资源调用的一致性。


### Fresco
Facebook出品，的强大的图片加载组件。

[Fresco中文文档](https://www.fresco-cn.org/)




## 网络请求库



### OkHttp

介绍：

#### OkHttp理解
这两篇文章真的很棒  
[A Guide to OkHttp](http://www.baeldung.com/guide-to-okhttp)  
[OkHttp Android Example Tutorial](http://www.journaldev.com/13629/okhttp-android-example-tutorial)   

至少理解下面的的语句。get请求一般只包含请求行和请求头，而url包含在请求行中；post请求还包含了请求正文(所以需要requestBody)部分。

在浏览器中输入一个网址，回车后，此时浏览器向发送了一个Get请求(用于获取页面的源代码？？)，而浏览器为了加载页面中的脚本和图片等(解析源代码？？)又会自行发起请求。比如打开一个Github上的仓库，共发起了100次请求。

同步GET:   
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
同步GET，并添加查询参数: 
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
基本的Post:
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





### Retrofit





### Volley

#### Volley介绍

[网络请求库Volley介绍](http://www.jcodecraeer.com/a/anzhuokaifa/androidkaifa/2015/0526/2934.html)

非常适合进行数据量不大，但通信频繁的网络操作。  
对大文件下载 Volley的表现非常糟糕    
只支持http请求  
图片加载性能一般  

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



## 地图

如何使用百度地图的API，来完成导航、搜索、路径规划


Content Provider面试技巧



## 依赖注入(di)

> 事先了解什么是[控制反转](http://baike.baidu.com/item/控制反转) (IoC)、什么是依赖注入(DI)。

### Dagger2

- [Android：dagger2让你爱不释手-基础依赖注入框架篇](http://www.jianshu.com/p/cd2c1c9f68d4#)  
- [Android：dagger2让你爱不释手-重点概念讲解、融合篇](http://www.jianshu.com/p/1d42d2e6f4a5)  
- [Android：dagger2让你爱不释手-终结篇](http://www.jianshu.com/p/65737ac39c44)  



### Butterknife
用于View注入的ButterKnife也是属于DI的一种。专业解决各种findViewById

[Android Butter Knife 框架——最好用的View注入](http://www.jianshu.com/p/9ad21e548b69)

[Android – Get more out of Butter Knife](http://engineering.letsnurture.com/android-get-butter-knife/)  

 for binding fields and methods of Android views. 进行View注入


Butterknife相关的Android Studio插件：  
[ButterKnifeZelezny](https://github.com/avast/android-butterknife-zelezny) Android Studio plug-in for generating ButterKnife injections from selected layout XML.



## 其他

### EventBus
[Greenrobot EventBus vs Otto Bus](http://www.jianshu.com/p/76c7bf5da3c8)


- Greenrobot EventBus
- Otto Bus












## 软件开发流程

```graph
    A[需求分析] --> B[UI界面设计]
    B --> C[编码开发]
    C --> D[测试]
    D --> E[上线]
```



