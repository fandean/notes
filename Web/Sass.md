## Sass简介

Sass 是 CSS预处理器。目前比较流行的CSS预处理器还有Less。

[Sass: Syntactically Awesome Style Sheets](http://sass-lang.com/ "Sass: Syntactically Awesome Style Sheets")



CSS并不能算是一门真正意义上的编程语言，无法完成嵌套、继承、设置变量等工作。为解决CSS的不足，开发者想到了编写一种对CSS进行预处理的"中间语言"。



**为什么使用Sass？**

- 可以使用变量
- 自动转换RGBA颜色值
- 忘记浏览器前缀
- 嵌套规则
- media query更简单
- 自动压缩CSS



## Sass与Compass

最初sass是为了配合haml而设计，所以和haml有着一样的**缩进式风格**；其文件后缀为 `.sass`。

```sass
body
	background:black
```



但是从第三代开始，保留缩进式风格，并同时向下兼容普通的css代码；其文件后缀名为 `.scss`。

```scss
/* 可以兼容css语法 */
body{
  background:black
}
```



Compass是Sass的工具库，它在Sass的基础上封装了一系列有用的模块和模板，补充Sass的功能。Compass与Sass的关系类似于jQuery与JS的关系。





安装Sass和Compass

1. 先安装ruby：参考 [Ubuntu安装ruby到opt下的rbenv目录](https://fandean.github.io/blog/2017/07/23/Ubuntu%E5%AE%89%E8%A3%85ruby%E5%88%B0opt%E4%B8%8B%E7%9A%84rbenv%E7%9B%AE%E5%BD%95/) 
2. 再直接使用命令`gem install compass`安装compass；这里在安装compass的同时会自动安装上sass。
3. 运行命令检查是否安装成功：`sass -v`，`compass -v`查看版本








## 学习资料

[前端开发_Sass/Less入门基础到高级教程_慕课网](http://www.imooc.com/course/list?c=sassless "前端开发_Sass/Less入门基础到高级教程_慕课网")

