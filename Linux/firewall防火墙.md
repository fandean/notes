防火墙学习
=================================

参考：  
[fedora防火墙FirewallD详解](http://www.fedora.hk/linux/yumwei/show_15.html)    
[Linux下iptables配置详解及常用配置](http://www.fedora.hk/linux/yumwei/show_23.html)   
[iptables](http://baike.baidu.com/link?url=Zu1FbVPOoxpczkqVFBg7PCeXYQb2U_kd6Qxi3KXaTlxRdJTEzmfPh-8FKRFB4SyvYCRmmfMwXyzlYenZ83sxz_ "百度百科,带有适合web服务器的规则示例脚本")    

**终于找到最好的Doc，官方文档**：[Red-Hat Security_Guide](https://access.redhat.com/documentation/zh-CN/Red_Hat_Enterprise_Linux/7/html/Security_Guide/index.html)


> 最近发现：有关fedora的学习见[fedoraproject](fedoraproject.org/wiki/Fedora_Project_Wiki)
进入此网站后，在左下角的位置有一个搜索框，可进行搜索(这个是关键)。


**在上面的网站搜索： FirewallD ，查看相关信息可知，FierwallD与iptables等静态防火墙是不能共存的。**


注意：更改后记得**重启服务**或者**重启系统**。   

iptables静态防火墙 
----------------------------------------------------
可参考: 鸟哥的Linux私房菜

###摘抄自百度百科

**适合Web服务器的iptables规则脚本文件**

```
IPT="/sbin/iptables"
$IPT --delete-chain
$IPT --flush
$IPT -P INPUT DROP #1
$IPT -P FORWARD DROP#1
$IPT -P OUTPUT DROP #1
$IPT -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT #2
$IPT -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT #3
$IPT -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT #3
$IPT -A INPUT -p tcp -m tcp --dport 21 -j ACCEPT#3
$IPT -A INPUT -p tcp -m tcp --dport 873 -j ACCEPT #3
$IPT -A INPUT -i lo -j ACCEPT #4
$IPT -A INPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT#5
$IPT -A INPUT -p icmp -m icmp --icmp-type 11 -j ACCEPT #5
$IPT -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT #6
$IPT -A OUTPUT -p udp -m udp --dport 53 -j ACCEPT #7
$IPT -A OUTPUT -o lo -j ACCEPT #4
$IPT -A OUTPUT -p tcp -m tcp --dport 80 -j ACCEPT #8
$IPT -A OUTPUT -p tcp -m tcp --dport 25 -j ACCEPT #9
$IPT -A OUTPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT#10
$IPT -A OUTPUT -p icmp -m icmp --icmp-type 11 -j ACCEPT #10
service iptables save
service iptables restart

```

将以上内容保存为 iptables.sh ,运行即可自动配置防火墙。  

也可以选择相应端口的条目手动执行，将 IPT 替换为 iptables 在命令行执行。   

解释：  

```
解释：
#1、设置INPUT,FORWARD,OUTPUT链默认target为DROP，也就是外部与服务器不能通信。
#2、设置当连接状态为RELATED和ESTABLISHED时，允许数据进入服务器。
#3、设置外部客户端连接服务器端口80,22,21,873。
#4、允许内部数据循回。
#5、允许外部ping服务器。
#6、设置状态为RELATED和ESTABLISHED的数据可以从服务器发送到外部。
#7、允许服务器使用外部dns解析域名。
#8、设置服务器连接外部服务器端口80。
#9、允许服务器发送邮件。
#10、允许从服务器ping外部。
iptables保存：iptables-save
			: 重启 restart 
iptables还原：iptables-restore
```



###iptables配置2  

**允许远程SSH登陆，开启22端口：**  

`iptables -A INPUT -p tcp --dport 22 -j ACCEPT`

**做web服务器，开启80端口**

`iptables -A INPUT -p tcp --dport 80 -j ACCEPT`

**做邮件服务器，开启25, 110端口**

```
iptables -A INPUT -p tcp --dport 110 -j ACCEPT
iptables -A INPUT -p tcp --dport 25 -j ACCEPT
```

**做FTP服务器，开启21端口**

```
iptables -A INPUT -p tcp --dport 21 -j ACCEPT
iptables -A INPUT -p tcp --dport 20 -j ACCEPT
```

**允许icmp包通过,也就是允许ping**

```
iptables -A OUTPUT -p icmp -j ACCEPT  #(OUTPUT设置成DROP的话)
iptables -A INPUT -p icmp -j ACCEPT   #(INPUT设置成DROP的话)
```

详细内容见参考链接。  







2.FierwallD 构建动态防火墙(Fedora)
-----------------------------------------

[firewallD on centos-7](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-using-firewalld-on-centos-7)


使用`firewall-cmd`命令行工具配置        

**firewall-cmd选项：**  

```
[--zone=]		代表区域，如不指定则为默认区域。  
[--timeout=]	生效时长。   
[-]/			端口/协议 组合;端口可以为一个端口范围
```

`firewall-cmd  -h`查看简明帮助信息。

事先查看其已有的配置(默认zone)：
```
firewall-cmd --list-all		#列出本zone的所有的配置
firewall-cmd --list-all-zone  #列出所有zone的所有配置
firewall-cmd --list-services  #列出本zone已经配置的服务
# 下面仅写选项，不再写 firewall-cmd命令
--list-ports
--get-services    # 获得所有可用的服务
--get-default-zone
--list-interfaces
```

> 永久设置的选项：  --permanent 

### 临时启用,某项服务
```
firewall-cmd [--zone=] --add-service=某项服务		#启用
firewall-cmd [--zone=]  --remove-service=某项服务   #禁用
firewall-cmd [--zone=] --query-service=某服务       #查询
firewall-cmd --add-service=http						#示例： 启用默认区域中的http服务  
```

### 临时启用和禁用端口协议组合
```   
firewall-cmd [--zone=] --add-port=[-]/		
firewall-cmd [--zone=]  --remove-port=[-]/  
firewall-cmd [--zone=] --query-port=[-]/  
firewall-cmd --add-port=22/tcp						#示例： 启用默认区域 22 端口
```

###临时启用，ICMP阻塞功能  
#### ICMP 阻塞用  icmp-block 表示，
firewall-cmd --zone=public --add-icmp-block=echo-reply	#示例：阻塞public区域的响应应答报文


#### 启用区域中的伪装； 用 masquerade 表示


#### 在区域中启用端口转发或映射 用 forward-port=port 表示
firewall-cmd [--zone=] --add-forward-port=port=[-]:proto= { :toport=[-] | :toaddr=  | :toport=[-]:toaddr=  }

firewall-cmd --zone=home --add-forward-port=port=22:proto=tcp:toaddr=127.0.0.2    #示例： 将home的ssh转发到127.0.0.2







### 永久设置    
只需在临时的各种设置中加上 --permanent  即可。  

	permanent：常驻，永久。

比如：

```
# 这一句可以不执行，默认就为public 
firewall-cmd --set-default-zone=public   #设置默认zone为public
# 不必显示指定 --zone=public 
firewall-cmd --permanent --zone=public --add-port=8080/tcp		#添加8080 tcp端口
# 不必显示指定 --zone=public 
firewall-cmd --permanent --zone=public  --list-all				#查看public的配置情况  
```


### 重载firewalld

	sudo systemctl reload firewalld

