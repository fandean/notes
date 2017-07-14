# Jekyll安装


- 先在本地安装并运行 jekyll，了解相关概念和命令
- 再选择一个主题练手；此时应该会遇到相关插件未安装的问题 --> 可见插件章节
- 详细介绍相关术语和命令
- 介绍相关配置 --> `_config.yml`文件的配置
- 部署到GitLab Pages


## Jekyll简介


中文翻译版 [Jekyll • 简单静态博客网站生成器 - 将纯文本转换为静态博客网站](http://jekyllcn.com/ "Jekyll • 简单静态博客网站生成器 - 将纯文本转换为静态博客网站")  

> GitHub Pages 的背后就运行着 Jekyll


## Jekyll本地安装
[Jekyll搭建个人博客](http://pongban.xyz/2016/10/jekyll_tutorials1/ "Jekyll搭建个人博客")

> 操作系统不同，安装方法也会有所差异；这里是在Ubuntu 16.04系统上进行安装

先安装Ruby环境：

- Ruby
- RubyGems

再安装jekyll等：

```
# 安装jekyll
$ gem install jekyll  
# 安装 bundler，用于使用Gemfile
$ gem install bundler   
```



创建并在本地访问博客：

```
# 创建博客
$ jekyll new myBlog
# 进入博客目录
$ cd myBlog
# 启动本地服务
$ jekyll serve
# 访问博客，在浏览器中输入启动服务成功后给出的地址
# 比如在浏览器中输入 http://127.0.0.1:4000 
```

如果需要将网站托管到GitHub Pages，或GitLab Pages则还需要安装git。

下面下载并重用他人制作的主题。

## Jekyll主题选择与安装



### 选择主题

众多的主题： [Jekyll Themes](http://jekyllthemes.org/ "Jekyll Themes")  

看好的主题：  

- [Kiko Plus](http://jekyllthemes.org/themes/kiko-plus/ "Kiko Plus")移动端效果也不错，特点：Disqus comment system、Google analytics、Pagination support分页、Custom tags、SEO support
- [Cards](http://jekyllthemes.org/themes/cards-jekyll-template/ "Cards")非常漂亮，移动端效果不错，安装难度大
- [Home – Moon](https://taylantatli.github.io/Moon/ "Home – Moon")
- [Libretto](http://jekyllthemes.org/themes/jekyll-theme-libretto/ "Libretto") 简洁
- [Documentation Theme for Jekyll](http://jekyllthemes.org/themes/documentation-theme-jekyll/ "Documentation Theme for Jekyll")
- [MAD4Jekyll](http://jekyllthemes.org/themes/MAD4Jekyll/ "MAD4Jekyll")有快速回到顶部按钮，界面漂亮。
- [Gridster](http://jekyllthemes.org/themes/gridster/ "Gridster")各终端的适配做的非常好的主题，可选择网格或列表形式的布局
- [Jekyll Clean Dark](http://jekyllthemes.org/themes/jekyll-clean-dark/ "Jekyll Clean Dark")黑色主题，各终端适配的很好，很漂亮，RSS订阅。
- [minimal mistakes - Jekyll Themes & Templates](https://jekyllthemes.io/theme/10267810/minimal-mistakes "minimal mistakes - Jekyll Themes & Templates")
- [jekyll-now](https://github.com/barryclark/jekyll-now ) 
- [pages · GitLab](https://gitlab.com/pages "pages · GitLab") 列出了众多的pages


主题选取的原则：

- 好看，简洁
- 可适应移动端
- 具备一定的功能


>该主题还包含了很多jekyll的教程：[Getting started with the Documentation Theme for Jekyll  ](http://idratherbewriting.com/documentation-theme-jekyll/ )


复杂主题：

- [Feeling Responsive](https://phlow.github.io/feeling-responsive/ "Feeling Responsive")
- [Home - Frisco Template](https://brave-submarine.cloudvent.net/ "Home - Frisco Template")




### 安装主题

以[Kiko Plus](http://jekyllthemes.org/themes/kiko-plus/ "Kiko Plus")主题为例。注意有些主题可能本身会存在些许缺陷。

具体步骤参考该主题在GitHub上的说明：[AWEEKJ/Kiko-plus: Simple theme for jekyll blog](https://github.com/AWEEKJ/Kiko-plus "AWEEKJ/Kiko-plus: Simple theme for jekyll blog")

> 前提：需要GitHub账号和安装git

如遇到问题，可先看下文，比如"jekyll插件"部分。

**这里有个坑人的错误：**

```
jekyll 3.5.0 | Error:  (/home/fan/Downloads/jekyll_demo/jekyll-now-master/_config.yml): did not find expected key while parsing a block mapping at line 7 column 1
```

提示第7行第1列有问题，解决该问题的方法是：在该行前添加一个空格，如果已经有空格就删除这个空格。



## Ruby相关概念


Jekyll 是基于 Ruby 开发的、包管理器 [RubyGems](http://rubygems.org/pages/download) 。所以会用到Ruby的相关命令。

理解几个名词：  

gem参考 ：[Ruby RubyGems | 菜鸟教程](http://www.runoob.com/ruby/ruby-rubygems.html "Ruby RubyGems | 菜鸟教程")    、[代码库](https://www.ruby-lang.org/zh_cn/libraries/ "代码库")。

**RubyGems：** 是 Ruby 的一个包管理器，它提供一个分发 Ruby 程序和库的标准格式，还提供一个管理程序包安装的工具。这类似于 Ubuntu 下的apt-get, Centos 的 yum，Python 的 pip。

**Gem：** 是 Ruby 模块 (叫做 Gems) 的包管理器。其包含包信息，以及用于安装的文件。A Gem is a bundle of code，**Jekyll就是一个Gem，还有大多数的Jekyll插件都是Gem。**

**gem命令：**用于构建、上传、下载以及安装Gem包。

> RubyGems.org 站点是代码库的主要集散地，它提供 Gem 形式的代码库。你可以直接访问其网站或者使用 gem 命令。（ Gem 会被发布到 RubyGems.org）。
>
> 国内源：  

> 由于国内网络原因（你懂的），导致 rubygems.org 存放在 Amazon S3 上面的资源文件间歇性连接失败。我们可以将它修改为淘宝下载源: `http://ruby.taobao.org/`  ,另还有 `https://gems.ruby-china.org/`
>
> 首先，查看当前源：`gem sources -l`
>
> 移除原有源，添加淘宝源（需确保只要一个源）： 
>
> ```
> gem sources --remove https://rubygems.org/
> gem sources -a https://ruby.taobao.org/
> gem sources -l
> ```
>
> > 如果使用Gemfile和Bundle，可以使用如下源代码镜像命令`bundle config mirror.https://rubygems.org https://ruby.taobao.org`, 这样你不用改你的 Gemfile 的 source。





**gemfile：**[What is a Gemfile](http://tosbourn.com/what-is-the-gemfile/ "What is a Gemfile")；也就是包含Ruby项目需要运行的Gems列表。当我们需要Jekyll插件时，我们在Jekyll网站上使用Gemfiles。需要在Gemfiles文件的开头，至少指定一个gem source(指向RubyGems server的url)；当执行命令`bundle init`时会创建一个gemfile，其默认source为`https://rubygems.org`

**Bundler：**    Bundler，一个用于管理应用依赖关系的通用工具，它可以跟 RubyGems 搭配使用，(bundle：包，捆)。通过Bundler程序读取Gemfile然后下载文件中需要的Gems。当我们更改了Gemfile文件后，需要运行`bundle install`命令，该命令生成Gemfile.lock文件，并下载该文件中的gems。当我们运行`jekyll serve`时，如果我们有一个插件`jekyll-feed`，并且该插件在我们的电脑上有多个版本，此时`jekyll serve`就可能选择了错误的版本；我们可以使用`bundle exec`来解决这个问题，它只会使用Gemfile中该gem需要的版本，示例：使用`bundle exec jekyll serve`代替`jekyll serve`。

```
bundle install --path vendor/bundle
```

We include a `--path` variable with the command to instruct Bundler to install all gems within our project directory. You **do not** need to enter the `--path`variable when you run `bundle install` in the future(之后使用bundle install时就无需指定--path参数). Bundler will automatically remember where we installed our site’s gems.

> 不要使用root权限安装bundler，不然之后的大多数命令都需要使用root权限.



执行`bundle exec jekyll serve`或`jekyll serve`后便会生成一个`_site`目录，这就是生成的网站。使用版本控制时建议排除`_site`目录。Before `building` the site, it actually doesn't exist and is just a bunch of template files。

`jekyll serve`命令的几个作用：  

1. 构建您的站点（使用build命令）；
2. 启动开发服务器，并在默认情况下监测文件变化并进行实时构建。任何时候发生变化，它将自动构建您的网站。



`jekyll build`命令：该命令用于创建静态站点(生成`_site`目录)。



`jekyll new`命令：该命令会使用默认的主题，创建一个新的jekyll网站框架(项目).



以下几篇文章都讲解了 Gem、GemFile、Bundler。

[**Gems, Gemfiles and the Bundler - CloudCannon Academy**](https://learn.cloudcannon.com/jekyll/gemfiles-and-the-bundler/ "Gems, Gemfiles and the Bundler - CloudCannon Academy")     

[Getting Started with Jekyll (plus a Free Bootstrap 3 Starter Theme) ― Scotch](https://scotch.io/tutorials/getting-started-with-jekyll-plus-a-free-bootstrap-3-starter-theme "Getting Started with Jekyll (plus a Free Bootstrap 3 Starter Theme) ― Scotch")   

[Quick-start guide | Jekyll • Simple, blog-aware, static sites](https://jekyllrb.com/docs/quickstart/ "Quick-start guide | Jekyll • Simple, blog-aware, static sites")   

[Bundler: Developing a RubyGem using Bundler](http://bundler.io/v1.15/guides/creating_gem.html "Bundler: Developing a RubyGem using Bundler")   

[How to create a blog with Jekyll (like this one) · Matt's Blog](http://matthodan.com/2012/10/27/how-to-create-a-blog-with-jekyll.html "How to create a blog with Jekyll (like this one) · Matt's Blog")   



Bundler用于在Ruby库中管理Rubygems依赖项；Bundler isn’t just for Rails!



> 在Gemfile中的`gem "jekyll-seo-tag"`相当于单独执行命令`gem install 'jekyll-seo-tag'`；前者只应用与当前项目，后者则安装到你的电脑上，与某个项目无关。




## Jekyll插件



当下载使用他人的主题时，运行 `jekyll serve`或`jekyll s`或`jekyll build`命令后，可能出现的插件相关错误。



**插件相关的错误：**

第一个错误：某些主题在`_config.yml`配置文件中使用 gems而非plugins。

```
The 'gems' configuration option has been renamed to 'plugins'. Please update your config file accordingly.
只需将： gems 改为 plugins 即可
```



之后的错误，大多数是提示相关插件没有安装，无法找到。没找到就安装该插件。

具体步骤：

- 查看该主题`_config.yml`文件中指定了哪些插件
- 新建Gemfile文件，并在该文件中添加这些插件
- 运行 `bundler install`安装这些插件；或使用`bundle install --path vendor/bundle` 此时推荐将vendor目录添加到.gitignore 文件中
- 再次运行 `jekyll serve`



**插件的安装方法：**

一般方法，先在Gemfile中添加，然后再在`_config.yml`文件的plugins下添加。

Gemfile文件内容：

```
# frozen_string_literal: true
source "https://rubygems.org"

# Kiko Plus 主题所需插件，下面的内容需要根据实际情况进行配置，不能重用
# 并且需要在_config.yml文件的plugins下进行添加
gem 'jekyll-seo-tag'
gem 'jekyll-paginate'
gem 'jekyll-admin'
```

对应的 `_config.yml`文件中的相应内容：

```
plugins:
  - jekyll-feed
  - jekyll-sitemap
  - jemoji
```





**几个插件介绍：**

Jekyll SEO Tag: 该插件为搜索引擎和社交网络添加元数据标签（meta tags），以更好地索引和显示您网站的内容。[File: README — Documentation for jekyll-seo-tag (1.2.0)](http://www.rubydoc.info/gems/jekyll-seo-tag/1.2.0 "File: README — Documentation for jekyll-seo-tag (1.2.0)")，使用该插件便可无需手动添加。[jekyll/jekyll-seo-tag: A Jekyll plugin to add metadata tags for search engines and social networks to better index and display your site's content.](https://github.com/jekyll/jekyll-seo-tag "jekyll/jekyll-seo-tag: A Jekyll plugin to add metadata tags for search engines and social networks to better index and display your site's content.")



jekyll-paginate: paginate(分页) Jekyll提供分页插件，因此您可以自动生成分页列表所需的相应文件和文件夹。开启分页，在_config.yml文件中，通过`paginate:5`来指定每页列出几个文章。

[Pagination | Jekyll • Simple, blog-aware, static sites](https://jekyllrb.com/docs/pagination/ "Pagination | Jekyll • Simple, blog-aware, static sites")



[Google Analytics（分析） - 网站分析和报告](https://www.google.com/analytics/ "Google Analytics（分析）官方网站 - 网站分析和报告 – Google Analytics（分析）")：分为两种：一个是用于跟踪Website，一个是用于跟踪Mobile app。创建Google Analytics 帐户需要填写网站名称，网站URL。时区 Reporting Time Zone：China  (GMT+08:00) China Time - Beijing 。开启的地址：[Analytics](https://analytics.google.com/analytics/web/provision/?authuser=0#provision/SignUp/ "Analytics")。相关介绍：[Google Analytics （分析） – 帮助中心](https://tumblr.zendesk.com/hc/zh-cn/articles/230864187-Google-Analytics-%E5%88%86%E6%9E%90- "Google Analytics （分析） – 帮助中心") ；[Set up Analytics tracking - Analytics Help](https://support.google.com/analytics/answer/1008080?hl=en "Set up Analytics tracking - Analytics Help")



## _config.yml配置文件



timezone时区设置： 上海：`Asia/shanghai`   香港：`Asia/Hong_Kong`



1、URL的配置

如果需要部署到GitHub pages，URL一定要配置好。

```
# URL
url:                "https://fandean.github.io" # the base hostname 主机名 & 协议 protocol for your site 
# url:                "http://localhost:4000" # use this url when you develop
baseurl:            "\blog" # the subpath of your site（网站的子路径,可以为空）, e.g. /blog 
# 访问你该网站首页的路径为： url + baseurl = https://fandean.github.io/blog
```



2、Permalinks固定链接

[Permalinks | Jekyll • Simple, blog-aware, static sites](https://jekyllrb.com/docs/permalinks/ "Permalinks | Jekyll • Simple, blog-aware, static sites")

引用变量的方法`:变量`，那么没有`:`前缀的就是固定字符。

在配置文件`_config.yml`中有： 

```
permalink:          /:year-:month-:day/:title/
```

以上固定链接表示： 文章生成的html保存在类似`_site/2017-01-19/style-test-ko/index.html`路径中。   其中`_site根目录 = url + baseurl`，`title`目录为 style-stest-ko，它是这篇文章的标题，最终的文章内容将保存在`index.html`文件中。

Jekyll预定义了几个固定链接的格式：比如 `date`表示`/:categories/:year/:month/:day/:title.html` ；我们可以简单的使用`permalink:date`来指定。其中`categories`表示分类，应该需要事先在markdown中指定。



在您的帖子，页面或集合的Front Matter中的permalink会覆盖任何全局设置，例如：

```
---
title: My page title
permalink: /mypageurl/
---
```

该Front Matter中的permalink表示该文章会保存在网站的`/mypageurl/`目录下，这里没有`:`前缀所以是固定字符。






## Jekyll安装

[安装 - Jekyll • 简单静态博客网站生成器](http://jekyllcn.com/docs/installation/ "安装 - Jekyll • 简单静态博客网站生成器")   

[搭建一个免费的，无限流量的Blog----github Pages和Jekyll入门 - 阮一峰的网络日志](http://www.ruanyifeng.com/blog/2012/08/blogging_with_jekyll.html "搭建一个免费的，无限流量的Blog----github Pages和Jekyll入门 - 阮一峰的网络日志")   

[github上利用jekyll搭建自己的blog的操作顺序？ - 知乎](https://www.zhihu.com/question/30018945 "(1 封私信)github上利用jekyll搭建自己的blog的操作顺序？ - 知乎")   


[安装 - Jekyll • 简单静态博客网站生成器](http://jekyllcn.com/docs/installation/ "安装 - Jekyll • 简单静态博客网站生成器")



### GitLab Pages部署jekyll

1. 先在本地配置好jekyll，运行测试。比如下载相关主题，并按该主题的相关指导进行部署。
2. 将jekyll push到gitlab进行托管，远程仓库名称为`username.gitlab.io`，根据gitlab给出的命令提示，执行相关命令。（建议先配置好.gitignore文件）
3. 添加`.gitlab-ci.yml`文件:   
  在GitLab网站，进入该Project，选择Project标签页，点击"Set up CI"，在出现的界面中点击"Apply a GitLab CI Yaml template"下拉列表，并选择Jekyll，直接使用给出的模板即可；然后提交更改。
4. 如果之前没有添加Gemfile，则添加该文件，在Gemfile文件中添加该工程需要的插件。Gemfile的说明见前文，示例见下面的引用。
5. 构建该Project：GitLab可能会为你**自动构建**；你也可通过Pipelines标签页进行查看，或手动运行。构建通过会显示有`passed`字样。
6. 通过`setting标签页 --> Pages` 查看访问该pages的url。点击该url即可进入页面。


> 这里讲解了怎样在GitLab中为GitLab Pages创建和调整`.gitlab-ci.yml`[GitLab Pages from A to Z: Part 4 - GitLab Documentation](https://docs.gitlab.com/ee/user/project/pages/getting_started_part_four.html "GitLab Pages from A to Z: Part 4 - GitLab Documentation") ，详细讲解了该文件的配置。`.gitlab-ci.yml`文件内容：
>
> ```
>
> image: ruby:2.3  # Use Ruby Docker image
>
> cache:  # Add Bundler cache to 'vendor' directory
>   paths:
>     - vendor/
>
> before_script:  # Install Gems to 'vendor' directory  要执行的命令
>   - bundle install --path vendor
>
> test:
>   stage: test
>   script:  # Generate test site(s) into 'test' directory 
>   - bundle exec jekyll build -d test
>       artifacts:  # Save a zipped version for download
>     paths:
>     - test
>   except:  # Execute for all branches except master
>   - master
>
> pages:      # pages  job，它告诉Runner您希望该任务使用GitLab页面部署您的网站
>   stage: deploy
>   script:  # Generate public site and deploy。 需要执行的命令；命令 --> script
>   - bundle exec jekyll build -d public
>       artifacts:  # Save a zipped version for download
>     paths:
>     - public
>   only:  # Only deploy the master branch
>   - master
> ```
>
> 根据上面的配置文件，在部署网站时会执行两条命令：`bundle install --path vendor` 和`bundle exec jekyll build -d public`
>
> 一个Gemfile文件示例：
>
> ```
> # frozen_string_literal: true
> source "https://rubygems.org"
>
> # Kiko Plus 主题所需插件，下面的内容需要根据实际情况进行配置，不能重用
> # 并且需要在_config.yml文件的plugins下进行添加
> gem 'jekyll-seo-tag'
> gem 'jekyll-paginate'
> gem 'jekyll-admin'
> ```




更多示例: [README.md · master · Jekyll Themes / Build Jekyll with Bundler · GitLab](https://gitlab.com/jekyll-themes/default-bundler/blob/master/README.md "README.md · master · Jekyll Themes / Build Jekyll with Bundler · GitLab")




相关视频：[How to Publish a Website with GitLab Pages - YouTube](https://www.youtube.com/watch?v=TWqh9MtT4Bg&feature=youtu.be "How to Publish a Website with GitLab Pages - YouTube")

[README.md · master · Jekyll Themes / Build Jekyll with Bundler · GitLab](https://gitlab.com/jekyll-themes/default-bundler/blob/master/README.md "README.md · master · Jekyll Themes / Build Jekyll with Bundler · GitLab")







---



## Jekyll主题安装


### Kiko Plus主题安装
[Kiko Plus](http://jekyllthemes.org/themes/kiko-plus/ "Kiko Plus")移动端效果也不错，特点：Disqus comment system、Google analytics、Pagination support、Custom tags、SEO support



在GitHub上可以正常访问tag，而在Gitlab上找不到tags页面。**原因**居然是目录`tags`没有push到gitlab的远程仓库中！！！，明明使用了`git add .`。

问题原因：在全局.gitignore 文件中，忽略了 tags 目录。   
解决办法：在本Project的.gitignore中添加`!tags`，来跟踪tags文件。    



### Jekyll Clean Dark主题安装
[Jekyll Clean Dark](http://jekyllthemes.org/themes/jekyll-clean-dark/ "Jekyll Clean Dark")黑色主题，各终端适配的很好，很漂亮。RSS订阅。

在GitHub和GitLab上都不能正常使用。




### Cards主题的安装

> 该主题就是搞不懂 gulp是怎么用的

软件安装(安装gulp)：
```
sudo apt install npm
sudo npm install gulp -g
```

[Gulp for Beginners](https://css-tricks.com/gulp-for-beginners/)     

[Getting Started with Gulp.js - Semaphore](https://semaphoreci.com/community/tutorials/getting-started-with-gulp-js "Getting Started with Gulp.js - Semaphore")

[Gulp折腾之路(III) | 晚晴幽草轩](http://jeffjade.com/2016/08/08/113-toss-gulp/ "Gulp折腾之路(III) | 晚晴幽草轩")


>主题列表：  
[Dr. Jekyll's Themes - 211 free open source static website jekyll themes](https://drjekyllthemes.github.io/)


### Cayman Blog Theme
[Cayman Blog Theme](https://lorepirri.github.io/cayman-blog/ "Cayman Blog Theme")



### jekyll-theme-simple-texture


[jekyll-theme-simple-texture: A gem-based responsive simple texture styled Jekyll theme.](https://github.com/yizeng/jekyll-theme-simple-texture)

作者主页：<http://yizeng.me/>


