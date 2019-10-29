# Blog搭建流程



几种方案：

- 购买主机 > 购买域名 > 选择某个博客生成器来生成博客 > 部署博客
- 购买域名 >  选择静态博客生成器 > 部署到GitHub（或者GitLab、码云、Coding）的Pages 【不用购买主机】
- 选择静态博客生成器 > 部署到GitHub（或者GitLab、码云、Coding）的Pages > 使用GitHub等提供的二级域名 【不买主机也不买域名】
- 或者将上面的各种Pages服务替换为 OpenShift



## 博客生成器

博客生成器用来自动生成博客的页面，它分为动态和静态两种。

动态博客生成器：

- 代表：WordPress、Ghost等
- 特点： 有管理后台 ，发布更新操作更加**方便**

静态博客生成器：

- 代表：Hexo、Jekyll、Octopress、Hugo等 
- 特点： 
  -  资源占用上， 静态的相比动态占用服务器资源少，还可以托管在Github Pages上 ；
  -  访问速度上， 静态博客没有数据库，所以访问速度更快；  
  - 安全性上， 静态博客相比动态博客免疫了很多Web攻击套路 。



 静态站点比动态站点的好处是，您经常可以找到便宜的托管服务，甚至可以免费使用github页面等服务 



主流静态博客生成器的对比：

- **Jekyll**： 基于Ruby开发；配置上自定义程度高（需要费些精力），生成速度相对来说还是慢。
- Octopress：基于Jekyll， 添加了一些预装的插件和其他复杂性。 文章一多生成速度非常慢 。
- Hexo：基于Node.js开发， 文章一多（超过200）生成速度非常慢 
- **Hugo**：基于Go，但它是一个没有依赖的二进制程序，所以安装方便； 并且生成速度极快， 资源占用少。 



> 第一次用的是 Jekyll并托管在github上，但很不方便，比如没有自动生成post，不能一键部署，并且当时不知道可以使用专用编辑器来解决上面的问题，文件结构和配置也是比较繁琐，最重要的是其对md文件格式的苛刻要求，有时生成的静态文件很乱，应该是有些字符解析的问题，需要修改后再编译再检查页面显示，如此反复，在使用了一段时间后决定放弃。



**Hugo与Jekyll对比：**

- Hugo可以在0.1秒内生成一个包含1000个页面的网站，而Jekyll可能需要花费几分钟来访问同一网站
- Hugo是标准的二进制程序，因此在计算机上本地测试/构建站点时，无需维护Ruby依赖项
- 分页，重定向和实时重新加载工作都可以在Hugo中直接使用，而无需设置插件
- 在Hugo中，您只需添加`draft = true`帖子的开头即可保存未发布的草稿，而不必将其移动到另一个文件夹
- 另外，Hugo还具有许多其他好处，例如内容的组织方式可能更直观，并且内置了多语言功能



**没有依赖关系**。Hugo的优点在于，它只是一个没有依赖性的标准二进制程序，因此维护由Hugo创建的站点非常简单。另一方面，Jekyll和WordPress分别具有复杂的Ruby和PHP依赖关系。 这个很棒，不用像Jekyll那样安装一大堆Ruby相关的东西。



> **Hugo, Jeklly, Hexo 简单对比**
>
> hexo是基于nodejs的应用，所以要先安装nodejs； Hexo的npm安装需要依赖很多其他node库，在网络条件不好的情况下，光安装就很费劲。
>
> Jeklly基于Ruby，所以需要先下载安装Ruby。虽然相对Hexo来说依赖要少一些，但安装其他还是略显麻烦。
>
> 但在安装Hugo的时候可以直接选择了二进制安装，而不用先下载Go，Go的编译型语言特性让Hugo更容易“二进制安装”。
>
> 所以相对来说，Hugo的主要优势在于安装方便，生成速度也是最快的。



>  文章导入方面，Hugo 支持 Yaml 格式的 Metadata Header，唯一需要修改的是时间格式。Hexo 是使用的 `date: YYYY-MM-DD HH:MM` 的格式，而 Hugo 用的是带有时区的 `date: YYYY-MM-DDTHH:MM:SS+HH:MM`。 



排除：

-  Wordpress：已经演化为内容管理系统；冗余功能太多，导致载入速度变慢且写作的注意力也容易被分散 。百度百科介绍如下：WordPress是使用PHP语言开发的开源（上面介绍的基本都开源）博客平台，后端依赖PHP和MySQL数据库（服务器性能要求高一点）。也可以把 WordPress当作一个内容管理系统（CMS）来使用。但是它是功能最丰富，再排名前1000万的网站中用户最多的一个，但是也有多次暴露出安全漏洞。

- FarBox：国产收费



> 主题选择时尽量选择响应式主题。



推荐 ： [搭建个人博客，你需要知道这些](http://www.jianshu.com/p/0c3663c4f0ef)  




[如何拥有一个完全免费的博客？](https://www.zhihu.com/question/20688782)  


[有哪些便宜稳定，速度也不错的Linux VPS 推荐？](https://www.zhihu.com/question/20800554)





## 主机



三种基本的主机类型：

- 虚拟主机（共享）
- 虚拟专用伺服器（VPS）
- 专属伺服器


- 进阶虚拟主机：云端伺服器



购买主机的时候要注意自己的**域名**是不是已经ICP备案，如果没有备案不能选择大陆的主机。建议用香港的，毕竟与日韩美比地理位置相对于大陆较近比。这里演示用的[主机公园](http://www.hostpark.cn/)的香港虚拟主机，如果你的域名备案了可以选择大陆的主机，比如阿里云，腾讯云都可以。

购买域名之后，如果选择国外的服务器提供商，域名只需要设置好DNS解析即可使用，而在国内的服务器提供商上部署，你还需要进行域名备案 。

我曾经有个疑问：如果我将静态网站托管在github pages上，并且用自己的域名是否需要备案？

**注意**：这里需要备案的是域名，而非主机；在国外服务商购买域名时该域名无需备案，但你想使用该未备案的域名购买国内主机是不允许的（不知是否有其他方式）



备案篇：     
阿里云的备案服务还是很好的，和在淘宝购物一般，一切都可以线上完成，无脑，只需要耐心等待审批过程    


> 购买域名后有了域名，买主机时会提供IP地址，之后还需设置域名解析。



服务器：              
免费的就用openshift吧，贼叼了，各种好啦。(其他免费的有的没得)             
收费较便宜的就SAE吧 

 

因为你很可能在国内，所以考虑一下CDN。    
免费的CDN有的是；效果是很明显的。而且节省流量。    


>一个搭建在openshift上的使用freenom.com上的.tk免费域名的blog <http://www.superwbd3.tk/>



**购买VPS吧，便宜好用；见另一篇关于VPS的文章**





## 域名
可以上这些地方购买域名：

- [阿里云：万网](https://wanwang.aliyun.com/domain/)
- [GoDaddy](https://hk.godaddy.com/ "币种选择CNY")  支持支付宝付款
- [Namesilo](https://www.liaosam.com/goto/namesilo) 支持支付宝付款



域名：

详见另一篇文章。



## OpenShift搭建Blog
[在 OpenShift 上**免费**搭建 Ghost 博客的过程](http://www.demojameson.com/2015/08/09/publish-ghost-blog/)


**准备事项：**  

1. 域名  顶级域名二级域名都行，但没有的话就不能让国内用户正常使用了。
2. 国外邮箱
3. 翻q工具（可选）  不一定是VPN，只要能让你的IP变到国外就行。据说OpenShift给国内用户分配的服务器比国外用户更加拥挤，不知是不是真的。

**方案：**    

- OpenShift + Ghost
- OpenShift + WordPress



> 想要建站的朋友也可以使用免费CDN来解决OpenShift空间访问不稳定的情况。

> [CDN](http://baike.baidu.com/item/CDN)的全称是Content Delivery Network，即内容分发网络。其目的是使用户可就近取得所需内容，解决 Internet网络拥挤的状况，提高用户访问网站的响应速度。


系列教程：
[新版OpenShift空间申请使用教程：安装WP、域名绑定**等**](http://www.chinaz.com/web/2015/1019/458725.shtml)
[手把手教你在OPENSHIFT上搭建WORDPRESS博客（一、、）](http://www.longgaming.com/archives/110)





## GitHub搭建Blog



> - [Github Pages 自定义域名启用 https]( https://mickir.me/blog/https-github-pages-custom-domain.html ) 作者建议使用 CloudFlare 而非 Github自带的https 
>
> - [使用PWA增强你的github pages - 掘金](https://juejin.im/post/5adb48b3f265da0ba76f502a) 【可选】
>
>  使用[cloudflare](https://cloudflare.com/)对github pages进行缓存和CDN，提供`HTTP/2` `https`等功能。看其升级记录  [Blog大升级 | Mickir的魔法笔记](https://mickir.me/blog/blog-update.html)  如何得到该博文中的各项评估测试数据？



Github+jekyll略显geek



**操作步骤：**

在GitHub上新建项目 `jekyll-demo`，然后我们为这个项目创建Github Pages，（这里不是为用户）

[安装 - Jekyll • 简单静态博客网站生成器](http://jekyllcn.com/docs/installation/ "安装 - Jekyll • 简单静态博客网站生成器")   参考这里，安装4个软件。   

打包下载主题： <https://github.com/streetturtle/jekyll-clean-dark.git> ，更多主题见 [Jekyll Themes](http://jekyllthemes.org/ "Jekyll Themes")

更改该主题的配置文件： `_config.yml`
```
url: http//faner.gitlab.io
# 下面的路径该为你的项目路径
baseurl: `/jekyll-demo`
# GitHub 图标指向自己
github: fandean
```

进入主题文件夹：`git init`初始化git仓库，

创建分支： `git branch gh-pages`；该项目的github pages文件需位于gh-pages分支中  
`git add .`  
`git commit -m "my jekyll"`    

`git remote add origin https://github.com/FanDean/fandean.github.io.git`    

`git push origin gh-pages`      

在浏览器输入`fandean.github.io/jekyll-demo` 即可打开网站。

之后的博客文章在`_post`文件夹中更新、添加即可。

```
---
layout: post
title: "Installation"
date: 2015-11-01 16:25:06
description: Here you'll find out how to install this theme
tags: 
 - installation
---
```



### Hexo
Hexo：   它的一个 **NexT主题**  是很多人都在使用的一个主题 ， [NexT主题介绍](http://theme-next.iissnan.com/)，该主题有3种外观，并且还有Jekyll版。

[Hexo建站](http://liangjingkanji.coding.me/2016/12/11/HexoBuild/)    



### Ghost




### Jekyll
见另一篇文章：《Jekyll》



### Hugo

 Hugo用Go语言编写，是一个开放源代码的静态站点生成器。 使用Hugo构建的网站极其快捷，安全，可以部署在任何地方，包括AWS，**GitHub Pages**，Heroku，Netlify和任何其他托管提供商。 



安装方法见下面几篇文章：

- [如何使用Hugo在GitHub Pages上搭建免费个人网站 - 知乎](https://zhuanlan.zhihu.com/p/37752930)
- [Hosting on GitHub Pages - Hugo中文文档](https://www.gohugo.org/doc/tutorials/github-pages-blog/) 必看结尾
-  [Hugo + Github Pages 搭建个人博客 - Brave New World](https://nusr.github.io/post/2019/2019-04-26-creat-hugo-blog/)  
- [Hugo中文文档](https://www.gohugo.org/)



推荐的主题：

- [Hugo Terrassa Theme | Hugo Themes](https://themes.gohugo.io/hugo-terrassa-theme/)

- [Timer Hugo | Hugo Themes](https://themes.gohugo.io/timer-hugo/)

- [Beautifulhugo | Hugo Themes](https://themes.gohugo.io/beautifulhugo/)

  

  

  

功能齐全，看起来还不错：

- [Academic | Hugo Themes](https://themes.gohugo.io/academic/) ； The Academic **framework** enables you to easily create a beautifully simple website using the [Hugo](https://gohugo.io/) static site generator in under 10 minutes 

- [Hugo Travelify Theme | Hugo Themes](https://themes.gohugo.io/hugo-travelify-theme/)   可爱的wordpress主题 ；这个布局感觉非常好，功能也好
- [Hugo Future Imperfect Slim | Hugo Themes](https://themes.gohugo.io/hugo-future-imperfect-slim/) 这个感觉也不错
- [Mainroad | Hugo Themes](https://themes.gohugo.io/mainroad/)  一个响应式，干净且注重内容的主题，这里有一个 [Mainroad的汉化版](https://github.com/jasonhancn/mainroad-cn)。

配色布局好：

- [Kross Hugo Portfolio Template | Hugo Themes](https://themes.gohugo.io/kross-hugo-portfolio-template/) 用于个人博客布局不错，但对于程序员来说功能需要加强
- [Meghna Hugo | Hugo Themes](https://themes.gohugo.io/meghna-hugo/) 主题样式不错（很**漂亮**的黑暗系），但是需要改进。
- [Mero | Hugo Themes](https://themes.gohugo.io/mero/) 黑暗系的佼佼者
- [Personal Web | Hugo Themes](https://themes.gohugo.io/personal-web/) 个人网站中还算不错

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





## GitLab Pages

国内GItLab可以正常访问。

GitLab的优点和缺点见：  
[From GitHub Pages to GitLab Pages - Eight Portions](https://eightportions.com/2016-08-21-Migrate-blog-to-GitLab-pages/ "From GitHub Pages to GitLab Pages - Eight Portions")   
该网站使用的主题为[Beautiful Jekyll](http://deanattali.com/beautiful-jekyll/ "Beautiful Jekyll") 看起来还不错。

GitLab Pages文档的格式与GitHub Pages文档不一样，我希望以下说明可以帮助您浏览设置过程。





[Hosting on GitLab.com with GitLab Pages | GitLab](https://about.gitlab.com/2016/04/07/gitlab-pages-setup/ "Hosting on GitLab.com with GitLab Pages | GitLab")    



[Getting started with GitLab CI - GitLab Documentation](https://docs.gitlab.com/ee/ci/quick_start/README.html "Getting started with GitLab CI - GitLab Documentation")



此处介绍的步骤：[pages / jekyll · GitLab](https://gitlab.com/pages/jekyll "pages / jekyll · GitLab")

Start from a local Jekyll project

- Install Jekyll.
- Use `jekyll new` to create a new Jekyll Project.
- Add this`.gitlab-ci.yml` to the root of your project.
- Push your repository and changes to GitLab.

## 码云 Pages





## Coding Pages

Coding Pages 是一个免费的静态网页托管和演示服务。您可以使用 Coding Pages 托管博客、项目官网等静态网页，还可以绑定自定义域名。

案例：设计师吴彦祖：<http://liangjingkanji.coding.me/>

[Coding Pages 介绍](https://coding.net/help/doc/pages/index.html "Coding Pages 介绍")


资源限制：

- Coding Pages 部署来源的大小不超过 100M。
- 每小时最多可部署 10 次。

Jekyll 支援： 

Coding Pages 可自动构建 Jekyll 网站，目前支持 Jekyll 3.0。



## 域名绑定与CDN



[Github Page创建个人主页以及绑定域名 - 蛙牛的个人页面](https://my.oschina.net/lujianing/blog/178745 "Github Page创建个人主页以及绑定域名 - 蛙牛的个人页面")

[我的博客是如何搭建的（github pages + HEXO + 域名绑定） - 简书](http://www.jianshu.com/p/834d7cc0668d "我的博客是如何搭建的（github pages + HEXO + 域名绑定） - 简书")

[GitHub Pages 绑定来自阿里云的域名](http://quantumman.me/blog/setting-up-a-domain-with-gitHub-pages.html "GitHub Pages 绑定来自阿里云的域名")  推荐.



绑定顶级域名和绑定二级域名。



> DNSpod的作用是什么？免费DNS智能解析



## 让博客Docker化

[在本地搭建你的Ghost博客](http://www.jianshu.com/p/08c7db751430)

能否通过Docker镜像在OpenShift上部署博客。

[让博客Docker化](http://dockone.io/article/961)     
[Docker免费空间申请-DaoCloud使用教程安装WordPress部署Docker镜像](https://www.freehao123.com/docker-daocloud/)        






## 博客工具



### 专用编辑器

主要参考：[planetjekyll/awesome-jekyll-editors: A collection of awesome Jekyll editors](https://github.com/planetjekyll/awesome-jekyll-editors)

- Netlify CMS： 将Netlify CMS与任何静态站点生成器一起使用可实现更快，更灵活的Web项目 
- Prose：





### 图床和相关工具

服务器提供商，相对来说会比较稳定靠谱，国内的UCloud、阿里云、腾讯云、七牛云，国外的有亚马逊。

图床服务器：    
将网页和多媒体资源分开存储，可以让Web服务器的访问宽带不至于很快被占用完。

七牛云存储的免费用户拥有10G的存储空间，和每月10W次的put/delete请求，100万次get请求。

立即注册成为七牛云用户，并完成实名认证，即可成为标准用户。成为标准用户您将获得：10 GB 永久免费空间，每月 10 GB 下载流量等诸多免费额度。



| 存储空间（北美）     | 第 0 GB 至 10 GB                         | 免费  （这就是免费的10GB空间） |
| -------------------- | ---------------------------------------- | ------------------------------ |
| 第 10 GB 至 50 TB    | 0.165 元/GB/月                           |                                |
| 第 50 TB 至 500 TB   | 0.162 元/GB/月                           |                                |
| 第 500 TB 至 5120 TB | 0.159 元/GB/月                           |                                |
| 第 5120 TB 以上      | 0.156 元/GB/月                           |                                |
|                      |                                          |                                |
| 上传流量             | 无限制                                   | 免费                           |
|                      |                                          |                                |
| PUT / DELETE 请求    | 第 0 千次至 10 万次                      | 免费  （有次数要求）           |
| 第 10 万次以上       | 0.001 元/千次（2017-01-01 起生效此价格） |                                |
|                      |                                          |                                |
| GET 请求             | 第 0 千次至 100 万次                     | 免费  （有次数要求）           |
| 第 100 万次以上      | 0.001 元/千次                            |                                |

[如何使用七牛云做为图床？ - 简书](http://www.jianshu.com/p/6dce6094bf61 "如何使用七牛云做为图床？ - 简书")



相关工具：

[简化markdown写作中的贴图流程 - Weishu's Notes](http://weishu.me/2015/10/16/simplify-the-img-upload-in-markdown/ "简化markdown写作中的贴图流程 - Weishu's Notes")




**GitHub User Content：**

另考虑如何利用Github相关的：<https://camo.githubusercontent.com> 保存图片，记得之前在GitHub中的Issue中上传图片时，上传的地址就是这里；另看到有些保存早GitHub上的md文章中的图片也是存储在这里。

> 使用PicGo将图片上传到GIthub仓库，并返回该图片的链接



---



下面是针对高级一点的用户来说的内容



### 站内搜索

开源免费的中文搜索引擎 xunsearch 迅搜，SegmentFault网站也是使用此搜索引擎。  

[xunsearch](http://www.xunsearch.com/)  


### 评论

[FLAG COUNTER](http://s09.flagcounter.com/) 可统计网页访问信息。示例  
![](http://s01.flagcounter.com/count2/88/bg_FFFFFF/txt_000000/border_CCCCCC/columns_2/maxflags_10/viewers_0/labels_0/pageviews_0/flags_0/)  

[快站](http://www.kuaizhan.com/) 做手机网站，上搜狐快站  
[畅言](http://changyan.kuaizhan.com/) 畅言支持各种类型的Web网站接入，网站只需要粘贴、复制JS代码到网页的任意位置，或者复制代码到模板中，畅言评论框将在所有网页自动出现。

[网易云跟贴](https://gentie.163.com/info.html)可用于多平台的评论服务。  

[**Disqus**](https://disqus.com/features/)   Powerful publisher tools, all for free ， Disqus平台支持评论和原生广告。(也有share的功能)
[JiaThis](http://www.jiathis.com/index2) 为网站添加分享按钮和评论区。   
上面两个的应用见[此处](http://talentprince.github.io/blog/2015/01/04/android-yu-inject-yi-lai-zhu-ru-de-bu-jie-zhi-yuan/)   



第三方的评论服务。

Next 主题里面提供了多种评论插件的集成，有 changyan | disqus | disqusjs | facebook_comments_plugin | gitalk | livere | valine | vkontakte 这些。

作为一名程序员，我个人比较喜欢 [gitalk](https://gitalk.github.io)，它是利用 GitHub 的 Issue 来当评论，样式也比较不错。所有评论都会出现在Issue中。



访问用户位置分析：  

[Welcome to RevolverMaps | RevolverMaps - Free 3D Visitor Maps](https://www.revolvermaps.com/ "Welcome to RevolverMaps | RevolverMaps - Free 3D Visitor Maps")



### 流量统计

- CNZZ：[http://web.umeng.com](https://link.jianshu.com/?t=http://web.umeng.com) ，中文网站统计分析平台，口碑不错，目前和友盟合并被阿里收购。
- 百度统计：[http://tongji.baidu.com](https://link.jianshu.com/?t=http://tongji.baidu.com) 



[站长之家](http://www.chinaz.com/) 