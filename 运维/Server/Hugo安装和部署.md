# Hugo安装和部署

Hugo用Go语言编写，是一个开放源代码的静态站点生成器。 使用Hugo构建的网站极其快捷，安全，可以部署在任何地方，包括AWS，**GitHub Pages**，Heroku，Netlify和任何其他托管提供商。 



## Hugo快速开始

```bash
# 使用自己的方式下载安装hugo，我这里是 scoop
$ scoop install hugo
# 或者安装扩展版，支持的功能更多
$ scoop install hugo-extended

# 查看是否安装成功
$ hugo help
# 切换到测试目录
$ cd /j/Test/Hugo
# 创建第一个测试站点
$ hugo new site firstSite
# 查看生成的站点目录结构，此时站点没有任何内容和任何配置

$ cd firstSite
$ tree -L 1 firstSite
firstSite
|-- archetypes ：原型目录
|-- content ：网站博文都保存在此目录
|-- data ：存储生成网站时hugo可以使用的配置文件
|-- layouts ：以 .html 文件形式存储模板，包括列表页面、主页、分类模板、单页模板等
|-- static ：存储所有静态内容，图像、CSS、JS等
|-- themes ：主题文件夹
|-- config.toml ：配置文件


# firstSite目录（网站根目录）下使用下面的命令创建一个文章内容页面。
# 此文件默认将放在content目录。并且在网站根目录下添加了一个resources目录
$ hugo new about.md
# 查看文件内容。
# 会发现它会自动生成文件头
$ cat content/about.md
---
title: "About"
date: 2019-10-31T03:31:15+08:00
draft: true
---

# 再创建一个文件；此文件会保存在 content/post/first.md
$ hugo new post/first.md


# 为上面两个新建的文件添加一些文字内容，

# 运行 hugo 内置的 web server
$ hugo server
# 浏览器中打开 http://localhost:1313 来查看
# 此时你会发现看不到任何内容
```



**看不到任何内容的原因之一：**

hugo在渲染时，默认会跳过下面三类文章

- 过期文章：`publishdate` 值是未来某天
- 草稿Draft：被标记为 `draft:true` 
- 未到发布日期的文章 ：`expirydate`值为过去某天

但可以分别通过下面的选项强制对它们进行渲染：

1. `--buildFuture`
2. `--buildDrafts`  或 `-D`
3. `--buildExpired`

可使用 `hugo help server`来查看帮助。也可以在 常见问题查看帮助 [Frequently Asked Questions | Hugo](https://gohugo.io/troubleshooting/faq/) 



**看不到任何内容的原因之二：**

 我们尚未指定Markdown内容应如何呈现，因此我们必须指定一个hugo要使用的主题 。



## 添加主题

添加主题：我这里选则了 maupassant 主题

```shell
# 正式开始
hugo new site hugoblog
cd hugoblog
git init
# 添加主题
git submodule add https://github.com/rujews/maupassant-hugo themes/maupassant
```

简单修改全局配置文件 `config.toml`

```toml
baseURL = "http://example.org/"
languageCode = "zh-Cn"
title = "My New Hugo Site"
theme = "maupassant"

[author]
  name = "我叫啥"

[params]
  author = "我叫啥"
  subtitle = "专注于撒娇"
  keywords = "不要"
  description = "专注于撒娇"
```

渲染**并**运行web server，在浏览器打开 <http://localhost:1313/>

```
hugo server -D
```

更详细的配置需要查看具体的主题说明。

主题文件夹的结构与hugo站点根目录结构相似，这样我们可以在相对应的路径下使用自己的文件来覆盖主题中对应文件的配置。举个例子：hugo 首先查找用户的模板文件，没有就会查找主题的模板文件。 

> 如果你Blog下有多个主题，也可通过 `hugo -t 主题名` 来指定需要使用的主题

> 网站图标：
>
>  You can put your favicon at `static/favicon.ico`, the theme will automatically look for it there. If you want to choose a different path, please set the `favicon` parameter in `[params]` in the config. 



## 部署站点



有这几种方式：

- 我们可以直接将最后生成的public目录复制到你的Web服务器就可部署了。
- ~~对于像GitHub Pages这样的静态托管服务，也分两种形式~~：**【说法有误，需要更正】**
  - 方式一：每次你都在本地 先删除之前的 public目录，再执行 `hugo`命令渲染再将整个站点push到github。
  - 方式二：仅第一次时和方式一一样，之后当我们编写好新的博文后，直接push到Github，不在本地渲染，而是利用Github中的Travis CI来渲染。见下文



>  见，[雨果-雨果快速入门指南](https://bwaycer.github.io/hugo_tutorial.hugo/overview/quickstart/) 这里一步一步的讲解了如何创建  gh-pages  分支。
>
>  **为什么要先删除 public 目录？**
>
>  运行 `hugo` 命令 *并不会* 删除之前生成的文件。这意味着你必须在运行 `hugo` 命令之前删除你的 `public/` 目录（或者你通过 `-d`/`--destination` 指定的目录）。 不然的话，你可能有运行遗留在生成目录的错误文件的风险（比如草稿或者未来的文章）。
>
>  一个简单的处理方法是使用不同的目录用于开发和部署环境。
>
>  启动一个会生成草稿内容（有助于编辑）的 Server ，指定一个不同的目标目录： `dev/` 目录
>
>  ```
>  $ hugo server -wDs ~/Code/hugo/docs -d dev
>  ```
>
>  当内容准备好发布时，使用默认的 `public/` 目录：
>
>  ```
>  $ hugo -s ~/Code/hugo/docs
>  ```
>
>  这将防止你不小心发布了还未准备好的内容。



hugo的命令：

```
config      Print the site configuration 打印当前所有设置
convert     Convert your content to different formats 格式转换
help        Help about any command
```



hugo的启动选项：使用`hugo –-help`查看

```
-b, --baseURL string         hostname (and path) to the root, e.g. http://spf13.com/
--cacheDir string        filesystem path to cache directory. Defaults: $TMPDIR/hugo_cache/
-c, --contentDir string      filesystem path to content directory
--debug                  debug output
--enableGitInfo          add Git revision, date and author info to the pages
--gc                     enable to run some cleanup tasks (remove unused cache files) after the build
--ignoreCache            ignores the cache directory
--log                    enable Logging
--logFile string         log File path (if set, logging enabled automatically)
--minify                 minify any supported output format (HTML, XML etc.)
-t, --theme strings          themes to use (located in /themes/THEMENAME/)
```



## 编译时忽略的文件

使用 `hugo` 编译时，将忽略 `config.toml` 文件中指定的内容，比如：以 `.foo` 和 `.boo` 结尾的文件。

```
ignoreFiles = [ "\\.foo$", "\\.boo$" ]
```

上面使用了正则表达式，使用 `\` 转义是因为在 TOML 里。



> 如果是git仓库，可在 .gitignore 中添加
>
> ```
> # Generated files by hugo
> /public/
> /resources/_gen/
> ```



## 目录结构说明



- archetypes：原型目录，里面包含了当你创建新文件时需要使用到的模板。比如使用`hugo new about.md`创建的文件中默认包含的内容。
- content：你编写的网站博文都保存在此目录。 您网站的所有内容都将位于此目录中。Hugo中的每个顶级文件夹都被视为一个[content section(内容章节)](https://gohugo.io/content-management/sections/)。举例来说，如果你的网站主要有三个sections（章节）： `blog`，`articles`和`tutorials`，你就需要有下面的三个目录`content/blog`，`content/articles`和`content/tutorials`。Hugo使用sections(章节)来分配默认[内容类型](https://gohugo.io/content-management/types/)(content type)。 
- assets：该目录存储 Hugo Pipes需要的文件， 仅将被 `.Permalink`或`.RelPermalink`使用的文件发布到`public`目录。 该目录需要手动创建。

[Directory Structure | Hugo](https://gohugo.io/getting-started/directory-structure/)



安装方法见下面几篇文章：

- [如何使用Hugo在GitHub Pages上搭建免费个人网站 - 知乎](https://zhuanlan.zhihu.com/p/37752930) **推荐**
- [Hosting on GitHub Pages - Hugo中文文档](https://www.gohugo.org/doc/tutorials/github-pages-blog/) 必看结尾
- [Hugo + Github Pages 搭建个人博客 - Brave New World](https://nusr.github.io/post/2019/2019-04-26-creat-hugo-blog/)  
- [Hugo中文文档](https://www.gohugo.org/) 文档翻译者的博客 [使用hugo搭建个人博客站点 - CoderZh Blog](https://blog.coderzh.com/2015/08/29/hugo/) 必看
- [Hosting &amp; Deployment | Hugo](https://gohugo.io/hosting-and-deployment/) 列出了可以 托管与部署Hugo的地方



## 选择主题



可以试一下 ：[从Hexo迁移到Hugo-送漂亮的Hugo Theme主题 | 飞雪无情的博客](https://www.flysnow.org/2018/07/29/from-hexo-to-hugo.html) 这位大佬修改后的主题，集成的功能也很全面，在该文中还介绍了在迁移博客时**遇到的坑**。其集成的功能见其github页面，这里列出几个

1. 最近发表的文章支持，显示最近的10篇
11. 不蒜子页面计数器支持
14. RSS支持，并且可以自动发现RSS
15. Google站内搜索
16. See Also 支持
19. utteranc评论（基于Github iss）
22. 自定义广告支持



## 配置Hugo

### 了解 Hugo 配置

全局配置文件默认为 `config.toml` 。比如这是一个默认配置文件， 在 `[params]` 下面的值将会构成模板里的 `.Site.Params` 变量： 

```toml
baseurl = "http://yoursite.example.com/"
canonifyurls = true
languageCode = "zh-Cn"

[taxonomies]
  category = "categories"
  tag = "tags"

[params]
  description = "Tesla's Awesome Hugo Site"
  author = "Nikola Tesla"
```

示例2：

```toml
baseURL = "https://yoursite.example.com/"
footnoteReturnLinkContents = "↩"
title = "My Hugo Site"

[params]
  AuthorName = "Jon Doe"
  GitHubUser = "spf13"
  ListOfFoo = ["foo1", "foo2"]
  SidebarRecentLimit = 5
  Subtitle = "Hugo is Absurdly Fast!"

[permalinks]
  posts = "/:year/:month/:title/"
```

下面是一份相同配置的 json配置文件：

```json
{
   "baseURL": "https://yoursite.example.com/",
   "footnoteReturnLinkContents": "↩",
   "params": {
      "AuthorName": "Jon Doe",
      "GitHubUser": "spf13",
      "ListOfFoo": [
         "foo1",
         "foo2"
      ],
      "SidebarRecentLimit": 5,
      "Subtitle": "Hugo is Absurdly Fast!"
   },
   "permalinks": {
      "posts": "/:year/:month/:title/"
   },
   "title": "My Hugo Site"
}
```

>  配置文件的使用由来已久，从.ini、XML、JSON、YAML再到TOML，语言的表达能力越来越强，同时书写便捷性也在不断提升。 TOML是前GitHub CEO， Tom Preston-Werner，于2013年创建的语言，其目标是成为一个小规模的易于使用的语义化配置文件格式。TOML被设计为可以无二义性的转换为一个哈希表(Hash table)。需要注意的点。
>
> - **TOML是大小写敏感的**
> - TOML文件必须是UTF8编码的
> -  使用`#`来表示注释 
>
>  [TOML： GitHub 这是要革 YAML 的命呀！](https://segmentfault.com/a/1190000000477752)

Hugo中存在一份默认就定义好的变量列表（必须要看的官方文档 [**Configure Hugo** | Hugo](https://gohugo.io/getting-started/configuration/) 或 [配置 Hugo - Hugo中文文档](https://www.gohugo.org/doc/overview/configuration/)  或者使用 `hugo config` **打印当前站点的配置**），要想配置Hugo就需要弄懂这些东西，下面列出几个：（这种写法只是为了好看）

```toml
defaultLayout:              "post"
editor:                     ""
newContentEditor:           ""
permalinks:
disablePathToLower:         false
# if true, auto-detect Chinese/Japanese/Korean Languages in the content. (.Summary and .WordCount can work properly in CJKLanguage)
hasCJKLanguage              false
# Site title.
title:                      ""
# if true, use /filename.html instead of /filename/
uglyURLs:                   false
# Content without language indicator will default to this language.

defaultContentLanguage ("en")
enableEmoji (false)
# Enable .GitInfo object for each page (if the Hugo site is versioned by Git). This will then update the Lastmod parameter for each page using the last git commit date for that content file. 感觉这个变量很好
enableGitInfo (false)
# Don’t sync modification time of files.
noTimes (false)
# Default number of elements per page in pagination.
paginate (10)
# The length of text in words to show in a .Summary.
summaryLength (70)
#Theme to use (located by default in /themes/THEMENAME/).
theme ("")
#The directory where Hugo reads the themes from.
themesDir ("themes")

# 生成页面内容的超时时间（以毫秒为单位）（默认为10秒）。注意：这用于避免递归内容生成，如果您的页面生成速度较慢（例如，因为它们需要大图像处理或依赖于远程内容），则可能需要提高此限制。
timeout (10000)
```



 Hugo本身已经支持了类似 posts, tags, categories 等内容聚合的页面，同时支持 rss.xml，404.html等。 

 tags, categories 等字段必须用列表的方式 



### 最终配置

```toml
baseURL = "https://"
languageCode = "zh-CN"
hasCJKLanguage = true
defaultContentLanguage = "zh-CN"
title = "Felix's blog"
theme = "maupassant"
# 不建议开启丑陋的url，过时
# uglyurls = true
# 默认 false
enableEmoji = true
# 
# enableGitInfo = true

# 默认不忽略，false
#ignorecache = true
#debug = true

# 分页 默认 10
# paginate = 10
# 默认 post
defaultLayout = "post"
editor = "notepad3.exe"
newContentEditor = "typora.exe"
# 文章摘要 默认是70
summarylength = 140

[author]
  name = "Felix"

[params]
  author = "Felix"
  subtitle = "Felix's personal blog, a programming enthusiast."
  keywords = "Java,Linux,数据库,前端,开发工具,git,Mamen,DBA,Android,Hugo,HTML5,FanDean,Felix's Blog,Fan's Blog"
  description = "专注于IT互联网，包括但不限于Java、Android、前端"

  # 不蒜子页面计数器支持，开启之前需要将其修改为自己的id
  #busuanzi = true

# 可以不用开启
# [permalinks]
  # post = "/:year/:month/:day/:title/"
  # post = "/:year/:month/:day/:slug/"


######################################
# 以下应用于 maupassant 主题          #
######################################
# 自定义菜单
[menu]

  [[menu.main]]
    # ID必须唯一
    identifier = "tools"
    name = "工具"
    url = "/tools/"
    #权重越低越靠前
    weight = 3

  [[menu.main]]
    # Hugo默认不支持归档，需要自己配置
    identifier = "archives"
    name = "归档"
    url = "/archives/"
    weight = 2

  [[menu.main]]
    identifier = "about"
    name = "关于"
    url = "/about/"
    weight = 4

# 默认
#indexes = map[category:categories tag:tags]

# 友情链接
[[params.links]]
  title = "我之前的Blog"
  name = "Fan's Blog"
  url = "https://fandean.github.io/"
[[params.links]]
  title = "飞雪无情"
  name = "飞雪无情"
  url = "https://www.flysnow.org/2018/07/29/from-hexo-to-hugo.html"


# 目录大纲：建议最多使用两层，并且从h2开始，便于SEO优化
# 在为文章开启目录大纲的方式在Front Matter添加 toc=true
# 当右侧空白超过 100px 时，显示悬浮目录

# 广告模块
# [[params.ads]]
#   title = "领取￥1888阿里云产品通用代金券"
#   url = "https://promotion.aliyun.com/ntms/act/vmpt/aliyun-group/home.html?userCode=g9oj97"
#   img = "https://img.alicdn.com/tfs/TB17qJhXpzqK1RjSZFvXXcB7VXa-200-126.jpg"



# 该主题支持开启版权声明
[params.cc]
    name = "知识共享署名-非商业性使用-禁止演绎 4.0 国际许可协议"
    link = "https://creativecommons.org/licenses/by-nc-nd/4.0/"

# 该主题支持utteranc评论，这是一个基于Github Issue的评论系统。详细设置见其官网
[params.utteranc]
    enable = true
    repo = "fandean/hugoblog"   # 存储评论的Repo，格式为 owner/repo
    #还可选择 title 按页面title标题的方式
    issueTerm = "pathname"  #表示你选择以那种方式让github issue的评论和你的文章关联。（推荐使用pathname）
    theme = "github-light" # 样式主题，有github-light和github-dark两种


## 是否禁止URL Path转小写
# disablePathToLower = true

# GA分析统计
#googleAnalytics = "GA ID"

# Disqus评论
# disqusShortname = "yourdiscussshortname"

# 见该主题说明
# 自定义的 shortcode 、 CSS、JS
# md文档绘图支持；比如序列图、流程图、graphviz
```



## 托管

> 感觉Render和Cloudflare可以一起使用。确实可以Render的手册中就写了设置方法。

看到了   CI vendors ：CI供应商

### Render

使用Render的全球CDN，完全托管的SSL免费托管您的Hugo网站，**并从GitHub自动部署**。 

 简单，公平，可预测的价格。 在几分钟内托管您的第一个应用程序或网站。无需信用卡。 

Render是一家现代化的云服务提供商，可轻松快捷地在生产中部署您的代码。您可以在Render上部署任何内容，从简单的静态站点和cron作业到数据库和Dockerized私有服务。 

Render直接从GitHub或GitLab部署您的服务。所需要做的就是像平常一样推送代码，Render会自动更新服务并使其始终保持运行状态。 

对于静态站点Render支持：

- Continuous and automatic deploys from GitHub and GitLab.
- Instant cache invalidation with a lightning fast, global CDN.
- Unlimited collaborators for free.
- Automatic [Pull Request Previews](https://render.com/docs/pull-request-previews).
- [Redirects and Rewrites](https://render.com/docs/redirects-rewrites)
- Native HTTP/2 support.
- Automatic [Brotli compression](https://en.wikipedia.org/wiki/Brotli) for faster sites.
- Automatic SSL certificate issuance and renewal using [Let’s Encrypt](https://letsencrypt.org/).
- Automatic HTTP → HTTPS redirects.
- Unlimited custom domains.



**实际体验了一番，流程如下：**

- 在Github中任意创建一个仓库，可以是私有仓库，
- 配置好你的hugo站点；比如，添加hugo相关的`.gitignore`文件（避免加入`/puglic/`目录），并推送至仓库。
- 注册Render，点击 `New Web Service`
- 然后需要连接到你的Github账户，然后选择让Render能够访问刚才创建的仓库。
- 然后会来到设置界面，设置内容如下：
  - 为该 web service选择一个唯一的服务名称，比如 `fan`
  - Environment ：`Static Site`
  - Build Conmmand：`hugo --gc --minify` (或者你自己的构建命令)
  - Publish Directory：`public` （如果你没有更改就是这个目录）
- 然后点击底部的 保存 或是什么按钮，等待一会就可以通过 `fan.onrender.com`来访问你的主页了
- 但是如果你的config.toml文件中的 baseURL没有更改为 `fan.onrender.com` 的话，其他页面是不能访问的。
- 每次推送后**也**可以去Render控制台点击手动部署 ”Manual Deploy”（部署速度真的是慢）

通过下面两个链接查看完整说明：
- [Static Sites - Render](https://render.com/docs/static-sites)
- [Host on Render | Hugo](https://gohugo.io/hosting-and-deployment/hosting-on-render/)

> `--gc`   选项  enable to run some cleanup tasks (remove unused cache files) after the build
>
> `--minify`     选项    minify any supported output format (HTML, XML etc.)
>
> 【可选】在 *Build command*`--cleanDestinationDir --forceSyncStatic --gc --ignoreCache --minify`
>
> - `--cleanDestinationDir`：构建前先清理目标文件夹，即 *public*
> - `--forceSyncStatic`：强制同步 *static* 文件夹
> - `--gc`：构建后执行一些清理任务（删除掉一些没用的缓存文件）
> - `--ignoreCache`：构建时忽略缓存
> - `--minify`：压缩网页（Debug 时慎用）

>  Render会在每次构建时自动下载Git存储库中定义的所有Git子模块。这样，即使是作为子模块添加的Hugo主题将按预期工作。 

更换了zzo主题后使用  `hugo --gc --minify ` 命令失败，去掉 `--minify` 后成功。

```
# 使用 hugo version 检查hugo版本
Nov 24 10:14:24 AM  ==> Cloning from https://github.com/fandean/hugoblog...
Nov 24 10:14:25 AM  ==> Syncing Git submodules
Nov 24 10:14:27 AM  ==> Checking out commit 9c17f04c00bf019d930c6660bb59621226a95c40 in branch master
Nov 24 10:14:32 AM  ==> Running build command 'hugo version'...
Nov 24 10:14:32 AM  Hugo Static Site Generator v0.59.1-D5DAB232/extended linux/amd64 BuildDate: 2019-10-31T15:28:09Z
Nov 24 10:14:33 AM  ==> Uploading build...
Nov 24 10:14:33 AM  ==> Build folder public does not exist!
Nov 24 10:14:33 AM  ==> Build failed 😞

# 将构建命令更改为 hugo --gc --verbose 
# 成功
==> Your site is live 🎉
```



同样尝试在本地使用 `--minify` ，同样出现错误

```
λ hugo server --gc --minify
Building sites … Total in 4949 ms
Error: Error building site: failed to render pages: parse error:8:35: unexpected comma character
    8:     "url" : "http://localhost:1313/ko/gallery/photo/",
```





### Cloudflare

Cloudflare作用就是：**保护和加速任何在线网站**。一旦您的网站成为 Cloudflare 社区的一部分，其网络流量就会通过我们的智能全球网络进行路由。我们会自动优化您的网页传送，以便您的访问者获得最快的页面加载时间和最佳性能。我们还会阻止威胁并限制滥用 Bots 和爬虫程序浪费您的带宽和服务器资源。

[Cloudflare_百度百科](https://baike.baidu.com/item/Cloudflare/17359757)



它的具体操作步骤为：

- [创建 Cloudflare 账户并添加网站 – Cloudflare Support](https://support.cloudflare.com/hc/zh-cn/articles/201720164-%E7%AC%AC-2-%E6%AD%A5-%E5%88%9B%E5%BB%BA-Cloudflare-%E8%B4%A6%E6%88%B7%E5%B9%B6%E6%B7%BB%E5%8A%A0%E7%BD%91%E7%AB%99)

> 设置完成后就是这样：  **最后一步**是使用上一步中提供的 Cloudflare 域名服务器（IP地址）更新您的域名的域名服务器。 【也就是说你最后将会获得 域名服务器IP然后（应该就是用它去设置域名解析）】



我们提供 Free 计划，适用于小型个人网站、博客以及任何想要评估 Cloudflare 的用户。
我们的使命是建立一个更好的互联网。我们相信每个网站都应该可以免费获得基础安全性和性能。Cloudflare 的 Free 计划对访问者使用的带宽量或您添加的网站数没有限制。

如果您想让您的网站更快、更有弹性，可以轻松升级到我们的更高级别计划之一。

- 无计量缓解 DDoS 攻击
- 全球 CDN
- 共享 SSL 证书（Cloudflare签发的万用SSL证书）：可与你现有SSL配置兼容；如果你当前没有使用SSL，Cloudflare 可以为你提供，无需配置。(补充；专用 SSL/TLS  专用SSL证书允许您保护子域的多个级别，并在公共名称中包含完全限定的域名）
- I'm Under Attack™ 模式
- 访问 Cloudflare 应用程序
- 访问帐户审核日志
- 随附 3 个页面规则

**重点：**在定价界面，点击[比较所有功能](https://www.cloudflare.com/zh-cn/plans/#compare-features)，点击展开所有并点击各项 `?` 符号，可以查看免费版的一些差别和详细说明，可以看到在我的上文列出的项目中还多了下面的支持：

- 智能路由：每月前1GB免费；并附带 分层缓存
- 负载均衡：前500K DNS请求免费
- 运行状态检测：支持每60秒ping一次检测原始服务器是否在线；检查地点数量最多一处
- 全局负载均衡（基于地理位置的路由）：**无**
- 自动静态内容缓存：直接从其全球数据中心提供静态内容，支持
- 客户端最大上传大小：100M
- 异步JS加载：支持
- HTTP/2 和 SPDY：自动提供，支持
- 随机加密
- Automatic HTTPS Revrites
- TLS优化
- 威胁阻止和隐私功能：比如垃圾评论防护，内容抓取防护，用户代理阻止
- 多用户访问：可以要求其他人成为管理员
- DNSSEC：将网站流量正确安全定向到服务器，避免中间人攻击
- 全球任播 DNS
- 简单的DNS管理，并有简单的DNS管理界面
- Always Online：使站点的静态部分保持在线状态，即使原始服务器出现故障。对于免费用户，每周以爬虫程序爬取。

> Cloudflare的中国网络访问 ：**只有企业用户**才可以访问Cloudflare在中国各地的20个数据中心； [利用我们的中国 CDN 安全浏览并减少延迟 | Cloudflare](https://www.cloudflare.com/zh-cn/network/china/) 



> CloudFlare CDN功能很强大，但它效果如何？做为身在国内的我来说，真的没有感觉到它的提速效果，与直接访问虚拟主机速度差不多，用测试工具测试速度反而有所下降，而且还会有一些地方根本无法访问。这当中的原因我想是因为国内网络环境和国内用户访问博客时CloudFlare 提供的CDN节点都是来自美国，与虚拟主机一样的距离来到中国，所以没有感觉速度上的提升。不知道CloudFlare不优先选择离中国最近的日本、香港等节点，反而跑到路途遥远的美国。
>
> 我会不会长期使用CloudFlare CDN？现时CloudFlare CDN对于国内访问没有太多的影响，同时可以实现上面我所说的功能，还可以对世界其它地区进行访问提速，同时会被Google搜索引擎认为更加友好的网站，所以我的答案是会的，除非某天国内大面积无法访问。坛子说用上CloudFlare后，源主机几乎看不到网站资源消耗，连流量都节省了60%以上，统计显示，最近7天来，总流量10.31 GB，缓存化的流量达6.72 GB，挡住了285个有害威胁（主要来自中国）。



### CI

[使用 Hugo 搭建博客 - - SegmentFault 思否](https://segmentfault.com/a/1190000012975914) 

推荐： [用Travis CI自动化Hugo生成及GitHub Pages部署 | 思维的博客](https://xusiwei.github.io/post/2019/10/hugo-github-pages-with-travis-ci/) 思考一下为什么这么做？

- 优点一，通过在线编辑器编辑推送md文件后也可以正常更新博文
- 优点二，本地编辑md文档后直接推送速度更快（只更新了md文件，对于Hugo生成的文件我们在 `.gitignore`文件中排除）



> .gitignore 文件的使用。



发现一个在本地使用的脚本。学到了其设置提交信息的方法

```shell
#!/bin/bash
# 部署到 github pages 脚本
# 错误时终止脚本
set -e

# 删除打包文件夹
rm -rf public

# 打包。even 是主题
hugo -t even # if using a theme, replace with `hugo -t <YOURTHEME>`

# 进入打包文件夹
cd public

# Add changes to git.

git init
git add -A

# Commit changes.
msg="building site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# 推送到githu
# nusr.github.io 只能使用 master分支
git push -f git@github.com:nusr/nusr.github.io.git master

# 回到原文件夹
cd ..
```







## 正式编辑 Post

编辑器选择：

- **vs code** 加 Hugofy 和 Hugo snippets 插件

[Developer Tools | Hugo](https://gohugo.io/tools/)



见另一篇文章《Hugo内容管理》

