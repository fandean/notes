# JNI

JNI是Java本地接口(Java Native Interface)。它是Java平台的一个特性(并不是Android系统特有的)。其实主要是定义了一些JNI函数，
让开发者可以通过调用这些函数实现Java代码调用C/C++的代码，C/C++的代码也可以调用Java的代码，这样就可以发挥各个语言的特点了。


首先是将写好的C/C++代码编译成对应平台的动态库(windows一般是dll文件，linux一般是so文件等)。


[Android JNI编程—JNI基础 - 简书](http://www.jianshu.com/p/aba734d5b5cd "Android JNI编程—JNI基础 - 简书")

[JNI Tips| Android开发者](https://developer.android.com/training/articles/perf-jni.html "JNI提示| Android开发者")

[Android NDK | Android Developers](https://developer.android.com/ndk/index.html?hl=zh-cn "Android NDK | Android Developers")

Android NDK 是一套允许您使用原生代码语言（例如 C 和 C++）实现部分应用的工具集。在开发某些类型应用时，这有助于您重复使用以这些语言编写的代码库。



