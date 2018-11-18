# Fragment

[Android - 随笔分类 - 超级Peng - 博客园](http://www.cnblogs.com/PengLee/category/603172.html "Android - 随笔分类 - 超级Peng - 博客园")



![](http://images.cnitblog.com/blog/641601/201409/201329372531026.png)





1、onAttach(Context context)：当该Fragment被添加到Activity时被回调，且这个方法只会被回调一次，这个方法中的参数context就是加载这个Fragment的Activity对象，所以我们可以通过这个方法获得Activity对象 

2、onCreate（Bundle）：创建Fragment的时候被调用，该方法只会被回调一次

3、onCreateView（）：每次创建、绘制Fragment的View组件时回调这个方法，Fragment将会显示该方法返回的View组件

4、onActivityCreated（）：当Fragment所在的Activity被启动完成后回调这个方法

5、onStart（）：启动Fragment的时候被回调

6、onResume（）：恢复Fragment的时候被回调，onStart()方法之后一定会回调这个方法

7、onPause（）：暂停Fragment时被回调

8、onDestroyView（）：销毁该Fragment所包含的View组件时回调

9、onDestroy（） ：销毁Fragment时被回调，只会被回调一次

10、onDetach（）：该方法只会被回调一次







