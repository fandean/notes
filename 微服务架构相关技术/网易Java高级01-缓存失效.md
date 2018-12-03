

> 玩转Java高并发分布式架构核心技术
>
> ￥7499*原价：￥12680*



# 缓存失效导致系统挂掉！如何解决这个深坑



- 先讲查票
- 再讲抢票(更加复杂)





## 缓存失效场景重现

高并发单元测试

通过线程模拟高并发

`java.util.concurrent` 包下包含并发相关工具（重点）

```
java.util.concurrent.CountDownLatch
```



需要设置缓存失效时间的原因，是为了保证数据的一致性。比如12306如果长时间不更新剩余车票数，会导致明明数据库中已经没票，但页面依然显示有票。

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/%E7%BC%93%E5%AD%98%E5%A4%B1%E6%95%88%E5%9C%BA%E6%99%AF.png)



## 缓存雪崩：



- Redis 挂掉
- 与Redis服务器之间的网络连接断开
- key失效

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/%E7%BC%93%E5%AD%98%E9%9B%AA%E5%B4%A9.png)





> 那么缓存穿透呢？
>
> [缓存穿透与缓存雪崩](http://www.cnblogs.com/fidelQuan/p/4543387.html) ：这里讲解了更多问题和更多更全的解决方案，和分布式缓存系统面临的系列问题，如缓存一致性问题。





## 解决方案一



1. 增加互斥锁：拿到锁的线程才访问数据库，重建缓存（缺点：锁粒度粗，所有车次使用一把锁，当某车次需要重建缓存时，竟然会阻塞其它车次）

   ![](https://raw.githubusercontent.com/fandean/images/master/PicGo/%E5%A2%9E%E5%8A%A0%E4%BA%92%E6%96%A5%E9%94%8101.png)

   ![](https://raw.githubusercontent.com/fandean/images/master/PicGo/%E5%A2%9E%E5%8A%A0%E4%BA%92%E6%96%A5%E9%94%81.png)

   ![](https://raw.githubusercontent.com/fandean/images/master/PicGo/%E5%A2%9E%E5%8A%A0%E4%BA%92%E6%96%A5%E9%94%8102.png)

2. （进一步）实现一个细粒度的锁

   ![](https://raw.githubusercontent.com/fandean/images/master/PicGo/%E7%BC%93%E5%AD%98%E9%99%8D%E7%BA%A701.png)

3. （进一步优化）**没拿到锁**的进行，缓存降级

   服务降级： 一步步降低预期要求

   - 平时 ：下单，直接付款成功
   - 高峰期（需要对服务降级）：提示排队，稍后重试。（12306的降级策略可能是，对于没拿到锁的用户，有票无票都显示0）

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/%E7%BC%93%E5%AD%98%E9%99%8D%E7%BA%A702.png)



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/%E7%BC%93%E5%AD%98%E9%99%8D%E7%BA%A703.png)



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/%E9%99%8D%E7%BA%A7%E6%96%B9%E6%A1%88%E7%9A%84%E4%BC%98%E7%BC%BA%E7%82%B9.png)

> Spring有 @cacheable 相关注解，用于简化缓存代码。
>
> 缓存降级：使用 map.putifAbsent() ，来做标记



> 网上更多解决方案：
>
> 1：在缓存失效后，通过**加锁**或者队列来控制读数据库写缓存的线程数量。比如对某个key只允许一个线程查询数据和写缓存，其他线程等待。
>
> 2：不同的key，**设置不同的过期时间**，让缓存失效的时间点尽量均匀。
>
> 3：**做二级缓存**，A1为原始缓存，A2为拷贝缓存，A1失效时，可以访问A2，A1缓存失效时间设置为短期，A2设置为长期（此点为补充）







![](https://raw.githubusercontent.com/fandean/images/master/PicGo/%E4%B8%A4%E5%B9%B4%E5%BC%80%E5%8F%91.png)



