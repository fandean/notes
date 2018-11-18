# Jackson







使用 Jackson 解析 json： 

- Jackson Databind：该项目包含 [Jackson Data Processor](https://github.com/FasterXML/jackson) （数据处理器）的通用数据绑定功能和树模型；它**建立在**Streaming API（流解析器/生成器）包之上，**并**使用 Jackson Annotations 进行配置。 见： [FasterXML/jackson-databind](https://github.com/FasterXML/jackson-databind "FasterXML/jackson-databind: General data-binding package for Jackson (2.x): works on streaming API (core) implementation(s)")：General data-binding package for Jackson (2.x): works on streaming API (core) implementation(s) 
- Jackson Core：该项目包含 [Jackson Data Processor](https://github.com/FasterXML/jackson) （数据处理器）使用的 core low-level incremental ("streaming")  （核心低级增量（“流”））解析器和生成器抽象。它还包括处理JSON格式的处理程序类型（解析器，生成器）的默认实现。核心抽象不是特定于JSON的，尽管由于历史原因，命名确实在许多地方包含“JSON”。只有特定包含单词'json'的包才是特定于JSON的。 这个包是Jackson Databind包的构建基础 。见：[FasterXML/jackson-core:](https://github.com/FasterXML/jackson-core "FasterXML/jackson-core: Core part of Jackson that defines Streaming API as well as basic shared abstractions") Core part of Jackson that defines Streaming API as well as basic shared abstractions 
- Jackson Annotations：见：[FasterXML/jackson-annotations](https://github.com/FasterXML/jackson-annotations "FasterXML/jackson-annotations: Core annotations (annotations that only depend on jackson-core) for Jackson data processor") ：Core annotations (annotations that only depend on jackson-core) for Jackson data processor。The only annotations not included are ones that require dependency to the [Databind package](https://github.com/FasterXML/jackson-databind). 

> 这里关键是这三个包各自的作用，见： [FasterXML/jackson-databind](https://github.com/FasterXML/jackson-databind "FasterXML/jackson-databind: General data-binding package for Jackson (2.x): works on streaming API (core) implementation(s)")
>
> jackson databind：该项目包含Jackson数据处理器的通用数据绑定功能和树模型；它建立在Streaming API（流解析器/生成器）包之上，并使用 Jackson Annotations 进行配置。 







三种方式处理JSON：

(1)流式API

读取并将JSON内容写入作为离散事件。 JsonParser读取数据，而JsonGenerator写入数据。它是三者中最有效的方法，是最低的开销和最快的读/写操作。它类似于Stax解析器XML。

(2)树模型

准备JSON文件在内存里以树形式表示。 ObjectMapper构建JsonNode节点树。这是最灵活的方法。它类似于XML的DOM解析器。

(3)数据绑定

转换JSON并从POJO（普通Java对象）使用属性访问或使用注释。它有两个类型:

- 简单的数据绑定：转换JSON和Java Maps, Lists, Strings, Numbers, Booleans 和null 对象。
- 全部数据绑定：转换为JSON从任何JAVA类型。

ObjectMapper读/写JSON两种类型的数据绑定。数据绑定是最方便的方式是类似XML的JAXB解析器。



## 示例 



### 序列化示例

```java
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import com.fasterxml.jackson.databind.ObjectMapper;

public class JacksonDemo {
    public static void main(String[] args) throws ParseException, IOException {
        User user = new User();
        user.setName("zhangsan");
        user.setEmail("zhangsan@163.com");
        user.setAge(20);

        SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
        user.setBirthday(dateformat.parse("1996-10-01"));

        /**
         * ObjectMapper是JSON操作的核心，Jackson的所有JSON操作都是在ObjectMapper中实现。
         * ObjectMapper有多个JSON序列化的方法，可以把JSON字符串保存File、OutputStream等不同的介质中。
         * writeValue(File arg0, Object arg1)把arg1转成json序列，并保存到arg0文件中。
         * writeValue(OutputStream arg0, Object arg1)把arg1转成json序列，并保存到arg0输出流中。
         * writeValueAsBytes(Object arg0)把arg0转成json序列，并把结果输出成字节数组。
         * writeValueAsString(Object arg0)把arg0转成json序列，并把结果输出成字符串。
         */
        ObjectMapper mapper = new ObjectMapper();

        //User类转JSON
        //输出结果：{"name":"zhangsan","age":20,"birthday":844099200000,"email":"zhangsan@163.com"}
        String json = mapper.writeValueAsString(user);
        System.out.println(json);

        //Java集合转JSON
        //输出结果：[{"name":"zhangsan","age":20,"birthday":844099200000,"email":"zhangsan@163.com"}]
        List<User> users = new ArrayList<User>();
        users.add(user);
        String jsonlist = mapper.writeValueAsString(users);
        System.out.println(jsonlist);
    }
}
```





### 反序列化示例



反序列化为单个java对象：

```java
public class JacksonDemo {
    public static void main(String[] args) throws ParseException, IOException {
        String json = "{\"name\":\"zhangsan\",\"age\":20,\"birthday\":844099200000,\"email\":\"zhangsan@163.com\"}";
        /**
         * ObjectMapper支持从byte[]、File、InputStream、字符串等数据的JSON反序列化。
         */
        ObjectMapper mapper = new ObjectMapper();
        User user = mapper.readValue(json, User.class);
        System.out.println(user);
    }
}
```



反序列化为List集合：

```java
public class JacksonDemo {

    public static ObjectMapper mapper = new ObjectMapper();

    public static void main(String[] args) throws ParseException, IOException {
        //json数组
        String json = "[{\"name\":\"zhangsan\",\"age\":20,\"birthday\":844099200000,\"email\":\"zhangsan@163.com\"}]";
        List<User> beanList = mapper.readValue(json, new TypeReference<List<User>>() {});
        System.out.println(beanList);
    }

}
```





> `TypeReference<T>`的作用：
>
> 除了使用Java类进行映射之外，我们还可以直接使用Map和List等Java集合组织JSON数据，在需要的时候可以使用readTree方法直接读取JSON中的某个属性值。需要注意的是从JSON转换为Map对象的时候，**由于Java的类型擦除**，所以类型需要我们手动用`new TypeReference<T>`给出 











## Jackson配置







参考：

- [Java下利用Jackson进行JSON解析和序列化 - winner_0715 - 博客园](https://www.cnblogs.com/winner-0715/p/6109225.html "Java下利用Jackson进行JSON解析和序列化 - winner_0715 - 博客园")
- [Jackson快速入门 - CSDN博客](https://blog.csdn.net/u011054333/article/details/80504154 "Jackson快速入门 - CSDN博客")
- [Json --- Jackson工具 - CSDN博客](https://blog.csdn.net/Ka_Ka314/article/details/79005027 "Json --- Jackson工具 - CSDN博客")