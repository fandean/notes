# Hugo Templating



 Hugo 使用 Go语言的`html/template` 和`text/template` 库作为其模板基础。

> [Introduction to Hugo Templating | Hugo](https://gohugo.io/templates/introduction/)



## 基本语法

 Go模板是带有变量和函数的HTML文件 ， Go模板的变量和函数可在`{{ }}`中访问。 

菜单

 访问预定义变量 

```html
<!-- 预定义的变量 -->
{{ .Title }}
<!-- 自定义的变量 -->
{{ $address }}
```

函数的参数使用空格分隔。通用语法为：

```go
{{ FUNCTION ARG1 ARG2 .. }}
```

使用add函数来计算 1+2
```go
{{ add 1 2 }}
```

方法和字段可以通过`.`来进行访问。

示例访问 Page 字段 bar，它定义在文章的 front matter中 

```go
{{ .Params.bar }}
```

可用 小括号将项目分组在一起 

```go
{{ if or (isset .Params "alt") (isset .Params "caption") }} Caption {{ end }}
```



## 变量

 每个Go模板都会获取一个数据对象 ， 在Hugo中，每个模板都会传递一个`Page`。 在下面的示例中 `.Title`是 `Page`变量中可以访问的的元素之一。



