## Bootstrap介绍

Bootstrap 来自 Twitter，是 2011 年八月在 GitHub 上发布的开源产品。

用于为小型站点开发响应式网站；对于像淘宝等复杂页面并不适合，为其重新创建专门用于移动端的页面可能更加简单。



官方地址： <http://getbootstrap.com>

中文地址：<www.bootcss.com>



> Bootstrap可视化布局工具



Bootstrap 的 JavaScript 插件需要引入 jQuery。所以需要与JQuery一起使用。

请注意，**Bootstrap 的所有 JavaScript 插件都依赖 jQuery，**因此 jQuery 必须在 Bootstrap 之前引入。

自 Bootstrap 3 起，框架包含了贯穿于整个库的**移动设备优先**的样式。



* Bootstrap 使用了一些 HTML5 元素和 CSS 属性。为了让这些正常工作，您需要使用 HTML5 文档类型（Doctype）。
* 为了让 Bootstrap 开发的网站对移动设备友好，确保适当的绘制和触屏缩放，需要在网页的 head 之中添加 **viewport meta** 标签
* JQuery引入
* BootStrap css引入
* BootStrap js引入




Bootstrap各文件介绍：

* bootstrap.css：Bootstrap 核心 CSS 文件
* bootstrap-theme.css：可选的BootStrap主题文件（一般不用引入）
* bootstrap.js：Bootstrap核心js文件



预编译版：

```
bootstrap/
├── css/
│   ├── bootstrap.css
│   ├── bootstrap.css.map
│   ├── bootstrap.min.css
│   ├── bootstrap.min.css.map
│   ├── bootstrap-theme.css
│   ├── bootstrap-theme.css.map
│   ├── bootstrap-theme.min.css
│   └── bootstrap-theme.min.css.map
├── js/
│   ├── bootstrap.js
│   └── bootstrap.min.js
└── fonts/
    ├── glyphicons-halflings-regular.eot
    ├── glyphicons-halflings-regular.svg
    ├── glyphicons-halflings-regular.ttf
    ├── glyphicons-halflings-regular.woff
    └── glyphicons-halflings-regular.woff2
```

预编译文件可以直接使用到任何 web 项目中。我们提供了编译好的 CSS 和 JS (`bootstrap.*`) 文件，还有经过压缩的 CSS 和 JS (`bootstrap.min.*`) 文件。同时还提供了 CSS [源码映射表](https://developer.chrome.com/devtools/docs/css-preprocessors) (`bootstrap.*.map`) ，可以在某些浏览器的开发工具中使用。同时还包含了来自 Glyphicons 的**图标字体**，在附带的 **Bootstrap 主题中**使用到了这些图标。






Bootstrap网站提供了一个**基本模板**：

```html
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <h1>你好，世界！</h1>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>
```



另可以通过Bootstrap网站提供的各种精选实例来入门Bootsrap： [起步 · Bootstrap v3 中文文档](http://v3.bootcss.com/getting-started/#examples)








> *responsive*：响应



> Bootstrap 使用 [Normalize](http://necolas.github.io/normalize.css/) 来建立跨浏览器的一致性。
>
> Normalize.css 是一个很小的 CSS 文件，在 HTML 元素的默认样式中提供了更好的跨浏览器一致性。用于清除浏览器默认样式。



**响应式图像：**

```html
<img src="..." class="img-responsive" alt="响应式图像">
```



**容器：**

```html
<div class="container">
  ...
</div>
```

Bootstrap 3 的 *container* class 用于包裹页面上的内容。

请注意，由于内边距（padding）是固定宽度，默认情况下容器container是不可嵌套的。



### Bootstrap开发工具

- 任意前端开发工具
- 专门针对Bootstrap的开发工具：Jetstrap（收费）





## Bootsrap栅格系统

Grid System(网格系统，栅格系统)。Bootstrap 提供了一套响应式、移动设备优先的流式网格系统，随着屏幕或视口（viewport）尺寸的增加，系统会自动分为**最多12列**。


栅格系统的学习：  Bootstrap中文官网 > 文档 > 全局CSS样式 > 栅格系统


1.Bootstap的栅格系统中根据屏幕尺寸，将屏幕设备进行了划分几种不同的屏幕。



### Grid System工作原理





网格系统通过一系列**包含内容的**行和列来创建页面布局。

* 行必须放置在 **.container** class 内，以便获得适当的对齐（alignment）和内边距（padding）。
* 使用行来创建列的水平组。
* **内容应该放置在列内**，且唯有列可以是行的直接子元素。
* 预定义的网格类，比如 **.row** 和 **.col-xs-4**，可用于快速创建网格布局。LESS 混合类可用于更多语义布局。
* 列通过内边距（padding）来创建列内容之间的间隙。该内边距是通过 **.rows** 上的外边距（margin）取负，表示第一列和最后一列的行偏移。
* **网格系统是通过指定您想要横跨的十二个可用的列来创建的**。例如，要创建三个相等的列，则使用三个 **.col-xs-4**。






### 网格选项

下表总结了 Bootstrap 网格系统如何跨多个设备工作：

|          | 超小设备手机（<768px）      | 小型设备平板电脑（≥768px）              | 中型设备台式电脑（≥992px）              | 大型设备台式电脑（≥1200px）             |
| -------- | ------------------- | ----------------------------- | ----------------------------- | ----------------------------- |
| 网格行为     | **一直是水平的**          | 开始是堆叠在一起的，当**大于**这些阈值时将变为水平排列 | 开始是堆叠在一起的，当**大于**这些阈值时将变为水平排列 | 开始是堆叠在一起的，当**大于**这些阈值时将变为水平排列 |
| 最大容器宽度   | None (auto)         | 750px                         | 970px                         | 1170px                        |
| Class 前缀 | **.col-xs-**        | **.col-sm-**                  | **.col-md-**                  | **.col-lg-**                  |
| 列数量和    | 12                  | 12                            | 12                            | 12                            |
| 最大列宽     | Auto                | 60px                          | 78px                          | 95px                          |
| 间隙宽度     | 30px（一个列的每边分别 15px） | 30px（一个列的每边分别 15px）           | 30px（一个列的每边分别 15px）           | 30px（一个列的每边分别 15px）           |
| 可嵌套      | Yes                 | Yes                           | Yes                           | Yes                           |
| 偏移量      | Yes                 | Yes                           | Yes                           | Yes                           |
| 列排序      | Yes                 | Yes                           | Yes                           | Yes                           |


水平：像表格一样，一行有多列。
堆叠：一行只有一列。




### 基本的网格结构

```html
<div class="container">
   <div class="row">
      <div class="col-*-*"></div>
      <div class="col-*-*"></div>      
   </div>
   <div class="row">...</div>
</div>
<div class="container">....
```









## 学习资料


[Bootstrap中文网](http://www.bootcss.com/ "Bootstrap中文网")

[印记中文 - 最权威的中文开发文档](https://docschina.org/ "印记中文 - 最权威的中文开发文档")

[bootstrap入门-bootstrap入门教程-web前端开发-麦子学院](http://www.maiziedu.com/course/304/ "bootstrap入门-bootstrap入门教程-web前端开发-麦子学院")

[bootstrap综合实战-bootstrap综合实战-麦子学院](http://www.maiziedu.com/course/543/ "bootstrap综合实战-bootstrap综合实战-麦子学院")

[Bootstrap响应式网站开发 移动端手机站制作视频教程_腾讯课堂](https://ke.qq.com/course/228137)

[Bootstrap前端框架_腾讯课堂](https://ke.qq.com/course/191050 "Bootstrap前端框架_腾讯课堂")

[Bootstrap 教程 - 菜鸟教程](http://www.runoob.com/bootstrap/bootstrap-tutorial.html "Bootstrap 教程 - 菜鸟教程")




