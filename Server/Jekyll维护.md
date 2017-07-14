# Jekyll维护



Jekyll网站内容维护的学习路线：

- 了解网站目录
- 学习如何编写和发布文章(Post帖子)
- 学习如何使用草稿

Jekyll网站功能维护涉及到的内容：

- 配置评论
- 配置分享按钮
- 使用Rake
- 自行编码实现tag和Category



内容基本来自[Jekyll中文网站](http://jekyllcn.com/)  的文档。这里只是介绍学习步骤。

## 了解相关概念

中文网站 [Jekyll • 简单静态博客网站生成器 - 将纯文本转换为静态博客网站](http://jekyllcn.com/ "Jekyll • 简单静态博客网站生成器 - 将纯文本转换为静态博客网站")  

**一些基本概念，在此了解**：[搭建一个免费的，无限流量的Blog----github Pages和Jekyll入门 - 阮一峰的网络日志](http://www.ruanyifeng.com/blog/2012/08/blogging_with_jekyll.html "搭建一个免费的，无限流量的Blog----github Pages和Jekyll入门 - 阮一峰的网络日志")   

## Jekyll网站目录结构

参考：[目录结构](http://jekyllcn.com/docs/structure/)

```
.
├── _config.yml
├── _drafts
|   ├── begin-with-the-crazy-ideas.textile
|   └── on-simplicity-in-technology.markdown
├── _includes
|   ├── footer.html
|   └── header.html
├── _layouts
|   ├── default.html
|   └── post.html
├── _posts
|   ├── 2007-10-29-why-every-programmer-should-play-nethack.textile
|   └── 2009-04-26-barcamp-boston-4-roundup.textile
├── _site
├── .jekyll-metadata
└── index.html
```



![](https://darkkris.github.io/images/posts/Jekyll/0.png)



> 进阶：[48 个你需要知道的 Jekyll 使用技巧 - David Zhang](https://crispgm.com/page/48-tips-for-jekyll-you-should-know.html "48 个你需要知道的 Jekyll 使用技巧 - David Zhang")  

## post相关

[撰写博客 - Jekyll • 简单静态博客网站生成器](http://jekyllcn.com/docs/posts/ "撰写博客 - Jekyll • 简单静态博客网站生成器")




## 使用草稿

[使用草稿](http://jekyllcn.com/docs/drafts/)

草稿是没有日期的文章。它们是你还在创作中而暂时不想发表的文章。想要开始使用草稿，你需要在网站根目录下创建一个名为 `_drafts` 的文件夹。

为了预览你拥有草稿的网站，运行带有 `--drafts` 配置选项的 `jekyll serve` 或者 `jekyll build`。此两种方法皆会将该草稿的修改时间赋值给草稿文章，作为其发布日期，所以你将看到当前编辑的草稿文章作为最新文章被生成。



## Front Matter 头信息
Front Matter 被翻译成了"头信息"  

[头信息 - Jekyll • 简单静态博客网站生成器](http://jekyllcn.com/docs/frontmatter/ "头信息 - Jekyll • 简单静态博客网站生成器")    
[Front Matter - Jekyll • Simple, blog-aware, static sites](http://jekyllrb.com/docs/frontmatter/ "Front Matter - Jekyll • Simple, blog-aware, static sites")

一个头信息：


```yaml
---
layout: post
title: "A Full and Comprehensive Style Test"
description: "Test post for style"
date: 2016-08-15
tags: [test, style]
comments: true
share: true
category: 单个分类
---
```

多个分类: 如果在固定链接中包含了`:category`，那么多个分类会产生多级目录。

```yaml
categories: [test, sample]
```

### Sample Link Post 简单的链接帖

下面就是整个post的内容，它仅仅表示一个链接。当点击标题查看该post时就会进入相关链接页面。

```yaml
---
layout: post
title: Sample Link Post
description: "This theme supports link posts, made famous by John Gruber. To use, just add `link: http://url-you-want-linked` to the post's YAML front matter and you're done."
tags:
  - sample post
  - link post
comments: true
link: 'http://aweekj.github.io/Kiko-plus'
---
```






## 配置Disqus评论

注册Disqus账号，选择将Disqus安装到网站。

。。。之后平台选择 Jekyll，然后就会提供相关方法：只需要将`comments: true`添加到Front Matter，

1.Add a variable called `comments` to the[ YAML Front Matter](http://jekyllrb.com/docs/frontmatter/) and set its value to `true`. A sample front matter might look like:

```yaml
---
layout: default
comments: true
# other options
---
```



2.In between a `{% if page.comments %}` and a `{% endif %}` tag, copy and paste the [Universal Embed Code](https://fandean.disqus.com/admin/install/platforms/universalcode)in the appropriate template where you'd like Disqus to load.

> Note: Comments can be disabled per-page by setting `comments: false` or by not including the comments option at all

如果你的jekyll主题支持Disqus，则替换`_config.yml`文件中的id值：

```yaml
# Disqus
disqus:
id:               "你的用户名"
```

有些主题配置Disqus的方式不同：

```
disqus:
  shortname: 
  public_key: 
```

**Shortname:**  Your website shortname is `fandean`.

This is used to uniquely identify your website on Disqus. It cannot be changed.(Shortname用于在Disqus中唯一标识你的网站，且不可更改)

[What's a shortname?](https://help.disqus.com/customer/portal/articles/466208)

**public_key:**  类似于 SqM3TGVGvUM6YB1GRlHE7j5VHN6bjcls9BFqdrcY0ks4yippJEUsNtHuVY8fm6fu (该Key已被改动)

[pathawks/jekyll-disqus-comments: A system for syncing Disqus comments to Jekyll](https://github.com/pathawks/jekyll-disqus-comments "pathawks/jekyll-disqus-comments: A system for syncing Disqus comments to Jekyll")

在此页面查看或创建公钥：[API - Disqus](https://disqus.com/api/applications/ "API - Disqus")



## 另一个评论工具



[HyperComments](https://www.hypercomments.com/ "HyperComments")

效果展示：[用GitHub+Jekyll搭建个人博客](https://darkkris.github.io/2017/07/%E7%94%A8Jekyll%E6%90%AD%E5%BB%BA%E4%B8%AA%E4%BA%BA%E5%8D%9A%E5%AE%A2/ "用GitHub+Jekyll搭建个人博客")





## 配置addthis的分享按钮

[AddThis - Get more likes, shares and follows with smart website tools](https://www.addthis.com/ "AddThis - Get more likes, shares and follows with smart website tools")

分享按钮的样式有多种，并且很美观：比如 Floating、Inline、Expanding、Banner。



```html
<!-- Go to www.addthis.com/dashboard to customize your tools --> <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-595fc12cbd5b5138"></script> 
```



your Profile ID: ra-595fc12cbd5b5138



## Jekyll主题中使用开源库


比如：[jekyll-clean-dark](https://github.com/streetturtle/jekyll-clean-dark "streetturtle/jekyll-clean-dark: Dark clean theme for jekyll")主题，使用了下面的开源库:

This theme includes the following files :

- js/bootstrap.min.js - [bootstrap](http://getbootstrap.com/)
- css/bootstrap.min.css - [bootstrap](http://getbootstrap.com/)
- js/jquery.min.js - [jquery](https://jquery.com/)



## Jekyll 添加 tag 或 Category

tag：标签； category：分类


[Tags In Jekyll](http://charliepark.org/tags-in-jekyll/ "Tags In Jekyll")


[Use Tags and Categories in your Jekyll based Github Pages without plugins · Codinfox](https://codinfox.github.io/dev/2015/03/06/use-tags-and-categories-in-your-jekyll-based-github-pages/ "Use Tags and Categories in your Jekyll based Github Pages without plugins · Codinfox")


[深入 Jekyll - David Zhang](https://crispgm.com/page/dive-into-jekyll.html "深入 Jekyll - David Zhang")


[使用Jekyll在Github上搭建个人博客（文章分类索引） - 说学逗唱 - SegmentFault](https://segmentfault.com/a/1190000000406017 "使用Jekyll在Github上搭建个人博客（文章分类索引） - 说学逗唱 - SegmentFault")




## 使用Rake生成Jekyll文章模板


[Rake让Jekyll写博更优雅 - 晚晴幽草轩](http://jeffjade.com/2016/03/26/2016-03-26-rakefile-for-jekyll/ "Rake让Jekyll写博更优雅 - 晚晴幽草轩")


以Rake一键生成Jekyll文章模版，一键预览效果，一键发布等等；Rake让Jekyll写博更优雅。



## 注意事项



`| `引发的血案：

由于在md文件中大量使用了 `右键该项目 | 添加新项 | 选择“文本文件”`这种形式的语句表示操作步骤，导致jekyll解析错误，页面无法正常显示。



仅使用 `Alt + /`作为标题，也导致解析错误，页面无法正常显示。



## Kramdown配置



[Jekyll kramdown配置 - JavaChen Blog](http://blog.javachen.com/2015/06/30/jekyll-kramdown-config.html)

[将 GitHub Pages 从 Redcarpet 切换到 kramdown — 码志](http://mazhuang.org/2016/02/04/switch-to-kramdown-from-redcarpet/)

[Jekyll配置Markdown代码高亮](http://istoney.github.io/jekyll/2016/03/10/set-markdown-hightlighter "Jekyll配置Markdown代码高亮")

[Syntax kramdown](https://kramdown.gettalong.org/syntax.html "Syntax  kramdown")

[kramdown和markdown较大的差异比较](http://gohom.win/2015/11/06/Kramdown-note/ "kramdown和markdown较大的差异比较 | Hom")



## 脚注

示例：

This page was generated by [GitHub Pages](https://pages.github.com/) using the [Cayman theme](https://github.com/jasonlong/cayman-theme) by [Jason Long](https://twitter.com/jasonlong).

[Droidplugin by DroidPluginTeam](http://droidpluginteam.github.io/DroidPlugin/ "Droidplugin by DroidPluginTeam")



