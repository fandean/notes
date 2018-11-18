# AngularJS



补充，视频中的分层图片





1、ng-app=" "  定义angularJS的使用范围；

2、ng-init="变量=值;变量='值'"  初始化变量的值，有多个变量时，中间用分号隔开；

3、ng-model="变量"  定义变量名；

4、ng-bind="变量"  绑定变量名，获取该变量的数据。这里的变量就是第3条的变量名。但是一般都用双重花括号来获取变量的值，比如：`{{变量}}`。

**ng-app** 指令定义一个 AngularJS 应用程序。

**ng-model** 指令把**元素值（比如输入域的值）**绑定到应用程序。

**ng-bind** 指令**把应用程序数据**绑定到 HTML 视图。





**module和 model：** 

AngularJS模块（angular.module）

Model：是应用中的数据，一般是简单的 JavaScript 对象。



## 数据绑定

原理：创建实时模板来代替视图。

**ng-app** 属性声明所有被其包含的元素都属于整个AngularJS应用。
**ng-controller** 属性声明所有被它包含的元素都属于某个控制器。





### ng-model



`ng-model` 指令用于绑定变量，这样用户在文本框输入的内容会绑定到变量上

（在用户输入内容时他会检查`$scop`中是否存在该变量，如果该变量还不存在，则会声明并初始化该变量。或者 是当用户没有输入内容时，仅仅是声明了改变量，而只有(推测)）



初始化操作也可以在 `ng-click="brand={}"`中进行。 



> 而表达式可以实时地输出变量。 



可以直接在ng-model中为 `$scop`添加属性，比如像这样  `ng-model="searchEntity.name" `  ？？是不是？？









## 作用域

先回顾一下JS中的作用域，见相关笔记。比如JS没有块级作用域，动态的属性，执行环境。



将应用的业务逻辑放在控制器中（见下文），将相关数据放在控制器的作用域中。



### $rootScope

ng-app 同 `$rootScope` 进行绑定.



### $scope



- `ng-controller` 同 `$scope` 进行绑定.
- `$scope` 对象在 angularjs 中充当数据模型.
- `$scope` 上的所有数据都可以自动被视图访问到.



值绑定： `{{}}` 将表达式绑定到视图上。



## 控制器

- 是一个函数
- 尽可能精简
- 给作用域对象设置初始状态
- 添加自定义行为和额外的功能
- 与视图关联, 业务逻辑封装独立

> 设计良好的应用会将复杂的逻辑放到 **指令** 和 **服务** 中.
> 我们要将控制器重构成一个轻量且容易维护的组件.



## 表达式 `{{}}`



拥有访问 $scope 的权限

> `{{ user.name }} <=> $scope.user.name`

不会抛出异常

> TypeError 和 ReferenceError

 不允许使用任何流程控制功能

> eg: if else

可以接受过滤器和过滤器链

> {{ 'jack' | uppercase }}



## 服务



- 单例对象
- 延迟加载
- 保持数据(一致性)
- 控制器间通信
- 关联方法的集合
- 应用的整个生命周期调用一次就一直存在



创建服务

注册服务

使用服务









## 资料

《AngularJS权威指南》



慕课网上有视频不错

[印记中文 - 最权威的中文开发文档](https://docschina.org/ "印记中文 - 最权威的中文开发文档")

[Angular.js 介绍及实践教程](http://www.ibm.com/developerworks/cn/web/1406_rentt_angularjs/index.html "Angular.js 介绍及实践教程")

[AngularJS 简介（Introduction）](http://www.angularjs.net.cn/tutorial/1.html "AngularJS 简介（Introduction）")

[AngularJS 教程 | 菜鸟教程](http://www.runoob.com/angularjs/angularjs-tutorial.html "AngularJS 教程 | 菜鸟教程")

[Angular 从0到1 (一）史上最简单的Angular教程 - 掘金](https://juejin.im/post/5860eebe1b69e6006ce1395c "Angular 从0到1 (一）史上最简单的Angular教程 - 掘金")