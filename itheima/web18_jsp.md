# jsp



web文件夹中的变动，只需让 tomcat 进行 update resources即可，那么 jsp 也是位于web目录，所以...



使用idea生成的webapp路径：

`C:\Users\Fan\.IntelliJIdea2018.1\system\tomca\**\work\**`

如果不清除是哪个文件夹，我们可以将tomcat* 相关文件夹删除，然后再通过idea重新生成。



对应servlet的成员变量和方法：

```html
<%!  %>
```



现在只在JSP显示，不涉及任何逻辑业务，基本上只在jsp中使用 EL和 jstl

在教学和演示过程中为了方便，我们才会使用 `<%  %>`，



- `<%=Java 表达式 %>` 把 Java 表达式的结果输出显示到页面上。会被转换成 service 方法里 `out.print(Java 表达式);`
-  `<% Java 代码块 %>` 把代码块的内容原封不动的拷贝到 service 方法里。（service方法是做什么的？与doGet()，doPost()的关系是？）
-  `<%! Java 声明 %>` Java 声明的代码，会被原封不动的拷贝成为 Servlet 的成员内容。    





spring不属于任何一层，他是一个粘合剂，在每层都有用，其作用是解耦。





## EL表达式

如果只是使用EL表达式，不需要引用任何jar包。只要jsp/servlet容器实现了相关规范就可以了。 









## JSTL



相关jar包：

1. [Apache Standard Taglib: JSP(tm) Standard Tag Library (JSTL) implementations](http://tomcat.apache.org/taglibs/standard/ ) Taglib是什么？
2. [Maven Repository: javax.servlet.jsp.jstl » jstl » 1.2](https://mvnrepository.com/artifact/javax.servlet.jsp.jstl/jstl/1.2 "Maven Repository: javax.servlet.jsp.jstl " jstl " 1.2")  那这个包又是干什么的？



jar包解释：

后者(2) 是 jstl-api， 前者(1)是 jstl 的实现。

实现主要有两个版本：

- 一个是 glassfish 的jstl-impl 
- 另一个是 apache 的 taglibs-standard-impl  

[正确配置Jstl的Maven依赖 - CSDN博客](https://blog.csdn.net/yq2017/article/details/78886280 "正确配置Jstl的Maven依赖 - CSDN博客")





taglib实现：

[https://www.apache.org/dist/tomcat/taglibs/taglibs-standard-1.2.5/README_bin.txt](https://www.apache.org/dist/tomcat/taglibs/taglibs-standard-1.2.5/README_bin.txt "https://www.apache.org/dist/tomcat/taglibs/taglibs-standard-1.2.5/README_bin.txt")



```
  CORE LIBRARY
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
```









修改功能的实现：

数据来源需要从数据库查询获取最新数据，避免使用内存中的数据，多人访问时数据可能已经改变。





首次进入：

参数为null

获取第一页，并计算总共有多少页码 totalPage





点击索引，获取对应页面的数据





