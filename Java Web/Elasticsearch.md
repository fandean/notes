# Elastic Stack

Elastic Stack 可以很轻松地安装在 Elasticsearch，从而为您带来更优的使用体验，提供的特性包括[安全性](https://www.elastic.co/cn/products/stack/security)、[监管](https://www.elastic.co/cn/products/stack/monitoring)、[警告](https://www.elastic.co/cn/products/stack/alerting)、[报告](https://www.elastic.co/cn/products/stack/reporting)、[图表关联分析](https://www.elastic.co/cn/products/stack/graph)和[机器学习](https://www.elastic.co/cn/products/stack/machine-learning)。



## Elasticsearch 

Elasticsearch 是一个分布式的 RESTful 风格的搜索和数据分析引擎，能够解决不断涌现出的各种用例。作为 Elastic Stack 的核心，它集中存储您的数据，帮助您发现意料之中以及意料之外的情况。

Elasticsearch 使用的是标准的 RESTful API 和 JSON。此外，我们还构建和维护了很多其他语言的客户端



[Elasticsearch: 权威指南 - Elastic](https://www.elastic.co/guide/cn/elasticsearch/guide/current/index.html "Elasticsearch: 权威指南 - Elastic")



在 Elasticsearch 中：

一个文档是一个可被索引的基础信息单元。比如，你可以拥有某一个客户的文档，某一个产品的一个文档，当然，也可以拥有某个订单的一个文档。**文档以****JSON****（****Javascript
Object Notation****）格式来表示**，而JSON是一个到处存在的互联网数据交互格式。





## 安装 

需要java运行环境

### 在Windows中安装

下载压缩包，解压运行即可。

如果内存不够修改config/jvm.options，见下文。



### 在linux中安装

在linux中不能以root身份运行，所以新建用户：

```shell
useradd fan
passwd fan
sudo chown -R fan:fan elasticsearch-5.6.8
```

启动之后只有本地可以访问，尝试修改配置文件 elasticsearch.yml 中的 network.host 为

```
 network.host: 0.0.0.0
```

修改 jvm 内存，修改 config/jvm.options

```
#-Xms2g
#-Xmx2g
-Xms512m
-Xmx512m
```

出现错误：max file descriptors [4096] for elasticsearch process is too low, increase to at least [65536]

[ElasticSearch启动报错,常规解决方法 - 黑猫大侠 - CSDN博客](https://blog.csdn.net/odeng888/article/details/76380832 "ElasticSearch启动报错,常规解决方法 - 黑猫大侠 - CSDN博客") 参照此处

[Elasticsearch问题集锦 - 简书](https://www.jianshu.com/p/0e3fe85b6366 "Elasticsearch问题集锦 - 简书")



后台启动

```
./elasticsearch -d
```

关闭：

```
ps -ef|grep elasticsearch
```



正常启动后会发现  publish_address 已经不是127.0.0.1

```
 publish_address {192.168.25.129:9300}
```

运行下面的命令进行测试：

```
curl "http://localhost:9200/?pretty"
```

> [（2）运行和关闭elasticsearch - Enjolras_fuu的博客 - CSDN博客](https://blog.csdn.net/Enjolras_fuu/article/details/81911437 "（2）运行和关闭elasticsearch - Enjolras_fuu的博客 - CSDN博客") 推荐



### 相关工具





- [elasticsearch-head: A web front end for an elastic search cluster](https://github.com/mobz/elasticsearch-head "mobz/elasticsearch-head: A web front end for an elastic search cluster") ：文档有说明如何在docker中运行该插件和如何直接通过 chrome插件 来运行
- Kibana：[开始使用 Kibana - Elastic](https://www.elastic.co/cn/webinars/getting-started-kibana?elektra=home&storm=sub2 "开始使用 Kibana  Elastic") （当下流行，官方产品）
- [一文上手 Elasticsearch常用可视化管理工具](https://my.oschina.net/hansonwang99/blog/2254385 "一文上手 Elasticsearch常用可视化管理工具 - hansonwang的个人空间 - 开源中国") 这里推荐了两个不错的工具



[elasticsearch插件大全（不断更新） - 云端分布式搜索技术](http://www.searchtech.pro/elasticsearch-plugins "elasticsearch插件大全（不断更新） - 云端分布式搜索技术")



> Kibana的安装见 docker 相关文章。



### 安装 ik 分词器

需要下载对应版本的 ik 分词器。

下载地址：[Releases · medcl/elasticsearch-analysis-ik](https://github.com/medcl/elasticsearch-analysis-ik/releases "Releases · medcl/elasticsearch-analysis-ik")

安装方法见其 github上的readme.md



1.  解压elasticsearch-analysis-ik-xx 后,将文件夹拷贝到elasticsearch-xx\plugins下，并重命名文件夹为ik
2. 重新启动ElasticSearch，即可加载IK分词器



 ik 分词器版本与es版本不对应报错：

```
org.elasticsearch.bootstrap.StartupException: java.lang.IllegalArgumentException: plugin [analysis-ik] is incompatible with version [5.6.12]; was designed for version [5.6.11]
```

但是并没有对应的 5.6.12 版的 ik分词器，可以尝试修改 ik分词器下的 plugin-descriptor.properties 文件，将所有的 5.6.11 都改为 5.6.12



测试：

```
http://192.168.25.129:9200/_analyze?analyzer=ik_smart&pretty=true&text=我是程序员
```





### 在 Docker 中运行 Elasticsearch

见 docker 相关文章。







## ELK

开源分布式搜索平台ELK(Elasticsearch+Logstash+Kibana)，这三个软件均可在 Elasticsearch网站下载。





- [**Elasticsearch** | Elastic](https://www.elastic.co/cn/products/elasticsearch "Elasticsearch | Elastic")
- [**Kibana**: 探索、可视化、检测数据 | Elastic](https://www.elastic.co/cn/products/kibana "Kibana: 探索、可视化、检测数据 | Elastic")
- [**Logstash** | Elastic](https://www.elastic.co/cn/products/logstash "Logstash | Elastic")





### Kibana

Kibana 是一个开源的分析和可视化平台，旨在与 Elasticsearch 合作。Kibana 提供搜索、查看和与存储在 Elasticsearch 索引中的数据进行交互的功能。开发者或运维人员可以轻松地执行高级数据分析，并在各种图表、表格和地图中可视化数据。

Kibana可以非常方便地把来自[Logstash](https://www.elastic.co/products/logstash)、[ES-Hadoop](https://www.elastic.co/products/hadoop)、[Beats](https://www.elastic.co/products/beats)或第三方技术的数据整合到Elasticsearch，支持的第三方技术包括[Apache Flume](http://flume.apache.org/)、[Fluentd](http://www.fluentd.org/)等。



[开始使用 Kibana - Elastic](https://www.elastic.co/cn/webinars/getting-started-kibana?elektra=home&storm=sub2 "开始使用 Kibana  Elastic") 

[Kibana 基础入门 - 关小西 - 博客园](http://www.cnblogs.com/moonlightL/p/7764919.html "Kibana 基础入门 - 关小西 - 博客园")

[Kibana：分析及可视化日志文件 - 资源 - 伯乐在线](http://hao.jobbole.com/kibana/ "Kibana：分析及可视化日志文件 - 资源 - 伯乐在线")

[Kibana基本使用 - ming_311的专栏 - CSDN博客](https://blog.csdn.net/ming_311/article/details/50619859 "Kibana基本使用 - ming_311的专栏 - CSDN博客") 这是个官方示例，资料可从官方下载。



### Logstash

Logstash 是开源的服务器端数据处理管道，能够同时从多个来源采集数据，转换数据，然后将数据发送到您最喜欢的 “存储库” 中。（我们的存储库当然是 Elasticsearch。）











