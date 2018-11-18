## CSS



《HTML5与CSS3基础教程》

《CSS权威指南》

《CSS实战手册》《CSS 实战手册（第四版）

推荐书籍：《CSS揭秘》这里有许多技巧，但该书的要求较高。



记得看 [CSS 参考手册](http://www.w3school.com.cn/cssref/index.asp "CSS 参考手册")





你有两年以上的前端开发经验吗？你会用 Sass 和 Autoprefixer 等高级的CSS辅助技能吗？你的 JavaScript 知识是否融汇贯通，你是否喜欢使用 Gulp ， npm 和 jQuery ？如果是这样，根据 [Ashley Nolan 的前端问卷调查](https://ashleynolan.co.uk/blog/frontend-tooling-survey-2016-results)，你是一个典型的前端开发工程师。



虽然 CSS 是一个看似简单的 属性 和 值 的键值对集合，但是 CSS 是众所周知地难以掌握。 CSS3引入了一系列新效果，并且越来越难以掌握所有的知识。



CSS预处理器(Sass、LESS、Stylus、PostCSS)可以帮我们组织代码、变量、颜色操作和数学运算。像PostCSS这样的工具可以帮我们完成添加浏览器前缀这样烦琐的任务。





## 操作样式表



**外部样式表(首选方法)**

在HTML页面的 head 部分，输入 `<link rel="stylesheet href="url.css" />`

> 浏览器可以缓存该文件。



**嵌入样式表**

在 head 部分创建一个 style 元素，其中包含了我们的样式表。

```html
# 在head中插入
<style>
  img {
      border:4px solid red;
  }
</style>
```





**内联样式(不可取)**

在某个 元素中加上 `style="border: 4px solid red"`，来为该元素设置样式。

```html
<img src="img/palau.jpg" width="250" height="163" alt="El Palau de la" 
     style = "border: 4px solid red"/>
```





## 选择器




```css
h1选择器 { /*声明块*/
	color:red;	/*声明*/
   /*属性：值*/
}
```



* 按元素名称选择
* 按类 `.className` 或ID `#idValue` 选择
* 按祖先元素选择：`祖先 后代`   (使用**空格**)
* 按父元素选择其**直接后代**(子元素)：`父 > 直接后代` (使用**>**) 
* 按**相邻**同胞元素选择：`哥哥 + 弟弟` (使用 **+** )，同胞之间必须直接相邻。
* 选择第一个或最后一个子元素： `:first-child` 和 `:last-child` (伪元素)
* 选择元素的第一个字母或第一行：`::first-letter` 和 `::first-line` (伪类)，可以只写一个冒号。
* 按状态选择链接元素`<a>`：可以通过一系列伪类实现这一特性。`a:link` 从未被激活、`a:visited` 已激活过、 `a:focus`已准备好激活、`a:hover`光标指向链接时、`a:active`激活过的链接。
* 按属性选择元素：匹配的方式有多种，比如只检查属性名`p[class]`、检查部分属性值(比较复杂) 和 检查全部`p[attr="value"]`。
* 指定元素组：各元素之间用 `，` 分隔。




### 特殊性（优先级）

> 在一次作业中忽略了特殊性问题，导致选择器无法生效



`元素名.id` > `id` 

```css
# 特殊性由高到低排列
article.architect p{}

.architect p{}

article p{}
```





### 通配符 `*` 的用法

示例：

```css
* {
    //此处的样式应用于所有元素
}

#add-blog *{
  // 此处的样式应用于
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
```



## 结构和层叠



### 理解继承

将html文档理解为文档树。文档树有助于理解CSS。

有些属性不可以被继承。详见书中列表。

对大多数属性来说，还可以使用inherit值强制进行继承。`p {border: inherit;}`





### 层叠：当规则发生冲突时
CSS用层叠的原则来考虑**特殊性、顺序、和重要性**，从而判断相互冲突的规则中哪个规则应该起作用。

**特殊性：**
特殊性规则指定选择器的具体程度。选 择器越特殊，规则就越强。遇到冲突时，优 先应用特殊性强的规则。

**顺序：**
有时候，特殊性还不足以判断在相互冲突的规则中应该优先应用哪一个。在这种情况下，规则的顺序就可以起到决定作用:晚
出现的优先级高

**重要性:**
如果这还不够，可以声明一条特殊的规 则覆盖整个系统中的规则，这条规则的重要 程度要比其他所有规则高。也可以在某条声 明 的 末 尾 加 上 !important，比 如 `p{ color: orange !important; }`

>一般记住特殊性就行了







## 值和单位



### 属性的值

继承值inherit值:`p {border: inherit;}`
预设值：`p {border: none;}`
长度和百分数：使用em和百分数指定相对长度值
CSS颜色：RGB 和 RGBA
HSL和HSLA：色相hue、饱和度saturation、亮度lightness


>em: 
>一个 em 的 长度大约与对应元素的字号相等。
>例如，对 元素设置 margin-left: 2em 就代表将元素的 左外边距设为元素字号的两倍。(当 em 用于 设置元素的 font-size 属性本身时，它的值继 承自对应元素的父元素的字号)

>px像素；pt磅。





## 字体





## 文本属性







## 盒模型

`box-sizing:border-box` 的作用







## 基本视觉格式化



**display：**

还有一种混合显示方式： inline-block。它让元素与其他内容出现在同一行，同时具有**块级元素**的属性（它的内容会以块级显示，而它自己则是**行内元素**）。





### 设置元素的高度和宽度



可以为很多元素设置高度和宽度，**同时， 可以为短语内容元素**( 默 认 以行 内 方 式 显 示 ) 设 置 `display: block;` 或`display: inline-block;`，再对它们设置宽度或高度。



* (1) 输 入 `width: w` ， 其 中的 w 是元素 **内容区域** 的宽度，可以表示为长度(带单位，如 px、em 等)**或**父元素的**百分数**。或者使用 **auto** 让浏览器计算宽度(这是默认值)。
* (2) 输入 `height: h` ，其中的 h 是元素内容区域的高度，**只能表示为长度**(带单位，如 px、em 等)。或者使用 **auto** 让浏览器计算高度(这是默认值)。

> 对定宽页面使用像素，对响应式 Web 设计使用百分数。

> 默认情况，不能为显示为行内元素的元素(如短语内容)设置高度或宽度，除非为它们设置 `display: inline-block` 或 `display: block`。






**max-width** 属性是为流式布局(下一章会讲到一个流式布局的例子)设置宽度限制的绝佳工具。

**min-height** 通常比 height 更适用。除非你确定元素的内容不会变得更高，最好避免在样式表中指定高度。在大多数情况下，可以让内容和浏览器自动控制高度。这可以让内容在浏览器和设备中根据需要进行流动。如果设置了高度，随着内容变多，它们有可能**撑破元素的盒子**，这可能是你预期之外的。（记住内容的增长大多情况下并不是由你自己控制）







### 100%



放到响应式布局中





> 文档流：默 认 情 况 下，元 素 会 按 照 它 们 在HTML 中自上而下出现的次序显示(这称为文档流，document flow)，并在每个非行内元素的开头和结尾处换行。



## 为文本添加样式




## 内边距、边框和外边距



### auto

对于大多数默认显示为**块级元素**的元素，width 的 auto 值是由包含块的宽度减去元素的内边距、边框和外边距计算出来的。

 行 内 元 素 会 完 全 忽 略 width 属性。

如果手动设置 width，但将某个**外边距margin**设为 auto，那么这个外边距将进行伸缩以弥补不足的部分。

`margin:20px auto`

如果手动设置了width，并将**左右**外边距都设为 auto，那么两个外边距就将设为相等的最大值，这样可以实现元素**居中**。



### 简写

同 border 和 margin 属性一样，padding 也可以使用简记法：

* `padding: 5px;` ——使用一个值，这个值就会应用于全部四个边。
* `padding: 5px 9px;` ——使用两个值，则前一个值会应用于上下两边，后一个值会应用于左右两边。
* `padding: 5px 9px 11px;` ——使用三个值，则第一个值会应用于上边，第二个值会应用于左右两边，第三个值会应用于下边。
* `padding: 5px 9px 11px 0;` ——使用四个值，它们会按照 **时钟顺序**，依次应用于**上、右、下、左**四个边。




### 内外边距的em值

当 em 值用于内边距和外边距时，它的值是相对于元素的字体大小的，而不是相对于父元素的字体大小的。

对于内边距和外边距的设置，建议使用相对单位。

**注意：**如果要对内边距和外边距使用百分数，通常**不会**将它们**用于上下**边距的值，因为这样的值是基于其**包含块的宽度**的。






## 颜色和背景





## 浮动和定位



如何让文字**围绕**在图像**周围**呢?

只要让一个**设置了宽度**的元素浮动，在正常情况下显示在它下面的内容就会流动到它的周围(前提是这些内容**没有**设置宽度)。

> 环绕效果：浮动的物体设置宽度，环绕的内容不设置宽度。

如何让两个元素并排在一起？

先为这两个元素设置宽度，在使它们一个向左浮动，一个向右浮动。

> 并排效果：

实用浮动时，源代码的顺序很重要。比如在实现环绕效果时向左或右浮动的元素必须出现在包围它的元素的前面。



差。见妙味课堂笔记。



### 清除浮动 

**清除浮动：**使该元素的某个方向上不能有浮动元素

 如果对某个元素(该元素自身没有浮动)使用该属性,**该元素**和**它后面的元素**就会显示在浮动元素的下面。



**书中示例解析：**

书中示例包含了两个浮动， 第一个浮动说的是嵌套在 main 中 section内的图片浮动，要清除浮动的类 `.post-footer`；第二个浮动说的是主页面和附属栏的浮动，需要考虑的是整个页面的footer的显示问题。

```html
...
<body>
<div class="page">
... [masthead] ...
<div class="container">
	<!--main左浮动-->
    <main role="main">
        ...
        
        <section class="post">
            <h2>container Main Section 2 </h2>

            <p>Main Section 2 下嵌套的图片浮动，环绕效果 </p>
            <img src="img/victoria.jpg" width="370" height="220" alt="" class="post-photo"/>

            <div class="post-blurb">
                <p>An hour and a half aboard a comfortable car</p>
            </div>
			<!-- post-footer 显示的位置偏于预期 -->
            <footer class="footer">
                <p class="post-footer">Section footer 1</p>
            </footer>
        </section>
        
    </main>
    <!--sidebar右浮动-->
    <div class="sidebar">
        ...
    </div>
</div> <!-- end container -->
    
<!-- 整个页面的 footer 显示的位置偏于预期 -->
<footer role="contentinfo" ...>
	<p class="legal"><small>&copy;2013 Le Journal. All Rights Reserved.</small></p>
	</footer>
</div>
</body>
</html>
```

第一个浮动的解决办法是让： post-footer 清除浮动

第二个浮动，我们为了使父元素container具有宽度，这里采用让浮动元素的父元素“自清除”浮动，即使用clearfix方法。复制粘贴如下代码，然后为父元素添加为 clearfix 类即可。

```html
.clearfix:before,
.clearfix:after {
	content:"";
	display:table;
}

.clearfix:after {
	clear:bath;
}

/* 为IE6添加下面的语句 */
.clearfix {
	*zoom:1;
}
```

> 修改（精简）过的代码位于： <https://github.com/FanDean/web-demos/blob/master/miaov/HTML5%E9%AB%98%E7%BA%A7/float2.html>

> 大量网站使用 clearfix 类或类似方法清除浮动。本书不会对所有这些代码进行详细解释,因为有些复杂。不过请将它常备手头,复制到每一个需要用到它的网站的样式表中去。
>
> clearfix方法中用到的  **:after 伪元素**
> ":after" 伪元素可以在元素的内容之后插入新内容。
>
> 下面的例子在每个 `<h1>` 元素后面插入一幅图片
>
> ```css
> h1:after
>   {
>   content:url(logo.gif);
>   }
> ```
>
> 
>
> 书中介绍还可使用 overflow 方法，示例：
>
> ```css
> /* 父元素 */
> .container{
>     overflow:hidden;
> }
> ```





## 表格布局







## 列表和生成内容









## 响应式布局

响应式页面也称为流式(fluid 或 liquid)页面，它使用百分数定义宽度。



响应式设计思路：先为小屏幕设计内容、样式，然后再向大屏幕扩展。

从最简单的“基本”体验开始,逐步扩充(所谓“渐进增强”)更容易。





**第一个响应式的例子：**

1.视口(viewport)设置

```html
<meta name="viewport" content="width=device-width">
```

2.先为图片设置默认值

```css
img {
	max-width: 100%;
}
```

3.媒体查询

这里比如当视口宽度超过600像素时(不同的页面断点值不同)，当前的页面布局存在被严重拉伸的问题。我们可以使用CSS3的媒体查询根据屏幕宽度来调整布局。

```css
/* 
最小媒体查询 
应该以最小屏幕为起点,然后再根据需求渐进扩充视觉和功能即可。
*/
/*
@media 指令告诉浏览器这里是一个媒体查询
screen 告诉浏览器这里的规则只适用于屏幕类型
and (min-width:50em) 意思是其中的规则只适用于视口宽度在50em以上的情况
*/
@media screen and (min-width: 50em) {
/* 样式 */
}
```







> 自适应和响应式的区别：
>
> 自适应：解决如何才能在不同大小的设备上呈现同样的网页（页面的内容和布局不改变）
>
> 响应式：根据不同的设备做出相应的调整，调整布局或元素（页面内容和布局是）



## 常用技巧









## 其它

### 浏览器前缀

出现原因：这个方案是指每个浏览器都可以实现这些**实验性的**(甚至是私有的、非标准的)特性，但要在名称前面加上自己特有的前缀。这些实验性的、加了前缀的属性可以轻而易举地实现以前大费周章才能达到的效果。

最常见的前缀分别是 Firefox 的 -moz-、IE 的 -ms-、Opera
的 -o- 以及 Safari 和 Chrome 的 -webkit-。

用不了多久，这个“坑”里的每个人就会意识到，浏览器前缀已是一场史诗般的失败。

最近，浏览器厂商已经很少以前缀的方式来实验性地实现新特性了。取而代之的是，这些实验性特性需要通过配置开关来启用。



### 对默认样式进行重置或标准化

每个浏览器都有内置的默认样式表。不同浏览器提供的默认样式表是相似的，但也存在一定的差异。

抹平差异的两种方法：

* **使用 CSS 重置(reset)**开始主样式表，如 Eric Meyer 创建的 Meyer 重置(http://meyerweb.com/eric/tools/css/reset/)。另外还有其他的一些重置样式表。**CSS 重置**可以有效地将所有默认样式都设为“零”。
* **使用 normalize.css 开始主样式表**。该样式表位于 http://necolas.github.com/normalize.css/(最新版本使用 Download按钮)。它并非对所有样式进行置，**而是对默认样式进行微调**，这样它们在不同的浏览器中具有相似的外观。




### 时钟顺序

对 padding、margin、 border 设置四个值时，这些值会按照时钟顺序应用于上、右、下、左四个边。



### Web开发相关工具

px转换为em ：[PXtoEM.com: PX to EM conversion made simple.](http://pxtoem.com/ "PXtoEM.com: PX to EM conversion made simple.")





### 个人理解

一次设置（node.js>blog项目）

祖先 `.menu` 的padding小于后代padding，导致后代产生了溢出。

```css
.menu{
    border-top: 5px solid orangered;
    padding: 4px; /* 将其改为至少 10px*/
}

.menu a{
    padding: 10px;
    font-size: 20px;
}
```









