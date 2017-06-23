# Java基础


- 实例变量：声明在一个类中，但在方法和语句块之外声明
- 静态变量（类变量）：在类中以static修饰符声明，但必须在方法和语句块之外声明
- 局部变量：在类中某方法中声明


## 一些基础知识
在Java中，任何对象变量的值都是存储在另外一个地方的对象的引用。new操作符的返回值也是一个引用。



### 时间和日期



> 《Java核心技术卷 I》第4章 4.1.1中有关于这些介绍。

Date表示时间，Calendar表示日期？



表示时间点的Date，表示大家熟悉的日历表示法的GregorianCalendar类。其中GregorianCalendar类扩展了一个更加通用的Calendar类。

Date类只提供了少量的方法用来比较两个时间点。例如before和after方法。（其他方法不推荐使用）

两者之间的转换：  

GregorianCalendar -> Date           
```
Date time = calendar.getTime();
```
Date ->  GregorianCalendar
```
calendar.setTime(new Date());
```

获取当前日期和时间：  
```
GregorianCalendar d = nwe GregorianCalendar();
//更易使用的方法
GregorianCalendar.getInstance();
```







### import

import: 
import可以向某个Java文件中导入指定包层次下某个**类或全部类**。

import 语句中的星号(*)只能代表类，不能代表包。

示例：  
```
import lee.Apple;  //导入lee包下的单个Apple类
import lee.*;    //表明导入lee包下的所有类。而lee包下的sub子包中的类则不会被导入。
import lee.sub.*   //必须使用该语句，才能导入lee的子包sub中的类
```



import static 静态导入：

import static静态导入用来导入静态方法和静态域。而import用于导入类。

静态导入用于导入指定类的**单个**静态成员变量、静态方法或**全部**的静态成员变量、静态方法。

示例：Math类中有非常多的静态方法，使用静态导入后使用这些静态方法时便可以不添加类名Math作为前缀。

> import导入后，使用导入包中某类的公共成员时，可以省略包名。    
> 而使用import static导入后，使用导入某类的公共静态成员时可以省略类名。   
>  （静态方法和静态域属于某个类；而类属于某个包）    



## String

就是char数组，唯一为重载了加号。String的构造过程。







## 继承

### 方法覆盖与方法重载

两者的几个不同之处：  

- 方法覆盖要求签名必须一致，而方法重载要求参数签名必须不一致
- 方法覆盖要求返回类型必须一致，而方法重载对此不做限制
- 方法覆盖对方法的访问权限和抛出的异常有特殊的要求，而方法重载没有要求


### super和this关键字

super和this关键字都可以用来覆盖Java语言的默认作用域，是被屏蔽的方法或变量变为可见。

方法或变量变被屏蔽的场合：  

- 场合一：在一个方法内，当局部变量和类的成员变量同名，或局部变量和父类的成员变量同名，安装变量作用域规则，只有局部变量在方法内可见。
- 场合二： 方子类的某个方法覆盖了父类的一个方法，在子类的范围内，父类的方法不可见。
- 场合三：当子类中定义了和父类同名的成员变量时，在子类的范围内，父类的成员变量不可见。

**注意：**  
只能在构造方法或实例方法内使用super关键字，而在静态方法和静态代码块内不能使用super关键字。



### 多态

动态绑定，向上、向下转型



### final
final常量

- final修饰的类不能被继承
- final修饰的方法不能被子类的方法覆盖
- final修饰的变量表示常量，只能被赋值一次
- final不用来修饰构造方法，因为父类的构造方法和子类的构造方法不存在覆盖关系
- private修饰的方法不能被子类覆盖，因此默认也是final的。
- 对于final类型的实例变量，可以在定义变量时，或者在构造方法中进行初始化。





### abstract修饰符
abstract可用来修饰类和成员方法。

抽象方法，抽象方法没有方法体。

- 抽象类中可以没有抽象方法，但包含了抽象方法的类必须被定义为抽象类。如果子类没有实现父类中的抽象方法，那么子类也必须被定义为抽象类。
- 构造方法、静态方法不能是抽象方法。但**抽象类**中可以有非抽象的静态方法和非抽象的构造方法。
- 抽象方法和抽象类不能被final修饰符修饰。（final修饰的类不能有子类，final修饰的方法不允许被子类方法覆盖）
- 抽象方法没有方法体。





## interface

接口对其成员变量和方法做了很多限制，**接口的特征**如下：  

1. 接口中的**成员变量**默认都是public、static、final 类型的，必须被显示初始化。（注意要理解这句话）
2. 接口中的**方法**默认都是public、abstract类型的
3. 接口中只能包含上面两种类型的成员或方法。
4. 接口没有构造方法（也不能有）
5. 一个接口不能实现另一个接口，但它能继承**多个**其他接口。例如：A、B都是接口，`public interface C extends A,B{//}`
6. 接口**必须**通过**类**来实现它的抽象方法。
7. 与子类继承抽象父类相似，当类实现了某个接口时，它必须实现接口中所有的抽象方法，否则这个类必须被定义为抽象类。
8. 不允许创建接口的实例，但允许定义接口类型的引用变量，该变量引用实现了这个接口的类的实例。
9. 一个类只能继承一个直接的父类，但能实现多个接口。


![](https://www.javatpoint.com/images/core/interfacerelation.jpg)  



> **Java 8新特性：**  

> Java 8之前interface中的方法不能有方法体。从Java 8开始interface方法可以有方法体，但是需要使用关键字`default`将其指定为默认方法。   
>
> Since Java 8, we can have static method in interface.   

> 补充：  
> marker or tagged interface(标记或标记接口): 一个没有任何成员(方法)的接口。An interface that have no member is known as marker or tagged interface. For example: Serializable, Cloneable, Remote etc. They are used to provide some essential information to the JVM so that JVM may perform some useful operation.
>
> 内嵌的interface：interface中可以内嵌interface



![](https://www.javatpoint.com/images/core/multipleinheritance.jpg)




抽象类与接口主要的两大区别：

- 在抽象类中可以为部分方法提供默认的实现，从而避免在子类中重复实现它们，提高代码的可重用性；而接口中只能包含抽象方法。接口一旦被公布，就必须非常稳定，因为随意在接口中添加抽象方法，会影响到所有的实现类。
- 一个类可以实现(或继承)多个接口，但只能继承一个抽象类。


> 为什么Java不允许一个类有多个直接的父类？而可以实现多个接口？ 见《Java面向对象编程》P223




## 内部类


inner Class：是定义在另一个类范围内的类。

内部类有如下特征：

- 一个内部类被编译成一个名为`OuterClassName$InnerClassName.class`类
- 内部类可以引用定义在它嵌套的外部类中的数据和方法
- 使用可见性修饰符定义内部类时，遵从和应用与在类成员上一样的可见性规则
- 可以将内部类定义为`static`。一个static内部类可以使用外部类的名字访问。一个static类是不能访问外部类的非静态成员的
- 内部类的对象经常在外部类中创建。也可从另一个类中创建一个内部类的对象。
  - 如果该内部类是非静态的，就必须先创建一个外部类的实例，然后使用下面的语法创建一个内部类的对象：
    `OuterClass.InnerClass innerObject = outerObject.new InnerClass();`
  - 如果内部类是静态的，那么使用下面的语法为他创建一个对象：
    `OuterClass.InnerClass innerObject = new OuterClass.InnerClass();`


### 实例内部类

- 实例内部类中不能定义静态成员，而只能定义实例成员。
- 静态内部类（静态的实例内部类）中可以定义静态成员和实例成员(非静态)


### 局部内部类
局部内部类是在一个方法中定义的内部类，它的可见范围是当前方法。局部内部类不能用访问控制修饰符和static修饰。

特点：  

- 只能在当前方法中使用
- 不能包含静态成员（与实例内部类一样）
- 局部内部类不能用访问控制修饰符修饰
- 可以访问外部类的所有成员；此外，局部内部类还可以访问所在方法中的**final类型的参数和变量**。


### 匿名类

一种特殊的内部类，该类没有名字。

特点：  

- 匿名类本身没有构造方法，但是会调用父类的构造方法。
  ```
  A a = new A(v){
    void method(){//...}
  };
  a.method();
  ```
- 除了可以在外部类的方法内定义匿名类外，还可以在声明一个成员变量时定义匿名类。
- 匿名类除了可以继承类外，还可以**实现接口**。但最多只能继承或实现一个接口或类。
  ```
  //比如在一个方法内
  Thread t = new Thread(new Runnable()){ //匿名内部类，实现了Runnable接口
    public void run(){
      
    }
  };
  t.start();
  ```
- 与局部内部类一样，如果匿名类位于一个方法中，还能访问所在方法的final类型的变量和参数



内部类的继承


## Java8新增的Lambda表达式

Lambda表达式支持将代码块作为方法参数，Lambda表达式允许使用更简洁的代码来创建只有一个抽象方法的接口（这种接口被称为函数式接口）的实例。

Lambda表达式由三部分组成：

- 形参列表：
- 箭头(->)：
- 代码块


Lambda表达式与函数式接口

Lambda表达式的类型，也被称为“目标类型（target type），Lambda表达式的目标类型必须是“函数式接口（functional interface）”。函数式接口代表只包含一个抽象方法的接口。函数式接口可以包含多个默认方法、类方法，但只能声明一个抽象方法。


