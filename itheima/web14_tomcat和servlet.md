## tomcat



16412-95A3-57F8-84E0-48A0





## servlet



servlet生命周期：





过滤器：

1.

2.拦截目录匹配的请求

```
urlPatterns  = "/*"
```

```
urlPatterns = "/admin/*"
```

3.扩展名匹配

```
urlPaterns = "*.jsp"
```

注意：不允许出现下面的格式：

```
urlPatterns = "/admin/*.jsp"
```





过滤器执行顺序



WEB-INF目录不允许在客户端进行访问，所以可以在该目录存放一些资源文件



classLoader获取流：



sevletContent 获取流：



