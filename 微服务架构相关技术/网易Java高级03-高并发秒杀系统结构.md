# 高并发秒杀系统架构设计和实现





## 02 高并发系统架构设计技巧



高并发流量治理

- 分流
- 限流



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/3.1%E7%B3%BB%E7%BB%9F%E6%9E%B6%E6%9E%84.png)



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/3.2%E7%8B%AC%E7%AB%8B%E6%95%B0%E6%8D%AE%E5%BA%93.png)



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/3.3%E7%B3%BB%E7%BB%9F%E9%80%BB%E8%BE%91%E6%A2%B3%E7%90%86.png)

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/3.4%E6%95%B0%E6%8D%AE%E5%BA%93%E5%8E%8B%E5%8A%9B%E6%B5%8B%E8%AF%95.png)



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/3.4%E4%BB%8E%E6%B5%81%E9%87%8F%E8%A7%92%E5%BA%A6%EF%BC%8C%E5%A4%9A%E5%B1%82%E6%AC%A1%E5%88%86%E6%9E%90%E6%9E%B6%E6%9E%84.png)





![](https://raw.githubusercontent.com/fandean/images/master/PicGo/3.5%E5%88%86%E6%B5%81%E5%92%8C%E9%99%90%E6%B5%81%E5%85%B7%E4%BD%93%E6%8F%8F%E8%BF%B0.png)



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/3.6%20%E7%94%A8%E6%88%B7%E6%93%8D%E4%BD%9C%E7%BB%B4%E5%BA%A6-%E9%99%90%E6%B5%81.png)



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/3.7%E6%9C%8D%E5%8A%A1%E5%99%A8%E5%81%87%E8%AE%BE-%E5%88%86%E6%B5%81.png)

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/3.8%20Nginx.png)





![](https://raw.githubusercontent.com/fandean/images/master/PicGo/3.9Java%E7%BC%96%E7%A0%81-%E7%94%A8%E6%88%B7%E8%AF%B7%E6%B1%82%E9%A2%91%E7%8E%87%E9%99%90%E5%88%B6.png)





![](https://raw.githubusercontent.com/fandean/images/master/PicGo/3.10%20%E4%BB%A4%E7%89%8C%E6%A1%B6%E7%AE%97%E6%B3%95.png)

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/3.11%20%E6%80%BB%E7%BB%93.png)



![](https://raw.githubusercontent.com/fandean/images/master/PicGo/3.12%E7%BD%91%E6%98%93%E5%AE%9E%E8%B7%B5%E4%B8%AD%E7%9A%84%E6%89%A9%E5%B1%95.png)









**redis组合命令：**

redis 是可以使用**组合命令**的，所以我们可以使用 `set key value ex 5 nx` 单条命令来替换下面的两条命令：

- setnx
- setex

这是一个非常重要的细节，这将会大大提高效率。





> 订单系统，库存系统是两个独立的系统，两者之间使用消息队列来进行通信，进行异步处理，并不需要等到商品发货时才表示一个订单成功生成。
>
> 订单系统高并发，高并发产生的订单经过消息队列的流量削峰才到达库存系统
>
>

