





重点：

```
     * BeanFactory 才是 Spring 容器中的顶层接口。
     * ApplicationContext 是它的子接口。
     * BeanFactory 和 ApplicationContext 的区别：
     * 创建对象的时间点不一样。
     * ApplicationContext：只要一读取配置文件，默认情况下就会创建 所有对象 。（立即加载）
     * BeanFactory：什么时候使，用什么时候创建对象。（延迟加载）
     *
     * Spring 创建这个类的时候，默认采用的单例的模式进行创建的。如果想去改变单例模式，需
     * 要通过 scope 进行配置。
```

Spring 创建这个类的时候，默认采用的单例的模式进行创建的？





```java
public class Client {

    // 模拟Action

//    /**
//     * 测试由ApplicationContext对象获取spring容器中创建的对象
//     * @param args
//     */
//    public static void main(String[] args) {
//        // 代码之间存在依赖关系（耦合）
//        // AccountService accountService = new AccountServiceImpl();
//        // 由spring创建对象（完成对象的解耦）
//        ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
//        // 通过名称调用（通过spring容器中的id属性）(推荐）
//        AccountService accountService = (AccountService) ac.getBean("accountService");
//        // 通过类型调用（通过spring容器中的class属性）
//        // AccountService accountService = ac.getBean(AccountServiceImpl.class);
//        accountService.saveAccount();
//    }

    /**
     * 测试BeanFactory和ApplicationContext之间的区别
     *
     * ApplicationContext：只要一读取配置文件，默认情况下就会创建对象。（立即加载）
       BeanFactory：什么时候使，用什么时候创建对象。（延迟加载）
     * @param args
     */
//    public static void main(String[] args) {
//        // 使用ApplicationContext创建对象默认是单例（只要加载spring容器，对象会立即创建，叫做立即检索）
//        // ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
//        // 使用BeanFactory创建对象默认是单例（当加载spring容器的时候，不会执行构造方法，对象不会立即创建，只要调用getBean的方法，对象才会创建，叫做延迟检索）
//        BeanFactory ac = new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
//        AccountService accountService = (AccountService) ac.getBean("accountService");
//        System.out.println(accountService);
//
//        AccountService accountService1 = (AccountService) ac.getBean("accountService");
//        System.out.println(accountService1);
//    }

    /**
     * 【ApplicationContext 接口的实现类 】
     （1）ClassPathXmlApplicationContext：
     它是从类的根路径下加载配置文件 推荐使用这种
     （2）FileSystemXmlApplicationContext：
     它是从磁盘路径上加载配置文件，配置文件可以在磁盘的任意位置。注意磁盘的权限
     （3）AnnotationConfigApplicationContext:
     当我们使用注解配置容器对象时，需要使用此类来创建spring 容器。它用来读取注解。
     */
//    public static void main(String[] args) {
//        // 测试ClassPathXmlApplicationContext
//        // ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
//        // 测试FileSystemXmlApplicationContext
//        ApplicationContext ac =  new FileSystemXmlApplicationContext("d:/applicationContext.xml");
//        AccountService accountService = (AccountService) ac.getBean("accountService");
//        System.out.println(accountService);
//
//        AccountService accountService1 = (AccountService) ac.getBean("accountService");
//        System.out.println(accountService1);
//    }

    /**
     * id中不能出现特殊字符，name中可以出现特殊的字符。
     可以指定多个name，之间可以用分号（“；”）、空格（“ ”）或逗号（“，”）分隔开，如果没有指定id，那么第一个name为标识符，其余的为别名； 若指定了id属性，则id为标识符，所有的name均为别名。如：
     <bean name="alias1 alias2;alias3,alias4" id="hello1" class="com.zyh.spring3.hello.HelloWorld"> </bean>  
     此时，hello1为标识符，而alias1，alias2，alias3，alias4为别名，它们都可以作为Bean的键值；
     */
    public static void main(String[] args) {
        // 测试ClassPathXmlApplicationContext
        ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        AccountService accountService = (AccountService) ac.getBean("accountService");
        System.out.println(accountService);
        accountService.saveAccount();


    }
}

```







## 注解配置



## 替换xml中的 bean 标签

用于创建对象的；他们的作用就和在 XML 配置文件中编写一个`<bean>`标签实现的功能是一样的 。



### 控制反转





注解：

用于class上

`@Component`： 用于把当前类对象存入spring容器中。



`@Component`的衍生类：作用相同

- `@Controller` ：用来修饰web层的类
- `@Service` ： 用来修饰 service层的类
- `@Repository` ： 用来修饰 dao 层的类



那么对于简单的JavaBean如何存入Spring容器？





### 依赖注入

用于class内部



`@Autowired` ：自动按类型注入。有条件。位置 变量上，或set方法上。



`@Qualifier` 需要与 `@Autowired`  一起使用



`@Resource` ：相当于同时使用  `@Autowired` 和 `@Qualifier`  

使用 jdk 10 时可能有问题

`@Resource`是基于



`@Value` ： 用于注入**基本类型**和String类型的字段。可以使用 SpEL表达式。还可以

引入属性文件中的值，方法是：

- 创建一个属性文件 application.properties

  ```properties
  accessKeyId=LTAImgqgo
  accessKeySecret=Xxgs4Asg4gqgogqgo
  ```

- 在spring.xml配置文件中指定属性文件

  ```xml
  	<context:property-placeholder location="classpath:config/application.properties" />
  ```

- 在java代码中使用

  ```java
      @Value("${accessKeyId}")
      private String accessKeyId ;
      @Value("${accessKeySecret}")
      private String accessKeySecret;
  ```




### 作用域



`@Scope` 





### 初始化和销毁



`@PostConstruct`



`@PreDestroy`





## JavaConfig替换整个xml



那么 `@Bean` 和 `@Component` 的区别

- `@Bean` 用于把当前方法的返回值作为 bean 对象存入 spring 的 ioc 容器中 。要在JavaConfig中声明一个简单的 bean ，我们需要编写一个方法，这个方法会创建所需 类型的实例，然后给这个方法添加 注解。  

- `@Component` 用于把当前类对象存入 spring 容器中 。





`.*.`





## AOP







代理机制。 

2 个：spring 的 aop 的底层原理 

1：JDK 代理（要求目标对象面向接口）（spring 默认的代理方式是 JDK 代理） 

2：CGLIB 代理（面向接口、面向类）  





在 spring 中，框架会根据目标类是否实现了接口来决定采用哪种动态代理的方式。 

- 如果对接口，默认使用 JDK 代理。 
- 如果对类，采用 CGLIB 代理。  







