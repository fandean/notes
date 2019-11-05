# Hugo安装和部署

Hugo用Go语言编写，是一个开放源代码的静态站点生成器。 使用Hugo构建的网站极其快捷，安全，可以部署在任何地方，包括AWS，**GitHub Pages**，Heroku，Netlify和任何其他托管提供商。 



## Hugo快速开始

```bash
# 使用自己的方式下载安装hugo
$ scoop install hugo
# 查看是否安装成功
$ hugo help
# 切换到测试目录
$ cd /j/Test/Hugo
# 创建第一个站点site
$ hugo new site firstSite
# 查看生成的站点目录结构，此时站点没有任何内容和任何配置
# 该目录结构必须了解，将在下文做解释
$ cd firstSite
$ tree -L 1 firstSite
firstSite
|-- archetypes
|-- content
|-- data
|-- layouts
|-- static
|-- themes
|-- config.toml
# firstSite目录（网站根目录）下使用下面的命令创建一个文章内容页面。
# 此文件默认将放在content目录。并且在网站根目录下添加了一个resources目录
$ hugo new about.md
# 查看文件内容。
# 
$ cat content/about.md
---
title: "About"
date: 2019-10-31T03:31:15+08:00
draft: true
---

```



## 主题选择





## 目录结构说明



- archetypes
- content：你编写的网站博文都保存在此目录。 您网站的所有内容都将位于此目录中。Hugo中的每个顶级文件夹都被视为一个[content section(内容章节)](https://gohugo.io/content-management/sections/)。举例来说，如果你的网站主要有三个sections（章节）： `blog`，`articles`和`tutorials`，你就需要有下面的三个目录`content/blog`，`content/articles`和`content/tutorials`。Hugo使用sections(章节)来分配默认[内容类型](https://gohugo.io/content-management/types/)(content type)。 



安装方法见下面几篇文章：

- [如何使用Hugo在GitHub Pages上搭建免费个人网站 - 知乎](https://zhuanlan.zhihu.com/p/37752930)
- [Hosting on GitHub Pages - Hugo中文文档](https://www.gohugo.org/doc/tutorials/github-pages-blog/) 必看结尾
- [Hugo + Github Pages 搭建个人博客 - Brave New World](https://nusr.github.io/post/2019/2019-04-26-creat-hugo-blog/)  
- [Hugo中文文档](https://www.gohugo.org/)
- [Hosting &amp; Deployment | Hugo](https://gohugo.io/hosting-and-deployment/) 列出了可以 托管与部署Hugo的地方





适合用于个人技术博客（按优先顺序排列）：

- [Hugo Travelify Theme | Hugo Themes](https://themes.gohugo.io/hugo-travelify-theme/)   可爱的wordpress主题 ；这个布局感觉非常好，功能还需要自行完善一下。

- [Mero | Hugo Themes](https://themes.gohugo.io/mero/) 黑暗系的佼佼者（功能还需要自行完善一下）

- [Mainroad | Hugo Themes](https://themes.gohugo.io/mainroad/)  一个响应式，干净且注重内容的主题，这里有一个 [Mainroad的汉化版](https://github.com/jasonhancn/mainroad-cn)。

- [Hugo Terrassa Theme | Hugo Themes](https://themes.gohugo.io/hugo-terrassa-theme/) （功能还需要自行完善一下）

  

比较适合个人非技术类的博主，配色布局好：

- [Kross Hugo Portfolio Template | Hugo Themes](https://themes.gohugo.io/kross-hugo-portfolio-template/) 用于个人布局不错，但对于程序员来说功能需要加强
- [Academic | Hugo Themes](https://themes.gohugo.io/academic/) ； The Academic **framework** enables you to easily create a beautifully simple website using the [Hugo](https://gohugo.io/) static site generator in under 10 minutes 
- [Meghna Hugo | Hugo Themes](https://themes.gohugo.io/meghna-hugo/) 主题样式不错（很**漂亮**的黑暗系），但是需要改进。
- [Personal Web | Hugo Themes](https://themes.gohugo.io/personal-web/) 个人网站中还算不错
- [Timer Hugo | Hugo Themes](https://themes.gohugo.io/timer-hugo/)

文档：

- [Hugo Theme Learn | Hugo Themes](https://themes.gohugo.io/hugo-theme-learn/) 纯粹的为编写一个文档而生，看起来不错

开源项目主页：

- [Syna | Hugo Themes](https://themes.gohugo.io/syna/)  可定制的一对多页面主题，适用于开源项目，公司和自由职业者。 





**推荐**：[从Hexo迁移到Hugo-送漂亮的Hugo Theme主题 | 飞雪无情的博客](https://www.flysnow.org/2018/07/29/from-hexo-to-hugo.html) 这位大佬修改后的主题，集成的功能非常全面，**绝对可以一试**。其集成的功能有：

1. 最近发表的文章支持，显示最近的10篇
2. 分类支持，并且可以显示分类内的文章数量
3. 标签云支持
4. 文章目录支持
5. 一键回到页面顶部
6. 支持关键字SEO优化
7. 自定义菜单支持，不限个数，自定义排序
8. 自定义友情链接支持
9. 支持文章按年份日期进行归档
10. 支持GA分析统计
11. 不蒜子页面计数器支持
12. 代码高亮、代码行号
    - markup、css、clike、javascript、c、csharp、bash、cpp
    - aspnet、dart、docker、markup-templating、erlang
    - go、groovy、java、json、kotlin、markdown、lua、objectivec
    - php、python、r、yaml、toml
13. sitemap站点地图
14. RSS支持，并且可以自动发现RSS
15. Google站内搜索
16. See Also 支持
17. Disqus评论支持
18. 自定义css、js
19. utteranc评论（基于Github iss）
20. 部分自定义的shortcode
21. 文章自定义摘要
22. 自定义广告支持













推荐： [用Travis CI自动化Hugo生成及GitHub Pages部署 | 思维的博客](https://xusiwei.github.io/post/2019/10/hugo-github-pages-with-travis-ci/) 思考一下为什么这么做？

- 优点一，通过在线编辑器编辑推送md文件后也可以正常更新博文
- 优点二，本地编辑md文档后直接推送速度更快（只更新了md文件，并没有让Hugo生成文件）

