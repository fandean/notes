# 120分钟掌握分布式锁应用与实现



## 模拟并发的关键

- CyclicBarrier ：循环屏障





![](https://raw.githubusercontent.com/fandean/images/master/PicGo/2.1%E5%BE%AA%E7%8E%AF%E5%B1%8F%E9%9A%9C.png)

另一种加锁方法：

```
Lock lock = new ReentrantLock();// 可重入的锁
```



## 场景描述



场景一：单台服务器通过加锁，来解决高并发时订单号的唯一

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/2.2%E5%9C%BA%E6%99%AF1%E5%8D%95%E5%8F%B0%E6%9C%8D%E5%8A%A1%E5%99%A8%E5%8A%A0%E9%94%81.png)



场景二：在集群中我们尝试先将订单编号生成类独立为共享的服务，并且为订单服务类添加jvm锁（就是平常使用的锁），我们会发现这样任然不能保证订单编号的唯一，因为订单服务类的锁并不是共享的。

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/2.3%E5%9C%BA%E6%99%AF2%E4%B8%BA%E6%AF%8F%E5%8F%B0tomcat%E5%8A%A0jvm%E9%94%81.png)





场景三：使用分布式锁

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/2.4%E5%88%86%E5%B8%83%E5%BC%8F%E9%94%81%E5%AE%9E%E7%8E%B0%E6%80%9D%E8%B7%AF1.png)

## 分布式锁实现思路

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/2.4%E5%88%86%E5%B8%83%E5%BC%8F%E9%94%81%E5%AE%9E%E7%8E%B0%E6%80%9D%E8%B7%AF2.png)

在哪些地方能找到排他性：

- 文件系统：文件名必须唯一
- 数据库： 主键，唯一约束 ，for update（数据库中也利用了锁）
- 缓存 redis： 利用 setnx 命令
- zookeeper：类似文件系统（每个节点的名称必须唯一）

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/2.4%E5%88%86%E5%B8%83%E5%BC%8F%E9%94%81%E5%AE%9E%E7%8E%B0%E6%80%9D%E8%B7%AF3.png)



优缺点和死锁出现的原因分析：

- 当使用数据库实现分布式锁时：比如我们利用其唯一约束来实现分布式锁，当某个服务插入了唯一值后在还没来得及删除该唯一值的时候服务器挂掉，导致该唯一值没有删除，那么其它服务就不能再插入该值，从而导致死锁。
- redis 实现分布式锁，实现方式复杂，但也可以利用第三方提供好的实现方案。当redis分布式锁出现死锁后，当到达一定时间后会自动删除相应的值从而释放锁。



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/2.5%E5%B8%B8%E7%94%A8%E5%88%86%E5%B8%83%E5%BC%8F%E9%94%81%E5%AE%9E%E7%8E%B0%E6%8A%80%E6%9C%AF.png)



> 另可参考：[分布式锁简单入门以及三种实现方式介绍 - 徐刘根的博客 - CSDN博客](https://blog.csdn.net/xlgen157387/article/details/79036337 "分布式锁简单入门以及三种实现方式介绍 - 徐刘根的博客 - CSDN博客")



基于zookeeper实现分布式锁：

- 优点：
- 缺点：因为需要频繁的创建和删除节点，性能上不如Redis方式





## 基于zookeeper实现分布式锁



> Zookeeper安装运行(事先安装好java)：
>
> - 下载压缩包解压
> - 重命名 conf 目录下的 zoo_sample.cfg 为 zoo.cfg
> - 运行bin目录下的脚本： `./zkServier.sh start` （另外还可使用 stop，status）
> - 使用命令行客户端连接： `./zkCli.sh`



### Zookeeper 简介



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/2.6Zookeeper%E7%AE%80%E4%BB%8B.png)



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/2.7Zookeeper%E8%8A%82%E7%82%B9%E7%B1%BB%E5%9E%8B.png)



**临时节点**： 在当前客户端创建，并且当该客户端断开连接后该节点会自动被删除。

**顺序节点**：在创建节点时只需要指定该节点需要保存的数据，而不需要指定该节点的名称；因为顺序节点会按照顺序自动已递增的方式生成节点名称，比如第一个顺序节点名称为 000000 ，那么下一个顺序节点名就会是 000001





![](https://raw.githubusercontent.com/fandean/images/master/PicGo/2.8Zookeeper%E5%85%B8%E5%9E%8B%E5%BA%94%E7%94%A8%E5%9C%BA%E6%99%AF.png)





### 实现逻辑一



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/2.9%E7%94%A8Zookeeper%E5%AE%9E%E7%8E%B0%E5%88%86%E5%B8%83%E5%BC%8F%E9%94%81%E9%80%BB%E8%BE%91%E4%B8%80.png)



> 比如我们创建的节点名称为 lock



**避免死锁：**

在实现分布式锁时，**需要使用临时节点**，而不能使用持久节点，原因是：万一持有锁的进程挂了，就会出现死锁。



> java代码的zookeeper客户端实现有很多，这里老师使用的是:  `com.101tec.zkclient` 它使用起来很方便





具体实现，需要见代码。。。。



这里老师的初步实现中会产生惊群效应

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/2.10%E6%83%8A%E7%BE%A4%E6%95%88%E5%BA%94.png)

> 惊群效应：当你往鸽群中投掷一块食物时，所有鸽子都会来抢，并且只有一只鸽子能抢到。
>
> 另外还有个：羊群效应





### 实现逻辑二（改进方案）



不单单利用临时节点的特性，还需利用其 **临时顺序节点** 的特性。



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/2.11%E7%94%A8Zookeeper%E5%AE%9E%E7%8E%B0%E5%88%86%E5%B8%83%E5%BC%8F%E9%94%81%E9%80%BB%E8%BE%91%E4%BA%8C.png)





## 如何快速成长为互联网Java高级开发工程师



### 找到自己的差距



互联网Java高级开发工程师的技术标准：



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/2.12%E4%BA%92%E8%81%94%E7%BD%91Java%E9%AB%98%E7%BA%A7%E5%BC%80%E5%8F%91%E5%B7%A5%E7%A8%8B%E5%B8%88%E7%9A%84%E6%8A%80%E6%9C%AF%E6%A0%87%E5%87%86.png)



### 不断学习



自学：

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/2.13%E5%A6%82%E4%BD%95%E5%BF%AB%E9%80%9F%E5%AD%A6%E4%B9%A0%E6%8F%90%E5%8D%87.png)



### 网易课程安排



#### 01 Java 高级-高性能编程专题

```
第一章 多线程并发编程

1.1 Java基础

1.1.1 JAVA程序运行堆栈分析
1.1.2 线程状态
1.1.3 线程中止
1.1.4 内存屏障和CPU缓存
1.1.5 线程通信
1.1.6 线程封闭之ThreadLocal和栈封闭
1.1.7 线程池应用及实现原理剖析

1.2 线程安全之可见性问题

1.2.1 使用volatile解决可见性问题及阻止指令重排序
1.2.2 线程安全之共享资源 / 不可变性 / 竟态条件 / 临界区
1.2.3 线程安全之原子操作
1.2.4 Atomic相关类和CAS机制
1.2.5 JAVA锁相关术语及同步关键字synchronized详解
1.2.6 Lock接口  和 ReentrantLock / ReadWriteLockv

1.3 J.U.C并发编程包详解 (java.util.concurrent)

1.3.1 AQS抽象队列同步器详解
1.3.2 FutureTask源码剖析
1.3.3 并发容器类-ConcurrentHashMap / ConcurrentSkipListMap
1.3.4 并发容器类2- / ConcurrentSkipListSet / ConcurrentLinkedQueue  / CopyOnWriteArrayList / LinkedBlockingQueue
1.3.5 Fork/Join框架详解
1.3.6 工具类拓展-信号量和栅栏和倒计数器

第二章  高并发网络编程

2.1 Java NIO网络编程

2.1.1 TCP/UDP协议
2.1.2 BIO阻塞式网络编程
2.1.3 NIO非阻塞网络编程三大核心理念

2.2 Netty框架源码学习

2.2.1 netty线程模型
2.2.2 零拷贝机制
2.2.3 责任链设计模式

2.3 网络编程项目实践

2.3.1 推送系统功能实现
2.3.2 系统优化 - 百万连接
2.3.3 网易后端开发中的netty最佳实践

第三章 Java系统性能调优

3.1 JVM性能篇

3.1.1 JVM内存模型详解
3.1.2 类加载机制
3.1.3 垃圾回收机制
3.1.4 JVM内置命令工具

3.2 性能调优综合实战

3.2.1 Tomcat网络处理线程模型
3.2.2 参数调优
3.2.3 JVM参数及调优
3.2.4 内存爆炸、CPU100%问题分析、定位、解决
3.2.5 网易真实性能调优案例分享
```



#### 02 Java高级-中间件专题

```
第一章 分布式消息中间件

1.1 分布式消息中间件设计篇

1.1.1 amqp
1.1.2 mqtt
1.1.3 open message
1.1.4 kakfa协议
1.1.5 持久化设计
1.1.6 消息分发设计
1.1.7 高可用设计
1.1.8 可靠性设计

1.2 Activemq

1.2.1  amq入门
1.2.2 amq支持的消息协议讲解
1.2.3 Activemq高可用集群方案
1.2.4 持久化原理及事务机制


1.3 Rabbitmq

1.3.1 rabbitmq入门
1.3.2 内部消息分发机制
1.3.3 rabbitmq集群和高可用方案
1.3.4 持久化机制、内存/磁盘控制
1.3.5 消息可靠性
1.3.6 插件化机制

1.4 Kafka

1.4.1 kafka入门
1.4.2 消息持久化
1.4.3 分片存储机制
1.4.4 消息分发和消费者push、pull机制
1.4.5 Kafka Connect数据传输作业工具
1.4.6 Kafka Streams架构
1.4.7 线程模型
1.4.8 容错机制
1.4.9 Kafka优雅停机
1.4.10 扩容
1.4.11 leader选举机制

1.5 Rocketmq

1.5.1 rocketmq入门
1.5.2 rocketmq架构方案及角色详解
1.5.3 有序消息
1.5.4 订阅机制
1.5.5 定时消息
1.5.6 批量处理
1.5.7 事务消息详解
1.5.8 RocketMQ中高性能最佳实践（包含消费者、生产者、JVM和Linux最佳配置）

1.6 应用场景实战

1.6.1 消息中间件监控方案
1.6.2 异步数据传输场景
1.6.3 削峰填谷场景
1.6.4 任务调度场景
1.6.5 海量数据同步场景
1.6.6 分布式事务场景
1.6.7 网易后端架构中消息中间件应用

第二章 负载均衡中间件

2.1 Nginx高性能负载均衡器

2.1.1 Nginx负载均衡
2.1.2 代理缓存机制
2.1.3 通过Lua拓展Nginx
2.1.4 高性能Nginx最佳实践

2.2 Lvs负载均衡软件

2.2.1 LVS基础概念解析
2.2.2 基于VIP的keepalived高可用架构讲解
2.2.3 搭建LVS负载均衡集群

2.3 基于云计算平台的架构

2.3.1 使用CDN实现应用的缓存和加速
2.3.2 通过DNS实现高可靠的负载均衡和访问提速

2.4 网易集团负载均衡的应用

第三章 缓存中间件

3.1 Java内存缓存

3.1.1 两级缓存方案：分布式缓存+JAVA内存缓存
3.1.2 自研JAVA内存缓存
3.1.3 谷歌guava提供的缓存

3.2 Redis分布式缓存

3.2.1 常用命令
3.2.2 数据结构
3.2.3 主从复制
3.2.4 持久化
3.2.5 高可用
3.2.6 集群
3.2.7 扩容
3.2.8 内存管理
3.2.9 集群监控

3.3 Memcached

3.3.1 安装使用
3.3.2 内存管理
3.3.3 缓存策略
3.3.4 分布式集群
3.3.5 分布式算法

3.4 缓存架构最佳实践

3.4.1 大型互联网高并发系统缓存架构方案
3.4.2 缓存失效
3.4.3 缓存雪崩解决方案
3.4.4 缓存穿透
3.4.5 网易后端架构中,缓存方面的设计

第四章 数据库中间件

4.1 数据库中间件设计篇

4.1.1 事务设计
4.1.2 SQL规范

4.2 Mycat数据库集群中间件

4.2.1 mycat入门
4.2.2 读写分离
4.2.3 分库分表的场景
4.2.4 原则
4.2.5 数据库设计最佳实践

4.3 Sharding-jdbc数据库操作增强类库

4.3.1 基于客户端的读写分离
4.3.2 分库分表
4.3.3 柔性事务
4.3.4 动态切换

4.4 其他中间件介绍

4.4.1 其他开源产品，大同小异，介绍区别和特色
4.4.2 分布式数据库在网易的最佳实践

```







#### 03 Java高级-容器化技术专题

```
第一章 Docker容器

1.1 docker入门

1.1.1 基础概念
1.1.2 安装
1.1.3 命令
1.1.4 运行JAVA程序
1.1.5 构建私有镜像
1.1.6 搭建docker私有仓库

1.2 docker进阶

1.2.1 数据挂载
1.2.2 Compose集成式应用组合
1.2.3 Service服务编排

1.3 网易docker最佳实践

1.3.1 容器监控
1.3.2 日志监控
1.3.3 资源管理
1.3.4 快速扩容

第二章 Kubernetes集群

2.1 K8S前言篇

2.1.1 k8s核心概念
2.1.2 名词讲解

2.2 K8S入门

2.2.1 K8S集群架构方案
2.2.2 集群环境搭建
2.2.3 运行docker容器

2.3 K8S进阶

2.3.1 搭建K8S高可用集群
2.3.2 K8S网络方案详解
2.3.3 内置的负载均衡机制
2.3.4 自定义CustomResourceDefinition拓展

2.4 K8S最佳实践

2.4.1 k8s可视化自动化工具
2.4.2 K8S日志收集
2.4.3 结合K8S的系统整体监控方案
2.4.4 业务系统部署方案
2.4.5 网易在K8S的探索和实践

```



#### 04 Java高级-分布式系统开发技术

```
第一章 分布式应用协调

1.1 互联网系统架构演进之路

1.1.1 集中式单体应用
1.1.2 系统拆分RPC阶段
1.1.3 微服务治理阶段

1.2 Zookeeper核心功能和应用场景

1.2.1 zk入门
1.2.2 数据模型
1.2.3 会话机制
1.2.4 watch机制的应用及原理分析
1.2.5 详解分布式一致性协议: 2pc、3pc、PAXOS算法、Raft算法、zab
1.2.6 用于实现配置中心
1.2.7 用于实现分布式锁
1.2.8 实现集群容错

1.3 分布式系统设计重要理论

1.3.1 CAP
1.3.2 BASE
1.3.3 DDD领域模型
1.3.4 墨菲定律
1.3.5 康威定律
1.3.6 业务系统设计的原则

第二章 RPC服务治理框架

2.1 RPC技术

2.1.1 rpc概念
2.1.2 核心三过程
2.1.3 常见rpc框架
2.1.4 rpc框架开发

2.2 Dubbo框架原理解析 

2.2.1 dubbo服务化思想
2.2.2 服务注册与发现机制
2.2.3 mock机制
2.2.4 容错机制
2.2.5 负载均衡机制
2.2.6 序列化
2.2.7 配置加载机制
2.2.8 与spring的集成原理
2.2.9 数据绑定实现原理
2.2.10 rpc-协议原理
2.2.11 Dubbo拓展(链路追踪\日志\回调)
2.2.12 Dubbo系统监控方案

第三章 SpringCloud 微服务解决方案

3.1 sprintboot

3.1.1 springboot设计理念
3.1.2 starter机制快速集成机制详解
3.1.3 通过config自动装载配置
3.1.4 使用actuator管理你的spring程序
3.1.5 命令行工具springboot -cli快速构建项目

3.2 spring netflix组件

3.2.1 eureka服务注册与发现机制
3.2.2 ribbon客户端负载均衡机制
3.2.3 feign服务调用客户端
3.2.4 hystrix服务容错机制
3.2.5 zuul微服务网关组件

3.3 springcloud生态

3.3.1 config分布式配置中心
3.3.2 sleuth分布式系统链路追踪
3.3.3 gateway网关组件
3.3.4 consul服务注册与发现机制
3.3.5 stream消息驱动编程组件

第四章 分布式方案拓展及最佳实践

4.1 RPC、链路追踪、网关产品

4.1.1 cat
4.1.2 zipkin
4.1.3 kong
4.1.4 grpc等等…介绍

4.2 网易分布式系统研发的最佳实现

4.2.1 springcloud遇到的坑和实践案例
4.2.2 dubbo在网易内部的应用
```



#### 05 云课堂后端项目实战

```
第一章 编码规范篇

1.1 规约

1.1.1 JAVA代码规约
1.1.2 数据库设计
1.1.3 SQL编写规约

第二章 源码结构管理篇

2.1 maven

2.1.1 Maven模块化开发
2.2.2 依赖管理
2.2.3 自定义项目脚手架
2.2.4 环境化和插件机制

第三章 版本控制篇

3.1 git

3.3.1 git常用操作
3.3.2 版本冲突解决方案
3.3.3 git分支和tag管理
3.3.4 git-flow流程

第四章 研发流程管理篇

4.1 devops

4.1.1 基于K8S+Jenkins构建持续交付devops平台
4.1.2 sonar代码检查
4.1.3 执行单元测试用例

第五章 云课堂功能实现篇

5.1 功能开发

5.1.1 视频资源搜索
5.1.2 视频资源播放
5.1.3 用户单点登录
5.1.4 弹幕功能
5.1.5 VIP会员机制
5.1.6 后台视讯资源管理系统

第六章 线上运维部署篇监控方案

6.1 部署方案

6.1.1 蓝绿部署
6.1.2 红黑部署
6.1.3 AB测试
6.1.4 灰度发布
6.1.5 金丝雀发布
6.1.6 滚动发布

6.2 监控方案

6.2.1 线上系统监控方案
6.2.2 告急处理流程
```



#### 06 网易商业化项目分享

```
1. 网易云音乐-评论系统后端架构设计

2. 网易云课堂-后端整体架构分享

3. 网易严选-电商系统架构分享

4. 网易大数据应用
```

