# HTML与CSS学习

Emmet的一些快捷方式: 
html:5 加 Tab键
快捷输入标签： script加Tab键
指定css文件： link:css加Tab键



命名习惯：

文件名(包括文件夹名也一样)全部使用小写字母，用短横线分隔单词，用 .html 作为扩展名。



项目结构：

```
图片文件夹：images 或 img
样式表文件： css 或 styles 
```



## 1.HTML结构
每个HTML文档都应该包含以下基本成分：
```html
<!DOCTYPE html>							//声明页面为HTML5文档
<html lang="zh_CN">						//文档的实际HTML部分，页面内容默认语言代码
<head>										//网页文档头部
	<meta charset="utf-8" />				//字符编码（空格和/是可选的）
	<title></title>							//页面标题：出现在窗口标题栏和浏览器标签页中
</head>
<body>										//页面主体

</body>
</html>
```

>`p`为元素；`<p>文本</p>`为标签

#### 网页的两个部分：head和body

在文档head部分：

- 通常要指明页面标题；
- 提供为搜索引擎准备的关于页面本身的信息；
- 加载样式表；
- 以及加载JS文件。

body元素：

- 包含页面的内容
- 文本
- 图像
- 表单
- 音频
- 视频
- 以及其他交互式内容


#### 普通页面构成

常用的一种布局：
```
------------------------------------------------
带导航的页头
------------------------------------------------
						|				|
主页面内容区    		|  相关但较		|
						| 为次要的信息	|
-------------------------------------------------
页脚
-------------------------------------------------
```

<p><b>一般普通页面的构成:</b></p>
<ul>
    <li>带导航的页头。header页眉、nav标记导航。</li>
    <li>主页面内容区。main主要区域、article文章、section定义区块(内容相似的主题，通常包含一个标题)、div通用容器。</li>
    <li>附注栏。aside指定附注栏。</li>
    <li>页脚。footer创建页脚。</li>
</ul>

ARIA：无障碍的富互联网应用
 ARIA role 属性；提供对屏幕阅读器支持

 **一些可用的地标角色：**

| 地标角色                         | 如何使用及何时使用             |
| ---------------------------- | --------------------- |
| role="banner" (横幅)           | 用在header元素中，每个页面只用一次  |
| role="navigation" (导航)       | 与nav元素是对应关系。添加到nav元素中 |
| role="main" （文档主要内容）         | 与main元素对应 ...         |
| role="complementary" （补充性内容） | aside元素               |
| role="contentinfo" (内容信息)    | 页脚footer元素            |



#### meta标签



viewport：

scale：比例

浏览器中用于呈现网页的区域叫视口(viewport)。视口通常并不等于屏幕大小,特别是可以缩放浏览器窗口的情况下。



**viewport属性：**

viewport 有尺寸、响应、缩放三层含义

[**meta标签中viewport属性的含义**](http://www.sjzphp.com/webdis/viewport.html "meta标签中viewport属性的含义")

[移动端 viewport 标签背后的三层含义 - 前端 - 掘金](https://juejin.im/entry/581efd690ce46300588d44f6 "移动端 viewport 标签背后的三层含义 - 前端 - 掘金")



一个示例：

```html
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
```

该meta标签的作用是让当前viewport的宽度等于设备的宽度，同时不允许用户手动缩放。




| 属性            | 说明                                       |
| ------------- | ---------------------------------------- |
| width         | 设置**layout viewport**  的宽度，为一个正整数，或字符串"width-device" |
| initial-scale | 设置页面的初始缩放值，为一个数字，可以带小数                   |
| minimum-scale | 允许用户的最小缩放值，为一个数字，可以带小数                   |
| maximum-scale | 允许用户的最大缩放值，为一个数字，可以带小数                   |
| height        | 设置**layout viewport**  的高度，这个属性对我们并不重要，很少使用 |
| user-scalable | 是否允许用户进行缩放，值为"no"或"yes", no 代表不允许，yes代表允许 |





#### 添加注释

`<!-- -->`

#### 创建分级标题
注意事项：避免跳过某些级别。
<h1>h1</h1>
<h1>h2</h1>
<h1>h3</h1>
<h1>h4</h1>
<h1>h5</h1>
<h1>h6</h1>

#### 创建页眉和标记导航

```html
<body>
<header role="banner">
	<nav role="navigation">
		<ul>
			<li><a href="#gaudi">位置1</li>
			<li></li>
		</ul>
	</nav>
</header>

</body>
```

#### 标记页面的“主要区域” 和 “创建文章”
使用**main元素**，该元素在一个页面只能有一个。




```html
...
<body>
	<header>...</header>

	<main role="main">
		<article>
			<h1></h1>
			<p></p>
			...
		</article>
	</main>
</body>
```

#### 文章

**创建文章article元素**：
其内容可以是段落、列表、音频、视频、图形、图像等。
可以将 article 嵌套在另一个 article中
一 个 页 面 可 以 有 多 个 article 元 素(也可以没有)
article 和section 元 素可以相互包含。

```HTML
...
<article>
	<h1>The Diversity of Papua New Guinea
	</h1>
	<p>Papua New Guinea is home to more than 800 tribes and languages ...</p>
	
	... [其余内容] ...
	
	<!-- 文章的页脚,并非页面级的页脚 -->
	<footer>
		<p>Leandra Allen is a freelance journalist who earned her degree in anthropology from the University of Copenhagen.</p>
		<address>
			You may reach her at <a href="mailto:leandra@therunningwriter.com">
			leandra@therunningwriter.com</a>.
		</address>
	</footer>
</article>
...

```

 每条读者评论都包含在一个 article里,这些 article 元素则嵌套在主 article 里：
```html
...
<article>
	<h1>The Diversity of Papua New Guinea</h1>
	... [父元素article内容] ...
	<footer>
		... [父元素article页脚] ...
	</footer>
	
	<section>
		<h2>Reader Comments</h2>
		
		<article>
		<footer>travelgal wrote on <time datetime="2014-02-26"> February 26, 2014</time>: </footer>
		<p>Great article! I've always been curious about Papua New Guinea.</p>
		</article>
		
		<article>
			... [下一则读者评论] ...
		</article>
		
	</section>
</article>
...

```



#### 定义区块
section元素：
section代表文档或应用的一个一般的区块。它是有相似主题的一组内容，通常包含一个标题。
section 标记的是页面中的特定区域,而 div 则不传达任何语义。

section 和 article 的区别在于,section 在本质上组织性和结构性更强,而 article 代表的是自包含的容器。


```html
...
<body>
...
<main role="main">
	<h1>Latest World News</h1>

	<section>
	<h2>Breaking News</h2>
	<ul>... [标题列表] ...</ul>
	</section>

	<section>
	<h2>Business</h2>
	<ul>... [标题列表] ...</ul>
	</section>

	<section>
	<h2>Arts</h2>
	<ul>... [标题列表] ...</ul>
	</section>
</main>
 ...
</body>
</html>
 
```

>如果只是出于添加样式的原因要对内容添加一个容器,应使用 div 而不是 section 。


#### 指定附注栏
aside元素用于表示在页面中与主体内容相关性没有那么强,但可以独立存在的一部分内容。
使用aside元素的例子还包括重要引述、侧栏、指向相关文章的一组链接、广告、nav元素组(如博客的友情链接)、相关产品列表，等等。

aside 可以嵌套在主要内容里面(则其中的内容应与其所在的内容密切相关,而不是仅与页面整体内容相关。),也可以位于主要内容外面


```html
...
<body>
<header role="banner">
	<nav role="navigation">
		... [包含多个链接的ul] ...
	</nav>
</header>

<main role="main">
	<article>
		<h1 id="gaudi">Barcelona's Architect</h1>
		
		... [文章的其他部分] ...
	</article>
</main>

<aside role="complementary">
	<h1>Architectural Wonders of Barcelona</h1>
	
	<p>Barcelona is home to many architectural wonders in addition to Gaudí's work. Some of them include:</p>
	<ul>
		<li lang="es">Arc de Triomf</li>
		<li>The cathedral <span lang="es">(La Seu)</span></li>
		<li lang="es">Gran Teatre del Liceu</li>
		<li lang="es">Pavilion Mies van der Rohe</li>
		<li lang="es">Santa Maria del Mar</li>
	</ul>
	
	<p><small>Credit: <a href="http://www.barcelona.de/en/barcelona-architecture-buildings.html" rel="external"><cite>Barcelona.de</cite></a>.</small></p>
</aside>
</body>
</html>
```

出于SEO和可访问性目的，最好将重要内容放在前面。所以应将main放在前，aside放在后面。可以通过CSS改变它们的显示顺序。


```html
<!-- 这个附注栏没有嵌套在主要内容中 -->
<aside>
	<h2>Other Projects</h2>
	<nav>
		<ul>
			<li><a href="habitat-for-humanity.html">Habitat for Humanity brochure</a></li>
			<li><a href="royal-philharmonic.html">Royal Philharmonic Orchestra website</a></li>
			...
		</ul>
	</nav>
</aside>
```

#### 创建页脚
footer 元素代表嵌套它的最近的 article 、aside 、 blockquote 、 body 、 details 、fieldset、figure、nav、section 或 td 元 素的 页 脚。 只 有 当 它 最 近 的 祖 先 是 body 时,它 才 是 整 个 页 面 的 页 脚

页脚通常包含关于它所在区块的信息,如指向相关文档的链接、版权信息、作者及其他类似条目


#### 创建通用容器
div通用容器,一个完全没有任何语义含义的容器。

 span 是与 div 对应的一个元素: div 是块级内容的无语义容器,而 span则是短语内容的无语义容器,例如它可以放在段落元素 p 之内。


#### 为元素指定类别或ID名称
id：唯一的标识符。
class：类别

css和javascript用到这两者。


#### 为元素添加title属性
注意：这里是**属性**。而非title元素。

可以使用 title 属性(不要与 title 元素混淆)为网站上任何部分加上提示标签。加上它们后可以提升无障碍访问功能（屏幕阅读器会朗读其title文本）。不过,它们并不只是提示标签。

```html
<ul title="Table of Contents">
	<li><a href="#gaudi" title="Learn about Antoni Gaudí">Barcelona's Architect </a></li>
	...
</ul>
```

 可以为任何元素添加 title,不过用的最多的是链接。当访问者将鼠标指向加了说明标签的元 素 时, 就 会 显 示 title。


### 2.文本
#### 段落p
HTML 会忽略你在文本编辑器中输入的回车符和其他额外的空格。**要在网页中开始一个新的段落,**应该使用 p 元素。

#### 标记重要和强调的文本 strong和em
strong：表示内容的重要性。通常显示为粗体。
em：表示内容的着重点。通常显示为斜体。

em 用于所有层次的强调,strong 用于表示重要性,而其他情况则使用 b 和 i。

 HTML5 强调, b 和 i 应该是其他元素(如strong、em、cite 等)都不适用时的最后选择。



#### 创建图figure
通常,图是由页面上的文本引述出来的。
图可以是图表、照片、图形、插图、代码片段,以及其他类似的独立内容。

figcaption 是figure 的标题,可选,出现在 figure 内容的开头或结尾处，不管figure里面有多少内容，都只运行有一个figcaption。

```html
	<figure>
		<figcaption><b>Figure 3:</b> Breakdown of Revenue by Industry</figcaption>
		<img src="chart-revenue.png" width="180" height="143" alt= "Revenue chart: Clothing 42%, Toys 36%, Food 22%" />
	</figure>
```

#### 指明引用或参考cite

#### 引述文本blockquote或q
blockquote元素：表示单独存在的引述（通常更长）**它默认显示在新的一行**。引述块级文本。
q元素：用于短的引述，如句子里面的引述。浏览器应对 q 元素中的文本自动加上特定语言的**引号**。引述行内文本。


#### 指定时间 time

	<time datetime="03-28">March 29th</time>
	<time datetime="2014-07-16">16</time>

需指定“有效的时间格式”。datetime属性是可选的。

#### 解释缩写词abbr
abbr元素：

	<abbr title="缩写词全称"></abbr>

另直接使用括号提供缩写词的全称，更加直观，能够让更多访问者看到。
​	

#### 定义术语dfn
仅用 dfn 包围要定义的术语,而不是包围定义。


#### 创建上标和下标 sup、sub

 sup 元素的一种用法就是表示脚注编号。

```html
 proliferation at theUnited Nations <a href="#footnote-2" title="Read footnote 2"><sup>2</sup> </a>
 
 <footer>
	<p id="footnote-1"><sup>1</sup>It means Paul in English.</p>
	<p id="footnote-2"><sup>2</sup>In 1963, I believe.</p>
</footer>
```

sub 和 sup 元素会轻微地增大行高。幸好,用一点 CSS 就可以修复这个问题


#### 添加作者联系信息address
实际上,没有专门用于标记通讯地址的 HTML 元素。
address 元 素 是 用 以 定 义 与HTML 页面或页面一部分,有关的作者、相关人士或组织的联系信息,通常位于页面底部或相关部分内。


#### 标注编辑和不再准确的文本ins和del
有时可能需要将在**前一个版本之后**对页面内容的编辑标出来,或者对不再准确、不再相关的文本进行标记。

代表添加内容的 ins 元素和标记已删除内容的 del 元素。
浏览器通常对已删除的文本加上删除 线,对插入的文本加上下划线。


s 元素用以标注不再准确或不再相关的内容(一般不用于标注编辑内容)


#### 标记代码code
如果你的代码需要显示`<`或`>`，应分别使用`&lt;`和`&gt;`。

code文本通常显示为等宽字体。



#### 预格式化的文本pre
用于保留文本固有的的回车和空格。

pre元素默认从新一行开始显示。


#### 突出显示文本mark
通常表现成使用荧光笔标记的效果。


应用示例：

- 对搜索结果页面或文章中的搜索词进行突出显示
- 引起对代码片段的注意

```html
<blockquote>
	<p>Remove the ... for <mark>15 minutes</mark>,rotating ... </p>
	...
</blockquote>
```

#### 创建换行br
br

#### 创建span
同div一样，span元素是没有任何语义的。而span只适合包围字词或短语内容。


#### u元素
以前,u 元素用来为文本添加下划线。现在,u 元素用于非文本注解

#### wbr元素
HTML5 为 br 引入了一个相近的元素, 称为 wbr。它代表“一个可换行处”。可以在 一个较长的无间断短语(如 URL)中使用该 元素,表示此处可以在必要的时候进行换行, 从而让文本在有限的空间内更具可读性。因 此,与 br 不同,wbr 不会强制换行,而是让 浏览器知道哪里可以根据需要进行换行。

#### 内容显示方向bdi和bdo
略

#### meter元素





#### progress元素
进度条



### 3. 图像


#### 图像压缩形式

- 有损格式：在将图像保存为有损格式时会丢失部分原始信息。但可以将损失控制在用户不易觉察的范围，以改善加载速度。
- 无损格式：采用无损格式对图片进行压缩时不会造成品质的损失。


#### 图像格式对比

| 格式     | 用法                                   | 颜色      | 索引色(基本)透明 | alpha透明 |
| ------ | ------------------------------------ | ------- | --------- | ------- |
| JPEG   | 适用与大多数的照片，以及其他颜色较多且可接受一些质量损失的图像      | 1600万以上 | ——        | ——      |
| PNG-8  | 适用于标识、重复的图案以及其他颜色较少的图像或具有连续颜色的图像     | 256     | 支持        | 支持      |
| PNG-24 | 与PNG-8相似，不过支持更多的图像。适用于颜色丰富且质量要求较高的照片 | 1600万以上 | 支持        | ——      |
| PNG-32 | 与PNG-24相似，不过支持具有alpha透明的图像           | 1600万以上 | ——        | 支持      |
| GIF    | 用法与PNG-8相似，在大多数情况应适用PNG-8            | 256     | 支持        | ——      |

**JPEG图像：**

- 适用于彩色**照片**
- 是有损格式；图片更小，加载快
- 大多数情况使用jpeg
- 不支持透明度

**PNG图像：**

- 文件比jpeg更大
- 只有在压缩造成的质量损失不可忽视时才使用PNG保存照片。
- 更适用与保存**非照片**类的图像，如标识、图案、图像文字。
- 支持透明度


**图标字体与SVG**
- 对与单色的图标，建议使用图标字体
- 对于标识和其他**非照片**类图像可以考虑使用SVG


#### 图片尺寸
打印出来的图像通常比显示器上看到的 要小一些。打印机的每英寸点数(dpi)通常 比显示器的每英寸像素数(ppi)要多。屏幕 分辨率变大加剧了这一情形。

有时,为了产生视觉冲击,我们可能需要使 用一张达到或超过整个网站内容宽度的大图。 这样的图像通常不超过 960 像素宽


#### 透明度:

索引色透明：一个像素要么是透明的，要么是不透明的。（图像边缘可能出现锯齿）
alpha透明：可以控制一个像素透明的程度，可以是部分透明。(图像边缘更平滑)



#### 在页面中插入图像img
img元素； alt属性；
格式：
```html
<img src="image.url">
<img src="image.url" alt="图片未能加载时的替代文本">
<img src="image.url" width="x" height="y">
```

#### width、height属性指定图像尺寸

**注意：**
如果指定图像的尺寸,浏览器就可以预 留空间,在图像加载的同时让文本显示在周 围,保持布局的稳定。

示例：将图片的显示尺寸指定为图像原始尺寸的一半

通过为图像指定新的高度和宽度(以像 素为单位),可以改变图像显示的尺寸。
由于图像的高度和宽度**比例保持不变**,图像就 **不会失真**。
显示的图像只有原图的一半大小。不过 要注意,**加载**它需要花的时间跟以前是一样的。毕竟,用的是同一个文件。


#### 为网站添加图标

示例：两个分别为16x16和32x32的favicon.ico图标

ICO 文件允许在**同一个文件中包含多个不同尺寸的同名文件**。

>为触屏设备添加图标。比如： apple-touch-icon.png图标文件。

将图标图像放在网站的根目录里。浏 览器会自动在根目录寻找这些特定的文件名, 找到后就将图标显示出来。





### 4. 链接a
#### 创建指向另一个网页的连接

```html
<a href="page.html">标签文本或图像，可以是任何元素或元素组(块级链接)</a>
```


链接中的title属性：

访问者将 鼠标移到指向其他网站的链接上时,目标 URL 会 出现在状态栏里,title 文字(如果指定了的话) 也会显示在链接旁边。


>每按一次 Tab 键,焦点就会转移到 HTML 代码中出现的下一个链接、表单控件或图像映
>射(每按一次 Shift+Tab,焦点就会向前转移)。这个顺序不一定与屏幕上出现的顺序一致,
>因为页面的 CSS 布局可能不同。

#### 定义连接的打开方式target属性

* _blank 在一个新的窗口中打开链接
* _seif  （默认）   在当前窗口中打开链接



#### 创建锚并链接到锚

创建锚：为元素添加`id="anchor-name"`。
链接到锚：`<a href="#anchor-name">文字</a>`。
如果锚位另一个文档: `<a href="page.html#anchor-name">文字</a>`

#### 创建其他类型的链接
比如：互联网上的任何文件，电子邮件，电话号码。

```html
<a href="http://www.site.com/dir/file.ext">文字</a>
<a href="mailto:name@domain.com">文字</a>
<a href="tel:+电话号码">文字</a>
```

避免直接使用这种链接到电子邮箱的链接。



## 字符实体




**常用的**


| 字符   | 实体符号       | 说明      |
| ---- | ---------- | ------- |
|      | `&nbsp;  ` | 空格      |
| &    | `&amp;   ` | and符号，与 |
| "    | `&quot;  ` | 引号      |
| <    | `&lt;    ` | 小于号     |
| >    | `&gt;    ` | 大于号     |
| ©    | `&copy;  ` | 版权标志    |
| ®    | `&reg;   ` | 注册标志    |
| ™    | `&trade; ` | 商标标志    |
| ¥    | `&yen; `   |         |
| $    | `$`        | 美元      |
| “    | `&ldquo; ` | 左双引号    |
| “    | `&ldquo; ` | 左双引号    |
| ”    | `&rdquo; ` | 右双引号    |
| ‘    | `&lsquo; ` | 做单引号    |
| ’    | `&rsquo; ` | 右单引号    |
| «    | `&laquo; ` | 左三角双引号  |
| »    | `&raquo; ` | 右三角双引号  |
| ‹    | `&lsaquo;` | 左三角单引号  |
| ›    | `&rsaquo;` | 右三角单引号  |
| §    | `&sect;  ` | 章节标志    |
| ¶    | `&para;  ` | 段落标志    |
| •    | `&bull;  ` | 列表圆点（大） |
| ·    | `&middot;` | 列表圆点（中） |
| …    | `&hellip;` | 省略号     |
| \|   | `        ` | 竖线      |
| ¦    | `&brvbar;` | 断的竖线    |
| –    | `&ndash; ` | 短破折号    |
| —    | `&mdash; ` | 长破折号    |



**数学类**


| 字符   | 实体符号       | 说明    |
| ---- | ---------- | ----- |
| <    | `&lt;    ` | 小于号   |
| >    | `&gt;    ` | 大于号   |
| ≤    | `&le;    ` | 小于等于号 |
| ≥    | `&ge;    ` | 大于等于号 |
| ×    | `&times; ` | 乘号    |
| ÷    | `&divide;` | 除号    |
| −    | `&minus; ` | 减号    |
| ±    | `&plusmn;` | 加/减 号 |
| ≠    | `&ne;    ` | 不等于号  |
| ¹    | `&sup1;  ` | 上标1   |
| ²    | `&sup2;  ` | 上标2   |
| ³    | `&sup3;  ` | 上标3   |
| ½    | `&frac12;` | 二分之一  |
| ¼    | `&frac14;` | 四分之一  |
| ¾    | `&frac34;` | 四分之三  |
| ‰    | `&permil;` | 千分率   |
| °    | `&deg;   ` | 度     |
| √    | `&radic; ` | 平方根   |
| ∞    | `&infin; ` | 无限大   |



**方向类**

| 字符    | 实体符号       | 说明   |
| ----- | ---------- | ---- |
| ←     | `&larr;  ` | 左箭头  |
| ↑     | `&uarr;  ` | 上箭头  |
| →     | `&rarr;  ` | 右箭头  |
| ↓     | `&darr;  ` | 下箭头  |
| ↔     | `&harr;  ` | 左右箭头 |
| ↵     | `&crarr; ` | 回车箭头 |
| ⌈     | `&lceil; ` | 左上限  |
| **⌉** | `&rceil; ` | 右上限  |
| **⌊** | `&lfloor;` | 左下限  |
| **⌋** | `&rfloor;` | 右下限  |



**其它**

| 字符   | 实体符号       | 说明    |
| ---- | ---------- | ----- |
| ♠    | `&spades;` | 黑桃    |
| ♣    | `&clubs; ` | 梅花    |
| ♥    | `&hearts;` | 红桃，心  |
| ♦    | `&diams; ` | 方块牌   |
| ◊    | `&loz;   ` | 菱形    |
| †    | `&dagger;` | 匕首    |
| ‡    | `&Dagger;` | 双剑号   |
| ¡    | `&iexcl; ` | 反向感叹号 |
| ¿    | `&iquest;` | 反向问号  |







## 跨浏览器问题





> Bootstrap 使用 [Normalize](http://necolas.github.io/normalize.css/) 来建立跨浏览器的一致性。Normalize.css 是一个很小的 CSS 文件，在 HTML 元素的默认样式中提供了更好的跨浏览器一致性。



## HTML5绘图

[HTML5绘图-HTML5绘图教程-麦子学院](http://www.maiziedu.com/course/596/ "HTML5绘图-HTML5绘图教程-麦子学院")






