

## 购买

- 在购买页面选择ECS的规格 或者 在控制台的ECS中的实例界面选择创建实例
- 选择ECS所在地区（原则上距你越近，访问越快）
- 选择需要在ECS实例中安装的操作系统镜像；另外还可以 **定制镜像** 
- 选择包月或按流量付费
- 付款



购买了云服务器后，大概1-2分钟后刷新页面就会发现自动为你创建了一个实例。



> **注意**：在管理控制台页面，记得**先**选择购买时所选云服务器所在的地区，比如我买的是 "华南1（深圳）"。比较坑的是，它可能不会自动选择正确的区域，比如它给你选择了 “华北1（青岛）”，而你自己没有去切换到深圳，你就会找不到实例，或者在创建安全组时没法选择专有网络。



> 2018.11.11阿里云10周年，新用户优惠， ECS 3年只需 298元。看了一下续费 80 一月。
>
> 所以要好好利用。
>
> 磁盘40GB，1核，内存2GB，1Mbps宽带，宽带计费方式 按固定宽带（感觉就是不限制流量)
>
> 一个公网IP一个私网IP？





官方文档：[云服务器 ECS-阿里云](https://help.aliyun.com/product/25365.html "云服务器 ECS-阿里云")



## 如何使用ssh连接ECS实例？



进入实例界面 > 更多 > 密码/密钥 >  修改远程连接密码 > 修改完成 > **重启实例**



找到公网 ip ，使用新密码连接。



> 填入密码后还是各种出错？
>
> 使用 Bitvise SSH Client 连接出错，但使用putty可以，然后尝试下载了mRemoteNG发现也可以，但是用习惯了 Bitvise SSH Client ，所以到其官网下载最新版本，安装后问题解决。最初的错误提示为：
>
> ```
> The SSH2 session has terminated with error. Reason: Error in component
> session/transport/kexHandler. Error class: Flow, code: ComponentException,
> message: Exception in component: Windows CNG (x86) with additions: AsymKey:
> CngAgree: unexpected secretData->cbStruct.
> 
> SSH2会话已因错误而终止。原因：组件错误
> 会话/传输/kexHandler。错误类：流，代码：组件异常，
> 消息：组件中出现异常：Windows CNG（x86），添加：AsymKey:
> CngAgree:意外的secretData->cbStruct。
> ```
>
> 
>
> **Bitvise SSH Client** 的介绍： 我们的免费，灵活的Windows SSH客户端包括最先进的终端仿真，图形以及命令行SFTP支持，FTP到SFTP桥接，强大的隧道功能，包括通过集成代理进行动态端口转发以及对我们的远程管理SSH服务器。 如果要启动连接或到他人计算机的文件传输，正在寻找SSH客户端。则可以在任何类型的环境中免费使用Bitvise SSH客户端。 
>
> mRemoteNG：里面包含了一个putty，进行ssh连接时调用的是putty。注意只有新建的连接才能保存密码。



## 如何开放端口？



开放端口，需要在安全组中配置。

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181118210053.png)

可以选择使用现有的安全组，也可选择自己再重新创建一个安全组。

选择使用现有的安全组时直接点击后面的**“配置规则”**就可设置要开放的端口。



> 官方推荐创建安全组时选择 “专有网络”（即VPS），所以要先创建一个VPS，
>
> ![](https://raw.githubusercontent.com/fandean/images/master/PicGo/aliyun%E5%AE%89%E5%85%A8%E7%BB%8402.png)



[云服务器 ECS](https://help.aliyun.com/product/25365.html) > [最佳实践](https://help.aliyun.com/document_detail/51170.html) > [安全](https://help.aliyun.com/document_detail/51170.html) > ECS安全组实践（一）



> 优先考虑 VPC 网络



在Docker中运行Mysql后再开放端口就可以访问了。



## 云安全中心



威胁检测 ：

- 防暴力破解：
- Web目录定义



