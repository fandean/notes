---
title: "Hugo的zzo主题配置"
date: 2019-11-24
description: "zzo主题配置过程记录"
keywords: ["hugo","hugo主题"]
toc: true
draft: true
comments: true
tags:
- hugo
- 主题
series:
- hugo
categories:
- hugo
---



## zzo主题配置过程

安装方式见，zzo主题的Github：[zzossig/hugo-theme-zzo: Make a blog with hugo zzo theme!](https://github.com/zzossig/hugo-theme-zzo)  本文也需要结合上述链接一同查看。



## 注意事项

Hugo版本要求：建议安装最新的扩展版 hugo-extended

参照官方Readme.md文件，在目录`themes/zzo/exampleSite`运行：

```
hugo server --themesDir ../..
```

如果报错，则建议删除报错文件，或参考：[fail to execute example site · Issue #1 · zzossig/hugo-theme-zzo](https://github.com/zzossig/hugo-theme-zzo/issues/1) 



在该主题中不支持使用 `--minify` 选项，比如运行  `hugo server --gc --minify`  会报错。在部署到某些托管服务器时默认执行的命令为 `hugo --gc --minify`，所以需要去掉该选项。



## 更改网站title和网站图标

网站标题需要在 languafes.toml 中更改，它与具体语言相匹配。

主页Logo旁的文字：``logoText = "就是这个范儿"``

主页logo：通过右键查看图片的方式可知，logo的存放在static目录



## 创建笔记

笔记下的内容使用 defalut 模板

```
hugo new notes/favorites/online-tools.md
```



创建其他

```
hugo new about/index.ko.md
hugo new posts/markdown-syntax.ko.md

# 图库
hugo new --kind gallery gallery/anygalleryname/index.md
```

为某篇文章启用第三方库支持：需要在文章的 front matter中添加 libraries

```yaml
---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}

libraries:
- katex 
- mathjax
- chart
- flowchartjs
- msc
- katex
- mermaid
- viz
- wavedrom
---
```



## 多国语言（待补充）

默认为英语，添加语言的步骤：

- 在配置文件中配置 `languages`
- 编写对应语言的文章，比如 about.ko.md
- 制作一个 i18n 文件

```
# 出现下面错误，未
site config value "zh-CN" for defaultContentLanguage does not match any language definition
```

```
languageCode = "zh-CN"
hasCJKLanguage = true
defaultContentLanguage = "zh-CN"
```

 为每种语言定义菜单 



## 自定义Header

- 先设置Header的显示效果

```toml
# 在 params.toml 文件中
# header有四种显示效果		 文字   图片  幻灯片   空
homeHeaderType = "empty" # text, img, slide , empty
```

- 在配置Header的显示内容

  创建 ` /content/_index.md ` 文件，复制下面的内容

  ```
  ---
  header:
    - type: text
      height: 235
      paddingX: 50
      paddingY: 0
      align: left
      title:
        - header title1
        - header title2
      subtitle:
        - header subtitle1
        - header subtitle2
      titleFontSize: 44
      subtitleFontSize: 16
      spaceBetweenTitleSubtitle: 20
    
    - type: img
      image: images/header/background.png
      height: 235
      paddingX: 50
      paddingY: 0
      align: center
      title:
        - header title1
        - header title2
      subtitle:
        - header subtitle1
        - header subtitle2
      titleFontSize: 44
      subtitleFontSize: 16
      spaceBetweenTitleSubtitle: 20
  
    - type: slide
      height: 235
      slide:
        - paddingX: 50
          paddingY: 0
          align: left
          image: images/header/background.png
          title:
            - header title1
          subtitle:
            - header subtitle1
          titleFontSize: 44
          subtitleFontSize: 16
          spaceBetweenTitleSubtitle: 20
  
        - paddingX: 50
          paddingY: 0
          align: center
          image: images/header/background.png
          title:
            - header title2
          subtitle:
            - header subtitle2
          titleFontSize: 44
          subtitleFontSize: 16
          spaceBetweenTitleSubtitle: 20
  
        - paddingX: 50
          paddingY: 0
          align: right
          image: images/header/background.png
          title:
            - header title3
          subtitle:
            - header subtitle3
          titleFontSize: 44
          subtitleFontSize: 16
          spaceBetweenTitleSubtitle: 20
  ---
  ```

  可以注意到上面有三个 `type:` 值，分别对应到第一步中每种Header显示类型需要显示的内容。



## 添加评论

zzo支持多种评论，这里

- LiveRe评论系统（发现这个韩国的评论系统不错，中文名为 ” [来必力](https://www.livere.com/)”）可以直接用各种社交媒体账号登录
- [Valine](https://valine.js.org/) 也不错，支持匿名留言。但是它基于 [LeanCloud](https://leancloud.cn/)  而使用LeanCloud需要进行实名认证。
- 还有各种基于Github的评论，由于访问不畅，暂时没有考虑

对于 LiveRe评论系统 注册账户后，点击安装👉选择City版👉安装👉填写信息👉申请获取代码 👉 获得相关代码👉 从代码中找到 `data-uid=` 后面的值，粘贴到zzo主题配置文件中

```toml
[livere]
  livereUID = "这个位置"
```

LiveRe的更多功能，可在其管理页面探索。



## 添加Google分析（GA）

问题：为什么要添加 Google 分析？

Google Analytics是独立站运营过程中，必须使用免费工具之一。如果你想做知道，你的网站访客来自哪里，在网站都看了什么，那些网页受欢迎，那些流量得到了比较好的转化。那么谷歌分析肯定可以帮助到您。你可能花费了很多的时间以及金钱，在做错误的关键词优化，错误的广告投放。错误的受众群体。那么谷歌分析可以帮助你避免这些坑。我们通过Google Analytics的数据体现情况，来优化您网站的体验。找到合适的关键词以及受众群体，去优化我们的网站，我们的广告。 

- [Google Analytics（分析）使用入门 ](https://support.google.com/analytics/answer/1008015?hl=zh-Hans) 官方帮助
- [Google Analytics教程,谷歌分析使用方法教程 - 环新网络](https://www.sdwebseo.com/google-analytics-tutorial/)
- [如何有效地使用Google Analytics（分析） | CTMaxs](https://ctmaxs.com/%e7%b6%b2%e8%b7%af%e8%a1%8c%e9%8a%b7/%e5%a6%82%e4%bd%95%e6%9c%89%e6%95%88%e5%9c%b0%e4%bd%bf%e7%94%a8google-analytics%ef%bc%88%e5%88%86%e6%9e%90%ef%bc%89/)
- [客戶是否喜歡你的網站?分析工具Google Analytics教學 | CTMaxs](https://ctmaxs.com/seo%E5%84%AA%E5%8C%96/%E5%A6%82%E4%BD%95%E4%BD%BF%E7%94%A8google-analytics-google-%E5%88%86%E6%9E%90-ga-google-analytics%E6%95%99%E5%AD%B8/) 推荐



创建Google分析账号：

- 输入帐号名称 （帐号可以包含多个跟踪 ID）

  一个Google账号可以创建100个Google分析账号。

  >  在创建账号时有这样一个疑惑：在填写账号名称时它提示 ”账号可以包含多个跟踪ID” 代表什么意思？

- 数据共享设置

- 选择需要衡量的内容

  ```
  您希望衡量哪些内容？ 
   
  网站
  衡量网站
  了解用户的来源并将数据转化为数据洞见
  分析用户行为并针对业务进行优化
  利用效果与转化分析了解趋势信息
  
  Google Apps
  衡量 iOS 或 Android 设备
  了解用户增长情况并深入了解应用行为
  自动记录关键事件或自行指定关键事件
  后续可添加网站数据流以衡量跨平台行为 （测试版）
  
  应用和网站 （测试版）
  跨应用和网站衡量用户
  探索以用户为中心的跨平台分析技术
  不需要编写代码即可完成事件配置，各种报告无需配置即可使用，让您可以快速上手
  如果您已经在自己的网站上使用 gtag.js 或跟踪代码管理器，则无需重新添加代码即可完成部署
  ```

- 网站名称，URL，行业，时区 （会自动为其创建一个媒体资源）

- 在管理界面，点击“跟踪代码”，就可看到代码和跟踪ID

- 将跟踪代码部署到你要**跟踪的每个页面上** （可以使用工具）



对于zzo主题，只需将跟踪ID粘贴到此处即可：

```toml
[marketing]
  google_analytics = "UA-853333376-1" # Google分析
  google_tag_manager = ""             # Google跟踪代码管理器（GTM）
```





如何 引荐 网站的



浏览器插件：

- Tag Assistant  就会告诉您存在哪些标签，报告我们发现的任何错误并提出可以对您的实现进行改进的建议。检查了大多数Google标签，包括Google Analytics（分析），Adwords转换跟踪，Google Tag Manager等。使用Google Tag Assistant记录来记录进出您的网站的典型用户流量，并立即验证，诊断和解决Google Analytics（分析）实施中的问题。 
- SEOquake
- SimilarWeb
- Keywords Everywhere：需要付费

> 除了Google分析还有其他分析，比如推特分析
>
> [認識SEO排名的殺手，『重複內容』完整攻略』 | Harris先生](http://www.yesharris.com/content-duplicate-issue/)

 Google Tag Manager（GTM） ， Tag Management（监测代码管理）  Google跟踪代码管理器（GTM）  tag在GTM中文版本翻译成“代码”） 【感觉Tag Assistant和它也有关系】



### 添加Google ads (广告)





##  添加Google跟踪代码管理器（GTM）

 创建一个GTM代码管理器帐户 



 注意：请勿将GA代码与GTM代码一起放在网页上。如果这样做，系统将认为页面浏览量是2次，而不是1次。 





## 自定义字体

复制zzo主题下的data目录下的 font.toml 到网站的 data目录中，进行更改；比如将所有字体全部更改为下面的字体栈

```toml
single_contents = "'Apple Color Emoji','Segoe UI Emoji','Segoe UI Symbol','Segoe UI','PingFang SC','Hiragino Sans GB','Microsoft Yahei',sans-serif"
```

但在该主题的 `assets/sass/pages/_single.scss` 文件的 table 中还是因编码了一个字体`Montserrat` 需要手动更改。或者在自定义sass中修改。

下面还有一份代码字体栈：

```
mononoki,"Cascadia Code",Consolas,"ubuntu mono",monospace
```



自定义字体不需要在 hugo 的配置文件中引用的原因是，hugo的覆盖机制，font.toml直接覆盖了主题中对应位置下的同名文件。



## 自定义CSS

> 是选择自定义CSS还是自定义主题？如果只是想更改某些配色，则建议选择自定义主题。



个人觉得需要更改的地方：

- 去除链接下划线
- 为表格添加边框 
- 减小引用文本的字体大小，并去除斜体 
- whoami 图片大小

我们需要调整的zzo的样式大多在 `_single.scss` 文件中，所以这里选择自定义 custom.scss 文件

```css
table{
    /* 避免相邻td之间出现间隙 */
    border-collapse: collapse;
}

th,td{
    border: .3em solid #727072;  
}
```

#424242  #727072

```css
blockquote {
	font-size: 1rem;
	font-style: normal;
	opacity: 0.8; /*透明度*/
}
```

引用前的竖杠颜色值由  `single-blockquote-border-color` 决定

定义好后我们在这样引用：

```toml
config/_default/params.toml

...
custom_css = ["css/custom.css", "scss/custom.scss", ...]
...
```



## 自定义主题

个人觉得需要更改的地方：

- code的背景颜色
- 代码字体颜色，白色太亮，与背景色反差太大

相关文件探讨：（最好为你的vscode安装SCSS IntelliSense插件）

- 你自定义的 `data/skin.toml` 
- `zzo/data/skin.toml`  所有值都为 `"inherit"` (继承)
- `zzo/assets/sass/themes/_dark.scss` 文件 ：文件中包含一个 sass变量 `$dark` 它的类型为 map 
- `zzo/assets/sass/themes/_custom.scss` 文件：变量 `$custom() !default;`  它允许覆盖。 而其所有属性值都是其他变量
- main.scss ：sass变量都在此文件中定义并赋值，初始值来源为各 toml 文件。

现在要弄清楚 custom.scss 文件与 skin.toml 的关系：skin.toml 为  `$custom` map变量 提供初始值。

`$custom` map变量 又被  `$themes` map变量所包含



**更改方式一：**

所以这里我只在现有 dark 主题的基础上对其稍作调整。参考官方说明，我们复制 `_dark.scss` 文件内容到自定义的 skin.toml 中，并更改格式使其符合要求（参考zzo的说明）：

在更改的时候你会发现部分颜色值使用了像 `lighten()` 这样的sass颜色函数，可以直接将它们放入双引号中  。

```shell
# 在我更改.scss到.toml文件格式时将函数中的逗号删除了导致hugo提示下面的错误
Function lighten is missing argument $amount
# 然后我在 sass 中测试发现是缺少逗号引起的
# 同样对于函数 rgba(0, 0, 0, 0.7), 也是需要有逗号的
$ sass -i
>> darken(#011627, 1.5%)
#011220
>> darken(#333333 1.5%)  
   ^^^^^^^^^^^^^^^^^^^^
Error: Missing argument $amount.
```

> **sass颜色函数：** lighten() 和 darken() 两个函数都是围绕颜色的亮度值做调整的，其中 lighten() 函数会让颜色变得更亮，与之相反的 darken() 函数会让颜色变得更暗。这个亮度值可以是 0~1 之间，不过常用的一般都在 3%~20% 之间。 

其中还有一段：`red,//#011627,` 通过观察scss文件可以发现这里 `//#011627` 只不过是注释，真正的颜色值为 red。



可能和代码有关的颜色

```scss
// 在dark主题下面的默认值
content-pre-main-color: #FFA7C4,
content-pre-background-color: #011627, // 蓝色背景
content-pre-header-background-color: darken(#011627, 1.5%),
content-diagram-background-color: red,//#011627,
content-code-color: #FCFCFA,
content-code-background-color: #595B5C,
```

```toml
# 自定义的值  
# 我想设置的背景色  #282c34 #282923 #333333 
content_pre_background_color = "#282c34" 
content-pre-header-background-color: darken(#282c34, 1.5%),
```

但是 ：代码高亮与主题有关，自定义的主题你还没有为其配置代码高亮，所以背景虽然改了，但却没有代码高亮。

这里有点好奇，hugo的代码高亮方案是如何切换的？



代码分为行内代码块 code 和 块级代码块 pre 

和代码有关的变量：

```scss
code,
pre {
  padding: 7px;
  font-size: $code-font-size;  
  font-family: $code-font-stack;   //而对于字体相关值 这样引入
  @include themify($themes) {  //对于颜色值需要这样引入(因为它与主题有关)
    background: themed("content-pre-background-color");
  }
}
```



在配置文件中设置主题的使用顺序：

```toml
...
themeOptions = ["custom", "dark", ...]
...
```



## 代码高亮

在zzo的代码注释中我看到了 Highlight.js 于是我搜索了一下发现  [highlight.js](https://highlightjs.org/) 是用于代码高亮的，所以我以为 zzo使用了它进行代码高亮。但是我去查看了readme.md，发现上面介绍说 ” Prism.js for highlight code ” ，那么它用的是 Prism.js ，此时才明白为什么会有 prism  文件夹的存在。

[Prism.js](https://prismjs.com/) 是一款**轻量**（ 代码压缩后只有 2KB ）、可扩展（官方有各种附加功能的插件）的代码语法高亮库，使用现代化的 Web 标准构建。 支持 199 种语言高亮，大概30种高亮主题 [PrismJS/prism-themes](https://github.com/PrismJS/prism-themes)。



> 听说 React 官网也使用了 Prism.js ，所以我查看其官网源代码发现了 Gatsby 网站，了解到  Gatsby是基于React的免费开源框架，可帮助开发人员构建快速的网站和应用 
>
> ```html
> <div class="gatsby-highlight" data-language="jsx"><pre class="gatsby-code-jsx"><code class="gatsby-code-jsx">
> ```
>
> 然后在Gatsby Library 中发现 gatsby-remark-prismjs ，即 prism.js 



[highlight.js](https://highlightjs.org/) 特点：

- 支持 [185 languages and 90 styles](https://highlightjs.org/static/demo/) 
- automatic language detection
- multi-language code highlighting
- available for node.js
- works with any markup
- compatible with any js framework





## 添加文章更新时间

我们可以在 `zzo/layouts/_default/single.html` 文件中发现

```html
    <div class="single__meta">
      🕓 {{ .Date.Format (i18n "single-dateformat") }} · ☕{{ .ReadingTime }} min read
      {{ partial "body/tags" . }}
    </div>  
```





## 自定义 JS

可以定义 返回到顶部、目录的展开等



## 中文搜索







## 补充

定制主题时的一些总结：

- 根据readme操作

- 准备适当的工具，比如为你的vscode安装SCSS IntelliSense插件

- 查看主题源代码

- 确认主题使用了哪些第三方库以及它们的作用

- ⭐在浏览器中检查最终生成的网页源码，并且结合浏览器的**开发工具** 

  比如我们可以得知有个 div 和 pre 都是 ` class="chroma"  ` 

- 寻求作者帮助



> [Awesomes-Web前端开发资源库](https://www.awesomes.cn/) ，该网站使用了：
>
> -  高亮用的是轻量级的 [prism](https://www.awesomes.cn/repo/PrismJS/prism)
> - 编辑器用的是 [codemirror](https://www.awesomes.cn/repo/codemirror/CodeMirror)  (打开其官网后发现之前见过它，在学习Typora时接触过)
> - markdown 解析用的是 [marked](https://www.awesomes.cn/repo/chjj/marked) 



在zzo主题相关目录探索

```
# 只显示目录
zzo
├───archetypes 
├───assets
│   ├───css
│   ├───js ：用到的第三方 js 库
│   └───sass
│       ├───abstracts
│       ├───base
│       ├───components
│       ├───layout：（个人感觉）内容显示区域之外的各部分的样式配置
│       ├───pages：（个人感觉）内容显示区域的样式配置
│       ├───prism：该主题使用 prism.js进行代码高亮，该目录包含各默认主题下的代码块样式配置（比如每种编程语言用哪种颜色）
│       └───themes ：zzo默认主题配色（颜色值）
├───data：包含各种配置数据和相应数据模板
├───exampleSite ：示例站点
├───i18n：国际化
├───images
├───layouts 
│   ├───about
│   ├───archive
│   ├───gallery
│   ├───partials
│   │   ├───body
│   │   ├───comments
│   │   ├───footer
│   │   ├───functions
│   │   ├───head
│   │   ├───header
│   │   ├───marketing
│   │   ├───navbar
│   │   ├───pagination
│   │   ├───sidebar
│   │   ├───summary
│   │   ├───svgs
│   │   │   ├───arrow
│   │   │   ├───etc
│   │   │   └───social
│   │   └───taxonomy
│   ├───shortcodes
│   └───_default
├───resources
│   └───_gen
│       └───assets
│           └───scss
│               └───sass
└───static
    ├───fonts
    └───images
        ├───header
        └───whoami
```



在zzo主题下的data目录中可以发现很多东西

- lib.toml 中包含了主题中用到的第三方库。从中还可发现 lunr 搜索支持的语言配置



从 `zzo/assets/sass/main.scss` 文件，弄懂所有变量定义、使用和导入方式，最终要搞清楚自定义的 scss 文件在何时被加入？



zzo用到的库：

- mermaid.js ：用于生成各种图形，比如流程图 。[mermaid - Markdownish syntax for generating flowcharts, sequence diagrams, class diagrams, gantt charts and git graphs.](https://mermaidjs.github.io/#/) 
- [PhotoSwipe](https://photoswipe.com/) ： PhotoSwipe兼容大量的移动设备以及所有流行的JavaScript类库/开发框架. 既有基于jQuery的版本,也有不依赖jQuery的版本，还有兼容jQuery Mobile的版本。当然，All In One，全在源码示例包里。
- [Masonry](https://masonry.desandro.com/)  ： Masonry是一个轻量级的布局框架 





