# Android控件效果展示

[Material Design](https://material.io/)  

各控件的介绍见[Material Design](https://material.io/) --> [MATERIAL COMPONENTS](https://material.io/components/) --> [Material Design guidelines](https://material.io/guidelines/) --> 打开Web页面的抽屉，选择"Components"，即可看到各控件。


[Android Design Support Library使用](http://wuxiaolong.me/2015/11/06/DesignSupportLibrary/ "Android Design Support Library使用")



先来介绍3个顶级导航控件。抽屉、底栏、

## Navigation Drawer
抽屉(Drawer)

Navigation Drawer是由NavigationView和DrawerLayout两个控件组合而成。

NavigationDrawer是 Google 在 Material Design 中推出的一种侧滑导航栏设计风格。
Google 为了支持这样的导航效果，推出一个新布局控件 —— DrawerLayout
效果如下：  
![网易云音乐 的侧滑导航栏效果](http://upload-images.jianshu.io/upload_images/912181-4e36f164a0de0329.jpg?imageMogr2/auto-orient/strip)  


而在此之前一般使用成熟的第三方开源库比如：SlidingMenu。效果如下：  
![SlidingMenu效果](http://upload-images.jianshu.io/upload_images/912181-db5fc5039e4bfb9e.jpg?imageMogr2/auto-orient/strip)  

参考：[最详细的 Android NavigationDrawer 开发实践总结](http://www.jianshu.com/p/c8cbeb7ea43a)  
[Android Sliding Menu using Navigation Drawer](http://www.androidhive.info/2013/11/android-sliding-menu-using-navigation-drawer/)  




## Toolbar
Toolbar是在 Android 5.0 开始推出的一个 Material Design 风格的导航控件 ，Google 非常推荐大家使用 Toolbar 来作为Android客户端的导航栏，以此来取代之前的 Actionbar 。它不像 Actionbar 一样，一定要固定在Activity的顶部，而是可以放到界面的任意位置。

![Toolbar展示](http://upload-images.jianshu.io/upload_images/912181-0f2cde151fdc03db.jpg?imageMogr2/auto-orient/strip)  
[最详细的 Toolbar 开发实践总结](http://www.jianshu.com/p/79604c3ddcae)  

添加ActionBarDrawerToggle 的效果：

![ActionBarDrawerToggle](http://upload-images.jianshu.io/upload_images/912181-2689a6c8af1b82ee.jpg?imageMogr2/auto-orient/strip)



## Bottom navigation bar
底栏

底栏不能左右滑动切换

在 2016 年三月, Google 正式将 bottom navigation 章节加入了 material design 指南中,

![效果展示](https://storage.googleapis.com/material-design/publish/material_v_11/assets/0B3321sZLoP_HZjN1eld5MjRXb2s/components_bottomnavigation_usage1.png)  

[Bottom navigation](https://material.io/guidelines/components/bottom-navigation.html#)  
[Bottom Navigation —— 如果要用, 请认真用](https://zhuanlan.zhihu.com/p/20646777)  








## Translucent System Bar
作用: 使系统的通知栏和app界面融为一体  

使用Translucent System Bar前(左)和使用后(右)的比较：  

![使用前](http://upload-images.jianshu.io/upload_images/912181-72dc0c6f14115462.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)  ![使用后](http://upload-images.jianshu.io/upload_images/912181-683589389ba103a1.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

[Translucent System Bar 的最佳实践](http://www.jianshu.com/p/0acc12c29c1b)  
> 另参考沉浸式








## 启动屏
Material Design中加入了Launch Screen； 对于启动屏的讨论[不支持使用启动屏](https://zhuanlan.zhihu.com/p/20157712)




## FAB(Floating Action Button)
[做正确的 Floating Action Button](https://zhuanlan.zhihu.com/p/20123119)  
效果展示：  
![FAB效果展示](http://pic2.zhimg.com/547c3fa90803569b3a98c6aebc468cdd_b.jpg)  



## Staggered Grid LayoutManager
图片需翻墙
![](http://2.bp.blogspot.com/-7hGYFpZwDKU/Vi-5RkEDbnI/AAAAAAAA184/0hJlyZ5QyBs/s1600/0052.jpg)







## 其他一些控件



### StackView

- Stackview是AdapterViewAnimator的子類，顧名思義就是以堆疊的方式呈現。
- 可透過滑動以及調用方法控畫面。



### SurfaceView



[Android自定义任意层级树形控件-慕课网](http://www.imooc.com/learn/303 "Android自定义任意层级树形控件-慕课网")





[21款炫酷动画开源框架，照亮你的APP - OPEN 开发经验库](http://www.open-open.com/lib/view/open1500457789786.html "21款炫酷动画开源框架，照亮你的APP - OPEN 开发经验库")





