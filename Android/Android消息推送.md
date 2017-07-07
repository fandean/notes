# Android消息推送

## Android推送的方式

### Pull
客户端时隔一段时间向服务端拉取数据，看是否有更新消息，如果有，更新客户端信息，如果没有更新，不做任何操作。



### Push
服务端在有新消息的情况下，主动向客户端推送更新消息。


### 异同点

1. 实现相同的功能
2. Pull方式更加耗费流量
3. Pull方式更加耗费电量



## Android推送解决方案

- C2DM云端推送
- MQTT协议
- RSMB实现推送
- XMPP协议
- 第三方推送平台



### C2DM云端推送

1. Google提供；
2. 提供简单、轻量级服务；
3. 应用程序直接与服务器进行通信；
4. 依赖Google官方C2DM服务器。(需FQ)


### MQTT协议

1. 使用TCP/IP网络连接；
2. 更加简约、轻量，而且易于使用；
3. 但是带宽低、网络延迟高、网络通信不稳定。


### RSMB实现推送
![RSMB推送，基于MQTT协议](http://www.maiziedu.com/uploads/new_img/kV2gsNqYfR1637X2u7.png)


### XMPP协议

1. 基于扩展标记语言（**XML**）的协议；
2. 开源；
3. 采用C/S模式通信模式；
4. XML的数据传输格式；
5. 客户端的操作非常简单；
6. 分布式网络特点

#### XMPP协议工作原理

1. 客户端连接到服务器；
2. 服务器对其进行认证；
3. 客户端进行某种定制的请求；
4. 客户端与服务端进行交互。

#### 基于XMPP协议的开源库Androidpn

1. 基于XMPP协议的开源库；
2. 包含完整的客户端以及服务端；
3. 基于openfire开源工程。

服务端需要自己配：

![配置服务端](http://www.maiziedu.com/uploads/new_img/NxCtMdWMA4kfqFUBrm.png)


推送界面：  

![推送界面](http://www.maiziedu.com/uploads/new_img/87tIPP6FZfNOztC8Vy.png)

> Androidpn已经过时
> Android客户端程序中需要包含Androidpn的相关代码，并能够与服务器进行通信。



[史上最全解析Android消息推送解决方案 - 简书](http://www.jianshu.com/p/b61a49e0279f "史上最全解析Android消息推送解决方案 - 简书")

## 第三方推送



### 友盟推送、极光推送、云巴（基于MQTT）

解决方案没有优劣，要具具体使用场景而定。但一般来说，**个人建议使用第三方平台推送，成本低+抵达率高**

## BAT大厂的平台推送

### 阿里云移动推送





手机厂商类：小米推送、华为推送。         
第三方平台类：友盟推送、极光推送、云巴（基于MQTT）          
BAT大厂的平台推送：阿里云移动推送、腾讯信鸽推送、百度云推送          