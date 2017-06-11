# Github、OpenShift搭建Blog

标签（空格分隔）： Web

---

[搭建个人博客，你需要知道这些](http://www.jianshu.com/p/0c3663c4f0ef)  

FarBox、Jekyll、Octopress、Ghost、marboo、Hexo、Medium、Logdown、Prose.io等  
[各种轻博客程序，点击此处](https://www.zhihu.com/question/21981094)  


[站长之家](http://www.chinaz.com/)  
[如何拥有一个完全免费的博客？](https://www.zhihu.com/question/20688782)  


[有哪些便宜稳定，速度也不错的Linux VPS 推荐？](https://www.zhihu.com/question/20800554)



## 域名
![](https://img1.wsimg.com/pc/img/1/trademark/nonregistered/godaddy-logo.png)  

[GoDaddy](https://hk.godaddy.com/ "币种选择CNY")  
支持支付宝付款，一般的域名：第一年每年 ¥5.86，兩年以上每年 ¥101.00

[DNSPod-免费智能DNS解析服务商](https://www.dnspod.cn/)  
.com	
首年注册（元/年）：49	  
续费（元/年）：55		  
转入（元/年）：55  

[阿里云：万网](https://wanwang.aliyun.com/domain/)
新注价格	        
1年	3年	5年	10年  
55	175	295	595	  
续费价格  
1年	3年	5年	10年  
60	180	300	600  


以上费用都是指**changchuanfan.com域名的价格**

如果是fandean.tech价格就非常便宜，但不知道有什么缺点。



> 1. 千万不要用免费tk域名，它迟早有一天会坑你（直接删你域名之类的），让你好不容易得到的搜索引擎排名瞬间消失。（本来tk就不容易被收录）域名不贵，也不难买，支持支付宝的GoDaddy，经常有优惠。 
2. OpenShift可以验证信用卡（不扣钱）但不用付费服务，验证之后你创建app的宿主机质量会变好！并且你可以使用SSL证书（StartSSL免费证书也行） 
3. 不要贪图免费的域名，这会牺牲和浪费你的精力。


为什么同一个域名卖的价格都不一样？




## 主机
三种基本的主机类型：

- 虚拟主机（共享）
- 虚拟专用伺服器（VPS）
- 专属伺服器


- 进阶虚拟主机：云端伺服器


购买主机的时候要注意自己的域名是不是已经ICP备案，如果没有备案不能选择大陆的主机。建议用香港的，毕竟与日韩美比地理位置相对于大陆较近比。这里演示用的[主机公园](http://www.hostpark.cn/)的香港虚拟主机，如果你的域名备案了可以选择大陆的主机，比如阿里云，腾讯云都可以。

备案篇：     
阿里云的备案服务还是很好的，和在淘宝购物一般，一切都可以线上完成，无脑，只需要耐心等待审批过程    


> 购买域名后有了域名，那么IP地址从哪里获取，买主机时会提供IP地址？之后还需设置域名解析。



服务器：              
免费的就用openshift吧，贼叼了，各种好啦。(其他免费的有的没得)             
收费较便宜的就SAE吧    

域名：             
免费的就<http://freenom.com> 后缀是tk，ml，ga，cf。谷歌收录正常，好好写呗，百度就算了。  

因为你很可能在国内，所以考虑一下CDN。    
免费的CDN有的是；效果是很明显的。而且节省流量。    


>一个搭建在openshift上的使用freenom.com上的.tk免费域名的blog <http://www.superwbd3.tk/>



服务器提供商，相对来说会比较稳定靠谱，国内的UCloud、阿里云、腾讯云、七牛云，国外的有亚马逊。七牛云也可以作为Web服务器？？


图床服务器：    
将网页和多媒体资源分开存储，可以让Web服务器的访问宽带不至于很快被占用完。七牛云存储的免费用户拥有10G的存储空间，和每月10W次的put/delete请求，100万次get请求。另还可以考虑其他免费图床服务(考虑其是否靠谱)。  



**购买VPS吧，便宜好用；见另一篇关于VPS的文章**



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

Github+jekyll略显geek

### Hexo
Hexo：   
它的一个NexT主题感觉很好    
[NexT主题介绍](http://theme-next.iissnan.com/)，该主题有3种外观。   
[Hexo建站](http://liangjingkanji.coding.me/2016/12/11/HexoBuild/)    




### Ghost



## 博客工具

### 站内搜索
开源免费的中文搜索引擎 xunsearch 迅搜，SegmentFault网站也是使用此搜索引擎。  

[xunsearch](http://www.xunsearch.com/)  


### 评论

[FLAG COUNTER](http://s09.flagcounter.com/) 可统计网页访问信息。示例  
![](http://s01.flagcounter.com/count2/88/bg_FFFFFF/txt_000000/border_CCCCCC/columns_2/maxflags_10/viewers_0/labels_0/pageviews_0/flags_0/)  

[快站](http://www.kuaizhan.com/) 做手机网站，上搜狐快站  
[畅言](http://changyan.kuaizhan.com/) 畅言支持各种类型的Web网站接入，网站只需要粘贴、复制JS代码到网页的任意位置，或者复制代码到模板中，畅言评论框将在所有网页自动出现。


[网易云跟贴](https://gentie.163.com/info.html)可用于多平台的评论服务。  
[网易云捕](http://crash.163yun.com/)用于捕捉app的每一次质量问题，助力开发者打造高品质app。  
[网易易测](http://et.163yun.com/) 用于对APP进行兼容性测试。    

[**Disqus**](https://disqus.com/features/)   Powerful publisher tools, all for free ， Disqus平台支持评论和原生广告。(也有share的功能)
[JiaThis](http://www.jiathis.com/index2) 为网站添加分享按钮和评论区。   
上面两个的应用见[此处](http://talentprince.github.io/blog/2015/01/04/android-yu-inject-yi-lai-zhu-ru-de-bu-jie-zhi-yuan/)   




## 让博客Docker化

[在本地搭建你的Ghost博客](http://www.jianshu.com/p/08c7db751430)

能否通过Docker镜像在OpenShift上部署博客。

[让博客Docker化](http://dockone.io/article/961)     
[Docker免费空间申请-DaoCloud使用教程安装WordPress部署Docker镜像](https://www.freehao123.com/docker-daocloud/)        


