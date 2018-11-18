# Context类 

标签（空格分隔）： Android

---

public abstract class Context 
extends Object 


java.lang.Object
   ↳	android.content.Context

Known Indirect Subclasses  

- Activity 
- Application
- Service
- and 45 others




>Interface to global information about an application environment. This is an abstract class whose implementation is provided by the Android system. It allows access to application-specific resources and classes, as well as up-calls for application-level operations such as launching activities, broadcasting and receiving intents, etc.

参考：[Difference between getContext() , getApplicationContext() , getBaseContext() and “this”](http://stackoverflow.com/questions/10641144/difference-between-getcontext-getapplicationcontext-getbasecontext-and)

<https://developer.android.com/reference/android/content/Context.html>



--- 

Android 应用程序会在如下所示的几个时间点创建应用上下文Context：  
- 创建Application
- 创建Activity
- 创建Service

它们三个都继承了Context。

Application Context：当应用程序第一次启动时，Android系统都会创建一个Application对象，同时创建Application Context，所有的组件都共同拥有这样一个Context对象，该应用上下文对象贯穿整个应用进程的声明周期。

Activity实例和Service实例的Context对象：创建Activity和Service组件时，系统也会给它们创建相应的Context对象。






- View.getContext(): Returns the context the view is currently running in. **Usually the currently active Activity.**
- Activity.getApplicationContext(): Returns the context for the entire application (the process all the Activities are running inside of). Use this instead of the current Activity context if you need a context tied to the lifecycle of the entire application, not just the current Activity.
- ContextWrapper.getBaseContext(): If you need access to a Context from within another context, you use a ContextWrapper. The Context referred to from inside that ContextWrapper is accessed via getBaseContext().

>注意：  
View.getContext()  
Activity.getApplicationContext()
ContextWrapper.getBaseContext()


对于 this ，因为 Activity类是Context类的子类。  但是Activity类中没有`getContext()`方法。

很多类中都有 `getContext()`方法：

- View类，其子类应该也都有，如 LinearLayout
- Fragment
- LayoutInflater
- **Adapter




----

另参考： 郭霖的博客
