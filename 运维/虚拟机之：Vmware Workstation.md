# Vmware Workstation



VMware Workstation Pro 14.1.0 注册码：

```
激活密钥：
AU5WA-0EF9M-0811P-REP5X-ZFK9A
ZV382-6VX96-H81LP-1ZZG9-PVKF4
GU34A-41G4Q-H88CY-3WPNT-XUK8F

CG54H-D8D0H-H8DHY-C6X7X-N2KG6
ZC3WK-AFXEK-488JP-A7MQX-XL8YF
AC5XK-0ZD4H-088HP-9NQZV-ZG2R4
ZC5XK-A6E0M-080XQ-04ZZG-YF08D
ZY5H0-D3Y8K-M89EZ-AYPEG-MYUA8
```



## VMware Workstation Pro™ 产品文档（中文）

[VMware Workstation Pro 文档](https://docs.vmware.com/cn/VMware-Workstation-Pro/index.html "VMware Workstation Pro 文档")  》 展开左侧的 “产品文档”



推荐





当我们复制或改变了一个虚拟机的位置之后，再启动虚拟机时会提示：

I moved it

或者

I copied it

----------------------------------------------------------------------------------------------------------------

解释：

根据实际情况来选择

如果选择I moved it 的话网卡的MAC地址会保持不变;因为始终只有一个MAC地址，不会造成冲突，所以虚拟机间通信没问题。

如果选择I copied it 的话网卡的MAC地址就会变化；因为如果MAC地址不变的话，就存在两个相同的MAC地址，那么这个两个虚拟机之间的通信就会造成冲突了，所以需要修改网络配置才能正常通讯。





## 虚拟机设置



硬件：

- 添加多个网络适配器

- 网络适配器连接模式
- 磁盘 ： 磁盘使用工具》磁盘映射》碎片整理》扩展》压缩
- 添加移除设备



选项：

- 共享文件夹
- 快照
- VNC连接





## 首选项设置





## VMware Tools的安装







## 虚拟网络编辑器



本机和虚拟机进行通信，

如果本机和虚拟机之间无法通信，可以选择：

- 修改当前虚拟网卡的类型（通信模式）
- 切换虚拟网卡
- 新建一个虚拟网卡



**新建一个仅主机模式的虚拟网卡：** 

查看虚拟主机的ip，这里假设是：`192.168.66.166`

打开`虚拟网络编辑器 > 添加网络 > 设置为仅主机模式 > 子网掩码：192.168.66.0 > 子网掩码： 255.255.255.0 > 配置某个虚拟机使用该网卡 > 测试连接 > 如果连接失败，查看主机网络适配器，找到刚才新建的 VMware Network Adapter Vm.. > 查看属性 > 找到internet协议版本4 > 属性 > 手动为其设置 ip 地址为192.168.66.**网段的值`   



新建一个NAT模式的虚拟网卡：





Workstation Pro 中的虚拟网络连接组件包括虚拟交换机、虚拟网络适配器、虚拟 DHCP 服务器和 NAT 设备。



**虚拟交换机**：又称为虚拟网络，其名称为 VMnet0、VMnet1、VMnet2 。可在**主机**的网络适配器中看到。与物理交换机相似，虚拟交换机也能将网络连接组件连接在一起。您可以将任意数量的虚拟网络设备连接到 Windows 主机系统的虚拟交换机（Linux主机最多只允许32个）



**虚拟网络适配器**：在您使用新建虚拟机向导创建新的虚拟机时，向导会为虚拟机创建一个虚拟网络适配器。也就是说 虚拟网络适配器 需要在虚拟机（**客户机**）中查看。



虚拟 DHCP 服务器：虚拟动态主机配置协议 (DHCP) 服务器可在未桥接到外部网络的配置中向虚拟机提供 IP 地址。例如，虚拟 DHCP 服务器可在仅主机模式和 NAT 配置中向虚拟机分配 IP 地址。（排除桥接）



NAT 设备：NAT 配置中的 NAT 设备可在一个或多个虚拟机以及外部网络之间传送网络数据，识别用于每个虚拟机的传入数据包，并将它们发送到正确的目的地。







通常使用 Workstation Pro 中包含的虚拟 DHCP 服务器来分配 IP 地址。也可以从虚拟 DHCP 服务器未分配的地址池中静态分配 IP 地址。使用 DHCP 分配 IP 地址比静态分配更简便，自动化程度更高。大多数 Windows 操作系统预配置为在引导时使用 DHCP，因此，Windows 虚拟机可以在首次引导时连接到网络，而无需进行额外的配置。

如果您希望虚拟机使用名称而不是 IP 地址进行相互通信，则必须设置命名约定以及/或者在专用网络上设置命名服务器。在这种情况下，使用静态 IP 地址可能更简便。

一般情况下，如果打算经常或**长时间使用虚拟机**，更方便的做法是分配静态 IP 地址或配置虚拟 DHCP 服务器，以便始终为每个虚拟机分配相同的 IP 地址。对于临时虚拟机，可以让虚拟 DHCP 分配 IP 地址。



> 虚拟 DHCP 服务器不会为位于桥接模式网络中的虚拟机或物理机提供支持。也就是DHCP只对仅主机模式和NAT模式有用。





## 配置网络地址转换

[配置网络地址转换](https://docs.vmware.com/cn/VMware-Workstation-Pro/14.0/com.vmware.ws.using.doc/GUID-89311E3D-CCA9-4ECC-AF5C-C52BE6A89A95.html#GUID-89311E3D-CCA9-4ECC-AF5C-C52BE6A89A95 "配置网络地址转换")

![](https://docs.vmware.com/cn/VMware-Workstation-Pro/14.0/com.vmware.ws.using.doc/images/GUID-4C1FE8E1-9C52-4A43-9C36-97AEC38C737B-high.png)


虚拟机和主机系统共享一个网络标识，此标识在外部网络中不可见。NAT 工作时会将虚拟机在专用网络中的 IP 地址转换为主机系统的 IP 地址。当虚拟机发送对网络资源的访问请求时，它会充当网络资源，就像请求来自主机系统一样。



[在仅主机模式和 NAT 模式网络中分配 IP 地址的 DHCP 约定](https://docs.vmware.com/cn/VMware-Workstation-Pro/14.0/com.vmware.ws.using.doc/GUID-9831F49E-1A83-4881-BB8A-D4573F2C6D91.html "在仅主机模式和 NAT 模式网络中分配 IP 地址的 DHCP 约定")

[更改 NAT 设置](https://docs.vmware.com/cn/VMware-Workstation-Pro/14.0/com.vmware.ws.using.doc/GUID-E146C894-664C-479A-9E19-484400614BED.html "更改 NAT 设置")





NAT 模式网络上的 IP 地址用途

| 范围              | 地址用途     | 示例                        |
| ----------------- | ------------ | --------------------------- |
| 网络.1            | 主机         | 192.168.0.1                 |
| 网络.2            | NAT 设备     | 192.168.0.2                 |
| 网络.3–网络.127   | 静态地址     | 192.168.0.3–192.168.0.127   |
| 网络.128–网络.253 | 由 DHCP 分配 | 192.168.0.128–192.168.0.253 |
| 网络.254          | DHCP 服务器  | 192.168.0.254               |
| 网络.255          | 广播         | 192.168.0.255               |



看起来 网络1 指的是 VMnet8的ip地址。



## 固定ip



[虚拟机中的CentOS 7设置固定IP连接最理想的配置 - 山鬼谣的专栏 - CSDN博客](https://blog.csdn.net/u013066244/article/details/61655788 "虚拟机中的CentOS 7设置固定IP连接最理想的配置 - 山鬼谣的专栏 - CSDN博客") 配置方式见此处。



我的一个配置，且并没有取消掉 虚拟网络编辑器中的"使用本地DHCP将IP地址分配给虚拟机"，IP也可以设置为大于128：

编辑：`/etc/sysconfig/network-script/ifcfg-eth**`

```properties
BOOTPROTO=static        #开机协议，有dhcp及static（这里使用静态地址）
ONBOOT=yes              #设置为开机启动；

# 子网掩码使用默认的
NETMASK=255.255.255.0
# 网关在 虚拟网络编辑器 的 NAT 设置中查看
GATEWAY=192.168.25.2
# IP地址的范围 最好还是遵循上文表格
#IPADDR=192.168.25.05
IPADDR=192.168.25.146
# 必须选择一个DNS服务器（下面是清华的一个DNS服务器）
DNS1=166.111.8.30
DNS2=8.8.8.8
```



```shell
service network restart     # centos 6
systemctl restart network.service  # centos 7
```





在每次登录进虚拟机后会提示：

```
Last login: Thu Nov  1 08:44:51 2018 from 192.168.25.1
```

而 `192.168.25.1` 是 VMnet8的ip地址