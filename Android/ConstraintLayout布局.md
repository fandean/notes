
[Android新特性介绍，ConstraintLayout完全解析 - 郭霖的专栏 - CSDN博客](http://blog.csdn.net/guolin_blog/article/details/53122387 "Android新特性介绍，ConstraintLayout完全解析 - 郭霖的专栏 - CSDN博客")    
[深入理解ConstraintLayout之使用姿势 - 简书](http://www.jianshu.com/p/b406ddc8b913 "深入理解ConstraintLayout之使用姿势 - 简书")      


Android Studio也支持可视化的方式来编写界面，但是操作起来并不方便，而ConstraintLayout就是为了解决这一现状而出现的。ConstraintLayout非常适合使用可视化的方式来编写界面，但并不太适合使用XML的方式来进行编写。另外，ConstraintLayout还有一个优点，它可以有效地解决布局嵌套过多的问题。

ConstraintLayout的用法很多都是对控件进行拖拽。

为了要使用ConstraintLayout，我们需要在app/build.gradle文件中添加ConstraintLayout的依赖，并且使用2.2以上版本的AS。

### 添加约束

如果一个控件没有添加任何约束的话，它在运行之后会自动位于界面的左上角。每个控件的约束都分为垂直和水平两类，一共可以在四个方向上给控件添加约束。控件上的四个圆点就是用来添加约束的；我们可以将约束添加到ConstraintLayout，也可将约束添加到另一个控件。

![](http://img.blog.csdn.net/20170131145556811)

![](http://img.blog.csdn.net/20170131150244736)

![](http://img.blog.csdn.net/20170131151357987)


### 删除约束

第一种用于删除一个单独的约束，将鼠标悬浮在某个约束的圆圈上，然后该圆圈会变成红色，这个时候单击一下就能删除了    
![](http://img.blog.csdn.net/20170131152026400)


第二种用于删除某一个控件的所有约束，选中一个控件，然后它的左下角会出现一个删除约束的图标，点击该图标就能删除当前控件的所有约束了。     
![](http://img.blog.csdn.net/20170131152353011)

第三种用于删除当前界面中的所有约束，点击工具栏中的删除约束图标即可
![](http://img.blog.csdn.net/20170131152641075)

![]()

![]()

![]()

![]()

![]()


