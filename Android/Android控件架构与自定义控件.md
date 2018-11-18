

## Android控件架构



### View视图树









### View的测量

前面说过：上层控件负责下层子控件的测量与绘制，并传递交互事件。(只是传递)



在绘制View前，必须对View进行测量，即告诉系统该画多大的View；这个过程在 `onMeasure()`方法中进行。







## 自定义控件

- 自绘控件
- 组合控件
- 基础控件



## 自定义控件的步骤

自绘控件

- 自定义属性的声明与获取。[观察控件是否需要某些属性，我们可以将其提取出来]
- 测量onMeasure() ：调用requestLayout()即可触发测量
- 布局onLayout(ViewGroup) 「是父控件去决定子View的显示位置」
- 绘制onDraw() 「大多数的ViewGroup都不需要考虑onDraw()」
- onTouchEvent() 「如果需要和用户交互，则还要覆写此方法」
- onInterceptTouchEvent(ViewGroup)  「如果是ViewGroup，还可以去拦截子View的一些事件」



> 带有 ViewGroup的为自定义ViewGroup才需要考虑的方法。



onTouchEvent() ，当要考虑多点触控时，在每个时刻只存在一个 ActivePointer 。当只有一个手指时那么第一个手指为 ActivePointer，此时当按下第二个手指时第个手指成为ActivePointer，当按下第三个手指时第三个手指成为ActivePointer。

当ActivePointer被移开时我们需要控制让其它手指成为ActivePointer。一般我们参考系统代码这样实现：当第三个手指移开时第一个手指变为 ActivePointer，如果此时移开的不是ActivePointer则不会改变。



[推荐：GcsSloop/AndroidNote: 安卓学习笔记](https://github.com/GcsSloop/AndroidNote "GcsSloop/AndroidNote: 安卓学习笔记")

[微信6.0主界面-慕课网](http://www.imooc.com/learn/273 "微信6.0主界面-慕课网")

[Android自定义任意层级树形控件-慕课网](http://www.imooc.com/learn/303 "Android自定义任意层级树形控件-慕课网")

[Android面试解密-自定义View-慕课网](http://www.imooc.com/learn/579 "Android面试解密-自定义View-慕课网")

[Android UI模板设计-慕课网](http://www.imooc.com/learn/247 "Android UI模板设计-慕课网")



