

## Dagger 2



- **依赖注入（Dependency Injection简称DI）**


- java中**注解(Annotation)**



我们可以用**注解(Annotation)来标注目标类中所依赖的其他类，同样用注解来标注所依赖的其他类的构造函数**，那注解的名字就叫Inject。



### 为什么依赖是危险的？

从上层到底层依赖都是危险的，因为我们在某种程度上把两个模块进行耦合，这样**当需要修改其中一个模块时，我们必须修改与其耦合的模块的代码**（比如：我们需要修改底层类的构造函数时。其它情况了？）。

```
   上层
----|---   上层依赖底层
   底层
```

这对于创建一个可测试的app来说是很不利的，因为单元测试要求测试一个模块时，要保证它和app中其他模块是**隔离**的。为了做到这一点，我们需要使用mocks代替依赖，想象一下这样的代码：

```java
public class Module1{
   //底层对象 Module2
   private Module2 module2;

   public Module1(){
      // 自行创建 Module2 的对象
      module2 = new Module2();
   }

  // 想象一下，现在我们要测试 module1的 doSomething()方法
  // 但是 它却与 module2 的 doSomethingElse()方法产生关联
  // 现在 测试 doSomething()方法时还要测试 doSomethingElse()方法，
  // 这明显有违规则。
  // 如果强行测试，当发生判断错误时，如果判断其发生在哪个方法中？
  // 如果module2实现细节不可见？
   public void doSomething(){
      ...
      module2.doSomethingElse();
      ...
   } 
}
```

每当敲下new关键字我们都应该意识到这可能是需要避免的强依赖。

没看懂了....   new 关键字为什么会造成耦合？这里为什么就变成了是 new 造成的问题？

如何解决？

如果不能在一个模块内部初始化另外的模块，那么需要以其他的形式初始化这些模块。你能想象如何实现吗？没错，通过构造函数。

```java
public class Module1{
   private Module2 module2;

   public Module1(Module2 module2){
     // 在外部创建好以后再将其注入(传入)
      this.module2 = module2
   }

   public void doSomething(){
      ...
      module2.doSomethingElse();
      ...
   } 
}
```







### Dagger 2 常见概念



- Inject
- Component
- Module
- Provides



目标类：需要进行依赖初始化的类。使用 new 来创建对象的类。

其它类：被 new 创建出来的类。



#### Inject



```java
   class A{
        //注解的是属性
        @Inject
        B b;
   }

   class B{
       // 同时需要注解它的某个构造方法
       @Inject
       B(){
       }
   }
```



但是：

![](http://upload-images.jianshu.io/upload_images/1504173-31fad8ca1aeb4c86.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#### Component



![](http://upload-images.jianshu.io/upload_images/1504173-f0998db6b592459c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)





####  Module

Modules 也是提供依赖注入时所需对象实例的类。不过它是用于第三方类库中的类。

Module和Provides是为解决第三方类库而生的，Module是一个**简单工厂模式**，Module可以包含创建类实例的方法，这些方法用Provides来标注。



![](http://upload-images.jianshu.io/upload_images/1504173-0b81f8a57768a703.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)





#### Provides






- Qualifier(限定符)
- Singleton(单例)
- Scope(作用域)
- Component的组织方式




### 翻



[Introduction to Dagger 2, Using Dependency Injection in Android: Part 2](https://blog.mindorks.com/introduction-to-dagger-2-using-dependency-injection-in-android-part-2-b55857911bcd)



这是系列文章的第2部分。在第1部分中，我们了解了为什么需要依赖注入和使用依赖注入的优势。我们还对Dagger2进行了概述。在这部分，我们主要关注如何在Android程序中使用Dagger2来实现依赖注入(DI)。

第一部分内容在 [这里](https://blog.mindorks.com/introduction-to-dagger-2-using-dependency-injection-in-android-part-1-223289c2a01b).

我们将逐步分解这个过程，逐个分析每个步骤。

记住Dagger2需要集中的方法。所以积极主动地跟随下面的教程，问了很多问题。

对于项目结构，参见下面提到的项目仓库。



首先，我们必须定义Android App的结构。核心类如下：

1. `DataManager`类将提供对应用程序数据的访问。
2. `DbHelper`将被DataManager用来访问SQLite数据库。
3. `SharedPrefsHelper` 将被DataManager用于访问SharedPreferences。
4. `Model`类，用于检索数据库表。





#### 步骤1：

在app的 build.gradle 文件中添加如下依赖：

```java
dependencies {
    ...
    compile "com.google.dagger:dagger:2.8"
    annotationProcessor "com.google.dagger:dagger-compiler:2.8"
    provided 'javax.annotation:jsr250-api:1.0'
    compile 'javax.inject:javax.inject:1'
}
```



注意： 我们正在使用gradle为android添加的注释处理器。dagger-compiler是在构建时生成依赖图类的注释处理备份。为Dagger2提供了其他的毕业依赖。



#### 步骤2:

我们将首先构建数据部分。所以，创建一个模型类User。





#### 步骤3:

创建几个自定义注释：ActivityContext，ApplicationContext，DatabaseInfo，PerActivity。 [java自定义注解 - 淡淡的春意的专栏 - CSDN博客](http://blog.csdn.net/yixiaogang109/article/details/7328466 "java自定义注解 - 淡淡的春意的专栏 - CSDN博客")

```java
@Qualifier
@Retention(RetentionPolicy.RUNTIME) //注解会在class字节码文件中存在，在运行时可以通过反射获取到
public @interface ActivityContext {
}
@Qualifier
@Retention(RetentionPolicy.RUNTIME)
public @interface ApplicationContext {
}
@Qualifier
@Retention(RetentionPolicy.RUNTIME)
public @interface DatabaseInfo {
}
@Scope
@Retention(RetentionPolicy.RUNTIME)
public @interface PerActivity {
}
```



为什么要创建这些注释，什么是`@Qualifier`和`@Scope`？

`@Qualifier`注释由javax inject包提供，用于限定依赖关系。例如，一个类可以询问Application Context和Activity Context。但是这两个对象都是Context类型。所以，对于Dagger2来说明哪个变量要提供什么，我们必须明确指定它的标识符。

因此，`@Qualifier`用于区分相同类型的对象，但是使用不同的实例。在上面的代码中，我们有ActivityContext和ApplicationContext，所以注入的Context对象可以引用相应的Context类型。DatabaseInfo用于在类依赖中提供数据库名称。由于String类被提供为依赖关系，因此总是一个好主意来限定它，以便Dagger可以显式地解析它。

一个替代方案是由Dagger2提供的`@Named`注释。它本身使用了`@Qualifier`注释。使用`@Named`，我们必须为类似的对象提供字符串标识符，并使用此标识符来映射类的依赖关系。我们将在本例的最后一步探索`@Named`。

`@Scope`用于指定依赖对象持续存在的范围。如果一个类获取依赖关系，那么注册了一个用Scope注释的类的成员，那么该类的每个实例都要求依赖关系将获得自己的一组成员变量。

#### 步骤4:

创建扩展SQLiteOpenHelper的DbHelper类。该类将负责所有与DB相关的操作。







为了提供类的依赖，我们必须创建一个Module类。该类定义了提供依赖关系的方法。

由@Module标识的模块类和由@Provides标识的依赖关系提供程序方法。

然后，我们必须创建一个接口，作为通过@Inject表示依赖关系的类与提供依赖关系的类之间的连接，即用@Module注释。

为了找出模块提供的依赖关系，我们必须扫描图中需要提供依赖关系的所有类，然后找出必须提供的最少对象数。

我们回到示例步骤来了解上述语句。







#### Step 9:

我们必须提供DemoApplication类中表达的依赖关系。这个类的需求`DataManager`，并提供这个类，我们必须提供所表达的依赖关系`DataManager` ，这是在构造函数中提到的是`Context`，`DbHelper`和`SharedPrefsHelper` 。

从最顶层开始分析，DemoApplication需要注入DataManager，那么我们还需要考虑提供一个DataManager需要哪些依赖，通过查看其构造函数可知:

```java
@Inject
public DataManager(@ApplicationContext Context context,
                       DbHelper dbHelper,
                       SharedPrefsHelper sharedPrefsHelper)
```



然后 

1. `Context` has to be `ApplicationContext`



2. `DbHelper` needs `Context`, `dbName`, and `version`. This does not have any further branching.

```java
@Inject
    public DbHelper(@ApplicationContext Context context,
                    @DatabaseInfo String dbName,
                    @DatabaseInfo Integer version) {
        super(context, dbName, null, version);
    }
```





3. `SharedPrefsHelper` needs `SharedPreferences`

```java
    @Inject
    public SharedPrefsHelper(SharedPreferences sharedPreferences) {
        mSharedPreferences = sharedPreferences;
    }
```



我们现在积累了所有这些依赖的集合。原来是：`Context`, `dbName`, `version`, and `SharedPreferences`



**我们创建ApplicationModule类，来提供这些依赖关系：**

```java
@Module
public class ApplicationModule {

    private final Application mApplication;

    public ApplicationModule(Application app) {
        mApplication = app;
    }

  //  Context 
    @Provides
    @ApplicationContext
    Context provideContext() {
        return mApplication;
    }

    @Provides
    Application provideApplication() {
        return mApplication;
    }

  // dbName
    @Provides
    @DatabaseInfo
    String provideDatabaseName() {
        return "demo-dagger.db";
    }

  // version
    @Provides
    @DatabaseInfo
    Integer provideDatabaseVersion() {
        return 2;
    }

  // sharedPerferences 
    @Provides
    SharedPreferences provideSharedPrefs() {
        return mApplication.getSharedPreferences("demo-prefs", Context.MODE_PRIVATE);
    }
}

```



在构造函数中，我们已经传递了Application实例。**此实例用于提供其他依赖关系**。

此类提供了上述步骤中列出的所有依赖项。









#### Step 10:

我们创建一个链接DemoApplication依赖项和ApplicationModule的Component

```java
@Singleton
@Component(modules = ApplicationModule.class)
public interface ApplicationComponent {			//接口

  // 
    void inject(DemoApplication demoApplication);

  // 下面是附加的，用于访问各依赖（也是由 Dagger2来实现这些方法？？）
    @ApplicationContext
    Context getContext();

    Application getApplication();

    DataManager getDataManager();

    SharedPrefsHelper getPreferenceHelper();

    DbHelper getDbHelper();

}
```

ApplicationComponent接口将由Dagger2去实现。使用@Component我们将该类指定为一个组件。

Here we have written a method `inject` where we pass the `DemoApplication`instance. *Why do we do it?*

当通过字段注入提供依赖关系，即在成员变量上注入时，我们必须告诉Dagger通过该接口的实现扫描此类。

此类还提供了用于访问依赖关系图中存在的依赖关系的方法。



#### Step 11:

同样，我们必须为MainActivity和它的组件创建模块。其遵循与上述步骤相同的步骤。

```java

@Module
public class ActivityModule {

    private Activity mActivity;

    public ActivityModule(Activity activity) {
        mActivity = activity;
    }

    @Provides
    @ActivityContext
    Context provideContext() {
        return mActivity;
    }

    @Provides
    Activity provideActivity() {
        return mActivity;
    }
}

```



```java
@PerActivity
@Component(dependencies = ApplicationComponent.class, modules = ActivityModule.class)  //在这里指定
public interface ActivityComponent {

    void inject(MainActivity mainActivity);

}
```

ActivityComponent指定ApplicationComponent和ActivityModule。

添加ApplicationComponent以使用上一步中已生成的图，并存在，**因为DemoApplication类仍然存在，只要应用程序运行**。



@PerActivity是一个范围，用于告诉Dagger2每次创建活动时，ActivityModule提供的上下文和活动都将被实例化。

我们可能会要求在每个活动中创建DataManager。但是，这并不是真的，因为我们已经用@Singleton注释了DataManager类。这将类引入全局范围，因此在依赖性被表达时被访问。

现在我们再来看看DemoApplication类和MainActivity类。这些类没有构造函数，Android系统负责实例化这些。为了获得依赖关系，我们使用OnCreate方法，因为它们被实例化时被调用一次。



```java
applicationComponent = DaggerApplicationComponent
                            .builder()
                            .applicationModule(new ApplicationModule(this))
                            .build();
applicationComponent.inject(this);
```



DaggerApplicationComponent是 Dagger生成的类，它实现了 ApplicationComponent 接口。我们提供ApplicationModule类，用于构建依赖。



我们还调用了applicationComponent的inject方法，并传递了DemoApplication类的实例。这样做是为了使用它来提供DataManager。ApplicationComponent实例被保留以便访问依赖图中可用的所有类，并且用于访问。

```java
public ActivityComponent getActivityComponent() {
    if (activityComponent == null) {
        activityComponent = DaggerActivityComponent.builder()
                .activityModule(new ActivityModule(this))
                .applicationComponent(DemoApplication.get(this).getComponent())
                .build();
    }
    return activityComponent;
}
```

MainActivity也应用了类似的过程。唯一的区别是，我们还提供了在ApplicationModule中提到的依赖关系解析所需的ApplicationComponent。



正如我们提到的@Named（“string”）注释，我们只需要在每个地方用@Named（“application_context”）和@Named（“activity_context”）替换@ApplicationContext和@ActivityContext。



如果由于某些原因，我们必须通过字段注入来为类注入依赖关系，而其他Android构造的类则定义该类的组件接口，并在类的构造函数中调用它的注入方法。我建议找出一个不这样做的方法，但是尝试使用@Inject的构造函数进行注入。






## 参考



系列文章一：

- [Android：dagger2让你爱不释手-基础依赖注入框架篇 - 简书](http://www.jianshu.com/p/cd2c1c9f68d4 "Android：dagger2让你爱不释手-基础依赖注入框架篇 - 简书")
- [Android：dagger2让你爱不释手-重点概念讲解、融合篇 - 简书](http://www.jianshu.com/p/1d42d2e6f4a5 "Android：dagger2让你爱不释手-重点概念讲解、融合篇 - 简书")
- [Android：dagger2让你爱不释手-终结篇 - 简书](http://www.jianshu.com/p/65737ac39c44 "Android：dagger2让你爱不释手-终结篇 - 简书")






系列文章二：

- [Android常用开源工具（1）-Dagger2入门 - 远古大钟 - CSDN博客](http://blog.csdn.net/duo2005duo/article/details/50618171 "Android常用开源工具（1）-Dagger2入门 - 远古大钟 - CSDN博客")






系列文章三：

* [Introduction to Dagger 2, Using Dependency Injection in Android: Part 1](https://blog.mindorks.com/introduction-to-dagger-2-using-dependency-injection-in-android-part-1-223289c2a01b "Introduction to Dagger 2, Using Dependency Injection in Android: Part 1")
* [Introduction to Dagger 2, Using Dependency Injection in Android: Part 2](https://blog.mindorks.com/introduction-to-dagger-2-using-dependency-injection-in-android-part-2-b55857911bcd "Introduction to Dagger 2, Using Dependency Injection in Android: Part 2") 推荐



系列文章四：

- [Dagger 2 完全解析（一），Dagger 2 的基本使用与原理](http://johnnyshieh.me/posts/dagger-basic/ "Dagger 2 完全解析（一），Dagger 2 的基本使用与原理  Johnny Shieh")
- [Dagger 2 完全解析（二），进阶使用 Lazy、Qualifier、Scope 等](http://johnnyshieh.me/posts/dagger-advance/ "Dagger 2 完全解析（二），进阶使用 Lazy、Qualifier、Scope 等 - Johnny Shieh")
- [Dagger 2 完全解析（三），Component 的组织关系与 SubComponent](http://johnnyshieh.me/posts/dagger-subcomponent/ "Dagger 2 完全解析（三），Component 的组织关系与 SubComponent - Johnny Shieh")
- [Dagger 2 完全解析（四），Android 中使用 Dagger 2](http://johnnyshieh.me/posts/dagger-use-in-android/ "Dagger 2 完全解析（四），Android 中使用 Dagger 2-Johnny Shieh")
- [Dagger 2 完全解析（五），Kotlin 中使用 Dagger 2](http://johnnyshieh.me/posts/dagger-use-in-kotlin/ "Dagger 2 完全解析（五），Kotlin 中使用 Dagger 2 - Johnny Shieh")







[Dependency Injection with Dagger 2 - CodePath Android Cliffnotes](https://guides.codepath.com/android/Dependency-Injection-with-Dagger-2#overview "Dependency Injection with Dagger 2 - CodePath Android Cliffnotes")