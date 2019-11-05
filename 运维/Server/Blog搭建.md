# Blog搭建流程简介

> 偏向于IT人员与爱折腾的同学



1. 编写或生成博客代码
2. 部署到服务器或某托管平台



## 博客生成器的选择

博客生成器的作用：根据你编辑的文件内容（博文内容）和你选择的主题（博客外观和功能）自动生成一个博客站点需要的所有代码；它分为动态和静态两种。

### 动态和静态生成器的对比

动态博客生成器：

- 代表：WordPress、Ghost、FarBox等
- 特点： 
  - 有管理后台 ，发布更新操作更加**方便**。
  - 功能多，界面美观。

静态博客生成器：

- 代表：Jekyll、Octopress、Hexo、Hugo等 
- 特点： 
  -  资源占用上， 静态的相比动态占用服务器资源少，还可以托管在Github Pages上 ；
  -  访问速度上， 静态博客没有数据库，所以访问速度更快；  
  - 安全性上， 静态博客相比动态博客免疫了很多Web攻击套路 。



静态站点比动态站点的好处之一是：您经常可以找到便宜的托管服务，甚至可以免费使用github页面等服务 



> 本人排除：
>
> -  Wordpress：已经演化为内容管理系统；冗余功能太多，导致载入速度变慢且写作的注意力也容易被分散 。百度百科介绍如下：WordPress是使用PHP语言开发的开源（上面介绍的基本都开源）博客平台，后端依赖PHP和MySQL数据库（服务器性能要求高一点）。也可以把 WordPress当作一个内容管理系统（CMS）来使用。但是**它是功能最丰富，在排名前1000万的网站中用户最多的一个**，但是也有多次暴露出安全漏洞。
>
> -  FarBox：国产收费
>



### 静态博客生成器之间的对比

主流静态博客生成器之间的对比：

- **Jekyll**： 基于Ruby开发；配置上自定义程度高（需要费些精力），生成速度相对来说还是慢。
- Octopress：基于Jekyll， 添加了一些预装的插件和其他复杂性。 文章一多生成速度非常慢 。
- Hexo：基于Node.js开发， 文章一多（超过200）生成速度就变慢 
- **Hugo**：基于Go，但它是一个没有依赖的二进制程序，所以安装方便； 并且生成速度极快， 资源占用少。 



**Hugo的优点：**

- Hugo可以在0.1秒内生成一个包含1000个页面的网站，而Jekyll可能需要花费几分钟来访问同一网站
- Hugo是标准的二进制程序，因此在计算机上本地测试/构建站点时，无需维护各种依赖项
- 分页，重定向和实时重新加载工作都可以在Hugo中直接使用，而无需设置插件
- 在Hugo中，您只需添加`draft = true`帖子的开头即可保存未发布的草稿，而不必将其移动到另一个文件夹
- 另外，Hugo还具有许多其他好处，例如内容的组织方式可能更直观，并且内置了多语言功能



相对来说，Hugo的主要优势在于安装方便，生成速度也是最快的。



**Hugo, Jeklly, Hexo 依赖关系的对比：**

hexo是基于nodejs的应用，所以要先安装nodejs； Hexo的npm安装需要依赖很多其他node库，在网络条件不好的情况下，光安装就很费劲。

Jeklly基于Ruby，所以需要先下载安装一大堆Ruby相关的东西。

但在安装Hugo的时候可以直接选择二进制安装，它只是一个没有依赖性的标准二进制程序，而不用先下载Go，Go的编译型语言特性让Hugo更容易“二进制安装”。



> 第一次用的是 Jekyll并托管在github上，但很不方便，比如没有自动生成post，不能一键部署，（当时不知道可以使用相关编辑工具来解决上面的问题），文件结构和配置也是比较繁琐，最重要的是其对md文件格式的苛刻要求，有时生成的静态文件很乱，应该是有些字符解析的问题，需要修修改改，在使用了一段时间后决定放弃。



>  文章导入方面，Hugo 支持 Yaml 格式的 Metadata Header，唯一需要修改的是时间格式。Hexo 是使用的 `date: YYYY-MM-DD HH:MM` 的格式，而 Hugo 用的是带有时区的 `date: YYYY-MM-DDTHH:MM:SS+HH:MM`。 



> 博客生成器的具体使用见其他文章。



### 主题的选择

各生成器的主页都可找到对应的主题。

主题选择时：

- 第一当然是颜值
- 第二是该主题为博客实现的功能
- 主题选择时尽量选择响应式主题



**博客常见功能：**

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
15. Google**站内搜索** 
16. See Also 支持
17. Disqus评论支持
18. 自定义css、js
19. utteranc**评论**（基于Github iss）
20. 部分自定义的shortcode
21. 文章自定义摘要
22. 自定义广告支持

上面是 [rujews/maupassant-hugo](https://github.com/rujews/maupassant-hugo) 主题的功能。





> 下面是自己感觉还不错的几个主题（大多是Hugo的）
>
> - Hexo的 **NexT主题**  是很多人都在使用的一个主题 ， [NexT主题介绍](http://theme-next.iissnan.com/)，该主题有3种外观，并且还有Jekyll版。
>
> - [Hugo Travelify Theme | Hugo Themes](https://themes.gohugo.io/hugo-travelify-theme/)   类wordpress主题 ；这个布局感觉不错，功能还需要自行完善一下。
> - [Mero | Hugo Themes](https://themes.gohugo.io/mero/) 黑色系，功能还需要自行完善一下。
> - [Hugo Theme Learn | Hugo Themes](https://themes.gohugo.io/hugo-theme-learn/) 纯粹的为编写一个**文档**而生，看起来不错
> - [Syna | Hugo Themes](https://themes.gohugo.io/syna/)  可定制的一对多页面主题，适用于**开源项目**，公司和自由职业者。 





推荐 ： [搭建个人博客，你需要知道这些](http://www.jianshu.com/p/0c3663c4f0ef)  


[如何拥有一个完全免费的博客？](https://www.zhihu.com/question/20688782)  


[有哪些便宜稳定，速度也不错的Linux VPS 推荐？](https://www.zhihu.com/question/20800554)





## 托管服务的选择



这里介绍几个免费的方案：（提个醒，各Pages都需要你会使用git）

- Github Pages：国内访问有时抽风，示例< https://fandean.github.io/ >
- GitLab Pages：国内访问有时抽风，示例< https://faner.gitlab.io/ >
- 码云、coding 的 pages：[Coding Pages](https://coding.net/help/doc/pages) 的文档，这是我找的一个示例 <http://liangjingkanji.coding.me/>
- Netlify：官网在国内基本无法访问
- Render：国内访问缓慢
- OpenShift





## 购买域名和主机

>  如果你将博客部署到Github pages等地方，域名（可选）和主机也可不买。

### 主机

就服务器，用来放你的博客。每个主机都有其唯一的IP地址。



主机类型：

- **虚拟主机**（virtual hosting）或称 **共享主机**（shared web hosting）：就是把一台运行在互联网上的服务器划分成多个“虚拟”的服务器，每一个虚拟主机都具有独立的域名和完整的互联网服务器功能。（价格相对便宜）
- 虚拟专用伺服器（VPS）： 从技术上讲，它仍然是共享主机 ；但 VPS主机的运作方式与共享主机完全不同。 VPS服务器本质上是一个虚拟化的服务器环境，它像独立服务器一样运行，但其可以灵活的从多个不同的共享物理服务器获取资源（扩展性强）。 （价格高）



主机购买：

- 国内买：在国内建站就连同域名一起在国内买，可选择阿里云...等。
- 国外买：你有**特殊需求**或想在国外建站随意发布内容就在国外买主机和域名。
- 路线选择靠自己近的，但最好自己去测试一下速度。



> 国内单独购买虚拟主机无需备案，单独购买域名需要 **备案**（也就提供些资料等几天的事，目的也就是方便对你进行监督管理）。



### 域名

把你的博客部署到你的主机后，可以通过主机的 IP 什么的来进行访问了，但是这样用户不方便呀。并且你想当你不小心做到和腾讯一样大时你需要Hold住这么多人的访问，就需要购买上万台服务器，此时就有上万个IP，用户就会纠结自己该用哪个？于是就有了域名和相关的服务，来让你只需要输入`www.qq.com`就能让你最快的访问到某台服务器。



可这些地方购买域名：

- [阿里云：万网](https://wanwang.aliyun.com/domain/)
- [GoDaddy](https://hk.godaddy.com/ "币种选择CNY")  支持支付宝付款
- [Namesilo](https://www.liaosam.com/goto/namesilo) 支持支付宝付款



**注意事项：**

- 在国内购买域名需要进行备案（需要几天时间），而国外无需备案。
- 推荐的域名后缀：`.com.`、`.net`、`.org`、`.me`等，域名的后缀和购买的年限都会影响到网站的SEO（如果你不考虑的话就随便）。
- 如果你有特殊需求，那么在域名和主机选择上还要进一步深入的了解。
- 要想让域名和主机IP关联还需设置**域名解析**（很简单他会提示你操作步骤）。



> 我曾经有个疑问：如果我将静态网站托管在github pages上，并且用自己的域名是否需要备案？
>
> **注意**：这里需要备案的是域名，而非主机；在国外服务商购买域名时该域名无需备案，但你想使用该未备案的域名用到国内主机上是不允许的（不知是否有其他方式）



## GitHub搭建Blog



> - [Github Pages 自定义域名启用 https]( https://mickir.me/blog/https-github-pages-custom-domain.html ) 作者建议使用 CloudFlare 而非 Github自带的https 
>
> - [使用PWA增强你的github pages - 掘金](https://juejin.im/post/5adb48b3f265da0ba76f502a) 【可选】
>
>  使用[cloudflare](https://cloudflare.com/)对github pages进行缓存和CDN，提供`HTTP/2` `https`等功能。看其升级记录  [Blog大升级 | Mickir的魔法笔记](https://mickir.me/blog/blog-update.html)  如何得到该博文中的各项评估测试数据？







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


[Hexo建站](http://liangjingkanji.coding.me/2016/12/11/HexoBuild/)    



### Ghost




### Jekyll
见另一篇文章：《Jekyll》







## 

## Netlify

 [Netlify](https://www.netlify.com/) 是什么？它是一家云计算公司，为静态网站提供托管和 serverless 后端服务。 

[部署 Hugo 网站到 Netlify - 掘金](https://juejin.im/post/5d086cdbe51d454f71439cdb)



有人部署在Netlify比Github Pages上的博客在国内访问更快，可是我连Netlify官网都进不去，对此表示怀疑。



> 类似的还有一个Render，此网站可以访问



**先说一下它的功能:**

- 可以**托管静态资源**
- 可以添加 CDN ，**加速国内访问**
- Continuous Deployment **持续部署** , 当你提交改变到 git 仓库，它就会自动运行 build command, 进行自动部署
- 可以添加自定义域名
- **可以启用免费的 TLS 证书，启用 HTTPS**
- **最强大的 cms**, 用来管理静态资源
- 自带 CI、支持自定义页面重定向、自定义插入代码、打包和压缩 JS 和 CSS、压缩图片、处理图片





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



因为你很可能在国内，所以考虑一下CDN。    
免费的CDN有的是；效果是很明显的。而且节省流量。    



KeyCDN

 CloudFlare  免费

又拍云 CDN



> 想要建站的朋友也可以使用免费CDN来解决OpenShift空间访问不稳定的情况。

> [CDN](http://baike.baidu.com/item/CDN)的全称是Content Delivery Network，即内容分发网络。其目的是使用户可就近取得所需内容，解决 Internet网络拥挤的状况，提高用户访问网站的响应速度。







## 让博客Docker化

[在本地搭建你的Ghost博客](http://www.jianshu.com/p/08c7db751430)

能否通过Docker镜像在OpenShift上部署博客。

[让博客Docker化](http://dockone.io/article/961)     
[Docker免费空间申请-DaoCloud使用教程安装WordPress部署Docker镜像](https://www.freehao123.com/docker-daocloud/)        






## 博客工具



### 专用编辑器

使用合适的编辑工具能让博客管理更加简单。

- Netlify CMS： 将Netlify CMS与任何静态站点生成器一起使用可实现更快，更灵活的Web项目 
- Prose

参考：

- [planetjekyll/awesome-jekyll-editors: A collection of awesome Jekyll editors](https://github.com/planetjekyll/awesome-jekyll-editors)
- [Editor Plug-ins for Hugo | Hugo](https://gohugo.io/tools/editors/)  官方介绍了几款插件





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