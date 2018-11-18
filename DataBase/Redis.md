# Redis



## Redis 的安装

在Docker中拉取最新的Redis镜像（输入命令时会有提示），见docker相关文章。

- 运行一个容器作为 redis-server

- 运行另一个容器作为 redis-cli



无意中发现了 Redis Commander 这个Redis管理工具：[Redis-Commander](http://joeferner.github.io/redis-commander/ "Redis-Commander")

Redis Commander 安装：

1. 可以通过 npm 在本地安装
2. 可以直接以docker容器运行



```
docker run --rm --name redis-commander -d \
  --env REDIS_HOSTS=172.17.0.4 \
  -p 8081:8081 \
  rediscommander/redis-commander:latest

```





## Redis的持久化机制





Redis持久化分为RDB持久化和AOF持久化：

- RDB持久化是将当前进程中的数据生成快照保存到硬盘（因此也称作快照持久化），保存的文件后缀是rdb；当Redis重新启动时，可以读取快照文件恢复数据。

  save命令会阻塞Redis服务器进程，直到RDB文件创建完毕为止

  而bgsave命令会创建一个子进程，由子进程来负责创建RDB文件

  在自动触发RDB持久化时，Redis也会选择bgsave而不是save来进行持久化

- AOF持久化(即Append Only File持久化)，则是将Redis执行的每次写命令记录到单独的日志文件中（有点像MySQL的binlog）；当Redis重启时再次执行AOF文件中的命令来恢复数据。AOF持久化的实时性更好。





默认会自动（定期）进行持久化

RDB（快照持久化）是 Redis 默认采用的持久化方式，在 redis.conf 配置文件中默认有此下配置：

```
#在900秒(15分钟)之后，如果至少有1个key发生变化，Redis就会自动触发BGSAVE命令创建快照。
save 900 1  
```





## 数据结构和内部编码

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181027201715.png)



## Redis单线程

必须知道的一个概念，才能理解一些看起来奇怪的问题。

Redis 使用单线程的多路 IO 复用模型。



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181027201903.png)



单线程为什么这么快？

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181027202453.png)





注意事项：

![1540643204975](D:\Fan Dean\Documents\fandean.github.io\_drafts\DataBase\assets\1540643204975.png)





Redis 事务：

Redis 通过 MULTI、EXEC、WATCH 等命令来实现事务(transaction)功能。

事务提供了一种将多个命令请求打包，然后一次性、按顺序地执行多个命令的机制。





## Redis API的使用和理解



对于一些计算长度或者其它类似操作的api，如果看到其时间复杂度为 O(1) 那么表示redis中有一个变量维护此数据，所以直接取出即可。



### 字符串 String



**结构和命令**:

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181027203555.png)

字符串类型 string ： 能够存储字符串、数字、二进制数据、json字符串。 值最大 512MB，但建议不要超过100Kb



**字符串类型使用场景：**

- 缓存
- 计数器：由于它时**单线程**的不会记错，并且提供了incr这种命令，所以天然适合做计数器(比如用于统计网站访问量)
- 分布式锁：分布式ID生成器。
- ...





**字符串类型对应的命令：**

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181027204027.png)

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181027204212.png)



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181027205036.png)



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181027205130.png)



批量操作：

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181027205257.png)



批量操作的优点：

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181027210333.png)



![1540645518198](D:\Fan Dean\Documents\fandean.github.io\_drafts\DataBase\assets\1540645518198.png)











**查漏补缺：**

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181027210707.png)



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181027211014.png)





总结：



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181027211147.png)





### Hash



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181027211432.png)



Hash 看起来是map中包含map，比如可以将 field和value看作一个整体，



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104171848.png)



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104172244.png)

hash使用场景：



- 记录网站每个用户个人主页的访问量？（也可用字符串实现） `hincrby user:1:info pageview count`
- 缓存视频的基本信息。视频的信息有很多，我们可以将视频实体保存为一个hash即可。



> 对比字符串的好处是各信息可以，保存在同一个hash中



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104173328.png)



小心使用 hgetall ，牢记单线程。





**如何更新用户属性？**

对于string实现：

![1541324589283](D:\Fan Dean\Documents\fandean.github.io\_drafts\DataBase\assets\1541324589283.png)



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104174628.png)

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104174733.png)





![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104175214.png)





查漏补缺：

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104184805.png)



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104184922.png)





### List

列表api相对较多

列表结构：

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104185116.png)



特点： 

- 有序
- 可重复
- 左右两边插入弹出





![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104185312.png)



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104185347.png)





![1541328897023](D:\Fan Dean\Documents\fandean.github.io\_drafts\DataBase\assets\1541328897023.png)





![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104185556.png)

rpop 类似： 略



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104185937.png)



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104190549.png)





![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104191031.png)

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104191446.png)

![1541330443599](D:\Fan Dean\Documents\fandean.github.io\_drafts\DataBase\assets\1541330443599.png)





![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104192149.png)



使用场景：

- 微博中的时间轴功能。比如有新微博我们可以使用 lpush 进行添加，并使用 lrange 来显示前 10 条微博。 

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104203011.png)

其中3为有固定大小的列表。

4为消息队列。





查缺补漏：



![1541334279329](D:\Fan Dean\Documents\fandean.github.io\_drafts\DataBase\assets\1541334279329.png)

阻塞弹出，可以很好的应用到消费订阅模式；比如我们可以一直等待，当某个key出现时就获取其值。









### Set

集合特点：

- 无序（不能按下标索引）
- 不重复
- 支持集合间的操作

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104203736.png)



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104204423.png)





集合内API：

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104205147.png)

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104211306.png)





集合间API：

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104212425.png)





集合使用场景1：

- 微博中的抽奖系统。可以使用 srandmember 随机弹出获奖用户
- 微博中的 like💗、赞👍、踩👎。当然也可使用其它数据类型
- 标签(tag)：比如给用户添加标签，给标签添加用户；我们还会发现，这两个操作可以放在同一个事务中，所以可以进行事务控制。



集合使用场景2：

- 不同用户之间的共同关注



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104212702.png)

标签

随机数

社交相关





### zset

有序集合 （用的相对较少），API 很多

特点：

- 有序
- 时间复杂度偏高



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104213306.png)





![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104213428.png)

注意这里： score 可以重复 但 element 不可重复

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104213527.png)





![1541338691175](D:\Fan Dean\Documents\fandean.github.io\_drafts\DataBase\assets\1541338691175.png)

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104214640.png)



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104214710.png)



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104214754.png)









## 命令





### 通用命令

这里只介绍6个，这里除了 keys的时间复杂度为 O(n)，其它命令的时间复杂度为 O(1)

- keys ： `keys *` 遍历所有key。还可以使用其它通配符（但是keys不用于生产过程）

  ![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181027200550.png)

- dbsize：计算key的总数

  ![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181027200513.png)

- exists key ：判断key是否存在（存在返回1，不存在返回0）

  ![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181027200408.png)

- del key [key ...] ：删除key-value

  ![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181027200338.png)

- expire key seconds ：设置key的过期时间

  ![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181027200235.png)

  ![1540642066924](D:\Fan Dean\Documents\fandean.github.io\_drafts\DataBase\assets\1540642066924.png)

- type key 

  ![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181027201030.png)











> 客户端和服务端命令有混淆



### Redis客户端命令



`config` 命令： 

```shell
# config get 命令：获取某设置的值
config get <config_setting_name>
```

```shell
# 获取所有配置
config get * 
```

```
# config set 命令：设置某设置的值
config get <config_setting_name> <new_config_value>
```



ping 命令：检查服务器是否正在运行



redis-cli 客户端的使用：

```shell
# 语法
redis-cli -h host -p port -a password
```

```shell
# 示例：
redis-cli -h 127.0.0.1 -p 6379 -a "mypass" 
```



redis连接命令：

```
# 使用给定的密码验证服务器
auth <password>
```



`quit`命令：关闭当前连接。



`select index` 切换到指定的数据库，数据库索引号 `index` 用数字值指定，以 `0` 作为起始索引值。默认使用 `0` 号数据库。



清除库所有key数据

```shell
# 清除当前库中所有key
flushdb
# 清除所有库中所有 key
flushall
# 查看所有key
keys *
```





### Redis服务端命令



`info` 命令获取 有关服务器的所有统计信息和信息 



设置验证密码：连接的任何客户端在执行命令之前都需要进行身份验证。要保护Redis安全，需要在配置文件中设置密码。 

```shell
# 获取现有密码
CONFIG get requirepass

# 设置密码：
CONFIG set requirepass "yiibai"
```



设置密码后，如果任何客户端运行命令而不进行身份验证，则会返回一个**(error) NOAUTH Authentication required.**的错误信息。 因此，客户端需要使用AUTH命令来验证。 

```shell
# AUTH <password>
```













## Redis的其它功能



- 慢查询
- pipeline
- 发布订阅
- Bitmap 
- HyperLongLong
- GEO



> 其中，Redis新版本还提供了其它数据结构：
>
> - BitMaps 位图
> - HyperLongLong：超小内存唯一值计数
> - GEO：地理信息定位





### 慢查询

Redis 的慢查询日志功能用于记录执行时间超过给定时长的命令请求， 用户可以通过这个功能产生的日志来监视和优化查询速度。



> [慢查询日志 — 《Redis 设计与实现》](http://redisbook.com/preview/slowlog/content.html "慢查询日志 — Redis 设计与实现") 



#### 生命周期

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104220254.png)



#### 两个配置





#### 三个命令





#### 运维经验









### pipeline（流水线）





![1541343177701](D:\Fan Dean\Documents\fandean.github.io\_drafts\DataBase\assets\1541343177701.png)



Redis 的流水线功能允许客户端**一次将多个命令请求发送给服务器， 并将被执行的多个命令请求的结果在一个命令回复中全部返回给客户端**， 使用这个功能可以有效地减少客户端在执行多个命令时需要与服务器进行通信的次数。 (比如 java客户端中会发现有 pipeline)

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104225155.png)







![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104225917.png)

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104230107.png)





#### Pipeline与原生M操作在执行时的区别



原生m操作指 hmset， mget， mset 等命令

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104230632.png)



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104231132.png)

**使用建议：**

- 注意每次 pipeline 携带的数据量（不要太大）
- pipeline 每次只能作用在一个Redis节点上
- M操作与 pipeline 的区别





> [Redis附加功能之Redis流水线pipeline - 瞌睡中的葡萄虎 - 博客园](https://www.cnblogs.com/luogankun/p/3986576.html "Redis附加功能之Redis流水线pipeline - 瞌睡中的葡萄虎 - 博客园")



### 发布订阅



类似生产者和消费者模型

Redis只是提供了发布订阅的功能，并不是此类专业工具。



#### 角色

发布者（publisher），频道（channel），订阅者（subscriber）：发布者将消息发布到频道，订阅者从频道上获取消息



频道(通道)可以是队列



#### 模型

通信模型

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104231953.png)





每个订阅者可以订阅多个频道：

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104232630.png)

这里有一个问题：当发布者已经将一条消息发送到了频道，此时正好新增了一个新的订阅者，那么该订阅者是收不到之前的消息的。





#### API



- 发布： publish
- 订阅：subscribe
- 取消订阅： unsubscribe
- 其它

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104232938.png)





![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104233128.png)



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181104233214.png)





![1541345568342](D:\Fan Dean\Documents\fandean.github.io\_drafts\DataBase\assets\1541345568342.png)





#### 发布订阅与消息队列



![1541345751400](D:\Fan Dean\Documents\fandean.github.io\_drafts\DataBase\assets\1541345751400.png)





而发布订阅所有订阅者都可收到消息。









## Redis进阶

[读完这篇文章，就基本搞定了Redis数据库](https://mp.weixin.qq.com/s?__biz=MjM5ODI5Njc2MA==&mid=2655819214&idx=1&sn=876739ed2df78a420536e0c3a17eab26&chksm=bd74d8198a03510f0c639bf2410432a76cfc200546ec320e6fcbffbdd003ffc6048148b6d65a&mpshare=1&scene=24&srcid=1028pVsJdfE8OC8D7EzolBbI#rd)

[慢查询日志 — 《Redis 设计与实现》](http://redisbook.com/preview/slowlog/content.html "慢查询日志 — Redis 设计与实现") 

[进阶的Redis之哈希分片原理与集群实战 - 掘金](https://juejin.im/post/5be8ee10e51d450bd74ed516?utm_source=gold_browser_extension "进阶的Redis之哈希分片原理与集群实战 - 掘金")



另见面试总结

