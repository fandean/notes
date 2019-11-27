## Sass简介

Sass 是 CSS预处理器。目前比较流行的CSS预处理器还有Less。

官网：[Sass: Syntactically Awesome Style Sheets](http://sass-lang.com/ "Sass: Syntactically Awesome Style Sheets")



CSS并不能算是一门真正意义上的编程语言，无法完成嵌套、继承、设置变量等工作。为解决CSS的不足，开发者想到了编写一种对CSS进行预处理的"中间语言"。



**为什么使用Sass？**

- 可以使用变量
- 自动转换RGBA颜色值
- 忘记浏览器前缀
- 嵌套规则
- media query更简单
- 自动压缩CSS

- 完全兼容 CSS3
- 在 CSS 基础上增加变量、嵌套 (nesting)、混合 (mixins) 等功能
- 通过函数进行颜色值与属性值的运算
- 提供控制指令 (control directives)等高级功能
- 自定义输出格式



## 安装Sass

安装 Sass 的方法有多种，具体见官网 [Sass: Install Sass](https://sass-lang.com/install)（早期视频教学都是通过ruby安装，但现在已经没有了）。

> 官方消息： Ruby Sass是Sass的原始实现，但它已在2019年3月26日开始不再受官方支持，Ruby Sass用户应迁移到另一个实现。 （因为Ruby已经开始退出舞台）

在Windows中我们可以通过scoop安装：

```
scoop install sass
```

sass命令的用法：

```shell
sass input.scss output.css
# watch 单个文件
sass --watch input.scss output.css
# watch 整个目录
sass --watch app/sass:public/stylesheets
```

可以使用 `sass -i` 来进行交互操作：

```shell
$ sass -i
>> "Hello, Sassy World!"
"Hello, Sassy World!"
>> 1px + 1px + 1px
3px
>> #777 + #777
#eeeeee
>> #777 + #888
white
```









> Sass的书写规则
>
> 最初sass是为了配合haml而设计，所以和haml有着一样的**缩进式风格**；其文件后缀为 `.sass`。
>
> ```sass
> body
> 	background:black
> ```
>
> 但是从第三代开始，保留缩进式风格，并同时**向下兼容普通的css代码**；其文件后缀名为 `.scss`。
>
> ```scss
> /* 可以兼容css语法 */
> body{
>   background:black
> }
> ```
>
> Compass是Sass的工具库，它在Sass的基础上封装了一系列有用的模块和模板，补充Sass的功能。Compass与Sass的关系类似于jQuery与JS的关系。





## 快速入门

详见：[Sass快速入门 | Sass中文网](https://www.sass.hk/guide/)



1. 变量声明：使用 `$`

   ```scss
   //变量名不区分中划线或下划线，
   //这意味着$nav-color和$nav_color是同一个变量
   $nav-color: #F90; 
   nav {
     $width: 100px;  //它的作用域只在 {} 中
     width: $width;  // 变量引用
     color: $nav-color;
   }
   ```

   

   - 变量引用： 凡是`css`属性的标准值（比如说1px或者bold）可存在的地方，变量就可以使用。
   - 变量数据类型：见 中文文档 部分

2. 嵌套CSS规则 (嵌套CSS选择器和嵌套CSS属性值) 

   ```scss
   #content {
     background-color: #f5f5f5;
     article {
       h1 { color: #333 }
       p { margin-bottom: 1.4em }
     }
     aside { background-color: #EEE }
   }
   ```

   ```scss
    /* 编译后 */
   #content { background-color: #f5f5f5 }
   #content article h1 { color: #333 }
   #content article p { margin-bottom: 1.4em }
   #content aside { background-color: #EEE }
   ```

   

   - 父选择器 `&` （即&会被父选择器替换）

     ```scss
     #main {
       color: black;
       //其后可以跟后缀生成复合的选择器，此时&必须作为选择器的第一个字符
       &-sidebar { border: 1px solid; }
       a {
         font-weight: bold;
          // 多层嵌套
         &:hover { color: red; }
         body.firefox & { font-weight: normal; }
       }
     }
     ```

     ```scss
      /* 编译后 */
     #main { color: black; }
     // 生成复合的选择器
     #main-sidebar { border: 1px solid;}
     #main a { font-weight: bold; }
     //多层嵌套，最外层的父选择器会一层一层向下传递
     #main a:hover { color: red; }
     body.firefox #main a { font-weight: normal; }
     ```

     

   - 群组选择器

     ```scss
     .container {
       h1, h2, h3 {margin-bottom: .8em}
     }
     ```

   - 选择器：> 直接子元素、+ 同层相邻 和 ~ 同层全体 

     ```scss
     article {
       ~ article { border-top: 1px dashed #ccc }
       > section { background: #eee }
       dl > {
         dt { color: #333 }
         dd { color: #555 }
       }
       nav + & { margin-top: 0 }
     }
     ```

     ```scss
      /* 编译后 */
     article ~ article { border-top: 1px dashed #ccc }
     article > footer { background: #eee }
     article dl > dt { color: #333 }
     article dl > dd { color: #555 }
     nav + article { margin-top: 0 }
     ```

     

   - 属性嵌套

     ```scss
     nav {
       border: {
       style: solid;
       width: 1px;
       color: #ccc;
       }
     }
     ```

     ```scss
      /* 编译后 */
     nav {
       border-style: solid;
       border-width: 1px;
       border-color: #ccc;
     }
     ```

     

3. 导入 sass 文件

    `sass`的`@import`规则在生成`css`文件时就把相关文件导入进来 ， 被导入文件 可以省略后缀名 `.scss`。有了导入功能后，我们可以把一个 .scss 文件分层多个子 .scss 文件 （partials：部分）

   - 忽略部分sass文件 （partials）

      那些子 `scss`文件，并不需要生成对应的独立`css`文件，这样的`scss`文件称为局部文件。  局部文件的文件名以**下划线开头**， 这样，`sass`就不会在编译时单独编译这个文件输出`css` ；在导入时该下划线可以省略。

   - 默认变量值

      一般情况下，你反复声明一个变量，只有最后一处声明有效且它会覆盖前边的值。 

     假设`_a.scss`库文件中有下面一个代码片段 

     ```scss
     $link-color: blue;
     a {
     	color: $link-color;
     }
     ```

     某用户在导入了这个库文件之后想要更改链接颜色就会有些困难，比如他的代码是这样：

     ```scss
     //无论用户将 $link-color 放在，放在@import之前还是之后都无法更改
     $link-color: red;
     @import "a"   //文件a中的代码将在这里展开(插入)
     $link-color: red; 
     ```

     这时可以通过在库文件 _a.scss 中使用`sass`的`!default`标签可以实现更改`$link-color` 变量值的目的。 

     ```scss
     $link-color: blue !default;
     a {
     	color: $link-color;
     }
     ```

     `!default` 含义是：如果这个变量被声明赋值了，那就用它声明的值，否则就用这个默认值。 

   - 嵌套导入

      `sass`允许`@import`命令写在`css`规则内。  举例说明，有一个名为`_blue-theme.scss`的局部文件，文件内容如下：

     ```scss
     aside {
       background: blue;
       color: white;
     }
     ```

     ```scss
     //嵌套导入
     .blue-theme {@import "blue-theme"}
     
     //生成的结果跟你直接在.blue-theme选择器内写_blue-theme.scss文件的内容完全一样。
     
     .blue-theme {
       aside {
         background: blue;
         color: #fff;
       }
     }
     ```

     

   - 原生的css导入

     写法： `CSS@import` 

4. 静默注释

    `css`标准注释格式为 `/* ... */` 其注释内容**会**出现在生成的css文件中

    `sass`另外提供了一种 静默注释  `//`  其注释内容**不会**出现在生成的css文件中

   

    了解了保持`sass`条理性和可读性的最基本的三个方法：嵌套、导入和注释后，现在 来更进一步学习。

5. 混合器

   你可以通过`sass`的混合器实现大段样式的重用。 而变量通常只能定义单个属性值。

    混合器使用`@mixin`标识符定义， 这个标识符给一大段样式赋予一个名字，这样你就可以轻易地通过引用这个名字重用这段样式。 

   ```scss
   @mixin no-bullets {
     list-style: none; //不仅可以包含属性
     li { //还可包含选择器和选择器中的属性
       list-style-image: none;
       list-style-type: none;
       margin-left: 0px;
     }
   }
   ```

   

   然后就可以在你的样式表中通过`@include`来使用这个混合器。`@include`调用会把混合器中的所有样式提取出来放在`@include`被调用的地方。

    ```scss
   ul.plain {
     color: #444;
     @include no-bullets;
   }
    ```

   ```scss
   // sass最终生成
   ul.plain {
     color: #444;
     list-style: none;
   }
   ul.plain li {
     list-style-image: none;
     list-style-type: none;
     margin-left: 0px;
   }
   ```

   通过使用参数，你可以使用混合器把你样式中的通用样式抽离出来，然后轻松地在其他地方重用。实际上，混合器太好用了，一不小心你可能会过度使用。大量的重用可能会导致生成的样式表过大，导致加载缓慢。所以，首先我们将讨论混合器的使用场景，避免滥用。 

   - 何时使用混合器（见原文）

   - 给混合器传参

     混合器并不一定总得生成相同的样式。可以通过在`@include`混合器时给混合器传参，来定制混合器生成的精确样式 

     ```scss
     @mixin link-colors($normal, $hover, $visited) {
       color: $normal;
       &:hover { color: $hover; }
       &:visited { color: $visited; }
     }
     ```

     ```scss
     a {
       @include link-colors(blue, red, green);
     }
     //或者通过这种形式的传参，参数顺序就不必再在乎了，只需要保证没有漏掉参数即可
     a {
         @include link-colors(
           $normal: blue,
           $visited: green,
           $hover: red
       );
     }
     ```

     ```scss
     //Sass最终生成的是：
     a { color: blue; }
     a:hover { color: red; }
     a:visited { color: green; }
     ```

     

   - 默认参数值

     ```scss
     @mixin link-colors(
         $normal,
         $hover: $normal, //默认值的特殊形式，引用其他参数值
         $visited: $normal
       )
     {
       color: $normal;
       &:hover { color: $hover; }
       &:visited { color: $visited; }
     }
     ```

     

6. 使用选择器继承来精简CSS

   使用`sass`的时候，最后一个减少重复的主要特性就是选择器继承。  基于`Nicole Sullivan`面向对象的`css`的理念，选择器继承是说一个选择器可以继承为另一个选择器定义的所有样式。这个通过`@extend`语法实现 

   ```scss
   //通过选择器继承继承样式
   .error {
     border: 1px solid red;
     background-color: #fdd;
   }
   .seriousError {
     @extend .error;
     border-width: 3px;
   }
   ```

   略略略



## 中文文档

[ Sass中文文档](https://www.sass.hk/docs/)  （文中安装sass部分已经过时，具体安装方法见sass官网或上文）

最新官方文档：[Sass: Documentation](https://sass-lang.com/documentation)

变量的数据类型：

- 数字，`1, 2, 13, 10px`
- 字符串，有引号字符串与无引号字符串，`"foo", 'bar', baz`
- 颜色，`blue, #04a3f9, rgba(255,0,0,0.5)`
- 布尔型，`true, false`
- 空值，`null`
- 数组 (list)，用空格或逗号作分隔符，`1.5em 1em 0 2em, Helvetica, Arial, sans-serif`
- maps, 相当于 JavaScript 的 object，`(key1: value1, key2: value2)`






## 学习资料

- [前端开发_Sass/Less入门基础到高级教程_慕课网](http://www.imooc.com/course/list?c=sassless "前端开发_Sass/Less入门基础到高级教程_慕课网")
- [CSS - 宁皓网](https://ninghao.net/package/css) 这套免费 css教程中包含了一套 sass 教程（免费课程无需注册）
- [Sass中文网](https://www.sass.hk/)  网站不错，可以通过网站的快速入门来学习sass

