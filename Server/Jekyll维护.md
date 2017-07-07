# Jekyll维护

[48 个你需要知道的 Jekyll 使用技巧 | David Zhang](https://crispgm.com/page/48-tips-for-jekyll-you-should-know.html "48 个你需要知道的 Jekyll 使用技巧 | David Zhang")  


中文翻译版 [Jekyll • 简单静态博客网站生成器 - 将纯文本转换为静态博客网站](http://jekyllcn.com/ "Jekyll • 简单静态博客网站生成器 - 将纯文本转换为静态博客网站")  

**一些基本概念，在此了解**：[搭建一个免费的，无限流量的Blog----github Pages和Jekyll入门 - 阮一峰的网络日志](http://www.ruanyifeng.com/blog/2012/08/blogging_with_jekyll.html "搭建一个免费的，无限流量的Blog----github Pages和Jekyll入门 - 阮一峰的网络日志")   


## post相关



[撰写博客 - Jekyll • 简单静态博客网站生成器](http://jekyllcn.com/docs/posts/ "撰写博客 - Jekyll • 简单静态博客网站生成器")

## Front Matter 头信息
Front Matter 被翻译成了"头信息"  

[头信息 - Jekyll • 简单静态博客网站生成器](http://jekyllcn.com/docs/frontmatter/ "头信息 - Jekyll • 简单静态博客网站生成器")    

[Front Matter | Jekyll • Simple, blog-aware, static sites](http://jekyllrb.com/docs/frontmatter/ "Front Matter | Jekyll • Simple, blog-aware, static sites")


### Sample Link Post

下面就是整个post的内容，它仅仅表示一个链接。

```
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



```
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

```
categories: [test, sample]
```



## 配置Disqus评论

注册Disqus账号，选择将Disqus安装到网站。

。。。之后平台选择 Jekyll，然后就会提供相关方法：只需要将`comments: true`添加到Front Matter，

1.Add a variable called `comments` to the[ YAML Front Matter](http://jekyllrb.com/docs/frontmatter/) and set its value to `true`. A sample front matter might look like:

```
---
layout: default
comments: true
# other options
---
```



2.In between a `{% if page.comments %}` and a `{% endif %}` tag, copy and paste the [Universal Embed Code](https://fandean.disqus.com/admin/install/platforms/universalcode)in the appropriate template where you'd like Disqus to load.

> Note: Comments can be disabled per-page by setting `comments: false` or by not including the comments option at all

如果你的jekyll主题支持Disqus，则替换`_config.yml`文件中的id值：

```
# Disqus
disqus:
id:               "你的用户名"
```



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


[深入 Jekyll | David Zhang](https://crispgm.com/page/dive-into-jekyll.html "深入 Jekyll | David Zhang")


[使用Jekyll在Github上搭建个人博客（文章分类索引） - 说学逗唱 - SegmentFault](https://segmentfault.com/a/1190000000406017 "使用Jekyll在Github上搭建个人博客（文章分类索引） - 说学逗唱 - SegmentFault")




## 使用Rake生成Jekyll文章模板


[Rake让Jekyll写博更优雅 | 晚晴幽草轩](http://jeffjade.com/2016/03/26/2016-03-26-rakefile-for-jekyll/ "Rake让Jekyll写博更优雅 | 晚晴幽草轩")


以Rake一键生成Jekyll文章模版，一键预览效果，一键发布等等；Rake让Jekyll写博更优雅。




