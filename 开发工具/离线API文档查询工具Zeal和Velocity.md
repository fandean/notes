# 离线API查询工具 Zeal 和 Velocity



[Zeal与velocity: Windows与Linux下与Mac中Dash类似的API离线查询工具 - CSDN博客](https://blog.csdn.net/sy373466062/article/details/49903469 "Zeal与velocity: Windows与Linux下与Mac中Dash类似的API离线查询工具 - CSDN博客")





## Zeal

[Zeal - Offline Documentation Browser](https://zealdocs.org/ "Zeal - Offline Documentation Browser")

跨平台。



通过 Scoop 安装： 

[Scoop](http://scoop.sh/) is a command-line installer for Windows.

First you need to enable Scoop's [extras](https://github.com/lukesampson/scoop-extras/) bucket, if that wasn't done before:

```
> scoop bucket add extras
```

To install Zeal run the following command:

```
> scoop install zeal
```







## Velocity

查询效果可能更好，但是免费版可能体验不好。

 (**provided by Dash for OS X**).[https://velocity.silverlakesoftware.com](https://velocity.silverlakesoftware.com/)



## 与其它IDE或Editor集成使用



### Dash

安装名叫 Dash 的 插件：

A smart and simple plugin that provides keyboard shortcut access for Dash, **Velocity** or **Zeal** in IntelliJ IDEA, RubyMine, WebStorm, PhpStorm, PyCharm, DataGrip, CLion, GoLand and Android Studio.



 **Supported API Documentation Browsers**

- Kapeli Dash (Mac OS X)  
Dash is an API Documentation Browser and Code Snippet Manager. Dash stores snippets of code and instantly searches offline documentation sets for 150+ APIs (for a full list, see below). You can even generate your own docsets or request docsets to be included. <http://kapeli.com/dash>

- Velocity (Windows)    
Velocity gives your Windows desktop offline access to over 150 API documentation sets (**provided by Dash for OS X**).[https://velocity.silverlakesoftware.com](https://velocity.silverlakesoftware.com/)

- Zeal (Linux & Windows)    
Zeal is a simple offline API documentation browser inspired by Dash (OS X app). [http://zealdocs.org](http://zealdocs.org/)



**可能存在的错误：**

On Windows, when using Zeal the IDE shows Failed to open dash-plugin://... in the Event Log

It looks like the URL handler has not been registered for Zeal. Please run `zeal.exe --register`.