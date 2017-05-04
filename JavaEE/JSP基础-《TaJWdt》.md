# JSP基础-《TaJWdt》

标签（空格分隔）： JavaEE

---

> 《Tomcat与Java Web开发技术详解(第2版)》.(孙卫琴).pdf
《Tomcat and Java Web development technology》本书翻译的英文名，将本书简称为 TaJWdt

当Servlet容器接收到客户端的要求访问特定JSP文件时，容器按照以下流程来处理客户请求：

1. 查找与JSP文件对应的Servlet，如果已经存在，就调用它的服务方法。
2. 如果与JSP文件对应的Servlet还不存在，就解析文件系统中的JSP文件，把它翻译成Servlet源文件，直接把Servlet源文件编译成Servlet类，然后再初始化并运行Servlet。

> Tomcat把由JSP生成的Servlet源文件和类文件放在work目录下。JSP文件如有改动，一般会自动重新编译JSP；也可以手动删除work目录下的相关Servlet文件来确保重新编译。（该目录是工作目录，用于存放临时文件等...）


JSP本质就是Servlet，因此JSP可以访问Servlet API中的接口和类，此外JSP还可以访问JSP API中的接口和类。
```
javax.servlet.Servlet        <<Interface>>
    ^
    |
javax.servlet.jsp.JspPage    <<Interface>>
    ^
    |
javax.servlet.jsp.HttpJspPage  <<Interface>>
    ^
    :
org.apache.jasper.runtime.HttpJspBase   (由Apache提供)
```



JSP中的HTML文本称为**模板文本**（template text),它会被原封不动的发送到客户端。一般通过如下方法输出模板文本：
```java
out.write("<html>\r\n");
...
out.write("</html>\r\n");
```

## JSP语法
通过**page指令**来引入Java包：

    <%@ page import="java.io.*,java.util.Hashtable" %>
    

| 功能 |Servlet  | JSP |
|---------- |--------- |-------------- |
|引入Java包 | `import java.io.*;`| `<%@ page import="java.io.*,java.util.Hashtable" %>`|
|设置响应正文格式 | response.setContentType("text/html");|`<%@ page contentType="text/html; charset=utf-8" %>` |
||||


### JSP指令(Directive)

JSP指令用来设置和整个JSP网页相关的属性，如页面的编码方式和脚本语言等；JSP指令的一般语法形式为：
```
<%@ 指令名 属性1="值1" 属性2="值2" %>
```

常用的3种指令为 page、include 和 taglib

#### Page指令

|page指令的属性 | 描述 | 举例 |
|------- |-------- |---------- |
|language | 目前仅java为有效和默认值 | |
|method | 指定Java程序片段(Scriptlet)所属的方法的名称，Java程序片段会成为指定方法的主体，默认方法是service()方法。有效值包括:service、doGet 和 doPost等| `<%@ page method="doPost"`|
|import | 指定导入的Java软件包名或类名列表，该列表用逗号分隔。(可多次导入)||
|content_type|指定响应结果的MIME类型，默认为text/html,默认字符编码为ISO-8859-1||
|session="true\|false" | 指定JSP是否使用Session，默认为true ||
|errorPage="error_url"|当发送异常时，客户请求被转发到哪个网页||
|isErrorPage="true\|false"|表示此JSP页是否为处理异常的网页||


#### include指令
JSP可以通过include指令来包含其他文件的内容，被包含的文件可以是JSP文件、HTML文件。语法形式：
```
<%@ include file="目标组件的绝对URL或相对URL" %>
```

比如在每个网页上都有相同的logo，因此可以把生成logo的代码放在一个JSP文件中，其他JSP就可通过include指令在相应的位置把它包含进来。比如该JSP内容如下：
```
<body>
<img src="logo.bmp">
<hr>
```

用include指令来包含其他文件被看做为静态包含，另还有动态包含。


### JSP声明
JSP声明用于声明与JSP对应的Servlet类的**成员变量**和**方法**，语法如下：
```
<%! declaration; [declaration;] %>
```

示例：
```
//声明对应Servlet的成员变量
<%! int v1=0; String v2="hello"; %>
//声明对应Servlet的方法
<%! 
public String amethod(int i){
    return i<3?"i<3":"i>=3";
}
```


### Java程序片段(Scriptlet)
在JSP文件中，可以在`<%`和`%>`标记之间直接嵌入任何有效的Java程序代码，这种嵌入的程序片段称为Scriptlet。如果在page指令中没有指定**method属性**，那么这些程序片段默认会与JSP **对应**的Servlet类的**service()方法中**的代码块。

示例：
```
<% 
    String gender="female"; //局部变量
    if(gender.equals("female")){
%>

She is a girl.      <%-- 模板文本 --%>

<% }else{ %>

He is a boy.         <%-- 模板文本 --%>

<% } %>
```

以上JSP代码等价于以下Servlet的service()方法：
```
public void service(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
    PrintWriter out = response.getWriter();
    String gender = "female";  //局部变量
    if(gender.equals("female")){
        out.print("She if a girl.");
    }else{
        out.print("He is a boy.");
    }
}
```

`<%--` 和 `--%>`为JSP的注释标记。

> 在JSP声明中定义的变量，为**实例变量**。
在程序片段中定义的变量，为**局部变量**。


### Java表达式
Java表达式的标记为`<%=` 和 `%>`。如果在JSP文件的模板文本中使用该标记，那么它能把表达式的值输出到网页上。表达式中的int或float类型的值都自动转换成字符串再进行输出。

```
You hit the page:
<%! int hitcount=1; %>
<%
    int count = 0;
    hitcount = count++;  <%-- 把hitcount变为 0 --%>
%>
<%= hitcount++ %>   <%-- hitcount始终为 0 --%>
times
```

### 隐含对象
Servlet可以访问由Servlet容器提供的ServletContext、ServletRequest 和 ServletResponse等对象。
而对于在JSP的**程序片段**中，这些对象称为隐含对象，每个对象都被固定的引用变量引用。

> 切记它们是局部变量

|隐含对象的引用变量 | 隐含对象的类型 |
|--------- |------------------ |
|request | javax.servlet.HttpServletRequest|
|response | javax.servlet.HttpServletResponse|
|pageContext | javax.servlet.jsp.PageContext|
|application | javax.servlet.ServletContext|
|out | javax.servlet.jsp.JspWriter|
|config | javax.servlet.ServletConfig|
|page | java.lang.Object (相当于Java中的this关键字)|
|session | javax.servlet.http.HttpSession |
|exception | java.lang.Exception |


## JSP的生命周期

- 解析：解析JSP语法
- 翻译：JSP文件 --> Servlet源文件
- 编译：Servlet源文件 --> Servlet类。以上三个阶段为JSP独有；仅发生在下例情况：
- - 首次被请求
- - 文件被更新
- - 类文件被删除
- 初始化：
- 运行：
- 销毁：

开发人员在编写JSP文件时，可以实现jspInit()和jspDestroy()方法，与JSP对应的Servlet类的_jspService()方法则由Servlet容器根据JSP源文件自动生成。

在jspInit()方法中要想获取隐含变量application(为_jspService()方法中的局部变量)可以变相通过getServletConfig().getServletContext()获得。


## 请求转发
JSP采用`<jsp:forward>`标签来实现请求转发，转发的目标可以是HTML、JSP、Servlet。
```
<jsp:forward page="目标组件的绝对/相对URL" />
```

JSP源组件和目标组件共享HttpServletRequest对象和HttpServletResponse对象，JSP源组件中的所有输出数据都不会被发送到客户端。

> 绝对路径：以 / 开头；相对路径：不以 / 开头。

**注意：**
Servlet源组件调用response.sendRedirect(String location)方法进行请求转发之后的代码也**会被执行**。
而JSP源组件中`<jsp:forward>`标签之后的代码**不会被执行**。

示例：源组件source.jsp，在与其对应的Servlet源文件source_jsp.java中，与`<jsp:forward>`标签对应的程序代码为：
```
if(true){
    _jspx_page_context.forward("target.jsp"); //请求转发
    return; //退出程序；所以后面的代码不会被执行
}
```

> 标签实际上也属于标记。本书把JSP中以`<%`开头的标记称为JSP标记，而把`<jsp:forward>`等称为JSP标签。把`<%!` `<%` `<%=`这3种以`<%`开头的JSP标记也称为JSP脚本元素，以`jsp`作为前缀的标签称为JSP动作元素。


转发源组件还可以通过`<jsp:param>`标签来向转发目标组件传递**额外的请求参数**。
```
<jsp:forward page="target.jsp">
    <jsp:param name="username" value="Tom" />
    <jsp:param name="password" value="123456" />
</jsp:forward>
```

> `<jsp:param>`标签还可内嵌在`<jsp:include>`标签中


## 包含
include指令用于**静态**包含：
```
<%@ include file="被包含组件的绝对/相对URL" %>
```

include标签用于**动态**包含：
```
<jsp:include page="被包含组件的绝对/相对URL" />
```

### 静态包含
静态包含发生在解析JSP源组件阶段，被包含的目标文件中的内容被原封不动的添加到JSP源组件中，Servlet容器然后再对JSP源组件进行翻译和编译；(HTML、JSP但不可为Servlet)。如果目标组件为JSP文件，那么该JSP文件可以访问在源组件中定义的局部变量，因为实际上，JSP源组件和JSP目标组件对应同一个Servlet。

> 一般习惯：被静态包含的JSP和HTML文件分别使用`.jspf` `.htmlf`后缀。


### 动态包含
对于动态包含，目标组件和源组件分别对应不同的Servlet，两个不同的servlet之间是无法访问对方的服务方法中的局部变量的。

整个过程：

示例（**目标组件为JSP**）：
JSP源组件中的 `<jsp:include page="content.jsp" />`被翻译为如下程序代码：
```
org.apache.jasper.runtime.JspFuntimeLibrary.include(request,response,"content.jsp",out,false);
```
客户端请求 --> Servlet容器调用 --> JSP源组件的service()方法 --> 调用上述include()方法时: Servlet容器执行该方法时，先解析目标组件content.jsp，如果没有语法错误，翻译成Servlet源文件，编译Servlet源文件，生成Servlet类，初始化该Servlet并调用它的service()方法。
Servlet容器执行完include()方法后，继续执行JSP源组件的service()方法中的后续代码。（如果目标组件有错，在实际请求时会出现）

动态包含发生在运行JSP源组件阶段；动态包含的目标组件可以为HTML文件、JSP文件或者为Servlet。
如果目标组件为JSP，Servlet容器会在运行JSP源组件的过程中，运行与JSP目标组件对应的Servlet的服务方法。JSP目标组件生成的响应结果被包含到JSP源组件的响应结果中。

`<jsp:include>`标签还有个flush属性。如果flush属性为true，就表示源组件在包含目标组件之前，先把已经生成的响应正文提交给客户。该属性默认为false。（示例见书）

> 静态包含和动态包含在的应用场景与示例分析，见书


> 书中的一个示例：
`<jsp:include page="<%=bodyfile %>">`，page由变量bodyfile指定（不能再静态包含中这样使用）。

## JSP异常处理
在发生异常的场合，可以通过下面的指令将请求转发给另一个专门处理异常的网页：
通过page指令的 errorPage和isErrorPage。

在处理异常的网页（isErrorPage）中可以直接访问exception隐含对象，获取到当前异常的详细信息；如：
```
<p>
    错误原因为：<% exception.printStackTreace(new PrintWriter(out)); %>
</p>
```


## 再谈发布JSP
直接将jsp文件放入Web应用的相关目录即可。也可以像Servlet一样在web.xml文件中进行配置，为jsp映射URL。（不同之处是：在servlet标签下使用jsp-file代替servlet-class）


## 预编译JSP
加快响应时间。


## PageContext抽象类
在JSP文件中使用PageContext类的场合：

- JSP文件中的Java程序片段
- JSP文件中的自定义标签的处理类

PageContext类中的方法可以分为以下几种：

- 用于向各范围内存取属性的方法。
- 用于获得由Servlet容器提供的其他对象的引用的方法。
- 用于请求转发和包含的方法。

### 用于向各范围内存取属性的方法
getAttribute(String name, int scope):返回参数scope指定范围内的特定属性的值。对应还有set...
findAttribute(String name):依次从页面范围、请求范围、会话范围和Web应用范围寻找参数name指定的属性；如果找到则返回其值。
int getAttributesScope(String name): 返回参数指定的属性所在的范围。

。。。

scope参数指定的范围，可选值为PageContext类的4个静态常量，其实际取值1~4

> pageContext对象是隐含对象。

### 用于获得由Servlet容器提供的其他对象的引用的方法
在自定义的JSP标签中：（JSP文件中已经有相应的隐含变量了）
可通过相关方法获得由Servlet容器提供的ServletContext、HttpSession、ServletRequest、ServletResponse、ServletConfig、JspWriter（用于输出响应正文）等对象

比如： getPage()：返回与当前JSP对应的Servlet实例


### 用于请求转发和包含的方法
在自定义的JSP标签中使用 forward()、include()方法进行请求转发和包含。



## JSP技术的发展趋势
当网页非常复杂时，JSP文件中的大量的HTML标记和Java程序片段混杂在一起，会大大削弱JSP代码的可读性和可维护性。

因此JSP的发展方向就是使JSP代码变得更加简洁和精炼。把JSP文件中的Java程序代码分离出去，最终使得在JSP文件中只有HTML标记和JSP标签。涉及到如下技术：

- JavaBean
- EL表达式语言
- 自定义JSP标签
- JSTL
- 采用MVC设计模式的框架


## JSP高级开发技术

- 第10章：JSP访问JavaBean
- 第12章：EL表达式语言
- 第13章：自定义JSP标签
- 第14章：采用模板设计网上书店应用
- 第15章：JSTL Core 标签库
- 第16章：JSTL I18N 标签库
- 第17章：JSTL SQL 标签库
- 第18章：JSTL Functions 标签库
- 第19章：简单标签和标签文件

