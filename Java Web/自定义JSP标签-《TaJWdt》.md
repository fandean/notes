# 自定义JSP标签-《TaJWdt》

标签（空格分隔）： JavaEE

---

> 《Tomcat与Java Web开发技术详解(第2版)》.(孙卫琴).pdf
《Tomcat and Java Web development technology》本书翻译的英文名，将本书简称为 -《TaJWdt》



## 自定义JSP标签简介

JSP标签包含以下几种形式：
```
<!-- 属性和主体都为空 -->
<mm:hello/>
```

```
<mm:message key="hello.hi" />
```

```
<mm:greeting> How are you. </mm:greeting>
```

```
<!-- 包含属性和主体 -->
<mm:greeting username="Tom"> How are you. </mm:greeting>
```

```
<mm:greeting>   <!-- 嵌套 -->
    <mm:user name="Tom" age="18" />
</mm:greeting>
```


开发包含**自定义标签**的标签库包括以下**步骤**：

1. 创建自定义标签的处理类（Tag Handler Class）
2. 创建TLD标签库描述文件（Tag Library Descriptor）


在Web应用中**使用标签库的步骤**：

1. 把标签处理类及相关类的.class文件存放在WEB-INF/classes目录
2. 把TLD标签描述文件存放在WEB-INF目录或其自定义子目录下
3. 在web.xml文件中声明所使用的标签库
4. 在JSP文件中使用标签库中的标签




## JSP Tag API
Servlet容器会调用自定义标签的处理类（Tag Handler Class）的相关方法。标签处理类可以继承JSP Tag API中的**TagSupport类**或者**BodyTagSupport类**。


![JavaWeb.png](https://ooo.0o0.ooo/2017/03/07/58be1c7f1445b.png"`图片删除链接https://sm.ms/api/delete/e9rxG4KJtRiWhaD`")


JSP 2.0之前，实现Tag接口的标签称为传统标签。JSP 2.0之后，实现SimpleTag接口称为简单标签。


### Tag接口
Tag接口定义了所有传统标签处理类都要实现的基本方法，包括以下几种：

- *setPageContext(PageContext pc)*：传递当前PageContext对象
- *setParent(Tag t)*：传递父标签的Tag对象
- getParent():
- *release()*:释放Tag对象占用的资源
- *doStartTag()*：当遇到开始标志时执行；并根据返回值决定后续流程
- *doEndTag()*:当遇到结束标志时执行；并根据返回值决定后续流程

> 斜体方法由servlet容器调用

标签处理类的对象（Tag对象）由Servlet容器负责创建。Servlet容器在执行JSP文件时，如果遇到JSP文件中的自定义标签，就会寻找缓存中的相关的Tag对象，如果还不存在，就创建一个Tag对象，把它放在缓存中以便重复使用。知道Web终止时，Servlet容器调用所有Tag对象的release()方法，然后销毁这些Tag对象。



当servlet容器得到Tag对象后按照如下顺序调用Tag对象的方法：

![ScreenHunter_02 Mar. 07 11.27.gif](https://ooo.0o0.ooo/2017/03/07/58be28ccad1a5.gif "删除链接:`https://sm.ms/api/delete/KnpgAJ5tFkPbEz6`")









