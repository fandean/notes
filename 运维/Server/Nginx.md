# Nginx





正向代理与反向代理区别在于代理的对象不一样：

- 正向代理代理的对象是客户端
- 反向代理代理的对象是服务端



> [正向代理与反向代理的区别 - 简书](https://www.jianshu.com/p/208c02c9dd1d "正向代理与反向代理的区别 - 简书")
>
> [图解正向代理、反向代理、透明代理-丁胖胖的BLOG-51CTO博客](http://blog.51cto.com/z00w00/1031287 "图解正向代理、反向代理、透明代理-丁胖胖的BLOG-51CTO博客")



## 正向代理







## 反向代理



当用户客户机请求集群系统时，集群给用户的感觉就是一个单一独立的服务器，而实际上用户请求的是一组集群服务器。







## Nginx配置Web服务器



> [Nginx教程™](https://www.yiibai.com/nginx "Nginx教程™")
>
> [Nginx快速入门 - Nginx教程™](https://www.yiibai.com/nginx/beginners_guide.html "Nginx快速入门 - Nginx教程™")



看一个示例：

```
	server {
        listen       80;
		server_name  search.pinyougou.com;
        location / {
	    	proxy_pass http://127.0.0.1:8084;
            root   /;
            index  search.html;
        }
    }
    
        server {
        listen       80;
		server_name  www.pinyougou.com;
        location / {
	    	proxy_pass http://127.0.0.1:8083;
            root   /;
            index  index.html;
        }
    }
```





### 设置虚拟服务器

NGINX配置文件必须至少包含一个服务器指令来定义虚拟服务器。 当NGINX处理请求时，它首先选择提供请求的虚拟服务器。
虚拟服务器由`http`上下文中的服务器指令定义，例如：

```
http {
    server {
        # Server configuration
    }
}
```



#### listen

`server`配置块通常包括一个`listen`指令，用于指定服务器侦听请求的IP地址和端口



下面的示例显示了监听IP地址`127.0.0.1`和端口`8080`的服务器：

```
server {
    listen 127.0.0.1:8080;
    # The rest of server configuration
}
```

如果省略端口，则使用标准端口。 同样地，如果省略一个地址，服务器将侦听所有地址。 如果没有包含listen指令，则“标准”端口为`80/tcp`，“default”端口为`8000/tcp`，具体取决于超级用户权限。





#### server_name



如果有多个服务器与请求的IP地址和端口相匹配，则NGINX将根据服务器块中的`server_name`指令测试请求的主机头域。 `server_name`的参数可以是完整(精确)名称，通配符或正则表达式。







### 配置位置 location



NGINX可以根据请求URI向不同的代理发送流量或提供不同的文件。





## Nginx反向代理

当NGINX代理请求时，它将请求发送到指定的代理服务器，获取响应，并将其发送回客户端。可以使用指定的协议将请求代理到HTTP服务器或非HTTP服务器

要将请求传递给HTTP代理服务器，则在一个[location](http://nginx.org/en/docs/http/ngx_http_core_module.html?&_ga=1.107628738.1509956953.1490042234#location)块内指定[proxy_pass](http://nginx.org/en/docs/http/ngx_http_proxy_module.html?&_ga=1.107628738.1509956953.1490042234#proxy_pass)指令。 例如：

```
location /some/path/ {
    proxy_pass http://www.example.com/link/;  # 
}
```



此示例配置将在此`location`处理的所有请求传递到指定地址(`http://www.example.com/link/`)处的代理服务器。该地址可以指定为域名或IP地址。 该地址还可能包括一个端口：

```
location ~ \.php {
    proxy_pass http://127.0.0.1:8000;
}
```

请注意，在上述 **第一个**示例中，代理服务器的地址后面是URI为 `/link/`。 如果URI与地址一起指定，它将**替换**与`location`参数匹配请求URI的部分。 例如，这里使用`/some/path/page.html`的URI请求将被代理到`http://www.example.com/link/page.html`。 如果地址被指定为没有URI，或者不可能确定要替换的URI部分，则会传递完整的请求URI(可能是修改)。



`proxy_pass`指令也可以指向一组命名的服务器。 在这种情况下，根据指定的方法在组中的服务器之间分配请求。





一个使用场景： [搭建nginx反向代理用做内网域名转发 – 运维生存时间](http://www.ttlsa.com/nginx/use-nginx-proxy/ "搭建nginx反向代理用做内网域名转发 – 运维生存时间")



[Nginx代理被墙域名 - firefoxbug](http://www.firefoxbug.com/index.php/archives/2042/ "Nginx代理被墙域名 - firefoxbug")



> 在做品优购项目时：可以通过 user.pinyougou.com 访问服务器，但是登录之后显示的地址还是原服务器的地址（loaclhost:8086）





