# NDK与JIN介绍



## NDK

NDK是一系列工具的集合。它提供了一系列的工具，帮助开发者快速开发C/C++的动态库，并能自动将SO和Java一起打包成apk.

Android 原生开发包(NDK)使用诸如C和C++之类的原生代码语言实现它们的部分应用。通过Google 发布的 Android 手机 NDK(Native Development Kit),应用程序可以非常方便地现 Java 与 C/C++代码的相互沟通。合理地使用 NDK,可以提高应用程序的执行效率。所以,对于 Android 开发人员来说,NDK 是必须掌握的工具。



《Android C++高级编程 — 使用NDK》内容：

- 在主要的操作系统上安装 Android 原生开发环境。
- 使用 Eclipse 集成开发环境开发原生代码。
- 使用 Java 原生接口(JNI)将原生代码与 Java 代码连接。
- 用 SWIG 自动生成 JNI 代码。
- 用 POSIX 和 Java 线程开发多线程原生应用。
- 用 POSIX sockets 开发网络原生应用。
- 用 logging、GDB 和 Eclipse 调试器调试原生代码。
- 用 Valgrind 分析内存问题。
- 用 GProf 测试应用性能。
- 用 SIMD/NEON 优化原生代码。




## JNI

JNI是Java本地接口(Java Native Interface)。它是Java平台的一个特性(并不是Android系统特有的)。其实主要是定义了一些JNI函数，
让开发者可以通过调用这些函数实现Java代码调用C/C++的代码，C/C++的代码也可以调用Java的代码，这样就可以发挥各个语言的特点了。

JNI标准是Java平台的一部分，JNI是Java语言提供的Java和C/C++相互沟通的机制。



首先是将写好的C/C++代码编译成对应平台的动态库(windows一般是dll文件，linux一般是so文件等)。


[Android JNI编程—JNI基础 - 简书](http://www.jianshu.com/p/aba734d5b5cd )

[JNI Tips - Android开发者](https://developer.android.com/training/articles/perf-jni.html)

[Android NDK - Android Developers](https://developer.android.com/ndk/index.html?hl=zh-cn)

Android NDK 是一套允许您使用原生代码语言（例如 C 和 C++）实现部分应用的工具集。在开发某些类型应用时，这有助于您重复使用以这些语言编写的代码库。







在SDK Tools中选择安装 LLDB（调试工具） 、CMake 和 NDK。