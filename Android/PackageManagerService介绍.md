# PackageManagerService

> [Android中获取应用程序(包)的信息-----PackageManager的使用(一) - qinjuning、lets go - CSDN博客](http://blog.csdn.net/qinjuning/article/details/6867806 "Android中获取应用程序(包)的信息-----PackageManager的使用(一) - qinjuning、lets go - CSDN博客")
讲解：获取应用程序的packagename、label、icon等 
[Android中获取应用程序(包)的大小-----PackageManager的使用(二) - qinjuning、lets go - CSDN博客](http://blog.csdn.net/qinjuning/article/details/6892054 "Android中获取应用程序(包)的大小-----PackageManager的使用(二) - qinjuning、lets go - CSDN博客")
讲解：如何获取安装包得大小，包括缓存大小(cachesize)、数据大小(datasize)、应用程序大小(codesize)。本部分的知识点涉及到AIDL、Java反射机制。


PackageManager  是客户端，   PackageManagerService是服务端。所有的操作都是由服务端完成。


## PackageManager

用于获得获得已安装的应用程序信息 。可以通过getPackageManager()方法获得。

```
@Override  
public PackageManager getPackageManager() {  
   //...  
   // Doesn't matter if we make more than one instance.  
   return (mPackageManager = new ApplicationPackageManager(this, pm));  
   //...  
} 
```
其中：
```
ApplicationPackageManager extends PackageManager
```




AnroidManifest.xml文件节点说明：


![](http://hi.csdn.net/attachment/201110/12/0_1318430219z8Sh.gif)



## PackageManagerService

PackageManagerService 的特性：  

 ①、开机就启动，由SystemServer进程启动 ；   
 ②、启动后它会扫描系统中所有应用程序Apk包下的AndroidManifest.xml文件，然后解析所有的   
AndroidManifest.xml文件，继而形成一个庞大的信息结构树，并且保存在PackageManagerService 的相关属性下    


PackageManagerService 的四个重要属性如下：

```
class PackageManagerService extends IPackageManager.Stub {  
    //...  
    //保存了所有Activity节点信息 。         自定义类  
    // All available activities, for your resolving pleasure.  
    final ActivityIntentResolver mActivities =  
            new ActivityIntentResolver();  
    //保存了所有BroadcastReceiver节点信息  。  自定义类  
    // All available receivers, for your resolving pleasure.  
    final ActivityIntentResolver mReceivers =  
            new ActivityIntentResolver();  
    //保存了所有Service节点信息。 。  自定义类  
    // All available services, for your resolving pleasure.  
    final ServiceIntentResolver mServices = new ServiceIntentResolver();  
    //保存了所有ContentProvider节点信息 ， 以Hash值保存  
    // Keys are String (provider class name), values are Provider.  
    final HashMap<ComponentName, PackageParser.Provider> mProvidersByComponent =  
            new HashMap<ComponentName, PackageParser.Provider>();  
    //...  
}  
```

 值得注意这些属性类型的不同。Activity、BroadcastReceiver、Service都采用了自定义类去保存相关信息，从类名上看，
 类结构应该很相似。而ContentProvider只是简单的采用了HashMap键值对去保存了信息？ 莫非有错 ？ 我们回忆下
 AndroidManifest.xml定义组件信息时，Activity、BroadcastReceiver、Service都可以通过`<intent-filter>`去隐式匹配的，而
 ContentProvider只需要一个Uri数据即可找到对应的ContentProvider组件信息了。 因此才采用了这两种结构去保存信息。
 
 
 
 
