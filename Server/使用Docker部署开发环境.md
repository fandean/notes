

## 安装 Tomcat

在拉取 tomcat 镜像的时候，可能搞不明白为什么会有如此之多的tag？这里我们先了解一下，该镜像相关的Variants（变体）的含义:



- `tomcat:<version>`：如果您不确定您的需求是什么，您可能想要使用这个。它被设计为既可以用作丢弃容器（安装源代码并启动容器来启动应用程序），也可以用作构建其他图像的基础。
- `tomcat:slim`：此映像不包含默认tag中包含的公共包，仅包含运行tomcat所需的最小包。除非您在仅部署tomcat映像并且存在空间限制的环境中工作，否则我们强烈建议您使用此库的默认镜像(即上一个镜像)。 (slim：瘦)
- `tomcat:alpine` 此镜像基于流行的Alpine Linux项目 。（不了解什么是 Alpine Linux Project，不下这个版本）
- `tomcat:<version>-jre*`：这个又是什么意思？查看Dockerfile文件，似乎所有文件都是`FROM openjdk:*-jre` 开头，那么所有镜像都是以openjdk作为基础镜像的？



还是没搞懂，这里选择 `8.5.32` 

```
docker pull tomcat:8.5.32
```

运行容器

```shell
# 记得修改 tag
$ docker run -it --rm -p 8888:8080 tomcat:tag
# You can then go to http://localhost:8888 or http://host-ip:8888 in a browser
```



tomcat容器的使用：







## 安装CentOS

**Tag的选择：**

The CentOS Project offers regularly updated images for all active releases. These images will be updated monthly or as needed for emergency fixes. These rolling updates（滚动更新） are tagged with the major version number **only**. For example:

建议pull的image：

```
docker pull centos:6
```

```
docker pull centos:7
```



> tag 带有小数点的版本不进行滚动更新维护



## 安装 Oracle Db 11g

### Oracle 11g

[wnameless/docker-oracle-xe-11g: Dockerfile of Oracle Database Express Edition 11g Release 2](https://github.com/wnameless/docker-oracle-xe-11g "wnameless/docker-oracle-xe-11g: Dockerfile of Oracle Database Express Edition 11g Release 2")



添加到 javaee 网络

```
docker run --name oracle11g -d -p 49161:22 -p 1522:1521 -p 49163:8080 -v /oracle11g-data/:/u01/app/oracle/oradata/oracle11g-data/ -e ORACLE_ALLOW_REMOTE=true wnameless/oracle-xe-11g
```



使用下面的语句启动容器：

```
docker run --name oracle11g -d -p 1522:1521 -p 49163:8080 --network javaee -v G:/Docker/JavaEERuntime/oracle11g/data:/u01/app/oracle/oradata/oracle11g-data/ -e ORACLE_ALLOW_REMOTE=true wnameless/oracle-xe-11g
```

启动容器后要等1~2分钟Oracle监听器才开启，所以等一下再连接。



使用jdbc连接数据库：

url： 注意端口这里并不是 默认的 1521 

```
jdbc:oracle:thin:@//127.0.0.1:1522
jdbc:oracle:thin:@localhost:1522
```



使用非DBA用户连接(需选择system用户)

```
hostname: localhost
port: 49161
sid: xe
username: system
password: oracle
```



> `sid : xe` 其中 xe 也是当前实例名称，在单机模式`xe`也就是数据库名称。
>
> 以dba身份登录： 用户`sys`和密码 `oracle`
>
> 如果选择sys用户则需勾选 as SYSDBA



在浏览器中访问：

url：`127.0.0.1:49163`

用户和密码： `system` ， `oracle`



创建表空间：

```sql
-- 创建表空间1
create tablespace itheima
datafile '/u01/app/oracle/oradata/oracle11g-data/itheima.dbf'
size 20M  --初始化大小
autoextend on  --自动扩展
next 10M;  --每次添加10M

-- 创建表空间2
create tablespace itheima
  datafile '/u01/app/oracle/oradata/oracle11g-data/itheima.dbf'
size 10M
extent management local autoallocate;

--  本地化管理方式创建,
-- extent management local autoallocate是设置当表空间大小已满时，用自动管理的方式扩展表空间。

```



创建用户：

```sql
create user itheima identified by fan123
  default tablespace itheima;
```



为用户授权：

```sql
grant connect, resource, dba to itheima;
```







### Oracle 12c

image 太大 3G，没下载完成，强行结束了，但不知如何删除？

[MaksymBilenko/docker-oracle-12c: Docker image with Oracle Database 12c on board](https://github.com/MaksymBilenko/docker-oracle-12c "MaksymBilenko/docker-oracle-12c: Docker image with Oracle Database 12c on board")

[![asciicast](https://asciinema.org/a/45878.png)](https://asciinema.org/a/45878)





## Spring boot

[spring-guides/gs-spring-boot-docker: Spring Boot with Docker :: Learn how to create a Docker container from a Spring Boot application with Maven or Gradle](https://github.com/spring-guides/gs-spring-boot-docker "spring-guides/gs-spring-boot-docker: Spring Boot with Docker :: Learn how to create a Docker container from a Spring Boot application with Maven or Gradle")





## docker lnmp



[docker：Dockerfile构建LNMP平台-DevOps(甘兵)-51CTO博客](http://blog.51cto.com/ganbing/2074640 "docker：Dockerfile构建LNMP平台-DevOps(甘兵)-51CTO博客")

[docker：编排与部署小神器Compose-DevOps(甘兵)-51CTO博客](http://blog.51cto.com/ganbing/2083806 "docker：编排与部署小神器Compose-DevOps(甘兵)-51CTO博客")

[voocel/docker-lnmp: Docker-compose(Linux,Nginx,MySql,PHP7,Redis)](https://github.com/voocel/docker-lnmp "voocel/docker-lnmp: Docker-compose(Linux,Nginx,MySql,PHP7,Redis)")







## docker redis



**配置文件：**

You can create your own Dockerfile that adds a redis.conf from the context into /data/, like so.，通过Dockerfile

```
FROM redis
COPY redis.conf /usr/local/etc/redis/redis.conf
CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]
```

或者直接在 docker run中：

```
$ docker run -v /myredis/conf/redis.conf:/usr/local/etc/redis/redis.conf --name myredis redis redis-server /usr/local/etc/redis/redis.conf
```

好吧redis容器中并不存在`/usr/local/etc/redis/redis.conf`文件，如果需要使用配置文件，可以下载一个redis压缩包，解压后使用里面的 redis.conf 文件，然后将此配置文件随便挂载到容器的某个目录，但是要与 `redis-server`命令后跟的路径一致即可。







**数据持久化：**

由于redis默认在内存中存储数据，如果需要将数据进行持久化就需要进行配置。

```
$ docker run --name some-redis -d redis redis-server --appendonly yes
```

If persistence is enabled, data is stored in the `VOLUME /data`, which can be used with `--volumes-from some-volume-container` or `-v /docker/host/dir:/data`



redis有两种数据持久化方式：

- RDB模式 -- 快照模式 。RDB是默认开启的，就是配置文件中的 `save 900 1部分（如果有配置文件）`。Redis会定时把内存中的数据备份，生成“快照文件”。文件名称是dump.rdb，默认被保存在了Redis的安装目录里。

- AOF模式 。AOF需要手动配置开启 。可在配置文件中开启：

  ```
  appendonly yes                        #默认是no，未开启AOF。设置为yes表示开启AOF模式。
  appendfilename “appendonly.aof”    #默认生成的AOF文件名称
  ```

  或通过相关选项开启：`redis-server --appendonly yes`



感觉根据redis的使用方式，只需在运行时能够进行持久化即可，而无需挂载数据卷



示例：

```shell
docker run --name redisServer -d -p 6379:6379  redis redis-server

docker run -it --link redisServer:redis --rm  redis redis-cli -h redis -p 6379
```





## Elasticsearch

[library/elasticsearch - Docker Hub](https://hub.docker.com/_/elasticsearch/ "library/elasticsearch - Docker Hub")

[Install Elasticsearch with Docker - Elasticsearch Reference 6.4](https://www.elastic.co/guide/en/elasticsearch/reference/6.4/docker.html )

```shell
docker pull elasticsearch
```





```
docker run -itd -p 9200:9200 -p 9300:9300 -v /opt/data/elasticsearch/logs:/usr/share/elasticsearch/logs -v /opt/data/elasticsearch/data:/usr/share/elasticsearch/data --name mylasticsearch -e "discovery.type=single-node" elasticsearch
```

```
# 运行下面的命令会报java异常
docker run -d -p 9200:9200 -p 9300:9300 -v /opt/data/elasticsearch/logs:/usr/share/elasticsearch/logs -v /opt/data/elasticsearch/data:/usr/share/elasticsearch/data -v /opt/data/elasticsearch/plugins:/usr/share/elasticsearch/plugins -v /opt/data/elasticsearch/config:/usr/share/elasticsearch/config --name es -e "discovery.type=single-node" -e ES_JAVA_OPTS="-Xms512m -Xmx512m" elasticsearch
```



```
# 同时限制jvm内存
docker run -d -p 9200:9200 -p 9300:9300 --name es -e "discovery.type=single-node" -e ES_JAVA_OPTS="-Xms512m -Xmx512m" elasticsearch
```



实时查看某容器的log：

```
docker logs -f 容器名/id
```





### 管理工具/插件

-  [elasticsearch-head: A web front end for an elastic search cluster](https://github.com/mobz/elasticsearch-head "mobz/elasticsearch-head: A web front end for an elastic search cluster") ：文档有说明如何在docker中运行该插件和如何直接通过 chrome插件 来运行该head（感觉不错简单）
-  Kibana插件：[开始使用 Kibana | Elastic](https://www.elastic.co/cn/webinars/getting-started-kibana?elektra=home&storm=sub2 "开始使用 Kibana | Elastic") 和 [Kibana Reference | Elastic](https://www.elastic.co/guide/en/kibana/index.html# "Kibana Reference | Elastic")



> docker中安装elasticsearch-head： 浏览器输入 host-ip:9100 访问该插件 （推荐chrome插件）
>
> ```shell
> docker run -d --name es_admin -p 9100:9100 mobz/elasticsearch-head
> ```
>
>

**部署kibana**

```
docker run -p 5601:5601 -e "ELASTICSEARCH_URL=http://172.17.0.2:9200" --name kibana --network host -d kibana:5.6.12
```

172.17.0.2 是 ES容器的地址。

报如下错误：WARNING: Published ports are discarded when using **host** network mode

但好像没有影响使用。








> [Elasticsearch: 权威指南 - Elastic](https://www.elastic.co/guide/cn/elasticsearch/guide/current/index.html "Elasticsearch: 权威指南 - Elastic")
>
> [elasticsearch插件大全（不断更新） - 云端分布式搜索技术](http://www.searchtech.pro/elasticsearch-plugins "elasticsearch插件大全（不断更新） - 云端分布式搜索技术")





### ik 分词器插件

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
# IK提供了两个分词算法ik_smart 和 ik_max_word
# 最小切分
http://192.168.25.129:9200/_analyze?analyzer=ik_smart&pretty=true&text=我是程序员
# 最细切分
http://192.168.25.129:9200/_analyze?analyzer=ik_max_word&pretty=true&text=我是程序员
```







### NoNodeAvailableException 错误

在Java代码中连接时出现错误：

```
NoNodeAvailableException[None of the configured nodes are available:
```



查看log日志发现：

```
[2018-11-02T07:03:56,627][INFO ][o.e.n.Node               ] [l1tnBgE] starting ...
[2018-11-02T07:03:56,934][INFO ][o.e.t.TransportService   ] [l1tnBgE] publish_address {127.0.0.1:9300}, bound_addresses {127.0.0.1:9300}
[2018-11-02T07:04:00,151][INFO ][o.e.c.s.ClusterService   ] [l1tnBgE] new_master {l1tnBgE}{l1tnBgEeTWig7WULclcimQ}{dvOVG91GT--NfTl_iVnfzQ}{127.0.0.1}{127.0.0.1:9300}, reason: zen-disco-elected-as-master ([0] nodes joined)[, ]
[2018-11-02T07:04:00,231][INFO ][o.e.h.n.Netty4HttpServerTransport] [l1tnBgE] publish_address {172.17.0.2:9200}, bound_addresses {0.0.0.0:9200}
```



可以发现9300和9200端口的地址是不一样的

```
publish_address {127.0.0.1:9300}

publish_address {172.17.0.2:9200}
```

再查看容器中config下的elasticsearch.yml配置文件：

```
# cat elasticsearch.yml
http.host: 0.0.0.0
# Uncomment the following lines for a production cluster deployment
#transport.host: 0.0.0.0
#discovery.zen.minimum_master_nodes: 1
```

会发现 并没有看到他人所说的  `network.host: 0.0.0.0`  （将其**配置为0.0.0.0意为允许外部访问**），这里它被分成了 http.host 和 transport.host 两个配置项，并且 **transport.host 默认是被注释掉的**！！ 所以我们**需要取消 transport.host 的注释**，方法是在外部新建一个 elasticsearch.yml 然后再cp到容器内。



```
 # 一个cp 示例：这里是从es容器中复制文件到主机 （调换一下即可改变复制方向）
 docker cp es:/usr/share/elasticsearch/config  /opt/data/elasticsearch
```



> 最后查看系统的相应端口有没有开放







黑马战队：

https://m.aliyun.com/act/team1111/#/share?params=N.mZb8DJHcOa.wyc8ilta



## Docker下 Dubbo开发





### ZooKeeper

[library/zookeeper - Docker Hub](https://hub.docker.com/_/zookeeper/ "library/zookeeper - Docker Hub")

[Zookeeper应用介绍与安装部署 - 简书](https://www.jianshu.com/p/4c13132ce49f "Zookeeper应用介绍与安装部署 - 简书")



**单机模式**

zoo.cfg配置

```ini
ticketTime=2000
clientPort=2181
dataDir=/opt/zookeeper/data
dataLogDir=/opt/zookeeper/logs
```



**集群模式** 

zoo.cfg配置

```ini
ticketTime=2000
clientPort=2181
dataDir=/opt/zookeeper/data
dataLogDir=/opt/zookeeper/logs

initLimit=10
syncLimit=5
server.1=master:2888:3888
server.2=slave01:2888:3888
server.3=slave02:2888:3888
```



由上面的配置可知，需要挂载的有 zoo.cfg 配置文件、保存数据的data目录、保存log的logs目录。

```shell
docker run --name temp-zookeeper --rm -d zookeeper
```

先查看容器结构：

```shell
bash-4.4# cat /conf/zoo.cfg 
clientPort=2181
dataDir=/data
dataLogDir=/datalog
tickTime=2000
initLimit=5
syncLimit=2
autopurge.snapRetainCount=3
autopurge.purgeInterval=0
maxClientCnxns=60
```



修改本地 conf/zoo.cfg 文件内容，然后运行容器：

```shell
docker run --name javaee-zookeeper -v G:/Docker/JavaEERuntime/zookeeper/data:/data -v G:/Docker/JavaEERuntime/zookeepe/conf:/conf -v G:/Docker/JavaEERuntime/zookeeper/logs:/datalog -p 2181:2181 --network javaee -d zookeeper:latest
```





### dubbo-admin

[监控与管理dubbo服务 ](http://qinghua.github.io/dubbo-3/ "监控与管理dubbo服务")

老师给的 dubbo-admin.war 包无法在 Docker中的tomcat上运行，

从网上下载的Dubbo源码通过编码后得到的war包或者下载的war包，默认不支持JDK1.8，在tomcat中运行会报错



解决方式一： 直接在Docker Hub上寻找现有dubbo-admin镜像（完美解决）

```
docker pull chenchuxin/dubbo-admin
```



解决方式二：寻找可用的 war 包 （**tomcat还是报异常**）

可以寻找支持 JDK1.8 的  Dubbo-admin war包，比如：<https://pan.baidu.com/s/1jpq8tD7DlKZItLpgyx5lfA>  密码：**6w7d**





> [Docker下dubbo开发，三部曲之二：本地环境搭建 - CSDN博客](https://blog.csdn.net/boling_cavalry/article/details/72460526 "Docker下dubbo开发，三部曲之二：本地环境搭建 - CSDN博客")
>
> [docker安装zookeeper和dubbo-admin - CSDN博客](https://blog.csdn.net/qq_33562996/article/details/80599922 "docker安装zookeeper和dubbo-admin - CSDN博客")
>
> [Dubbo教程(二)----Dubbo-admin管理平台搭建 - CSDN博客](https://blog.csdn.net/u011781521/article/details/76037473 "Dubbo教程(二)----Dubbo-admin管理平台搭建 - CSDN博客")
>
> [Docker+Spring+Dubbo+ZooKeeper完成服务化RPC实验 - CSDN博客](https://blog.csdn.net/zhengwei223/article/details/78077582)





注意，dubbo-admin有些是tomcat7有些是tomcat8的

并且可能和 jdk 版本也有关系。





## FastDFS



### 第一次尝试

使用  [season/fastdfs](https://hub.docker.com/r/season/fastdfs/ "season/fastdfs - Docker Hub") （不确定其是否整合了Nginx，因该时没有，怕麻烦直接使用了第二种方法）

```shell
docker run --name javaee-zookeeper -v G:/Docker/JavaEERuntime/zookeeper/data:/data -v G:/Docker/JavaEERuntime/zookeepe/conf:/conf -v G:/Docker/JavaEERuntime/zookeeper/logs:/datalog -p 2181:2181 --network javaee -d zookeeper:latest

# tracker
docker run -dti --name fastdfs-trakcer -v G:/Docker/JavaEERuntime/fastDFS/tracker/data:/fastdfs/tracker/data --network javaee season/fastdfs tracker

docker run -dti --name fastdfs-trakcer -v G:/Docker/JavaEERuntime/fastDFS/tracker/data:/fastdfs/tracker/data -p 22122:22122 --network javaee season/fastdfs
```



- port

tracker default port is 22122

- base_path

you should map the path: /fastdfs/tracker/data to keep the data

```
安装成功后进入/etc/fdfs 目录：
拷贝一份新的 tracker 配置文件：
cp tracker.conf.sample tracker.conf
修改 tracker.conf
vi tracker.conf
base_path=/home/yuqing/FastDFS
改为：
base_path=/home/FastDFS
```









```shell
#storage
docker run -ti --name fastdfs-storage -v ~/storage_data:/fastdfs/storage/data -v ~/store_path:/fastdfs/store_path --net=host -e TRACKER_SERVER:192.168.1.2:22122 season/fastdfs storage

docker run --name fastdfs-storage -v G:/Docker/JavaEERuntime/fastDFS/storage/data:/fastdfs/storage/data -v G:/Docker/JavaEERuntime/fastDFS/storage/store_path:/fastdfs/store_path --network javaee -e TRACKER_SERVER:fastdfs-trakcer:22122 season/fastdfs

docker run --name fastdfs-storage -v G:/Docker/JavaEERuntime/fastDFS/storage/base_data:/fastdfs/storage/data -v G:/Docker/JavaEERuntime/fastDFS/storage/store_path0:/fastdfs/store_path --network javaee -e TRACKER_SERVER:fastdfs-trakcer:22122 season/fastdfs
```



- storage_data

equal to "base_path" in store.conf

- store_path

equal to "store_path0" in store.conf

- TRACKER_SERVER

tracker address

补充

- log (所以不用指定log目录)

I redirect FastDFS's log file to container's stdout, so, its easy to collect log.

- use your config file

FastDFS config files is in: /fdfs_conf



```
安装成功后进入/etc/fdfs 目录：
拷贝一份新的 storage 配置文件：
cp storage.conf.sample storage.conf
修改 storage.conf
vi storage.conf
group_name=group1
base_path=/home/yuqing/FastDFS 改为：base_path=/home/FastDFS
store_path0=/home/yuqing/FastDFS 改为：store_path0=/home/FastDFS/fdfs_storage
#如果有多个挂载磁盘则定义多个 store_path，如下
#store_path1=.....
#store_path2=......
tracker_server=192.168.101.3:22122 #配置 tracker 服务器:IP
#如果有多个则配置多个 tracker
tracker_server=192.168.101.4:22122
```





### 第二次尝试



使用整合了nginx的fastdfs :  [ygqygq2/fastdfs-nginx](https://hub.docker.com/r/ygqygq2/fastdfs-nginx/ "ygqygq2/fastdfs-nginx - Docker Hub")



```shell
docker run -dti --network=host --name tracker -v /var/fdfs/tracker:/var/fdfs ygqygq2/fastdfs-nginx tracker

docker run -dti --network=host --name storage0 -e TRACKER_SERVER=10.1.5.85:22122 -v /var/fdfs/storage0:/var/fdfs ygqygq2/fastdfs-nginx storage

docker run -dti --network=host --name storage1 -e TRACKER_SERVER=10.1.5.85:22122 -v /var/fdfs/storage1:/var/fdfs ygqygq2/fastdfs-nginx storage

docker run -dti --network=host --name storage2 -e TRACKER_SERVER=10.1.5.85:22122 -e GROUP_NAME=group2 -e PORT=22222 -v /var/fdfs/storage2:/var/fdfs ygqygq2/fastdfs-nginx storage
```

修改

```shell
docker run -dti --network=javaee --name tracker -v G:/Docker/JavaEERuntime/fastDFS/tracker/data:/var/fdfs  -p 22122:22122 ygqygq2/fastdfs-nginx tracker

docker run -dti --network=javaee --name storage0 -e TRACKER_SERVER=tracker:22122 -v G:/Docker/JavaEERuntime/fastDFS/storage/store_path0:/var/fdfs ygqygq2/fastdfs-nginx storage

docker run -dti --network=javaee --name storage1 -e TRACKER_SERVER=tracker:22122 -v G:/Docker/JavaEERuntime/fastDFS/storage/store_path1:/var/fdfs ygqygq2/fastdfs-nginx storage

docker run -dti --network=javaee --name storage2 -e TRACKER_SERVER=tracker:22122 -e GROUP_NAME=group2 -e PORT=22222 -v G:/Docker/JavaEERuntime/fastDFS/storage/store_path2:/var/fdfs ygqygq2/fastdfs-nginx storage
```



tracker log： 

```
[2018-09-26 15:41:02] INFO - file: tracker_relationship.c, line: 394, selecting leader...
[2018-09-26 15:41:02] INFO - file: tracker_relationship.c, line: 412, I am the new tracker leader 172.18.0.2:22122
```

storage0 log:

```
[2018-09-26 15:41:03] INFO - file: storage_func.c, line: 257, tracker_client_ip: 172.18.0.3, my_server_id_str: 172.18.0.3, g_server_id_in_filename: 50336428
[2018-09-26 15:41:03] INFO - file: tracker_client_thread.c, line: 310, successfully connect to tracker server 172.18.0.2:22122, as a tracker client, my ip is 172.18.0.3
[2018-09-26 15:41:33] INFO - file: tracker_client_thread.c, line: 1263, tracker server 172.18.0.2:22122, set tracker leader: 172.18.0.2:22122
```

两者可以连接成功，但是java无法使用该地址连接

```
connect to server 172.18.0.2:22122 fail
java.net.ConnectException: Connection timed out: connect
	at java.net.DualStackPlainSocketImpl.waitForConnect(Native Method)
	at java.net.DualStackPlainSocketImpl.socketConnect(DualStackPlainSocketImpl.java:85)
	at java.net.AbstractPlainSocketImpl.doConnect(AbstractPlainSocketImpl.java:350)
	at java.net.AbstractPlainSocketImpl.connectToAddress(AbstractPlainSocketImpl.java:206)
	at java.net.AbstractPlainSocketImpl.connect(AbstractPlainSocketImpl.java:188)
	at java.net.PlainSocketImpl.connect(PlainSocketImpl.java:172)
	at java.net.SocksSocketImpl.connect(SocksSocketImpl.java:392)
	at java.net.Socket.connect(Socket.java:589)
	at org.csource.fastdfs.TrackerGroup.getConnection(TrackerGroup.java:47)
	at org.csource.fastdfs.TrackerGroup.getConnection(TrackerGroup.java:72)
	at org.csource.fastdfs.TrackerClient.getConnection(TrackerClient.java:58)
	at cn.itcast.demo.FastDFSDemo.main(FastDFSDemo.java:14)
connect to server 172.18.0.2:22122 fail
java.net.ConnectException: Connection timed out: connect
	at java.net.DualStackPlainSocketImpl.waitForConnect(Native Method)
	at java.net.DualStackPlainSocketImpl.socketConnect(DualStackPlainSocketImpl.java:85)
	at java.net.AbstractPlainSocketImpl.doConnect(AbstractPlainSocketImpl.java:350)
	at java.net.AbstractPlainSocketImpl.connectToAddress(AbstractPlainSocketImpl.java:206)
	at java.net.AbstractPlainSocketImpl.connect(AbstractPlainSocketImpl.java:188)
	at java.net.PlainSocketImpl.connect(PlainSocketImpl.java:172)
	at java.net.SocksSocketImpl.connect(SocksSocketImpl.java:392)
	at java.net.Socket.connect(Socket.java:589)
	at org.csource.fastdfs.TrackerGroup.getConnection(TrackerGroup.java:47)
	at org.csource.fastdfs.TrackerGroup.getConnection(TrackerGroup.java:72)
	at org.csource.fastdfs.TrackerClient.getConnection(TrackerClient.java:58)
	at org.csource.fastdfs.TrackerClient.getStoreStorage(TrackerClient.java:91)
	at org.csource.fastdfs.StorageClient.newWritableStorageConnection(StorageClient.java:1912)
	at org.csource.fastdfs.StorageClient.do_upload_file(StorageClient.java:702)
	at org.csource.fastdfs.StorageClient.upload_file(StorageClient.java:163)
	at org.csource.fastdfs.StorageClient.upload_file(StorageClient.java:131)
	at org.csource.fastdfs.StorageClient.upload_file(StorageClient.java:113)
	at cn.itcast.demo.FastDFSDemo.main(FastDFSDemo.java:20)
Exception in thread "main" java.lang.Exception: getStoreStorage fail, errno code: 0
	at org.csource.fastdfs.StorageClient.newWritableStorageConnection(StorageClient.java:1915)
	at org.csource.fastdfs.StorageClient.do_upload_file(StorageClient.java:702)
	at org.csource.fastdfs.StorageClient.upload_file(StorageClient.java:163)
	at org.csource.fastdfs.StorageClient.upload_file(StorageClient.java:131)
	at org.csource.fastdfs.StorageClient.upload_file(StorageClient.java:113)
	at cn.itcast.demo.FastDFSDemo.main(FastDFSDemo.java:20)

```





将ip地址改为本地回环地址后出现：

```
Exception in thread "main" java.net.ConnectException: Connection timed out: connect
	at java.net.DualStackPlainSocketImpl.waitForConnect(Native Method)
	at java.net.DualStackPlainSocketImpl.socketConnect(DualStackPlainSocketImpl.java:85)
	at java.net.AbstractPlainSocketImpl.doConnect(AbstractPlainSocketImpl.java:350)
	at java.net.AbstractPlainSocketImpl.connectToAddress(AbstractPlainSocketImpl.java:206)
	at java.net.AbstractPlainSocketImpl.connect(AbstractPlainSocketImpl.java:188)
	at java.net.PlainSocketImpl.connect(PlainSocketImpl.java:172)
	at java.net.SocksSocketImpl.connect(SocksSocketImpl.java:392)
	at java.net.Socket.connect(Socket.java:589)
	at org.csource.fastdfs.ClientGlobal.getSocket(ClientGlobal.java:107)
	at org.csource.fastdfs.StorageServer.<init>(StorageServer.java:45)
	at org.csource.fastdfs.TrackerClient.getStoreStorage(TrackerClient.java:158)
	at org.csource.fastdfs.StorageClient.newWritableStorageConnection(StorageClient.java:1912)
	at org.csource.fastdfs.StorageClient.do_upload_file(StorageClient.java:702)
	at org.csource.fastdfs.StorageClient.upload_file(StorageClient.java:163)
	at org.csource.fastdfs.StorageClient.upload_file(StorageClient.java:131)
	at org.csource.fastdfs.StorageClient.upload_file(StorageClient.java:113)
	at cn.itcast.demo.FastDFSDemo.main(FastDFSDemo.java:20)

```







```
docker run -dti --network=host --name tracker ygqygq2/fastdfs-nginx tracker

docker run -dti --network=host --name storage0 -e TRACKER_SERVER=10.1.5.85:22122  ygqygq2/fastdfs-nginx storage

docker run -dti --network=host --name storage1 -e TRACKER_SERVER=10.1.5.85:22122  ygqygq2/fastdfs-nginx storage

docker run -dti --network=host --name storage2 -e TRACKER_SERVER=10.1.5.85:22122 -e GROUP_NAME=group2 -e PORT=22222  ygqygq2/fastdfs-nginx storage

######

docker run -dti --network=host --name storage0 -e TRACKER_SERVER=tracker:22122  ygqygq2/fastdfs-nginx storage

docker run -dti --network=host --name storage1 -e TRACKER_SERVER=tracker:22122  ygqygq2/fastdfs-nginx storage

docker run -dti --network=host --name storage2 -e TRACKER_SERVER=tracker:22122 -e GROUP_NAME=group2 -e PORT=22222  ygqygq2/fastdfs-nginx storage
```









上面修改的命令中，需要改进的地方是：`G:/Docker/JavaEERuntime/fastDFS/storage/store_path0` 不要写成

`store_path0` ，直接是 `storage0` 就行，因为该目录下会自动创建 data 和 log 目录



- [FASTDFS - 简书](https://www.jianshu.com/p/1c71ae024e5e "FASTDFS - 简书") 入门推荐
- [分布式文件系统 - FastDFS 简单了解一下 - Mafly - 博客园](http://www.cnblogs.com/mafly/p/fastdfs.html "分布式文件系统 - FastDFS 简单了解一下 - Mafly - 博客园")
- [用FastDFS一步步搭建文件管理系统 - bojiangzhou - 博客园](https://www.cnblogs.com/chiangchou/p/fastdfs.html "用FastDFS一步步搭建文件管理系统 - bojiangzhou - 博客园") 
- [使用docker进行FastDFS搭建_慕课手记](https://www.imooc.com/article/66981?block_id=tuijian_wz "使用docker进行FastDFS搭建_慕课手记")





## javaee

先创建javaee网络：

```shell
docker network create -d bridge javaee
```

再运行各容器：

```shell
docker run --name javaee-mysql5.5 -v G:/Docker/JavaEERuntime/mysql5.5/data:/var/lib/mysql -p 3306:3306 --network javaee -e MYSQL_ROOT_PASSWORD=fan123 -d mysql:5.5.60 --character-set-server=utf8 --collation-server=utf8_unicode_ci --lower-case-table-names=1

docker run --name javaee-tomcat -v G:/Docker/JavaEERuntime/tomcat-8.5/webapps:/usr/local/tomcat/webapps -v G:/Docker/JavaEERuntime/tomcat-8.5/conf:/usr/local/tomcat/conf -p 8080:8080 --network javaee -d tomcat:8.5.32

docker run --name javaee-nginx -v G:/Docker/JavaEERuntime/nginx/html:/usr/share/nginx/html -v G:/Docker/JavaEERuntime/nginx/nginx.conf:/etc/nginx/nginx.conf -p 80:80 --network javaee -d nginx:latest


docker run --name javaee-redis  -v G:/Docker/JavaEERuntime/redis/redis.conf:/usr/local/etc/redis/redis.conf -v G:/Docker/JavaEERuntime/redis/data:/data -p 6379:6379 --network javaee -d redis:latest redis-server /usr/local/etc/redis/redis.conf

# ---------------------------------------

docker run --name javaee-zookeeper -v G:/Docker/JavaEERuntime/zookeeper/data:/data -v G:/Docker/JavaEERuntime/zookeepe/conf:/conf -v G:/Docker/JavaEERuntime/zookeeper/logs:/datalog -p 2181:2181 --network javaee -d zookeeper:latest


## 使用 javaee-zookeeper:2181 代替 127.0.0.1:2181 才能连接成功
docker run --name dubbo-admin \
-p 8888:8080 \
-e dubbo.registry.address=zookeeper://javaee-zookeeper:2181 \
-e dubbo.admin.root.password=root \
-e dubbo.admin.guest.password=guest \
--network javaee -d \
chenchuxin/dubbo-admin


docker run --name javaee-tomcat7-01 -v G:/Docker/JavaEERuntime/tomcat-7/webapps:/usr/local/tomcat/webapps -v G:/Docker/JavaEERuntime/tomcat-7/conf:/usr/local/tomcat/conf -p 8701:8080 --network javaee -d tomcat:7
webapps目录和 conf目录非原生，还需要更改
```









> 可以使用此方式连接 redis：  不建议使用 --link 
>
> ```shell
> # 使用下面的方法不行，提示他们不属于同一个网络
> #docker run -it --link javaee-redis:redis --rm redis redis-cli -h redis -p 6379
> 
> # 使用下面的命令，提示无法连接到127.0.0.1 ( Could not connect to Redis at 127.0.0.1:6379: Connection refused)
> # docker run -it --name redis-cli --network javaee redis:latest redis-cli
> 
> # 使用下面的命令，明确为 credis-cli 指定 host 和 端口
> # # 这里 -h -p 选项是传递给 redis-cli 用的，并非给 docker run 使用
> docker run -it --name redis-cli --network javaee redis:latest redis-cli  -h javaee-redis -p 6379
> ```
>
> 此命令输出：
>
> ```shell
> $ docker run -it --name redis-cli --network javaee redis:latest redis-cli  -h javaee-redis -p 6379
> javaee-redis:6379>
> ```
>
> 



[GoogleContainerTools: Jib](https://github.com/GoogleContainerTools)

Build container images for your Java applications. 谷歌开源的 Java 应用容器生成工具，不用写 Dockerfile，构造过程中自动生成一个 Docker 容器。 









## node



[docker-node/README.md ](https://github.com/nodejs/docker-node/blob/master/README.md "docker-node/README.md at master · nodejs/docker-node")



Run a single Node.js script：

```shell
$ docker run -it --rm --name my-running-script -v "$PWD":/usr/src/app -w /usr/src/app node:8 node your-daemon-or-script.js
```





Create a Dockerfile in your Node.js app project：





Best Practices：

[Best Practices Guide](https://github.com/nodejs/docker-node/blob/master/docs/BestPractices.md "Best Practices Guide")



```shell
$ docker run \
  -e "NODE_ENV=production" \
  -u "node" \
  -m "300M" --memory-swap "1G" \
  -w "/home/node/app" \
  --name "my-nodejs-app" \
  node [script]
```





## CentOS7虚拟机中安装Docker



运行容器时提示：

```
[root@localhost ~]# docker run --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -d mysql:5.5.60

WARNING: IPv4 forwarding is disabled. Networking will not work.
```

解决办法：
```
# vim  /usr/lib/sysctl.d/00-system.conf1
```

添加如下代码：

```
net.ipv4.ip_forward=11
```

重启network服务

```
# systemctl restart network
```





### Idea 连接 CentOS7虚拟机中的Docker



需要修改 Docker 配置文件让其开放 Docker Remote API （docker REST API）

网上有很多方式，且有些如果操作系统或docker版本不同配置也不相同。



查看配置文件位于哪里：

```shell
[root@localhost ~]# systemctl show --property=FragmentPath docker
FragmentPath=/usr/lib/systemd/system/docker.service
[root@localhost ~]# whereis dockerd
dockerd: /usr/bin/dockerd /usr/share/man/man8/dockerd.8.gz
```

编辑该文件：

```shell
[root@localhost ~]# vi /usr/lib/systemd/system/docker.service
```

在此处添加如下内容：(这里端口为2375，所以之后再idea中连接时也要填写该端口)

```
ExecStart=/usr/bin/dockerd -H unix:///var/run/docker.sock -H tcp://0.0.0.0:2375
```

重新加载配置文件：

```shell
[root@localhost ~]# systemctl daemon-reload
```

重启docker

```shell
[root@localhost ~]# systemctl restart docker
```





