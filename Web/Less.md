## Less简介

CSS预处理器

[Getting started - Less.js](http://lesscss.org/)

[Less 中文网](http://lesscss.cn/ "Less 中文网")



在写Less的时候要注意技巧，不然生成的CSS将会有大量的冗余代码。所以只建议CSS高手进阶用，初级CSSer最好还是先把CSS写熟了再说吧！




## Less的使用

Less只有在被编译后才能被浏览器识别使用。

可以使用**Less编译工具**或使用**Less.js**将`.less`文件编译成css文件。

[Less.js用法](http://www.lesscss.net/#command-line-usage) 这里详细讲解了如何利用命令行、GUI界面程序、在线编译等各种使用less的方法。



### Less编译工具

- 在命令行编译less：先通过`npm install less -g`进行安装；再通过`lessc`命令进行编译。


- [Koala](http://koala-app.com/index-zh.html)，国人开发的**全平台**的Less编译工具
- [WinLess - Windows GUI for less.js](http://winless.org/ "WinLess - Windows GUI for less.js") 
- [CodeKit - THE Mac App for Web Developers](https://codekitapp.com/index.html "CodeKit - THE Mac App for Web Developers") 收费

用法：先使用Less编译工具将你编写的less文件编译为css文件，然后再在html中引入编译后的css文件即可。

优点：便于插入生成的css。



lessc命令：

```shell
# 编译styles.less文件，在终端输出编译后的内容
lessc styles.less

# 编译styles.less文件并指定输出文件
lessc styles.less styles.css
```



在线编译：

- [Online LESS Compiler - WinLess](http://winless.org/online-less-compiler "WinLess - Windows GUI for less.js") ：推荐；不仅可以实时显示编译结果，还提供了相关语法的示例。





### 使用less.js

> 尝试几次都失败。

使用less.js时它会在Html文档中直接插入css。

**客户端**调试方式：

- [下载 Less.js](http://lesscss.org/#download-options) (如果下载的是源代码，则less.js文件位于dist目录下)。


- 首先引用`.less`文件(该文件就是你自己编写的less文件)。注意引用时使用`link`引入，然后将`rel`属性设置为`rel="stylesheet/less"`
- 然后引入`less.js`文件。注意：与引入普通js方式一样，但是一定要放置在less样式文件之后。







### 编辑器插件

WebStorm 和 PhpStorm (内置支持Less)



## 注释

Less中的注释：

- 以`//`开始的注释，不会被编译到css文件中
- `/**/`包裹的注释会被编译在css文件中


## 变量(Variables)

注意，由于变量只能定义一次，实际上他们就是“常量”.

### 普通变量

变量的定义和引用：使用`@变量`的形式。

```less
//定义变量并为其赋值
@blue:#b83ad;

#header{
  color:@blue
}
```



### 作为选择器和属性名

使用时将变量以`@{变量名}`的方式使用。

**注意：**下面的示例中是将变量同时作为选择器和属性名。

```less
@mySelector:width;

//html中存在一个 class="width"
// 1.作为选择器
.@{mySelector}{
  //2.作为属性名
  @{mySelector}:150px
}
```



### 作为URL

定义变量时，其值使用双引号扩起来；使用时将变量以`@{变量名}`的方式使用。

```less
@imgUrl:"http://www.site.com/static/images";

body{
  background:#4cdca9 url("@{imgUrl}/logo.png") no-repeat;
}
```



### 延迟加载

什么是延迟加载？

变量是延迟加载的，在使用前不一定要预先声明。（可以先使用后定义）。



### 定义多个相同名称的变量

在定义一个变量两次时，只会使用最后定义的变量，Less会从当前作用域中向上搜索。



## 混合(Mixins)

混合是一种将一系列属性从一个规则集引入(混合)到另一个规则集的方式。

例如：混合可以将一个定义好的class A轻松的引入到另一个class B中，从而简单实现class B**继承**class A中的所有属性。我们还可以带参数地调用，就像使用函数一样。**当然这里的class也可以是id**。

你可以混合“类”选择器或者“id”选择器。

### 普通混合

```html
<!-- html代码，注意这里并不想要为h1和h2添加font_hn类 -->
...
<h1>标题一</h1>
<h2>标题二</h2>
```



```less
.font_hn {
	color: red;
	font-family: microsoft yahei, "黑体", Arial, Simsun, "Arial Unicode MS";
}

#font_hn {
	color: blue;
	font-family: microsoft yahei, "黑体", Arial, Simsun, "Arial Unicode MS";
}

h1 {
	font-size: 28px;
   /* 将类.font_hn混合进h1 */
	.font_hn;
}

h2 {
	font-size: 24px;
	#font_hn;
}
```



### 不带输出的混合

如果你想要创建一个混合集，但是却不想让它输出到你的的css文件中；那么在不想输出的混合集的名字后面加上一个括号即可。

```less
.my-mixin{
  color:black;
}
/*不会在编译后的css中保留下面的类*/
.my-other-mixin(){
  background:white;
}

.class{
  .my-mixin;
  .my-other-mixin;
}
```



编译后的css文件：

```css
/*依然保留的类*/
.my-mixin{
  color:black;
}

.class{
  color:black;
  background:white;
}
```



### 带选择器的混合

Less文件：

```less
.my-hover-mixin(){
  &:hover{
    border:1px solid red;
  }
}

button{
  .my-hover-mixin();
}
```

 

编译后的css文件：

```css
button:hover{
  border:1px solid red;
}
```



`&` 表示当前选择器的父选择器



### 带参数的混合

定义混合：

```less
.border(@border_color){
  border:sloid 2px @border_color;
}
```

使用上面定义的混合：使用时我们传入一个参数

```less
.div{
  border(#f60);
}
```

编译结果：

```css
.div{
  border:sloid 2px #ff6600;
}
```



### 带默认参数值的混合

定义混合

```less
.border(@border_color:#f60){
  border:sloid 2px @border_color;
}
```

使用时可以传入参数也可不传参数。

### 带有多个参数的混合

参数之间使用分号隔开(也可使用逗号)。

```less
.mixin(@color; @padding:xxx; @margin:2){
  color-3:@color;
  padding-3:@padding;
  margin:@margin;
}
```

使用上面定义的混合时，第一个参数必须传入，其它两个参数因为带有默认值所以可以省略 。同样各参数之间也使用分号分隔，也可使用逗号，但是分号的优先级更高。

> 因为分隔符可以是`,`或者`;`那么有时可能造成混淆：
>
> ```less
> .mixin(1,2,3); //编译后的结果为分别传入了三个参数
>
> .mixin(1,2,3;); //编译后的结果为只传入了一个参数
> ```



定义多个具有相同名称和参数数量的混合：

```less
//定义1
.mixin(@color){
  color-1:@color;
}
//定义2
.mixin(@color; @padding:2){
  color-2:@color;
  padding-2:@padding;
}
//定义3
.mixin(@color; @padding; @margin:2){
  color-3:@color;
  padding-3:@padding;
  margin:@margin;
}
```

使用方式一：

```less
.some .selector div{
  //该语句可以同时匹配 定义1 和 定义2
	.mixin(#000);
}
```

生成的css

```css
.some .selector div {
  color-1: #000;
  color-2: #000;
  padding-2: 2;
}
```

使用方式二：

```less
.some .selector div{
  //该语句可以同时匹配 定义2 和 定义3
	.mixin(#000, 6);
}
```

生成的css：

```css
.some .selector div {
  color-2: #000;
  padding-2: 6;
  color-3: #000;
  padding-3: 6;
  margin: 2;
}
```





### 命名参数

引用混合时可以通过参数名称而不是参数位置的顺序来为mixin提供参数值。

```less
.mixin(@color:black; @margin:10px; @padding:20px){
  color:@color;
  margin:@margin;
  padding:@padding;
}
```

```less
.class1{
  //参数的顺序发生了改变
  .mixin(@margin:20px;@color:#000);
}
```



### `@arguments`变量

`@arguments`变量代表所有的可变参数。



### 匹配模式

```less
//以匹配模式的方式实现各方向上的三角形
//朝下的三角形
.triangle(bottom,@w:5px,@c:#ccc){
	border-width:@w;
	border-color: @c transparent transparent transparent;
	border-style: solid dashed dashed dashed;
}
//朝左的三角形
.triangle(left,@w:5px,@c:#ccc){
	border-width:@w;
	border-color: transparent @c transparent transparent;
	border-style: solid dashed dashed dashed;
}
//朝上的三角形
.triangle(top,@w:5px,@c:#ccc){
	border-width:@w;
	border-color: transparent transparent @c transparent;
	border-style: solid dashed dashed dashed;
}
//朝右的三角形
.triangle(right,@w:5px,@c:#ccc){
	border-width:@w;
	border-color: transparent transparent transparent @c;
	border-style: solid dashed dashed dashed;
}

//@_代表不管匹配的是谁，都需将下面的内容混淆进去
//注意：后面的两个参数都不能省略
.triangle(@_,@w:5px,@c:#ccc){
	width: 0;
	height: 0;
	overflow: hidden; //用来处理IE6的最小高度问题
}
```

需要向上的三角形时就这样调用：

```less
.sanjiao{
	.triangle(top,50px);
}
```





### 得到混合中变量的返回值

```less
.average(@x,@y){
  @average:((@x + @y)/2);
}

div{
  .average(16px,50px);
  padding:@average;
}
```

生成的css：

```css
div {
  padding: 33px;
}
```



## 嵌套规则(Nested rules)

```less
#header {
  color: black;
  .navigation {
    font-size: 12px;
  }
  .logo {
    width: 300px;
  }
}
```

编译后的css:

```css
#header {
  color: black;
}
#header .navigation {
  font-size: 12px;
}
#header .logo {
  width: 300px;
}
```

`&` 表示当前选择器的父选择器



## 运算符(Operations)





## (Color functions)















## 学习资料

[less教程_即学即用-慕课网](http://www.imooc.com/learn/102 "less教程_即学即用-慕课网")

[用法 - Less.js](http://www.lesscss.net/#command-line-usage) ：各种使用Less的方式。

[语言特性 - Less.js](http://www.lesscss.net/features/#mixins-feature) ：查看Less的语法。



