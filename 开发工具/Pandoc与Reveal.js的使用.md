# Pandoc中使用Reveal.js制作幻灯片

> 工具：Typora (markdown编辑器) + Pandoc + reveal.js
>
> 如果需要使用 pandoc 命令，则需将 pandoc 添加到 path 环境变量中



主要讲： markdown -> 幻灯片



## Pandoc介绍






pandoc如果没有指定输入文件则从stdin读取，并且使用stdout作为默认输出。可以使用 `-o`选项指定输出文件：

```
pandoc -o output.html input.txt
```



> pandoc 自行安装



### 文件转换

> 官方提供了各种转换示例：[Pandoc - Demos](http://pandoc.org/demos.html "Pandoc - Demos")
>
> 还可在线尝试 Pandoc：[Try pandoc!](http://pandoc.org/try/ "Try pandoc!")



直接使用 pandoc 命令（使用其默认模板）



**转换为word：**

```
pandoc -f markdown -t docx file.md -o file.docx
```


**转换为 html：** 

```
pandoc file.md -o file.html -s
```



**转换为pdf：**


```
pandoc test.txt -o test.pdf
```

直接使用pandoc，遇到如下提示：

```
pdflatex not found. Please select a different --pdf-engine or install pdflatex
```





直接使用pandoc命令，使用的是其默认的模板，往往得不到自己想要的效果，所以建议利用 Typora 完成markdown 到其它文件格式的转换。使用 Typora 调用 Pandoc，好处就是转换后的文档格式就是Typora中所显示的格式。




比如中Typora中markdown与word的互转： 

在Typora中：`Typora > 文件 > 导入/导出` 选择 word格式即可。（markdown中的数学公式可以转换到word中。）





> Pandoc具有模块化设计：它由一系列读出器和一系列编写器组成的，读出器用于以给定格式分析文本并生成一份此文档的本地表示，编写器则用于将这份本地表示转换为目标格式。因此，增加某种输入或输出格式只需要增加一个读出器或编写器就可以了。 
>
> 查看转换为pdf使用的默认模板：
>
> ```shel
> pandoc -D latex
> ```





### 转换为幻灯片(slides)



目前Pandoc包含了对五种HTML幻灯片框架的支持：

- [DZSlides](https://github.com/paulrouget/dzslides)
- [Slidy](http://www.w3.org/Talks/Tools/Slidy2/)
- [S5](http://meyerweb.com/eric/tools/s5/)
- [Slideous](http://goessner.net/articles/slideous/slideous.html)
- [**reveal.js**](http://lab.hakim.se/reveal-js)

当然，你实际上可以使用任何喜欢的幻灯片框架，只要让Pandoc在渲染HTML时使用你指定的模板（使用`-t`选项）即可。

使用dzslides，转换为ppt 的示例：

```
pandoc slides.md -o slides.html -t dzslides -s
```



> 选项 `-s` 的作用：(表示不理解)
>
> By default, pandoc produces a document fragment. To produce a standalone document (e.g. a valid HTML file including `<head>` and `<body>`), use the `-s` or `--standalone` flag:
>
> 另：使用-s / - standalone选项时，pandoc使用模板添加自立文档所需的页眉和页脚材料 
>
> ```
> pandoc -s -o output.html input.txt
> ```
> 在直接转换成html文件的时候感觉加不加`-s`没啥大的区别，但在制作幻灯片时必须加 `-s`选项
>
> ```
> HTML fragment:
> pandoc README -o example1.html
> 
> Standalone HTML file:
> pandoc -s README -o example2.html
> ```
>
> 





在这些框架中 Reveal.js 的设计风格（字体、HTML5/CSS3效果）比起前面几个框架更加现代，所以推荐使用 Reveal.js。

虽说reveal.js本身就提供对Markdown语法的支持.。不过使用Pandoc的好处很明显，那就是一条命令解决问题，不需要用户接触任何HTML，使用简单。缺点就是需要安装 pandoc ，而reveal.js只有几M大小的Js文件而已，且使用 reveal.js 可以更容易进行深度定制。


下文将介绍 reveal.js 的使用。






## 直接使用Reveal.js



下载 reveal.js文件里面提供了一个模板文件 index.html 和 一个示例文件 demo.html 。

我们在创建幻灯片时，可以复制`index.html`文件内容，并在其基础上更改，找到文件中类似下面的标签，并在里面添加幻灯片。



```html
		<div class="reveal">
			<div class="slides">
				<section>Slide 1 幻灯片1的内容</section>
				<section>Slide 2 幻灯片2的内容</section>
                  <section data-markdown> 使该幻灯片支持 markdown 语法</selection>
                  <section data-transition="值">为该幻灯片 使用特定转场动画，值可以是：fede，slide，convex，concave，zoom，none</section>
                  <section data-background="#000">为该幻灯片指定背景色</section>
                  <section data-background-image="图片路径">为该幻灯片指定背景图片</section>
                <section data-background-video="视频地址">为该幻灯片指定背景视频</section>
			</div>
		</div>
```

如果还嫌不够，顺便说一句，Reveal.js 支持 javascript，所以其应用场景可不限于传统的演示文稿——如果你想做一个现场投票、幸运转盘抽奖，都没问题。这些有趣的拓展功能都内嵌在你的 Reveal.js 版「PPT」里 。



> 强烈推荐：[reveal-js - Awesomes](https://www.awesomes.cn/repo/hakimel/reveal-js "reveal-js - Awesomes") (中文)
>
> 更详细的使用见文档：[GitHub - hakimel/reveal.js: The HTML Presentation Framework](https://github.com/hakimel/reveal.js) 



## 使用Pandoc和Reveal.js制作幻灯片



转换所用文本（示例文本，标准文本）：

```markdown
% Habits
% John Doe
% March 22, 2005

# In the morning

## Getting up

- Turn off alarm
- Get out of bed

## Breakfast

- Eat eggs
- Drink coffee

# In the evening

## Dinner

- Eat spaghetti
- Drink wine

------------------

![picture of spaghetti](images/spaghetti.jpg)

## Going to sleep

- Get in bed
- Count sheep
```


> 该文本来自： [Pandoc - Pandoc User’s Guide](http://pandoc.org/MANUAL.html#producing-slide-shows-with-pandoc "Pandoc - Pandoc User's Guide")
>
> 
>
> 为了让Pandoc对不包含任何元信息的Markdown文本进行处理生成幻灯片，在文本开头需要包含三行以%打头的元信息：标题、作者和日期。 





首先需要从GitHub上获取<https://github.com/hakimel/reveal.js>，并将`reveal.js`同名的文件夹放在幻灯片所在目录下即可：

使用git克隆，或者直接下载reveal.js的压缩包.
```
$ git clone https://github.com/hakimel/reveal.js
```




渲染幻灯片：

```
$ pandoc slides.md -o slides.html -t revealjs -s
```

除了默认的外观主题以外，reveal.js 还提供了多个主题可供选择见下文

```
$ pandoc slides.md -o slides.html -t revealjs -s -V theme=beige
```






> 如果你用于转换的markdown文件格式不符合要求，可能会出现如下警告：
>
>  ```
>  pandoc Pandoc.md -o slides.html -t revealjs -s -V theme=night
> [WARNING] This document format requires a nonempty <title> element.
>   Please specify either 'title' or 'pagetitle' in the metadata.
>   Falling back to 'Pandoc'
>  ```



> `-V`选项：
>
> 模板包含变量（variables），它的作用是允许在文件中的任何位置包含任意信息。 可以使用`-V / - variable`选项在命令行中设置它们 。
>
> 如果未设置变量，pandoc将在文档的元数据中查找对应的值。元数据 可以使用[YAML metadata blocks](http://pandoc.org/MANUAL.html#extension-yaml_metadata_block) 或`--metadata`选项进行设置。 
>
> YAML metadata blocks：就是出现在文档顶部，且使用两个 `---` 包围起来的部分。





### 几个常用变量



所有演示文稿都有一个普通的尺寸，也就是当前浏览器的分辨率。为了保证所有元素都适应任何给定的视口， 该框架将会自动均匀地缩放演示文稿。 



```json
    // 是否在右下角展示控制条
    controls: true,

    // 是否显示演示的进度条
    progress: true,

    // 是否显示当前幻灯片的页数
    slideNumber: false,

    // 是否将每个幻灯片改变加入到浏览器的历史记录中去
    history: false,

    // 是否启用键盘快捷键来导航
    keyboard: true,

    // 是否启用幻灯片的概览模式
    overview: true,

    // 是否将幻灯片垂直居中
    center: true,

    // 是否在触屏设备上启用触摸导航
    touch: true,

    // 是否循环演示
    loop: false,

    // 是否将演示的方向变成 RTL
    rtl: false,

    // 全局开启和关闭碎片
    fragments: true,

    // 标识演示文稿是否在嵌入模式中运行，即包含在屏幕的有限部分中的
    embedded: false,

    // 标识当问号键被点击的时候是否应该显示一个帮助的覆盖层
    help: true,

    //  两个幻灯片之间自动切换的时间间隔（毫秒），当设置成 0 的时候则禁止自动切换，该值可以被幻灯片上的 ` data-autoslide` 属性覆盖
    autoSlide: 0,

    // 当遇到用户输入的时候停止切换
    autoSlideStoppable: true,

    // 是否启用通过鼠标滚轮来导航幻灯片
    mouseWheel: false,

    //  是否在移动设备上隐藏地址栏
    hideAddressBar: true,

    // 是否在一个弹出的 iframe 中打开幻灯片中的链接
    previewLinks: false,

    // 切换过渡效果
    transition: 'default', // none/fade/slide/convex/concave/zoom

    // 过渡速度
    transitionSpeed: 'default', // default/fast/slow

    // 全屏幻灯片背景的过渡效果
    backgroundTransition: 'default', // none/fade/slide/convex/concave/zoom

    // 除当前可见的之外的幻灯片数量
    viewDistance: 3,

    // 视差背景图片
    parallaxBackgroundImage: '', // e.g. "'https://s3.amazonaws.com/hakim-static/reveal-js/reveal-parallax-1.jpg'"

    // 视差背景尺寸
    parallaxBackgroundSize: '', // CSS syntax, e.g. "2100px 900px"

    // 移动视差背景（水平和垂直）滑动变化的数量, 例如100
    parallaxBackgroundHorizontal: '',
    parallaxBackgroundVertical: ''

});
```







### 幻灯片的分隔依据

> 内容整理自： [Pandoc - Pandoc User’s Guide](http://pandoc.org/MANUAL.html#producing-slide-shows-with-pandoc "Pandoc - Pandoc User's Guide")



默认情况下，*幻灯片级别*是层次结构中的最高标级别，**后面紧跟内容**，而不是文档中某处的一个标题。在上面的示例中，级别1标题后面始终跟有2级标题，后跟内容，因此2是幻灯片级别。 



> 1级标题In the morning后面紧跟2级标题Getting up，而2级标题Getting up后面的内容是显示在幻灯片上的主体内容，因此这里的Slide level为2。这意味着每个2级标题生成一张幻灯片。高于2级的标题（1级标题）生成一张独立的仅包含标题的幻灯片，而低于2级的标题（3级标题）将存在于上一级标题的幻灯片中，不单独生成新的幻灯片.
>
> 可以使用--slide-level选项覆盖默认的Slide level。 
>
> 在reveal.js模板下，由于幻灯片的滚动方向可以是二维的（键盘→←↑↓），所以1级标题渲染为水平方向的幻灯片，2级标题渲染为竖直方向的幻灯片。 
>
>  为了生成合适的用于演示的HTML文档，需要记住的另一点是：在默认情况下每个二级标题是一张独立的幻灯片。这样在写作的时候，只需注意把每个二级标题下的内容控制在适当的长度。 





这里幻灯片的布局格式：

```
+---------+     +---------+    +---------+
|         |     |         |    |         |
+---------+     +---------+    +---------+

+---------+     +---------+    +---------+
|         |     |         |    |         |
|  slide1 |     |  slide1 |    |  slide1 |
|         |     |         |    |         |
+---------+     +---------+    +---------+

+---------+     +---------+    +---------+
|         |     |         |    |         |
| slide2  |     | slide2  |    | slide2  |
|         |     |         |    |         |
+---------+     +---------+    +---------+
```







根据以下规则将文档划分为幻灯片：



- 水平规则 始终会分割出一个新幻灯片（对应上文的 `----------`），即可以使用分割线来强行生成新的幻灯片。分隔线的使用场景我想因该是当你的内容在一张幻灯片上装不下时使用。
- 幻灯片级别的 **标题** 始终会分割出一个新幻灯片。
- .....（看不懂）







文件编码必须是 utf-8，否则当文件中出现中文时会产生如下错误：

```
pandoc: Cannot decode byte '\xe3': Data.Text.Internal.Encoding.decodeUtf8: Invalid UTF-8 stream
```





### 渐进显示的列表

比如有如下列表：

- 列表项1
- 列表项2

你希望展示时先显示`列表项1`，之后点击向下箭头后再显示`列表项2`，则可使用下面的 `fenced div`语法：



```
::: incremental

- 列表项1i
- 列表项2

:::
```

> 这里 `:::`对表示这是一个 `div`， 而 `incremental`表示它所属的 `class`
>
> ```html
> <div class=incremental>
>     
> </div>
> ```



或者在生成幻灯片时加入`-i`选项，用于控制列表的显示效果（逐条渐入） 

```
$ pandoc slides.md -o slides.html -t revealjs -s -i
```





### 插入暂停

使用带空格的三个点 `. . .`即可插入在两段文字显示之间的人为停顿 

```markdown
## 暂停

暂停之前

. . .

暂停之后
```



> 建议直接复制上面的三个点





### 幻灯片主题



这里所有的配置 [reveal.js configuration options](https://github.com/hakimel/reveal.js#configuration) 都可通过变量形式进行设置。比如主题可以使用 `theme`变量来进行设置：

```
-V theme=moon
```

我们找到上面 url 中所列的 `keyboard`来进行测试：

```
pandoc test01.txt -o slides.html -t revealjs -s  -V theme=simple -V keyboard=false
```

效果是我们在生成的幻灯片中不能使用键盘的方向键来切换幻灯片。



reveal.js的主题： 

- default：（默认）深灰色背景，白色文字
- beige：米色背景，深色文字
- sky：天蓝色背景，白色细文字
- night：黑色背景，白色粗文字
- serif：浅色背景，灰色衬线文字
- simple：白色背景，黑色文字
- solarized：奶油色背景，深青色文字





### 提示板

notes应该是为了给演讲者相应的提示的内容，Notes使用如下格式：

```
::: notes

这是我的笔记.

- 它可以包含 Markdown
- 比如这个列表
- 只有按 s 键，notes才会显示

:::
```

默认看不到notes，只有按 s 键，notes才会显示。



### 并排显示

可以添加多个列，只需将对应的 `div`的`class`设置为`columns`并且为 `width`属性设置值。示例：

```markdown
:::::::::::::: {.columns}
::: {.column width="40%"}
contents...
:::
::: {.column width="60%"}
contents...
:::
::::::::::::::
```



### 设置背景



> **Sorry： 在我的windows中就是提示找不到本地图片，可能路径有问题**
>
> 当使用在线图片是可以显示的，可能会有点慢(在尝试了几次后才加载出来)



**为每个幻灯片设置同一个背景图片：**

使用配置选项 `parallaxBackgroundImage ` ，可以 在YAML元数据块中或作为命令行变量 使用该选项。 

You can also set `parallaxBackgroundHorizontal` and `parallaxBackgroundVertical` the same way and must also set `parallaxBackgroundSize` to have your values take effect. 





**为单独的某个幻灯片设置背景图片：**

在第一个幻灯片级别的头部添加 `{data-background-image="/path/to/image"}`。

add `{data-background-image="/path/to/image"}` to the first slide-level header on the slide (which may even be empty). 



其它的一些 background 设置也可以在单独的某个幻灯片上使用，包括：

 `data-background-size`, `data-background-repeat`, `data-background-color`, `data-transition`, and `data-transition-speed`.

查看 [reveal.js documentation](https://github.com/hakimel/reveal.js#slide-backgrounds) 文档以了解更多细节 ( 一定要看 )。



示例：

```markdown
---
title: My Slideshow
parallaxBackgroundImage: /path/to/my/background_image.png
---

## Slide One

Slide 1 has background_image.png as its background.

## {data-background-image="/path/to/special_image.jpg"}

Slide 2 has a special image for its background, even though the header has no content.
```





> In reveal.js’s overview mode, the parallaxBackgroundImage will show up only on the first slide. 只会在第一个幻灯片上显示





### 代码高亮风格

控制代码高亮风格的选项有：

- --highlight-style pygments
- --highlight-style kate
- --highlight-style monochrome
- --highlight-style espresso
- --highlight-style haddock
- --highlight-style tango
- --highlight-style zenburn

 



[桌面应用|Markdown+Pandoc→HTML幻灯片速成](https://linux.cn/article-4080-1.html "桌面应用|Markdown+Pandoc→HTML幻灯片速成")

