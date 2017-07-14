# 一些简单的UI组件用法



## 通用的常见属性





## FrameLayout

### android:foreground

Foreground defines the drawable to draw **over the content** and this may be a color value.

### android:foregroundGravity

It is used to set the gravity of  foreground.  

This defines the gravity to apply to the foreground drawable. Default value of gravity is fill







## EditText

EditText组件最重要的属性是`inputType`,该属性将其设置为指定类型的输入组件。
。。。

** 这种东西还是见 思维导图 吧 **  


## ImageView

### ScaleType

`ScaleType`:决定了图片在View上显示的样子。  

- CENTER: 不进行任何缩放，将图片中心与ImageView中心对齐
- CENTER_CROP：中心对齐；按比例缩放，直至填满ImageView
- FIT_CENTER：中心对齐；按比例缩放，直至有一个方向适应ImageView
- FIT_START：开始位置对齐，直至有一个方向上适应ImageView
- FIT_XY：不按比例缩放；填满整个ImageView




代码设置ImageView的src:

```java
setImageDrawable(Drawable drawable);  
setImageBitmap(Bitmap bm);  
setImageResource(int resId);  
```

代码设置ImageView的background:  

```java
setBackgroundReource(int resid)  
setBackground(Drawable background)  
setBackgroundColor(int color)  
//This method was deprecated in API level 16. use setBackground(Drawable) instead 
setBackgroundDrawable(Drawable background) 
```

 属性 src 和 background 的区别:

background 会根据 ImageView 组件给定的长宽进行拉伸来填满ImageView,；而 src 默认存放的是原图的大小, 不会进行拉伸(但可通过scaleType设置)。此外: scaleType 只对 src 起作用；bg 可设置透明度。