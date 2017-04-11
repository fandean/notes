# EL表达式语言-《TaJWdt》

标签（空格分隔）： JavaEE

---

> 《Tomcat与Java Web开发技术详解(第2版)》.(孙卫琴).pdf
《Tomcat and Java Web development technology》本书翻译的英文名，将本书简称为 -《TaJWdt》


EL（Expression Language）表达式语言是在JSP 2.0版本中引入的新特性，它用于JSP文件中的数据访问。这种表达式语言能简化JSP文件中数据访问的代码，可用来代替传统的基于`<%=`和`%>`形式的Java表达式，以及部分基于`<%`和`%>`形式的Java程序片段。


## 基本语法
EL表达式并不是一种通用的编程语言，它仅仅是一种数据访问语言。

EL表达式的基本形式为：`${var}`，如果在JSP文件的模板文本(HTML)中使用EL表达式，那么表达式的值会输出到网页上。

EL表达式和Java表达式一样，既可以直接插入到JSP文件的模板文本中，也可以作为JSP标签的属性的值。例如：
```
<jsp:useBean id="myPageBean" scope="page" class="mypack.CounterBean" />

<%-- 把myPageBean的count属性的值加 1 --%>
<jsp:setProperty name="myPageBean" property="count" value="${myPageBean.count+1}" />

<%-- 打印myPageBean的count属性 --%>
Current count value is : ${myPageBean.count}
```


### 访问对象的属性及数组的元素
EL表达式语言可以使用点号运算符`.`来访问对象的属性。也可使用方括号运算符`[]`来访问对象的属性(包含特殊字符时必须使用`[]`)。
例如：`${customer["name"]}`和`${customer.name}`是等价的。

方括号还可用来访问数组中的元素，例如`${customers[0]}`表示访问customers数组中的第一个元素。


### EL运算符
EL语言支持算术运算符、关系运算符和逻辑运算符等。


|运算符类型| 范例 | 结果 |
|-------|-------| -------|
|算术运算符| `${16+5}` | 21  |
|关系运算符|`${16==5}`|false|
|逻辑运算符|`${16>5 && 16<18}`|true|
|empty运算符|`${empty var}`|如果变量var为null，就返回true|
|empty运算符|`${! empty var}`|如果变量var不为null，就返回true|
|条件运算符|`${16>5?16:5}`|16|


### 隐含对象
EL语言定义了11个隐含对象，它们**都是** **`java.util.Map`** 类型，网页制作者可以通过它们来便捷的访问Web应用中的特定数据。

可以分为以下4种：

- 表示HTTP请求中的特定数据，包括header、headerValues、param、paramValues和cookie
- 表示特定范围，包括pageScope、requestScope、sessionScope、applicationScope。表示把某范围内的属性名和属性值进行**映射**。
- 表示PageContext对象，为pageContext
- 表示Web应用的初始化参数集合，为 initParam

具体映射方式见书。

> 对于`${header["user-agent"]}`，由于在"user-agent"中包含特殊字符"-"所以此时必须采用"[]"运算符来访问它，而不能使用"."运算符。

注意EL表达式中无法直接访问JSP文件中的隐含对象。例如无法使用`${request.requestURL}`，正确的表达式应为`${pageContext.request.requestURL}`。


### 命名变量
EL表达式中的变量称为命名变量，比如`${username}`，它不是JSP文件中的局部变量或实例变量，而是存放在特定范围内的属性，命名变量的名字和属性名对应。

未完。。。

只有看书中示例才可以理解



## 定义和使用EL函数





