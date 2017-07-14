# Android单元测试入门


> 此处不讲解JUnit基础

> 不需要将所有测试方法都掌握，有些是测试人员干的事情。学好本地单元测试就差不多了。
> 你要学习JUnit的使用，你要学习Mokito的使用，Robolectric的使用，依赖注入的概念和使用等等。


## 相关概念
Android单元测试有两种方式： **本地单元测试** 和 **设备单元测试**。  

本地单元测试：直接运行在本地机器上的JVM上；没有Android Framework的支持。  
设备单元测试：运行单独的APK，直接运行到Android虚拟机或物理Android设备设备，它拥有整个App的生命周期和运行环境。


> Android测试包含： 单元测试和集成测试。 这里将的是两种单元测试。


单元测试文件位置：  

- `../app/src/test/java/` 是本地单元测试的文件目录
- `../app/src/androidTest/java/`是设备单元测试的文件目录


Java单元测试框架：**Junit、Mockito、Powermockito**   等

Android：**Robolectric、AndroidJUnitRunner、Espresso**等

建议先学习**Junit & Mockito**。这两款框架是java领域应用非常普及，使用简单。junit运行在**jvm**上，所以只能测试纯java，若要测试依赖android库的代码，可以用mockito**隔离依赖**







## 本地单元测试

### JUnit测试简单操作示例
新建测试用例：  
在编辑器中打开该类，右击类名选择 "Go To" → "Test" → 在"Create Test"对话框中选择要测试的方法等 → 在"Choose Destination Directory"对话框中选择`.../app/src/test/java/...` 

> 编写测试用例时不要导错包
>
> Assertion classes断言类：断言方法在测试失败后会抛出AssertionException



## 设备单元测试

暂时没有解决下面的问题.

### 配置单元测试环境
需要引入单元测试的依赖库，在 AndroidManifest.xml 里面添加 uses-library:  
```xml
<application
	...
	<uses-library android:name="android.test.runner"/>
</application>
```

然后再在minifest中配置单元测试的启动项：  
```xml
<manifest ...>
	<instrumentation 
		android:name="android.test.InstrumentationTestRunner"
		android:targetPackage="com.jjz"
        android:label="test"/>
</manifest>
```





## 参考：



相关概念理解：必看

[Android单元测试——初探 - 简书](http://www.jianshu.com/p/79addb29b06d "Android单元测试——初探 - 简书")   

[Android单元测试 - 如何开始？ - 简书](http://www.jianshu.com/p/bc99678b1d6e "Android单元测试 - 如何开始？ - 简书")   








[Android单元测试-Junit](http://blog.csdn.net/yaodong379/article/details/55113388)  
[Android - 单元测试](https://juejin.im/post/58e97377ac502e4957c11a01)  
[Android单元测试（四）：Mock以及Mockito的使用](http://chriszou.com/2016/04/29/android-unit-testing-mockito.html)  
[Android测试官方教程翻译(三) -- 构建设备单元测试](http://blog.csdn.net/zhumenggaofei/article/details/54620385)     



进阶：

[解读Android官方MVP项目单元测试 - 简书](http://www.jianshu.com/p/cf446be43ae8 "解读Android官方MVP项目单元测试 - 简书")



