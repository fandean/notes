


## Drawable 可绘制对象资源

在Android世界里,凡是要在屏幕上绘制的东西都可以叫作drawable,比如抽象图形、
Drawable类的子类、位图图像，颜色等。（可以在Canvas上进行绘制的抽象的概念）

**可绘制对象资源**是一般概念，是指可在屏幕上绘制的图形，以及可以使用 `getDrawable(int)` 等 API 检索或者应用到具有 `android:drawable` 和 `android:icon` 等属性的其他 XML 资源的图形。

在实际开发中，Drawalbe常被用来**作为View的背景**使用。Drawable一般都是通过XML来定义。

对于定义在XML文件中的drawable,可以归为一类,统称为XML drawable。





XML drawable用起来方便灵活,不仅用法多样,还易于更新维护。

XML drawable独立于屏幕像素密度,它们直接定义在drawable目录中,不需要加屏幕
密度资源修饰符。如果是普通图像,就需要准备多个版本,以适配不同屏幕像素密度的设备。

> `res/drawable`目录和`res/mipmap`目录：
>
> 《Android权威编程指南》中指出APK文件包含了项目drawable目录(有很多drawable\*目录)里面的所有图片，哪怕是从来不会用到的图片，这是个负担。为了减轻负担可以针对设备定制APK，比如mdpi APK，hdpi APK。但是需要将应用图标的各种分辨率的图标全部包含在APK中；这时可以将启动图标放在 mipmap 目录下，这样在APK分包时，mipmap资源会全部包含在APK文件中。**推荐的做法就是，把应用启动器图标放在mipmap目录中，其它图片都放在drawable目录中。**
>
> 再看网上的一些解释： [mipmap 和 drawable 的区别 - 简书](http://www.jianshu.com/p/ecf007710fae "mipmap 和 drawable 的区别 - 简书")，说是还涉及到Mipmap纹理技术；但是最终还是说：**Google 建议大家只把 app 的启动图标放在 mipmap 目录中，其他图片资源仍然放在 drawable 下面。**



> 参考：
>
> [可绘制对象资源 - Android Developers](https://developer.android.com/guide/topics/resources/drawable-resource.html "可绘制对象资源 - Android Developers")
>
> 《Android开发艺术探索》第6章：Android的Drawable
>
> [领略千变万化的Android Drawable （一） - 安卓 - 伯乐在线](http://android.jobbole.com/84704/ "领略千变万化的Android Drawable （一） - 安卓 - 伯乐在线")
>
> [领略千变万化的Android Drawable （二） - 安卓 - 伯乐在线](http://android.jobbole.com/84705/ "领略千变万化的Android Drawable （二） - 安卓 - 伯乐在线")
>
> [Android Drawable 那些不为人知的高效用法 - Hongyang - CSDN博客](http://blog.csdn.net/lmj623565791/article/details/43752383 "Android Drawable 那些不为人知的高效用法 - Hongyang - CSDN博客")
>
> [Android 应用层开发 Drawable 的一些叨叨絮 - 工匠若水 - CSDN博客](http://blog.csdn.net/yanbober/article/details/56844869 "Android 应用层开发 Drawable 的一些叨叨絮 - 工匠若水 - CSDN博客")



![](http://img.blog.csdn.net/20150214200525889?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvbG1qNjIzNTY1Nzkx/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)



### BitmapDrawable

它表示的就是一张图片。在实际开发中我们可以**直接引用**原始的图片；也可**通过XML的方式来描述它**，通过XML来描述的BitmapDrawable可以设置更多的效果。

**在实际开发中使用一张图片的方法：**  

- 直接引用原始的图片。
- 通过XML的方式来描述它。描述的时候也需要通过`android:src`属性来指定原始图片的id。

某属性设置效果：

![](http://img.blog.csdn.net/20160814223852655)



### ShapeDrawable

可以理解为通过**颜色**来构造的图形。它即可以是纯色的图形，也可以是具有渐变效果的图形。



数字99的背景：

![](http://img.blog.csdn.net/20160817231024859)



**gradient（渐变）属性：**

线性渐变

![](http://img.blog.csdn.net/20160817223030536)

radial（径内渐变），sweep（扫描渐变）

![](http://img.blog.csdn.net/20160817224001080)



> 注意：`<shape>`标签创建的Drawable，其实体类实际上是GradientDrawable。gradient表示渐变填充。



### LayerDrawable

使用标签`<layer-list>` ，表示一种层次化的Drawable集合；通过将不同的Drawable放置在不同的层上面从而达到一种叠加后的效果。

一个`<layer-list>`中可以包含多个item，每个item表示一个Drawable。

注意：可以直接在item中定义一个 Drawable

```xml
<layer-list>
  
  <item>
    <!-- 注意：可以直接在item中定义一个 Drawable -->
    <shape android:shape="rectangle">
      <solid android:color="#0ac39e" />
    </shape>
  </item>
  
  <item>
    <!-- -->
  </item>
</layer-list>
```





### StateListDrawable

对应`<selector>`标签，它也是表示 Drawable 集合，每个Drawable对应着View的一种状态。





![](http://img.blog.csdn.net/20160818081248786)

### LevelListDrawable

对应于`<level-list>`标签，它同样表示一个Drawable集合，集合中的每个Drawable都有一个等级(level)的概念。根据不同的等级，切换到对应的Drawable

在Java代码中切换



### TransitionDrawable

Transition：过渡

对应于`<transition>`标签，它用于实现两个Drawable之间的淡入淡出效果。



![](http://img.blog.csdn.net/20160818081952900)



### InsetDrawable

对应`<inset>`标签，它可以将其它Drawable内嵌到自己当中，并可以在四周留出一定的间距。当一个View希望自己的背景比自己的实际区域小的时候，可以采用InsetDrawable来实现。

![](http://img.blog.csdn.net/20160816100308147)



### ScaleDrawable

Scale：比例，缩放

对应 `<scale>`标签，它可以根据自己的等级(level)将指定的Drawable缩放到一定的比例。

![](http://img.blog.csdn.net/20160816215246141)



### ClipDrawable



对应`<clip>`标签，它可以根据自己的等级(level)来裁剪另一个Drawable，裁剪方向可以通过`android:clipOrientation`和`android:gravity`着两个属性来共同控制。





![](http://img.blog.csdn.net/20160819010940970)



> 下面是两个不常用的Drawable，官方也没有过多介绍
>
> * ColorDrawable
>   它实际上是代表了单色可绘制区域，它包装了一种固定的颜色，当ColorDrawable被绘制到画布的时候会使用颜色填充Paint，在画布上绘制一块单色的区域。
>
> * GradientDrawable 
>   GradientDrawable 表示一个渐变区域，可以实现线性渐变、发散渐变和平铺渐变效果。   
>   前面展示的shapeDrawable，编译的资源数据类型：就是指向 GradientDrawable 的资源指针。





### 自定义 Drawable

略

