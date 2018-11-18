# CoordinatorLayout

相关内容见AndroidHive的CardView示例和收藏的笔记。

[CoordinatorLayout与滚动的处理 【译：codepath】](http://www.jcodecraeer.com/a/anzhuokaifa/androidkaifa/2015/0717/3196.html)

CoordinatorLayout是用来协调其子view们之间动作的一个父view，而Behavior就是用来给CoordinatorLayout的子view们实现交互的


CoordinatorLayout的工作原理是搜索定义了CoordinatorLayout Behavior 的子view，不管是通过在xml中使用`app:layout_behavior`标签还是通过在代码中对view类使用`@DefaultBehavior`修饰符来添加注解。当滚动发生的时候，CoordinatorLayout会尝试触发那些声明了依赖的子view。

要自己定义CoordinatorLayout Behavior，你需要实现layoutDependsOn() 和onDependentViewChanged()两个方法。比如AppBarLayout.Behavior 就定义了这两个关键方法。     
理解如何实现这些自定义behavior的最好途径是研究AppBarLayout.Behavior 和 FloatingActionButtion.Behavior。

[codepath教程：浮动操作按钮详解 \- 泡在网上的日子](http://www.jcodecraeer.com/a/anzhuokaifa/androidkaifa/2015/0718/3197.html)


看下FloatingActionButton的源码就能发现其中有一个Behavior方法继承自CoordinatorLayout.Behavior，并在其中实现了与Snackbar互动时的逻辑。



AppBarLayout  -> 可滚动的View互动 (比如RecyclerView、NestedScrollView等但ListView不行)  

FloatingActionButton  ->   与Snackbar互动(当snackbar显示时)    



> CoordinatorLayout 与 RecyclerView的关系一直搞不懂


