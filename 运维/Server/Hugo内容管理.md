## 编辑 Post

编辑器选择：

- **vs code** 中安装Hugo Helper、 Hugo snippets 插件

> code如此强悍，好好学习一下如何使用 code 比如创建 snippets



你可以立马编辑文章，或者了解一下下面的内容。



**[Developer Tools | Hugo](https://gohugo.io/tools/)**   提供了很多资源

- 在 Frontend Interfaces with Hugo 中可以找到不少 CMS（内容管理系统） ，可以很方便的管理和编辑hugo博客。
  - 本地使用的 Hokus CMS ： [Open-source multi-platform CMS for Hugo - Hokus](https://www.hokuscms.com/) 
  - [Netlify CMS | Open-Source Content Management System](https://www.netlifycms.org/)  开源React应用程。安装方法： 两个文件添加到您的站点，并通过在构建过程中包括这些文件或链接到我们的内容交付网络（CDN）来连接后端。 
  - …

- 在 Migrate th Hugo中可以找到，各种迁移方法。比如 Jekyll ，可以使用命令 `hugo import jekyll jekyll_root_path target_path` 





## Content Organization内容组织

> 简化说明

 Hugo默认使用与源内容组织相同的结构来呈现（渲染）网站。 

 Hugo 0.32宣布将与页面相关的图像和其他资源打包到Page Bundles中。 

![](https://d33wubrfki0l68.cloudfront.net/9d9313498c287a3dc722f4202a8f4eddee46f4bf/8f7e9/content-management/organization/1-featured-content-bundles_hu3e3ae7839b071119f32acaa20f204198_63640_300x0_resize_catmullrom_2.png)

 该图显示了3个捆绑包。请注意，**主页**捆绑包不能包含其他内容页面，但是可以包含图像等文件。

虽然Hugo支持在任何级别嵌套的内容，但是顶层（即content / ）在Hugo中是特殊的，被视为用于确定布局的内容类型。  要了解有关各节的更多信息，包括如何嵌套它们，请参见Section部分。 无需添加任何设置，下面的结构即可正常运行：

```
└── content
    └── about
    |   └── index.md  // <- https://example.com/about/
    ├── posts
    |   ├── firstpost.md   // <- https://example.com/posts/firstpost/
    |   ├── happy
    |   |   └── ness.md  // <- https://example.com/posts/happy/ness/
    |   └── secondpost.md  // <- https://example.com/posts/secondpost/
    └── quote
        ├── first.md       // <- https://example.com/quote/first/
        └── second.md      // <- https://example.com/quote/second/
```

> 这里为什么不需要存在一个 `_index.md`文件就能出现 `https://example.com/posts/happy/ness/`



**路径分解**

**index Pages：`_index.md`**

该文件允许您将front matter和content添加到 list templates中。这些模板包括：section templates, taxonomy templates, taxonomy terms templates 和 homepage template. 



源内容组织：

```
.         url
.       ⊢--^-⊣
.        path    slug
.       ⊢--^-⊣⊢---^---⊣
.           filepath
.       ⊢------^------⊣
content/posts/_index.md
```

构建后的内容组织

```
                     url ("/posts/")
                    ⊢-^-⊣
       baseurl      section ("posts")
⊢--------^---------⊣⊢-^-⊣
        permalink
⊢----------^-------------⊣
https://example.com/posts/index.html
```

 这些section可以根据需要嵌套多层。重要的是，要使section树完全导航，至少最下面的section需要一个内容文件（i.e. ：_index.md文件）。



> 在官网看到很多 i.e. ，查询了一下他的意思，和 i.e. vs e.g
>
>  E.g.  ：表示在经验上的  “for example.”  比如
>
> I.e.  ：是 id est 的缩写，它的意思是  “in other words.” (换一种说法)



 **路径说明** 

 以下概念将帮助您更深入地了解项目组织与构建输出网站时Hugo的默认行为之间的关系。 

- section
- slug：它包含了 name.extension 或 `name/`
- path：由文件的路径决定。基于内容的路径并且不包括 slug
- url

我们可以在 Front Matter中覆盖它们的值

## Front Matter

查看：[Front Matter | Hugo](https://gohugo.io/content-management/front-matter/)

Front Matter 使您可以将元数据保留在内容类型的实例上（即，嵌入在内容文件中） 

常见格式有 TOML、YAML

toml示例

```toml
categories = ["Development", "VIM"]
date = "2012-04-06"
description = "spf13-vim is a cross platform distribution of vim plugins and resources for Vim."
slug = "spf13-vim-3-0-release-and-new-website"
tags = [".vimrc", "plugins", "spf13-vim", "vim"]
title = "spf13-vim 3.0 release and new website"
```



Front Matter Variables：

- keywords： the meta keywords for the content. 该文章的关键字
- layout： the layout Hugo should select from the [lookup order](https://gohugo.io/templates/lookup-order/) when rendering the content. If a `type` is not specified in the front matter, Hugo will look for the layout of the same name in the layout directory that corresponds with a content’s section. 
- lastmod：上次更改时间
- outputs：允许你指定特殊的输出格式
- publishDate：指定发布日期
- summary
- title
- type
- date
- description：内容描述
- draft：草稿
- url
- weight：通过权重，为文章设置排序（详见说明）
- aliase



## 页面捆绑 Page Bundles

> 自己翻译的狗屁不通

 内容组织使用了页面捆绑。 页面捆绑包是对页面资源进行分组的一种方式 

页面捆绑可以分为：

- Leaf（叶子） Bundle：没有 children（这里指**嵌套子目录**）
  - 用法： 收集内容和附件构成一个单页(single page)
  - 索引文件名：`index.md` 。如果在inde.md文件头部添加`headless=true`它将变成 Headless Bundle（它将不生成在publish目录中，所以无法访问）
  - Layout type：single
- Branch（分支） Bundle：有 children，比如可以有主页、section等
  - 用法： 收集附件给  section pages （主页、section等）
  - 索引文件名：`_index.md`
  - Layout type：list



> hugo中的内容组织是依赖Page Bundles来管理的。Page Bundles包括Leaf Bundle（没有子节点）和Branch Bundle（home page, section, taxonomy terms, taxonomy list）两类。
>
> |          | Leaf Bundle | Branch Bundle               |
> | :------- | :---------- | :-------------------------- |
> | 索引文件 | index.md    | _index.md                   |
> | 布局类型 | single      | list                        |
> | 嵌套     | 不允许嵌套  | 允许Leaf或Branch Bundle嵌套 |



Leaf Bundles示例

```
content/
├── about 			leaf bundle
│   ├── index.md      		
├── posts
│   ├── my-post				leaf bundle （包含多个文件，但没有嵌套子目录）
│   │   ├── content1.md
│   │   ├── content2.md
│   │   ├── image1.jpg
│   │   ├── image2.png
│   │   └── index.md   		
│   └── my-other-post		leaf bundle
│       └── index.md
│
└── another-section
    ├── ..
    └── not-a-leaf-bundle
        ├── ..
        └── another-leaf-bundle		leaf bundle
            └── index.md
```

branch bundle示例

```
content/
├── branch-bundle-1
│   ├── branch-content1.md
│   ├── branch-content2.md
│   ├── image1.jpg
│   ├── image2.png
│   └── _index.md
└── branch-bundle-2
    ├── _index.md
    └── a-leaf-bundle
        └── index.md
```





## 再说 index

> 先看上一节
>
> 补充：看到某站点有 “点击查看原md文档” 的选项，可以观察一下两者的路径
>
> ```shell
> # 查看博文的路径：该路径下有一个 index.html 文件（隐藏了）
> https://blog.olowolo.com/post/hugo-quick-start/
> # 查看md文档的路径，这里会发现有一个 index.md 文件
> https://blog.olowolo.com/post/hugo-quick-start/index.md
> ```
>
> 

这里有一个站点的目录布局：

```
.
├── config.toml
├── archetypes
|   └── default.md
├── content
|   ├── post
|   |   ├── firstpost.md
|   |   └── secondpost.md
|   └── quote
|   |   ├── first.md
|   |   └── second.md
├── data
├── i18n
├── layouts
|   ├── _default
|   |   ├── single.html
|   |   └── list.html
|   ├── partials
|   |   ├── header.html
|   |   └── footer.html
|   ├── taxonomies
|   |   ├── category.html
|   |   ├── post.html
|   |   ├── quote.html
|   |   └── tag.html
|   ├── post
|   |   ├── li.html
|   |   ├── single.html
|   |   └── summary.html
|   ├── quote
|   |   ├── li.html
|   |   ├── single.html
|   |   └── summary.html
|   ├── shortcodes
|   |   ├── img.html
|   |   ├── vimeo.html
|   |   └── youtube.html
|   ├── index.html
|   └── sitemap.xml
├── themes
|   ├── hyde
|   └── doc
└── static
    ├── css
    └── js
```

从该目录结构大概可以知道下面的信息：

- 该网站打算提供两种不同类型的内容(content)： post 和 quote
- 它还将对这些内容应用两种不同的分类( taxonomies ) ：category 和 tags （分类和标签）
-  它将以3种不同的视图来显示内容：列表，摘要和整页视图。 

hugo中`Page`可以包含内容和metadate，

将内容添和 frontmatter 添加到  到home page， section ，分类法 或 分类法列表  ，在对应的文件夹下添加一个 `_index.md`文件。

```
└── content
    ├── _index.md
    ├── categories
    │   ├── _index.md
    │   └── photo
    │       └── _index.md
    ├── post
    │   ├── _index.md
    │   └── firstpost.md
    └── tags
        ├── _index.md
        └── hugo
            └── _index.md
```



> 下面是机器翻译
>
>  `_index.md`在雨果中扮演特殊角色。它使您可以将主题和内容添加到[列表模板中](https://gohugo.io/templates/lists/) (形成索引)。这些模板包括[部分模板](https://gohugo.io/templates/section-templates/)，[分类模板](https://gohugo.io/templates/taxonomy-templates/)，[分类术语模板](https://gohugo.io/templates/taxonomy-templates/)和您的[主页模板的模板](https://gohugo.io/templates/homepage/)。 
>
> > **提示：**您可以`_index.md`使用[`.Site.GetPage`函数](https://gohugo.io/functions/getpage/)获得对内容和元数据的引用。 
>
>  您可以`_index.md`为首页保留一个，在每个内容部分，分类法和分类术语中保留一个。下图显示了Hugo网站上一个部分列表页面的`_index.md`内容和封面的典型放置位置`posts` 
>
>  `_index.md`是一个比较特殊的文件，如果你只是需要一个about页面，你只需要`hugo new about.md`即可 。



下面是[zzo]( https://github.com/zzossig/hugo-theme-zzo )主题下的示例站点 exampleSite 的结构

```shell
$ pwd
/mnt/j/Test/hugo/zzotheme/themes/zzo/exampleSite
# 可以看到该exampleSite下并没有再包含themes，该示例站点又该如何运行？见下文
$ tree exampleSite/
exampleSite/
├── assets
│   └── css
│       └── photoswipe
│           └── custom-skin.css
├── config.toml
├── content
│   ├── about
│   │   ├── index.ko.md
│   │   └── index.md
│   ├── archive
│   │   ├── _index.ko.md
│   │   └── _index.md
│   ├── gallery
│   │   ├── cartoon
│   │   │   ├── index.ko.md
│   │   │   └── index.md
│   │   └── photo
│   │       ├── index.ko.md
│   │       └── index.md
│   ├── notes
│   │   ├── hugo
│   │   │   └── hugo-1.md
│   │   └── sublist
│   │       ├── _index.md
│   │       ├── go
│   │       │   ├── go-1
│   │       │   │   ├── go-1-1
│   │       │   │   │   ├── go-1-1-1
│   │       │   │   │   │   └── go-5.md
│   │       │   │   │   └── go-1.md
│   │       │   │   └── go-2.md
│   │       │   └── go-4.md
│   │       ├── post-1
│   │       │   └── index.md
│   │       ├── post-2.md
│   │       └── post-3.md
│   └── posts
│       ├── _index.ko.md
│       ├── _index.md
│       ├── emoji-support.md
│       ├── markdown-syntax.ko.md
│       ├── markdown-syntax.md
│       ├── math-typesetting.mmark
│       └── placeholder-text.md
├── layouts
│   ├── _default
│   │   └── summary.html
│   └── patials
│       └── body
│           └── photoswipe.html
├── resources
│   └── _gen
│       ├── assets
│       │   └── scss
│       │       └── sass
│       │           ├── main.scss_e680761d791774b6351b18d537b957bb.content
│       │           └── main.scss_e680761d791774b6351b18d537b957bb.json
│       └── images
└── static
    ├── gallery
    │   ├── cartoon
    │   │   ├── fish-33712_640.png
    │   │   ├── girl-3316342_640.jpg
    │   │   └── zombie-521243_640.png
    │   └── photo
    │       └── owl-4590569_640.jpg
    ├── images
    │   ├── photoswipe
    │   │   ├── default-skin.png
    │   │   ├── default-skin.svg
    │   │   └── preloader.gif
    │   ├── tree.jpg
    │   └── whoami
    │       └── photo.png
    └── videos
        ├── 1.mp4
        └── poster
            └── 1.jpg
```

观察可知，在 List 列表作者添加了 `_index.md` （其中 `_index.ko.md`是用于韩文）比如 archive、sublist、posts。我们看一下 `_index.md` 的内容，注意它的 type：

```markdown
---
title: "Archive"
date: 2019-10-19T11:44:14+09:00
type: "archive"
---

archive page
```

而对于 about 则是 `index.md` 其内容为 (注意type)：

```
+++
title = "About"
description = "Hugo, the world’s fastest framework for building websites"
type = "about"
date = "2019-02-28"
+++
正文
Written in Go, Hugo is an open source static site generator available under the [Apache Licence 2.0.](https://github.com/gohugoio/hugo/blob/master/LICENSE) Hugo supports TOML, YAML and JSON data file types, Markdown and HTML content files and uses shortcodes to add rich content. Other notable features are taxonomies, multilingual mode, image processing, custom output formats, HTML/CSS/JS minification and support for Sass SCSS workflows.
```

我们可以这样**运行该示例站点**：

```shell
# 在 exampleSite 下的 config.toml 中指定主题 theme = "zzo" 
# 然后运行下面的命令
# 手动指定主题所在目录 位于 exampleSite 的上级目录
hugo server --themesDir ../ ..
# 再来补充一下路径
$ pwd
/j/Test/hugo/zzotheme/themes/zzo/exampleSite
```

上面说到两个文件中的 type分别是：archive 和 about ，那么这两个类型的模板需要到 exampleSite上级目录zzo主题下的layout文件夹下寻找，就会发现

```
layouts/
├── 404.html
├── about
│   └── single.html
├── archive
│   └── list.html
...
```

 hugo由三种类型的模版：

- single：用于渲染页面内容
- list ：用于渲染一组内容， 例如一个站点下所有内容，一个目录下的内容 ； homepage实际上就是一个站点所有内容的入口 ， 也就是_index.md，是一个特殊类型的list template 
- partial： 可以被其他模版引用，实际上可以理解为模版级别的组件，例如页面头部、页面底部等。 

 Hugo有一套自己的模版**查找机制**（见参考），如果找不到与内容完全匹配的模板，它将向上移动一级并从那里搜索，直到找到匹配的模板；如果找不到模板，它将使用该站点的默认模板。 



## Content Sections



- content目录：叫root sections
  - archives子目录：如果你想自定义一个section，你就需要创建一个archives子目录，并在目录下创建一个 `_index.md`文件【不就是上面的 Branch Bundle吗】



>  section是基于content/目录下的组织结构定义的页面集合。
>
> content/ 下的第一级子目录都是一个section。如果想让一个子目录成为section，需要在目录下面定义_index.md文件。 所有的section构成一个section tree。
>
>  如果section tree 需要可导航，至少最底层的部分需要定义一个_index.md文件。 



```
content
└── blog        <-- 这是Section, because first-level dir under content/
    ├── funny-cats
    │   ├── mypost.md
    │   └── kittens         <-- 这是Section, because contains _index.md
    │       └── _index.md
    └── tech                <-- Section, because contains _index.md
        └── _index.md
```



 当我们谈论与模板选择相关的部分时，当前它始终仅是root sections

> layout 的使用： If you need a specific template for a sub-section, you need to adjust either the `type` or `layout` in front matter. 



section的作用一：构建导航，比如面包屑导航

Hugo将为每个root sections自动创建列出该部分所有内容的页面 





## URL管理之Permalink

查看： [URL Management | Hugo](https://gohugo.io/content-management/urls/#permalinks)

比如你有一个 名叫 post 的sections，你想将 原本路径(canonical path)更改为分层的 根据年月日和标题 路径，则可以在 config.toml 文件中添加如下内容：

```toml
[permalinks]
  # 只有 post 目录下的文章按这种方式
  post = "/:year/:month/:day/:title/"
```

并且文件名并不需要再去添加2019-11-10前缀(添加了也每影响)，只需要在头部包含date比如 `date: 2019-11-10T12:28:08+08:00` 即可。示例：

你有你个文件 ` content/posts/sample-entry.md ` 添加了上述内容后它将会被渲染到 ` public/2017/02/sample-entry/index.html `，你在浏览器中就可这样访问 ` https://example.com/2017/02/sample-entry/ `

> 好奇这个是干啥的？
>
> `:slug` the content’s slug (or title if no slug is provided in the front matter)如果没有提供slug则使用 title 代替。



**Pretty URLs (漂亮的URL)：**

 Hugo的默认行为是使用“漂亮的” URL呈现您的内容。这些漂亮的URL不需要非标准的服务器端配置。  下面演示了该概念： 

```
content/posts/_index.md
=> example.com/posts/index.html
content/posts/post-1.md
=> example.com/posts/post-1/
```

更多

```
.
└── content
    └── about
    |   └── _index.md  // <- https://example.com/about/
    ├── posts
    |   ├── firstpost.md   // <- https://example.com/posts/firstpost/
    |   ├── happy
    |   |   └── ness.md  // <- https://example.com/posts/happy/ness/
    |   └── secondpost.md  // <- https://example.com/posts/secondpost/
    └── quote
        ├── first.md       // <- https://example.com/quote/first/
        └── second.md      // <- https://example.com/quote/second/
```



**Ugly URLs(丑陋的URL)：**

需要在 config.toml 中配置` uglyurls = true ` 来开启；带后缀 html的就是丑陋的 url 示例：

```
example.com/urls.html
```

 以下是相同内容目录的示例，以及当Hugo以其默认行为运行时最终的URL结构。 



规范化：

 默认情况下，输入中遇到的所有相对URL均保持不变，例如， /css/foo.css将保持为/css/foo.css 



Hugo支持  permalinks（永久链接）、aliases、链接规范化、绝对网址和相对网址

- permalinks：允许你按 a per-section basis ，来调整URL
  - 这见更改文件最终渲染时的写入位置和 change the page’s internal “canonical” location 



```
# 可以不用开启
# [permalinks]
  # post = "/:year/:month/:day/:title/"
  # post = "/:year/:month/:day/:slug/"

```





## 菜单 Menus

查看：[Menus | Hugo](https://gohugo.io/content-management/menus/)， [Menu Templates | Hugo](https://gohugo.io/templates/menu-templates)



示例 添加about菜单的方式 ：先创建 `content/about/index.md`文件，

- 方式二：在config.toml中添加

  ```toml
  [menu] 
    [[menu.main]]
      identifier = "about"
      name = "关于"
      url = "/about/"
      weight = 4
  ```

  

## 模板

[Introduction to Hugo Templating | Hugo](https://gohugo.io/templates/introduction/) 看

> 模板和变量放在下一篇文章记录

## 变量和参数

查看：[Variables and Params | Hugo](https://gohugo.io/variables/)

[Hexo => Hugo主题移植记录](https://xiaohei.im/2019/09/hugo-theme-dev-note/) 



## Static File

By default, the `static/` directory in the site project is used for all **static files** (e.g. stylesheets, JavaScript, images). The static files are served on the site root path (eg. if you have the file `static/image.png` you can access it using `http://{server-url}/image.png`, **to include it in a document you can use** `![Example image](/image.png) )`. 



## List of Content

 [Lists of Content in Hugo | Hugo](https://gohugo.io/templates/lists/)

Group Content：内容分组

比如归档一般就是利用日期进行分组。

Hugo提供了一些功能，可按Section，Type，日期等对页面进行分组。 

`layouts/partials/by-page-date.html ` ：其中 2006-01 表示按年和月进行分组， 如果是2006则表示按年进行分组

```html
<!-- Groups content by month according to the "date" field in front matter -->
{{ range .Pages.GroupByDate "2006-01" }}
<h3>{{ .Key }}</h3>
<ul>
    {{ range .Pages }}
    <li>
    <a href="{{ .Permalink }}">{{ .Title }}</a>
    <div class="meta">{{ .Date.Format "Mon, Jan 2, 2006" }}</div>
    </li>
    {{ end }}
</ul>
{{ end }}
```



## 404页面

[Custom 404 Page | Hugo](https://gohugo.io/templates/404/)



## shortcodes(简码)

短代码（shortcodes）相当于一些自定义模版，通过在md文档中引用，生成代码片段，类似于一些js框架中的组件。

短代码必须在themes/layouts/partials 或者layouts/partials目录下定义。

短代码在模版文件中引用是无效的，只能在content目录下的*.md文件中引用。

*引用方式* 示例一：

```
{{%/* msshortcodes params1="xxx" */%}}**this** is a text{{%/* /msshortcodes */%}}
{{</* msshortcodes params1="xxx"  */>}} **Yeahhh !** is a text {{</* /msshortcodes */>}}
```

1. % 代表短代码中的内容需要进一步渲染
2. < 代表短代码中间的内容项不需要进一步渲染

示例二：

```go
{{< ref "blog/post.md" >}} => https://example.com/blog/post/
{{< ref "post.md#tldr" >}} => https://example.com/blog/post/#tldr:caffebad
{{< relref "post.md" >}} => /blog/post/
{{< relref "blog/post.md#tldr" >}} => /blog/post/#tldr:caffebad
{{< ref "#tldr" >}} => #tldr:badcaffe
{{< relref "#tldr" >}} => #tldr:badcaffe
```

 hugo 还内置了`instagram`、`tweet`、`youtube`等Shortcodes，可以阅读[官方文档](https://gohugo.io/content-management/shortcodes/#use-hugo-s-built-in-shortcodes)了解更多信息，你使用的主题可能也会提供Shortcodes，当然你也可以[定制你自己的Shortcodes](https://gohugo.io/templates/shortcode-templates/)。 



## 多语言（国际化i18n）

> i18n：国际化（internationalization ），由于该单词过长，有20个字母，演化出来的简便写法就是 i18n，用18代表中间省去的18个字母。

几个相关的参数

```toml
# 设置默认语言（默认为英语）
defaultContentLanguage = "zh"
# 访问默认语言时URL中是否也添加默认语言的代码(个人建议设置为false)
defaultContentLanguageInSubdir = true
# 是否包含 中日韩 文字，它会影响 .Summary和.WordCount
hasCJKLanguage = true
# 禁用语言
disableLanguages = ["fr", "ja"]
# The site’s language code. It is used in the default RSS template and can be useful for multi-lingual sites.
languageCode = ""
# The site’s language name.
languageName = ""
```



添加语言的步骤：

- 在 toml 配置文件 中通过配置 `languages` 来定义可用的语言
- 编写对应语言的文章，比如韩语版 about.ko.md （或者通过目录管理，通过 `contentDir= content/french` 将所有法语文章放在french目录）；那么对于像 about.md 这种**缺少任何语言代码文章都会被分配给默认语言**。
- 制作一个 i18n 文件，（如果该主题需要）



使用多国语言后，当访问非默认（或者默认）语言时 url 路径中会多一个 语言代码，比如：

```
http://localhost:1313/zh/
```



**配置文件在多语言之间的读取方式：**

比如我的配置文件目录如下（可以见下文的配置文件目录）

```
config
└── _default
    ├── config.toml
    ├── languages.toml
    ├── menus.en.toml
    ├── menus.zh.toml
    ├── params.en.toml
    └── params.toml
```

就拿 params.toml 和 params.en.toml 两个文件来说，无论你在浏览器访问何种语言的页面都会读取 params.toml 中的配置；但是只有访问英语页面时才会激活 params.en.toml 中的配置，并且 params.en.toml 中的配置优先级更高。

即：会先读取 不带任何语言代码的配置文件 中的配置，再读取语言相关的文件中的配置，通用配置放在不带任何语言代码的配置文件中

> 这与.md文件的读取规则不一样

几个词汇翻译：

- See Also： 相关内容、相关文章
- Social：社交
- Series：系列



## 语法高亮

Hugo 默认使用 Chroma 进行语法高亮



配置语法高亮：

- pygmentsOptions ：后跟类似 `"linenos=table,hl_lines=3 5-10,linenostart=199"` 的一串使用逗号分隔的值
- pygmentsCodefences ：如果为 true ，则为markdown中标记有语言的代码块高亮
- pygmentsUseClasses ：如果为 true，则使用CSS类来高亮代码，生成语法高亮的CSS的方法见  [Generate Syntax Highlighter CSS](https://gohugo.io/content-management/syntax-highlighting/#generate-syntax-highlighter-css) 
- pygmentsStyle ：设置高亮风格；**前提是**没有设置  pygmentsUseClasses (没有通过CSS来高亮代码)
- pygmentsCodefencesGuessSyntax ：如果为 true，则尝试为markdown中**没有**语言标记的代码块高亮
- pygmentsUseClassic ：如果为 true 则使用 老版本（ Hugo 0.28 之前）的  Pygments  进行高亮

**选项**：

选项值可以在配置文件中配置给 pygmentsOptions，或者在代码中进行配置。

-  `linenos=inline` 代码内部开启行号  或`linenos=table`  以表格的形式开启行号（表格形式更方便复制）
-  `hl_lines`   列出一组要突出显示的行号或行号范围。 
-  `linenostart=199`   行号起始值为 199

示例：

在配置文件中 `pygmentsOption="linenos=table,linenostart=199"` 

在代码中

```php+HTML
{{< highlight go "linenos=table,hl_lines=3 5-10,linenostart=199" >}}
// ... code
{{</highlight >}}
```



**生成用于语法高亮的CSS：**

```bash
# 这里使用 monokai 风格
hugo gen chromastyles --style=monokai > syntax.css
```

使用命令帮助获取更多信息：

```shell
hugo gen chromastyles -h
```

更多风格展示参考：[Chroma Style Galler 短](https://xyproto.github.io/splash/docs/all.html) 或 [Chroma Style Gallery 长](https://xyproto.github.io/splash/docs/longer/all.html)



支持高亮的语言列表中有 bash 及其别名中包含 shell 



## 再谈hugo配置

> 再谈hugo配置 👇



### 配置文件目录

可以使用 configDir 来指定配置文件目录 (默认为 `config`目录) 从而更简单的组织和维护特定环境下的设置。

- 每个文件表示一个配置根对象，比如 参数 Params ，菜单 Menus，语言 languages 等…
-  每个目录包含一组文件，这些文件用于特定的环境的设置。 
- 文件可以本地化，用于特定语言。

```
├── config
│   ├── _default
│   │   ├── config.toml
│   │   ├── languages.toml
│   │   ├── menus.en.toml	# 用于特定语言
│   │   ├── menus.zh.toml
│   │   └── params.toml
│   ├── production
│   │   ├── config.toml
│   │   └── params.toml
│   └── staging
│       ├── config.toml
│       └── params.toml
```

考虑到上述结构，当运行 ` hugo --environment staging ` 时，hugo将会把 `_default`下的所有设置和 `staging` 下的所有设置合并，然后再使用。





### 配置文件缓存

下面时默认配置

```toml
[caches]
[caches.getjson]
dir = ":cacheDir/:project"
maxAge = -1
[caches.getcsv]
dir = ":cacheDir/:project"
maxAge = -1
[caches.images]
dir = ":resourceDir/_gen"
maxAge = -1
[caches.assets]
dir = ":resourceDir/_gen"
maxAge = -1
[caches.modules]
dir = ":cacheDir/modules"
maxAge = -1
```

> 给改后为 20s 报错 Building sites … ERROR 说某特性当前hugo版本还不支持，可能需要安装扩展版hugo。

`:cacheDir` 缓存目录；在windows中它可能位于用户缓存目录中，比如 `C:\Users\name\AppData\Local\Temp\hugo_cache`（可以在 `huge config`的输出中找到）

`:project`：当前Hugo项目的顶层目录名。这意味着，在它的默认设置中，每个项目都有独立的文件缓存，这意味着当你执行`hugo --gc`时，你不会碰到与在同一台PC上运行的其他hugo项目相关的文件。（遇到过一次居然使用了其他项目的图片）

`:MaxAge` ：这是缓存实例被清除之前的持续时间，`-1`表示永远，`0`表示关闭缓存，`10s`表示10秒，类似还有`10m` 、`10h` 



### 配置 Blackfriday

Blackfriday 是 hugo 内置的markdown渲染引擎。

配置示例：

```toml
[blackfriday]
  angledQuotes = true
  extensions = ["hardLineBreak"]
  fractions = false
  plainIDAnchors = true
```



> 可以粘贴下面的内容到hugo博客中去测试

- taskLists=true ：作用，任务列表
- smartypants=true ：作用，① 智能标点替换 ，启用后下面的设置才能生效
  - smartypantsQuotesNBSP=false ： 作用，法语风格的Guillemets，在引号内使用不间断的空格。 
  - angledQuotes=false ：智能带角双引号，比如使用  «Hugo» 替换 “Hugo”  
  - fractions=true ：智能分数，比如  `5/12` 渲染为  `5⁄12 ` 。测试 1/2 
  - smartDashes=true ：智能波折号， false禁用智能破折号；即将多个连字符转换为一个破折号或全破折号。如果为true，则可以使用下面的 latexDashes 标志修改其行为。 
    - latexDashes=true ： 如果为 `true`, 则`--` 转换为 –  并且  `---` 转换为 — 。测试 hugo --gc ， hugo ---gc 
- hrefTargetBlank=false ：如果为 `true` 则绝对链接将在新标签页打开，而内部链接则在当前页面打开。
- extensions=[]  ： 用途，启用一个或多个 Blackfriday 的 Markdown 扩展 (`EXTENSION_*`) 
- extensionsmask=[] ： 禁用一个或多个 Blackfriday 的 Markdown 扩展(`EXTENSION_*`) 
- skipHTML=[] ： 是否跳过 markdown 文件中的任何 HTML 代码

Blackfriday extensions（扩展）：

- tables=enabled ：启用 markdown 表格
- fencedCode= enabled  ：启用3个及以上的重音符号表示的代码块
- autolink=enabled  ： 如果启用，未被显式标记为链接的 url 将被转换为链接。https://thisfaner.com
- strikethrough=enabled ： 两个波浪线的文本表示 ~~删除~~ 
- noEmptyLineBeforeBlock=disabled ： 当启用时，不需要插入一个空行来启动一个(代码、引用、有序列表、无序列表)块。 
- headerIds=enabled ： 启用时，允许用 `{#id}` 指定 header IDs 。 
- autoHeaderIds=enabled ： 当启用时，从标题文本自动创建标题 ID （header IDs）
- joinLines=enabled ： 当启用时，删除换行并连接行 





## 其他

- 相关内容：Hugo内置高度可配置的“相关内容”功能
- 使用多个主题



## How do I schedule posts?[ ](https://gohugo.io/troubleshooting/faq/#how-do-i-schedule-posts)

1. Set `publishDate` in the page [Front Matter](https://gohugo.io/content-management/front-matter/) to a date in the future.
2. Build and publish at intervals.

How to automate the “publish at intervals” part depends on your situation:

- If you deploy from your own PC/server, you can automate with [Cron](https://en.wikipedia.org/wiki/Cron) or similar.
- If your site is hosted on a service similar to [Netlify](https://www.netlify.com/) you can use a service such as [ifttt](https://ifttt.com/date_and_time) to schedule the updates.

Also see this Twitter thread:

> [@GoHugoIO](https://twitter.com/GoHugoIO?ref_src=twsrc^tfw) Converted https://t.co/icCzS7Ha7q from [@Medium](https://twitter.com/Medium?ref_src=twsrc^tfw) to Hugo yesterday. Once I figure out how to do scheduled posts I will be ecstatic.
>
> — Chris Short (@ChrisShort)
>
> February 10, 2018





## 参考



- [Hugo-框架学习 - - SegmentFault 思否](https://segmentfault.com/a/1190000016078760) 推荐

- [Hugo 从入门到会用 - olOwOlo's Blog](https://blog.olowolo.com/post/hugo-quick-start/)

- [Hugo - Hugo Quickstart Guide](https://bwaycer.github.io/hugo_tutorial.hugo/overview/quickstart/) 虽然老但内容不错

- [Hugo 主题 MemE 文档 | reuixiy](https://io-oi.me/tech/documentation-of-hugo-theme-meme/) 介绍了代码高亮方案更改的方法

  [将 Hexo 静态博客部署到 Netlify | reuixiy](https://io-oi.me/tech/deploy-static-site-to-netlify/)  ，称Netlify为持续集成

  [将博客部署到星际文件系统（IPFS） | reuixiy](https://io-oi.me/tech/host-your-blog-on-ipfs/) 

- [Hexo => Hugo主题移植记录](https://xiaohei.im/2019/09/hugo-theme-dev-note/)  **值得一看** 

- [Learn Theme for Hugo ](https://learn.netlify.com/en/) 如何自定义主题

- [hugo多语种第1部分：内容翻译 | 里吉斯·菲利伯特](https://regisphilibert.com/blog/2018/08/hugo-multilingual-part-1-managing-content-translation/) 作者有一系列好文章

- [从WordPress到Hugo，一种思维定势过渡| 里吉斯·菲利伯特](https://regisphilibert.com/blog/2019/01/from-wordpress-to-hugo-a-mindset-transition/)

