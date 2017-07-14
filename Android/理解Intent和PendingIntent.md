# 理解Intent和PendingIntent

> 摘抄：[Intent原理+实例 - 程序园](http://www.voidcn.com/blog/wanli_smile/article/p-216171.html "Intent原理+实例 - 程序园")
>
> 《Android编程权威指南》第15章：隐式Intent；第22章：深入学习intent和任务

> 未完成

Intent 各个属性：

- Action：动作（要执行的动作）
- data：执行动作要操作的数据（要访问数据的位置）
- type：数据类型；显示指定Intent的数据类型（MINE形式）
- Category：可选类别；被执行动作的附加信息。
- extras：附加信息。（对于**隐式Intent**，key使用Intent类中的常量，这样每个Activity就知道如何使用对应的数据）
- component：组件；（**显式Intent才进行设置**）指定Intent的目标组件的类名称。通常 Android会根据Intent 中包含的其它属性的信息，比如action、data/type、category进行查找，最终找到一个与之匹配的目标组件。但是，如果 component这个属性有指定的话，将直接使用它指定的组件，而不再执行上述查找过程。指定了这个属性以后，Intent的其它所有属性都是可选的。

每个 Intent 中只能指定一个 action,但却能指定多个 category

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



可以自定义Action和Category；都可以直接用一个String表示；比如：

```java
Intent intent = new Intent("com.example.activitytest.ACTION_START");
intent.addCategory("com.example.activitytest.MY_CATEGORY");
startActivity(intent);
```



## 显示Intent

显式Intent：指定了component属性的Intent（调用`setComponent(ComponentName)`或者`setClass(Context, Class)`来指定）。通过指定具体的组件类，通知应用启动对应的组件。 



## 隐式Intent

隐式Intent：没有指定comonent属性的Intent。这些Intent需要包含足够的信息，这样系统才能根据这些信息，在在所有的可用组件中，确定满足此Intent的组件。



## Intent过滤器

对于直接Intent，Android不需要去做解析，因为目标组件已经很明确，Android需要解析的是那些间接Intent，通过解析，将 Intent映射给可以处理此Intent的Activity、IntentReceiver或Service。

​        Intent解析机制主要是通过查找已注册在AndroidManifest.xml中的所有IntentFilter及其中定义的Intent，最终找到匹配的Intent。

在这个解析过程中，Android是通过Intent的action、type、category这三个属性来进行判断的，判断方法如下：

1. 如果Intent指明定了action，则目标组件的IntentFilter的action列表中就必须包含有这个action，否则不能匹配
2. 如果Intent没有提供type，系统将从data中得到数据类型。和action一样，如果Intent指明定了type，目标组件的数据类型列表中必须包含Intent的数据类型，否则不能匹配。(type)
3. 如果Intent中的数据不是`content: `类型的URI，而且Intent也没有明确指定它的type，将根据Intent中数据的scheme （比如 http: 或者mailto: ） 进行匹配。同上，Intent 的scheme必须出现在目标组件的scheme列表中。(type)
4. 如果Intent指定了一个或多个category，这些类别必须**全部**出现在目标组件的类别列表中。
5. 在调用 startActivity()方法的时候会自动将" android.intent.category.DEFAULT"这个默认的 category 添加到 Intent 中（第一行代码第2版）。那么按照第4条的规则，在目标Activity的Intent filter中必须显示包含该Category。（《Android编程权威指南》p256说该DEFAULT类别默认存在与绝大多数Intent中）



虽然每个 Intent 中只能指定一个 action,但是对于intent-filter没有此限制；并且一个activity可以包含多个Intent-filter。

```xml
<activity android:name="NotesList" android:label="@string/title_notes_list">
  <intent-filter>
    <action android:name="android.intent.action.MAIN" />
    <category android:name="android.intent.category.LAUNCHER" />
  </intent-filter>
  <intent-filter>
    <action android:name="android.intent.action.VIEW" />
    <action android:name="android.intent.action.EDIT" />
    <action android:name="android.intent.action.PICK" />
    <category android:name="android.intent.category.DEFAULT" />
    <data android:mimeType="vnd.android.cursor.dir/vnd.google.note" />
  </intent-filter>
  <intent-filter>
    <action android:name="android.intent.action.GET_CONTENT" />
    <category android:name="android.intent.category.DEFAULT" />
    <data android:mimeType="vnd.android.cursor.item/vnd.google.note" />
  </intent-filter>
</activity>
```



使用Intent的形式：

通过Context.startActivity() orActivity.startActivityForResult() 启动一个Activity； 
通过 Context.startService() 启动一个服务，或者通过Context.bindService() 和后台服务交互； 通过广播方法(比如 Context.sendBroadcast(),Context.sendOrderedBroadcast(), Context.sendStickyBroadcast()) 发给broadcast receivers。


## 理解PendingIntent

PendingIntent是一种token对象；通过给另一个应用程序发送一个PendingIntent，那么该应用将能够以发送方相同的权限和身份来执行该PendingIntent包裹的Intent中指定的操作。

PendingIntent并不继承于Intent，本身也不包含Intent。



PendingIntent可以在满足一定条件下执行其包裹的**Intent**，它相比于**Intent**的优势在于自己携带有Context对象，这样他就不必依赖于某个activity才可以存在。

[说说PendingIntent的内部机制 - 悠然红茶的个人页面](https://my.oschina.net/youranhongcha/blog/196933 "说说PendingIntent的内部机制 - 悠然红茶的个人页面")



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



[Android PendingIntent](http://dongchuan.github.io/android/2016/06/12/Android-PendingIntent.html "Android PendingIntent")

获取一个PendingIntent对象的几个方法：获取到的对象可以被其他applications引用，这样这些applications可以稍后执行你所描述的操作。

```java
PendingIntent.getActivity(Context context, int requestCode, Intent intent, int flags)
PendingIntent.getActivities(Context context, int requestCode, Intent[] intents, int flags)
PendingIntent.getBroadcast(Context context, int requestCode, Intent intent, int flags)
PendingIntent.getService(Context context, int requestCode, Intent intent, int flags)
```

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