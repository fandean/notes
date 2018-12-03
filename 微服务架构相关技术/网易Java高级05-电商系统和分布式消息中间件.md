# 电商系统和分布式消息中间件，不得不说的故事



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/6.1%E7%94%B5%E5%95%86%E4%B8%9A%E5%8A%A1%E7%AE%80%E4%BB%8B01.png)



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/6.2%E7%94%B5%E5%95%86%E4%B8%9A%E5%8A%A1%E7%AE%80%E4%BB%8B02.png)



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/6.3%E7%94%B5%E5%95%86%E4%B8%9A%E5%8A%A1%E7%AE%80%E4%BB%8B03.png)



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/6.4RabbitMQ%E7%AE%80%E4%BB%8B.png)



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/6.5RabbitMQ%E7%AE%80%E4%BB%8B02.png)



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/6.6RabbitMQ%E7%AE%80%E4%BB%8B03.png)



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/6.7%E7%94%B5%E5%95%86%E4%B8%9A%E5%8A%A1%E6%95%B4%E4%BD%93%E6%9E%B6%E6%9E%84.png)



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/6.8RabbitMQ%E9%83%A8%E7%BD%B2.png)



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/6.9%E7%94%B5%E5%95%86%E4%B8%9A%E5%8A%A1%E6%B6%88%E6%81%AF%E9%98%9F%E5%88%97%E6%9E%B6%E6%9E%84-%E9%98%9F%E5%88%97%E8%AE%BE%E8%AE%A1.png)









> 还有一个消息的顺序问题没有说。

## 支付回调

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/6.9%E7%94%B5%E5%95%86%E4%B8%9A%E5%8A%A1%E6%B6%88%E6%81%AF%E9%98%9F%E5%88%97%E6%9E%B6%E6%9E%84-%E9%98%9F%E5%88%97%E8%AE%BE%E8%AE%A102.png)



外部系统 和 内部系统（网易这里是内部系统） HTTP接口会出现网络延迟等情况

相当于品优购对微信



支付回调之后并没有更改数据库，而只是将支付状态直接给队列，然后返回给支付（表明接收成功）



支付回调面临的问题：

- 对方的支付系统在对你进行支付回调时一般第一次只给你一秒响应时间，如果一秒没有响应会再次进行回调，此次会过2秒，再下一次会等5秒，回调5次截至。支付回调对时间很敏感，如果你在接收到回调后去更改状态读写数据库等系列操作就可能超时。所以不能做成同步的，必须做成异步的。
- 短时间内重复回调该如何处理？比如（对方）支付系统出现bug，**同时**向两台（或多台）服务器发送支付回调，那么我需要发起两次订购吗（如果发起两次订购我就会赔钱）？**加锁**



> 上下对应来理解

支付回调问题解决办法：

- **异步处理**，避免超时：使用消息队列来实现异步
- 使用**分布式锁**：保证一次回调只产生一次订购，一旦接收到对应的消息（一次回调会产生一条消息）（消息被消费的时候）就对流水号或订单号加分布式锁，当再次接收到消息后去检测该订单是否有加锁，如果已经加锁则不处理该消息，或将其发送到另一个消息队列中。
- 进行幂等性判断：这里是为了判断你的订单消息是否已经处理过，如果已经处理则直接返回。
- 持久化：避免宕机后消息或事务丢失





> 幂等性：**相同的操作和资源**做一次或多次效果一样。拿set集合的put操作来说，你第一次put一个A和第二次再put一个A结果是一样的；这里的操作都是put，资源都是A。



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/6.9%E7%94%B5%E5%95%86%E4%B8%9A%E5%8A%A1%E6%B6%88%E6%81%AF%E9%98%9F%E5%88%97%E6%9E%B6%E6%9E%84-%E6%B6%88%E6%81%AF.png)



## ACK机制

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/6.10%E7%94%B5%E5%95%86%E4%B8%9A%E5%8A%A1%E4%B8%AD%E7%9A%84%E5%85%B3%E9%94%AE%E8%AE%BE%E8%AE%A1-%E6%B6%88%E6%81%AF%E7%A1%AE%E8%AE%A4%E6%9C%BA%E5%88%B6.png)



开启ACK机制后

- 如果消费端宕机或异常退出会导致没有发送ACK，则消息队列会将消息发送到另一个消费端。
- 如果消息被消费端正常处理，那么消费端会发送ACK，消息队列会将该消息删除。



Message的（）几个状态：

- 可用：可以直接发送给消费者
- 锁定：已经发给某个消费者，但消费者还没有发送ACK
- 完成：消费者已经发送了ACK，接下来该消息会被从消息队列中删除





ACK分为自动ACK（默认）和手动ACK





## 幂等性保证

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/6.11%E7%94%B5%E5%95%86%E4%B8%9A%E5%8A%A1%E4%B8%AD%E7%9A%84%E5%85%B3%E9%94%AE%E8%AE%BE%E8%AE%A1-%E5%B9%82%E7%AD%89%E6%80%A7%E4%BF%9D%E8%AF%81.png)





## 分布式事务



比如支付成功后，会给你一次抽奖活动（由一个服务处理）或删除优惠券（由一个服务处理）。

一个订单的变化，涉及到多个任务的处理，这些事情会由**不同的服务**(不同服务器，分布式)，**不同的时间**（异步）来处理，并且我们需要保证系统的一致性，要成功都成功，出现一个失败就全部回滚。

这就需要进行分布式事务处理。



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/6.12%E7%94%B5%E5%95%86%E4%B8%9A%E5%8A%A1%E4%B8%AD%E7%9A%84%E5%85%B3%E9%94%AE%E8%AE%BE%E8%AE%A1-%E5%88%86%E5%B8%83%E5%BC%8F%E4%BA%8B%E5%8A%A1.png)



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/6.13%E7%94%B5%E5%95%86%E4%B8%9A%E5%8A%A1%E4%B8%AD%E7%9A%84%E5%85%B3%E9%94%AE%E8%AE%BE%E8%AE%A1-%E5%88%86%E5%B8%83%E5%BC%8F%E4%BA%8B%E5%8A%A102.png)



> CAP理论：可参考阮大侠的文章



> Zookeeper选择了的是CP，放弃了可用性。ZK 一般采用 1L + 2F (一个领导者Leader加两个跟随者Follower，或者叫 1+2n 或 1+2f，n,f为变量，所以ZK的节点数为奇数)，底层使用 ZAB协议，高层使用节点树形式。
>
> ZAB协议分为几个过程：
>
> - 选举过程：启动的时候（或当前Leader宕机后）选举出一个节点作为Leader；此过程不对外提供服务（放弃可用性）。
> - 同步过程：各节点进行事务(任务)同步
> - 事务过程：对外提供服务（查询时不区分节点，做修改时Follower会将请求转发给Leader处理）





> ZK的临时节点作用域为会话





![](https://raw.githubusercontent.com/fandean/images/master/PicGo/6.14%E7%94%B5%E5%95%86%E4%B8%9A%E5%8A%A1%E4%B8%AD%E7%9A%84%E5%85%B3%E9%94%AE%E8%AE%BE%E8%AE%A1-%E5%88%86%E5%B8%83%E5%BC%8F%E4%BA%8B%E5%8A%A103.png)



这里使用最终一致性



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/6.15%E7%94%B5%E5%95%86%E4%B8%9A%E5%8A%A1%E4%B8%AD%E7%9A%84%E5%85%B3%E9%94%AE%E8%AE%BE%E8%AE%A1-%E5%88%86%E5%B8%83%E5%BC%8F%E4%BA%8B%E5%8A%A104.png)



