---
layout: post
title: "理解Intent和PendingIntent"
description: "理解Intent和PendingIntent"
date: 2017-07-14
tags: [Android]
category: Android
last_updated: 2017-07-18
comments: true
chare: true
---

* Kramdown table of contents
{:toc .toc}



# 理解Intent和PendingIntent

参考：  
> 《Android编程权威指南》第15章：隐式Intent；第22章：深入学习intent和任务   
> 《Android 4 高级编程》第5章：Intent和BroadCast Receiver 【推荐】   
> [Intent 和 Intent 过滤器 - Android Developers](https://developer.android.com/guide/components/intents-filters.html "Intent 和 Intent 过滤器  Android Developers")   【推荐：作为开发指南】     
> [Intent - Android Developers](https://developer.android.com/reference/android/content/Intent.html "Intent - Android Developers") 【了解Intent类】   
> [通用 Intent - Android Developers](https://developer.android.com/guide/components/intents-common.html "通用 Intent  Android Developers")     
> [Intent原理+实例 - 程序园](http://www.voidcn.com/blog/wanli_smile/article/p-216171.html "Intent原理+实例 - 程序园")   






## Intent 的结构

Intent的主要属性：

- Action：动作（要执行的动作）
- data：执行动作要操作的数据（要访问数据的位置，表示为Uri）

Intent的次要属性：  

- Category：可选类别；被执行动作的附加信息。（相当于为某Action再细分类别）
- type：数据类型；显示指定Intent的数据类型（MIME形式）通常这种类型是从data本身推断出来的。By setting this attribute, you disable that evaluation and force an explicit type（大致理解，当设置了此type属性，就无需去分析data来获得type）**MIME类型保证接收方能看懂**发送方发送的正文数据。**注意：**若要同时设置 URI 和 MIME 类型，**请勿**调用 `setData()` 和 `setType()`，因为它们会互相抵消彼此的值。请使用 `setDataAndType()`同时设置 URI 和 MIME 类型。
- component：指定用于该Intent的组件的显式名称；（**显式Intent才进行设置**）指定Intent的目标组件的类名称。通常 Android会根据Intent 中包含的其它属性的信息，比如action、data/type、category进行查找，最终找到一个与之匹配的目标组件。但是，如果 component这个属性有指定的话，将直接使用它指定的组件，而不再执行上述查找过程（解析过程）。指定了这个属性以后，Intent的其它所有属性都是可选的。  
- extras：附加信息，一个Bundle。（可作为附加数据的对象）
- Flag：标识。在 `Intent` 类中定义的、充当 Intent 元数据的标志。 标志可以指示 Android 系统如何启动 Activity；以及启动之后如何处理。

每个 Intent 中只能指定一个 action,但却能指定多个 category。

比较下面两段代码的区别：

```java
Intent intent = new Intetn(FirstActivity.this, SecondActivity.class);
//向startActivity传递显式Intent
startActivity(intent);
```



```java
Intent intent = new Intetn("表示Action的String常量");
//向startActivity传递隐式Intent
startActivity(intent);
```



可以**自定义Action和Category**；都可以直接用一个String表示；比如：

```java
Intent intent = new Intent("com.example.activitytest.ACTION_START");
intent.addCategory("com.example.activitytest.MY_CATEGORY");
startActivity(intent);
```





> 还有一个 Bundle  



## 显式Intent

显式Intent：指定了component属性的Intent（调用`setComponent(ComponentName)`或者`setClass(Context, Class)`来指定）。通过指定具体的组件类，通知应用启动对应的组件。 



## 隐式Intent

隐式Intent：没有指定comonent属性的Intent。这些Intent需要包含足够的信息，这样系统才能根据这些信息，在在所有的可用组件中，确定满足此Intent的组件。





### 检查是否有能接收该intent的组件

>  《Android 4 高级编程》第5章

发送隐式Intent时，先检查系统是否有能接收该intent的组件，可通过下面的方法进行检测：

`PackageManager` 提供了一整套 `query...()` 方法来返回所有能够接受特定 Intent 的组件。此外，它还提供了一系列类似的 `resolve...()` 方法来确定响应 Intent 的最佳组件。 例如，`queryIntentActivities()` 将返回能够执行那些作为参数传递的 Intent 的所有 Activity 列表，而 `queryIntentServices()` 则可返回类似的服务列表。这两种方法均不会激活组件，而只是列出能够响应的组件。 对于广播接收器，有一种类似的方法： `queryBroadcastReceivers()`。



通过调用Intent的resolveActivity方法，并向该方法传入包管理器，可以对包管理器进行查询，确定是否有组件能够启动以响应该Intent。



## Intent过滤器

要把一个Activity或者Service注册为一个可能的Intent处理程序，可以通过为它们设置 Intent Filter，来声明它们支持的动作和数据。

Intent Filter还用来指定一个Broadcast Receiver感兴趣接收的动作（广播动作）。

###  解析隐式Intent



对于显式Intent，Android不需要去做解析，因为目标组件已经很明确。

Android需要解析的是那些隐式Intent，通过解析，将 Intent映射给可以处理此Intent的Activity、IntentReceiver或Service。

​        Intent解析机制主要是通过查找已注册在AndroidManifest.xml中的所有IntentFilter及其中定义的Intent，最终找到匹配的Intent。

当系统收到隐式 Intent 以启动 Activity 时，它根据以下三个方面将该 Intent 与 Intent 过滤器进行比较，搜索该 Intent 的最佳 Activity：

- Intent 操作 （action）
- Intent 数据（URI 和数据类型） 
- Intent 类别 （category）



> 应该是从data中就可以判断出type，暂时不深究两者的区别



在这个解析过程中，Android是通过Intent的**action、type、category这三个属性**来进行判断的，**判断方法如下**：

1. 如果Intent指明定了某action，则目标组件的IntentFilter的action列表中就必须包含有这个action，否则不能匹配(action)
2. 如果Intent没有提供type，系统将从data中得到数据类型。和action一样，如果Intent指明定了type，目标组件的数据类型列表中必须包含Intent的数据类型，否则不能匹配。
3. 如果Intent中的data不是`content: `类型的URI，而且Intent也没有明确指定它的type，将根据Intent中data的scheme （比如 http: 或者mailto: ） 进行匹配。同上，Intent 的scheme必须出现在目标组件的scheme列表中。【有时，MIME 类型可以从 URI 中推断得出，特别当数据是 `content:` URI 时尤其如此。这表明数据位于设备中，且由 `ContentProvider` 控制，这使得数据 MIME 类型对系统可见。一个data示例：`content://contacts/people/1`  。
4. 如果Intent指定了一个或多个category，这些类别必须**全部**出现在目标组件的Intent Filter的category列表中；但过滤器中可以包含除Intent中额外的category。,(category)
5. 通过设置**DEFAULT类型**(category)，可以使一个组件成为Intent Filter内指定的数据类型的默认动作。对于那些使用一个显示的Intent启动的Activity，都必须在其Intent Filter中指定该类型；在调用 startActivity()方法的时候会自动将" android.intent.category.DEFAULT"这个默认的 category 添加到 Intent 中（第一行代码第2版）。那么按照第4条的规则，在目标Activity的Intent filter中必须显示包含该DEFAULT类型。【这里说的是隐式intent，一般我们用的是显式Intent所以manifest文件中的activity无需设置过滤器】(category)


虽然每个 Intent 中只能指定一个 action；而每个intent-filter必须**至少**包含一个action，并且一个activity可以包含多个Intent-filter。





### 设置Intent Filter

[应用清单 - Android Developers](https://developer.android.com/guide/topics/manifest/manifest-intro.html)

可以在manifest文件中设置intent-filter，也可以

manifest文件中的**intent-filer标签**，可以有三种类型的直接子标签：action、category、**data**。

可以使用data标签设置type（MIME类型）

```xml
<activity android:name="MainActivity">
    <!-- This activity is the main entry, should appear in app launcher -->
    <intent-filter>
        <action android:name="android.intent.action.MAIN" />
        <category android:name="android.intent.category.LAUNCHER" />
    </intent-filter>
</activity>

<activity android:name="ShareActivity">
    <!-- This activity handles "SEND" actions with text data -->
    <intent-filter>
        <action android:name="android.intent.action.SEND"/>
        <category android:name="android.intent.category.DEFAULT"/>
        <!-- 使用data标签设置type（MIME类型） -->
        <data android:mimeType="text/plain"/>
    </intent-filter>
    <!-- This activity also handles "SEND" and "SEND_MULTIPLE" with media data -->
    <intent-filter>
        <action android:name="android.intent.action.SEND"/>
        <action android:name="android.intent.action.SEND_MULTIPLE"/>
        <category android:name="android.intent.category.DEFAULT"/>
        <data android:mimeType="application/vnd.google.panorama360+jpg"/>
        <data android:mimeType="image/*"/>
        <data android:mimeType="video/*"/>
    </intent-filter>
</activity>
```



### data标签



每个 `<data>` 元素均可指定 URI 结构和数据类型（MIME 媒体类型）。 URI 的每个部分均包含单独的 `scheme`、`host`、`port` 和 `path` 属性：
```
<scheme>://<host>:<port>/<path>
```
例如：
```
content://com.example.project:200/folder/subfolder/etc
```

在此 URI 中，架构是 `content`，主机是　`com.example.project`，端口是 `200`，路径是 `folder/subfolder/etc`。

内容比较多，见 [Intent 和 Intent 过滤器](https://developer.android.com/guide/components/intents-filters.html#Resolution) Intent解析下的数据测试。



## 使用Intent


**常见形式：**

- 通过Context.startActivity() 或者 Activity.startActivityForResult() 启动一个Activity； 
- 通过 Context.startService() 启动一个服务，或者通过Context.bindService() 和后台服务交互；
- 通过广播方法(比如 Context.sendBroadcast(),Context.sendOrderedBroadcast(), Context.sendStickyBroadcast()) 发给broadcast receivers。

把匿名的动作作为菜单项集成，在菜单中使用intent

在设置页面使用intent



## Intent解析过程深入分析



> 参考：进阶： [Intent匹配规则以及解析框架深入分析](http://blog.csdn.net/qinjuning/article/details/7384906)

这里还是抄大神一些内容。

**PackageManger ：**

用于获得获得已安装的应用程序信息 。可以通过getPackageManager()方法获得。



![](http://hi.csdn.net/attachment/201203/23/0_1332517620ZDXB.gif)

PackageManagerService 的特性：  

 ①、开机就启动，由SystemServer进程启动 ；   
 ②、启动后它会扫描系统中所有应用程序Apk包下的AndroidManifest.xml文件，然后解析所有的   
AndroidManifest.xml文件，继而形成一个庞大的信息结构树，并且保存在PackageManagerService 的相关属性下    

![](http://hi.csdn.net/attachment/201203/23/0_1332518043CCiQ.gif)





## 理解PendingIntent

> [Intent 和 Intent 过滤器 ： 之PendingIntent](https://developer.android.com/guide/components/intents-filters.html#PendingIntent ) 官方说明    
> [说说PendingIntent的内部机制 - 悠然红茶的个人页面](https://my.oschina.net/youranhongcha/blog/196933 "说说PendingIntent的内部机制 - 悠然红茶的个人页面")    
> [Android PendingIntent](http://dongchuan.github.io/android/2016/06/12/Android-PendingIntent.html "Android PendingIntent")   



`PendingIntent` 对象是 `Intent` 对象的包装器。`PendingIntent` 的**主要目的**是授权外部应用使用包含的 `Intent`，就像是它从您应用本身的进程中执行的一样。

PendingIntent是一种token对象；通过给另一个应用程序发送一个PendingIntent，那么该应用将能够以发送方相同的权限和身份来执行该PendingIntent包裹的Intent中指定的操作。

PendingIntent并不继承于Intent，本身也不包含Intent。



PendingIntent可以在满足一定条件下执行其包裹的**Intent**，它相比于**Intent**的优势在于自己携带有Context对象，这样他就不必依赖于某个activity才可以存在。




主要的区别在于Intent的执行立刻的，而pendingIntent的执行不是立刻的。pendingIntent执行的操作实质上是参数传进来的Intent的操作，但是使用pendingIntent的目的在于它所包含的Intent的操作的执行是需要满足某些条件的。


PendingIntent类包含了一些静态的常量，它们可以用于指定标志，以更新或者取消与指定动作匹配的现有Pending Intent，也可以用于指定该Intent是否只触发一次。

```java
Intent i = PollService.newIntent(context);
//获取一个
PendingIntent pi = PendingIntent.getService(
context, 0, i, 0);


//撤销PendingIntent
pi.cancel();
```





获取PendingIntent对象的几个方法：


```java
PendingIntent.getActivity(Context context, int requestCode, Intent intent, int flags)
PendingIntent.getActivities(Context context, int requestCode, Intent[] intents, int flags)
PendingIntent.getBroadcast(Context context, int requestCode, Intent intent, int flags)
PendingIntent.getService(Context context, int requestCode, Intent intent, int flags)
```
> 获取到的对象可以被其他applications引用，这样这些applications可以稍后执行你所描述的操作。
> 每种方法均会提取当前的应用 Context、您要包装的 Intent 以及一个或多个指定应如何使用该 Intent 的标志（例如，是否可以多次使用该 Intent）。
>



接下来介绍这几个方法都涉及到的几个参数：

**Flags:**

- `FLAG_CANCEL_CURRENT` - If the described PendingIntent already exists, the current one should be canceled before generating a new one.（如果描述的PendingIntent已经存在，则在生成新的PendingIntent之前应该取消当前的。）
- `FLAG_NO_CREATE` - If the described PendingIntent **does not already exist**, then simply return **null** instead of creating it.（如果描述的PendingIntent不存在，那么只需返回null而不是创建它。）
- `FLAG_ONE_SHOT` - PendingIntent can be used only once.
- `FLAG_UPDATE_CURRENT` - If the described PendingIntent already exists, then keep it but replace its extra data with what is in this new Intent.（如果描述的PendingIntent已经存在，那么请保留它，但是将其额外的数据替换为这个新的Intent中的内容。）
- `FLAG_IMMUTABLE` - PendingIntent should be immutable. It means that the additional intent argument passed to the send methods to fill in unpopulated properties of this intent will be ignored（PendingIntent应该是不变的。这意味着传递给send()方法的Intent参数，）



**RequestCode：**

It is a private request code for the sender and quite useful when there are more than one PendingIntents to send (ex. send two notifications in the mean time). It works as ID to distinguish different PendingIntents. If not set different values, the next PendingIntent will override the previous one even if their wrapped intents have different extra values.（这是发送者的私人请求代码，当有多个PendingIntent发送时，它作为ID来区分不同的PendingIntent。假如发送了两个PendingIntent如果前后两个ID都相同，则后一个PendingIntent将会覆盖前一个PendingIntent，即使它们携带的Intent中包含不同的extra values）【此概念还会在Android的通知中见到】

For `FLAG_UPDATE_CURRENT` and `FLAG_CANCEL_CURRENT`, request code will be used here to tell android how to distinguish two PendingIntents.



在PendingIntent源代码中见到了ActivityManagerNative



### PendingIntent和Intent的差别

PendingIntent并不继承于Intent

- Intent is immediate. But PendingIntent can be triggered later or even cancel later.
- Intent is killed when the related Activity is killed. But PendingIntent still keeps alive.  PendingIntent自己携带有Context对象，这样他就不必依赖于某个activity才可以存在。
- Intent must run with a Context. But PendingIntent has its own Context.PendingIntent自己携带有Context对象
- Intent runs in the original task. But PendingIntent run in a new task.




### PendingIntent进阶

当前PendingIntent接触的比较少，暂不了解 ...



PendingIntent一般作为参数传给某个实例，在该实例完成某个操作后自动执行PendingIntent上的Action，也可以通过PendingIntent的send函数手动执行，并可以在send函数中设置OnFinished表示send成功后执行的动作。