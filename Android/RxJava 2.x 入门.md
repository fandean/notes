# RxJava 2.x 入门



**RxJava 2.x :**   

- [给初学者的RxJava2.0教程(一) - 简书](http://www.jianshu.com/p/464fa025229e "给初学者的RxJava2.0教程(一) - 简书") 系列9篇
- [这可能是最好的RxJava 2.x 教程（完结版）](http://www.apkbus.com/blog-898535-68185.html )系列6篇




### fromCallable

返回一个Observable，当观察者订阅它时，调用您指定的函数，然后发出从该函数返回的值。

```java
public static <T> Observable<T> fromCallable(@NotNull java.util.concurrent.Callable<? extends T> supplier)
```



这允许您推迟您指定的函数的执行，直到观察者订阅ObservableSource。也就是说，它使功能“懒惰”。





