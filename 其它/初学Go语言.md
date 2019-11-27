

# 初学Go语言



Go 亦称为 Golang（译注：按照 Rob Pike 说法，语言叫做 Go，Golang 只是官方网站的网址），是由谷歌开发的一个开源的编译型的静态语言。

Golang 的主要关注点是使得高可用性和可扩展性的 Web 应用的开发变得简便容易。（译注：Go 的定位是系统编程语言，只是对 Web 开发支持较好）

 Go 从C语言继承了相似的表达式语法、控制流结构、基础数据类型、调用参数传值、指针等很多思想。

 因为Go语言没有类和继承的概念，所以它和 [Java](http://c.biancheng.net/java/) 或 C++ 看起来并不相同。但是它通过接口（interface）的概念来实现多态性。Go语言有一个清晰易懂的轻量级类型系统，在类型之间也没有层级之说。因此可以说Go语言是一门混合型的语言。 

 Go语言的语法规则严谨，没有歧义，  将“++”、“--”从运算符降级为语句，保留指针，但默认阻止指针运算 。

 垃圾回收 ； 因指针的存在，所以回收内存不能做收缩处理。幸好，指针运算被阻止，否则要做到精确回收都难。 

并发；在早期 CPU 都是以单核的形式顺序执行机器指令，C语言正是这种顺序编程语言的代表。 Go语言则是在多核和网络化的时代背景下诞生的原生支持并发的编程语言。**Go语言从底层原生支持并发，无须第三方库**，开发人员可以很轻松地在编写程序时决定怎么使用 CPU 资源。  Go语言的并发是基于 goroutine 的，goroutine 类似于线程，但并非线程。可以将 goroutine 理解为一种虚拟线程。Go语言运行时会参与调度 goroutine，并将 goroutine 合理地分配到每个 CPU 中，最大限度地使用 CPU 性能。 



**学习资料：**

- [Go中文翻译组 - GCTT - Go语言中文网](https://studygolang.com/gctt)
- [Go语言入门教程，Golang入门教程](http://c.biancheng.net/golang/)
- 《Go语言圣经》[Go语言圣经中文版](https://github.com/gopl-zh/gopl-zh.github.com)
- [《Go2编程指南》开源图书](https://github.com/chai2010/go2-book)
-  [《Go语言高级编程》开源图书](https://github.com/chai2010/advanced-go-programming-book)



## 安装

Go官网只提供了安装包，这里我们通过命令安装，免去配置步骤。

centos 7:

```shell
yum info golang
yum install golang -y
go version
```

windows :

```
scoop info go
scoop install go
go version
```



安装目录说明

| 目录名 | 说明                                                         |
| ------ | ------------------------------------------------------------ |
| api    | 每个版本的 api 变更差异                                      |
| bin    | go 源码包编译出的编译器（go）、文档工具（godoc）、格式化工具（gofmt） |
| doc    | 英文版的 Go 文档                                             |
| lib    | 引用的一些库文件                                             |
| misc   | 杂项用途的文件，例如 Android平台的编译、git 的提交钩子等     |
| pkg    | Windows 平台编译好的中间文件                                 |
| src    | 标准库的源码                                                 |
| test   | 测试用例                                                     |

> Go语言的源文件后缀是`.go` 



## GOPATH

Go语言无须解决方案、工程文件和 Make File，只要将工程文件按照 **GOPATH** 的**规则**进行填充，即可使用 `go build/go install` 进行编译，编译完成的二进制可执行文件统一放在 bin 文件夹下。 

 所以i在编写代码之前，我们首先应该建立 Go 的工作区（Workspace）。

-  在 **Mac 或 Linux** 操作系统下，Go 默认工作区在 **$HOME/go** 
-  在 **Windows** 下，默认工作区设置在 **C:\Users\YourName\go** 
-  工作区位置由环境变量 GOPATH 决定，建议更改它的值。也可以通过`go env`查看该变量的值。另外默认工作区一般还需手动创建。

> 这里我们可以通过其他工具来进行控制。下文介绍。



Go对项目的目录结构做了硬性规定：

- src 目录：放置项目和库的源文件

  - 以包package的形式存放Go源文件，若一个源文件被声明为 log 包则需要保存在 src/log 目录中。如果直接存放在src目录则该源文件属于main包。

- pkg 目录：放置编译后生成的包/库的归档文件；比如 log 包会被编译为 log.a 。

- bin 目录：放置编译后生成的可执行文件。

  

来到 Go 的工作区，创建 helloworld.go 文件

```go
package main  //必须放在第一行，这里 main函数 需要放在main包下

import "fmt"  //导入 fmt 包

func main() { //这个 { 不能单独放在一行，否则报错 
    fmt.Println("Hello World") //包名加方法来调用
}
```

Go程序有多种方式运行：

- `go run helloworld.go ` 我们使用这条命令来运行上面的程序
- `go install` 之后再讲 

> [Go语言代码风格清晰、简单](http://c.biancheng.net/view/7.html)





## 变量

**每一行代表一个语句结束**。没必要使用 `;` 分号，但也可添加分号以便在一行写上多条语句。

```go
var age ini //声明一个ini变量，完整格式
var age ini = 20 //声明并赋值

var age = 20 //如果同时被初始化，则可 自动进行类型推断

var height, width int = 100, 50  //声明多个变量并分别初始化
//同时声明多个不同类型的变量
var (
	name = "fan"
    age = 20
    height int	//默认初始化为0
)

//简短声明，使用 := 操作符
name, age := "fan", 20  //声明多个变量并赋值
//简短声明 := 要求 新变量全部被赋值，下面是错误的
name, age := "fan"  //报错
//简短声明 := 要求  如果运算符左边至少包含一个新变量（之前还未被声明的变量）
b, c := 40, 50 // 如果b 和 c 早就已经声明，则报错
```



Go语言中为了不让你纠结于 `i++`  和 `++i`  ，它只允许一种写法，并且只能单独作为一个语句（一般单独写在一行）

```
var a, b int
a++  //允许
++a //不允许
b = a++ //不允许
```



**变量的作用域：**

Go语言中的变量分为三种类型，分别是

- 局部变量： 在函数体内声明 的变量 
- 全局变量： 在函数体外声明 的变量
- 形式参数：函数的参数，也是局部变量



匿名变量

 匿名变量的特点是一个下画线`_`   也被称为空白标识符。  它可以像其他标识符那样用于变量的声明或赋值（任何类型都可以赋值给它），但任何赋给这个标识符的值都将被抛弃。 匿名变量不占用内存空间，不会分配内存。 



## 类型

基本类型：

下面是 Go 支持的基本类型：

- bool ：true 或 false
- 数字类型
  - int8, int16, int32, int64, int  ：有符号整型 （数字表示有多少位，int则是32或64位）
  - uint8, uint16, uint32, uint64, uint  ：无符号整型 
  - float32, float64      ：浮点型
  - complex64, complex128   ：复数类型（64表示实部和虚部都是float32类型） 需使用 `complex()` 函数创建
  - byte ： 是 uint8 的别名。 
  - rune  ： 是 int32 的别名。 
- string ： 字符串是字节的集合。 可以直接对字符串使用 + 号

 Go 有着非常严格的强类型特征。Go 没有自动类型提升或类型转换。 比如整型和浮点不能转换。



## 常量

 "常量"用于表示固定的值 ，使用 `const` 关键字声明。并且常量不能被重新赋值。

 常量的值会在编译的时候确定。因为函数调用发生在运行时，所以不能将函数的返回值赋值给常量。 

 双引号中的任何值都是 Go 中的字符串常量。 

 **无类型的常量有一个与它们相关联的默认类型** 



未完



## 条件和循环

条件

```go
// 判断条件
if condition {  
}

if condition {  
} else { // 大括号 } 必须和else在同一行
}  //这里会被自动插入分号

//另一种形式
 [初始化条件]   判断条件
if statement; condition {  
}

    if num := 10; num % 2 == 0 { //checks if number is even
        //num仅限于在if中使用
        fmt.Println(num,"is even") 
    }  else {
        fmt.Println(num,"is odd")
    }
```

 `else` 语句应该在 `if` 语句的大括号 `}` 之后的同一行中。如果不是，编译器会不通过。  

出错的原因是 **Go 语言的分号是自动插入**。你可以在这里阅读分号插入规则 https://golang.org/ref/spec#Semicolons 。

在 Go 语言规则中，如果`}`之后没有内容他就会认为这是该行的最终标记，然后会在 `}` 后插入一个分号，。因此，在if语句后面的 `}` 会自动插入一个分号。



循环

```go
// [变量初始化]      [条件]     [循环变量修正]
for initialisation; condition; post {  
}

    for i := 1; i <= 10; i++ {
        fmt.Printf(" %d",i)
    }
```







## 函数

 函数声明通用语法如下： 

```go
//关键字   函数名     [参数及类型]       [返回值类型]
func functionname(parametername type) returntype {  
    // 函数体（具体实现的功能）
}
```

 如果有连续若干个参数，它们的类型一致，那么我们无须一一罗列，只需在最后一个参数后添加该类型。 

 Go 语言支持一个函数可以有**多个返回值**。  这些返回值必须用 `(`  `)` 括起来。 

```go
package main

import (  
    "fmt"
)
//返回面积和周长
func rectProps(length, width float64)(float64, float64) {  
    var area = length * width
    var perimeter = (length + width) * 2
    return area, perimeter
}

func main() {  
    area, perimeter := rectProps(10.8, 5.6)
    fmt.Printf("Area %f Perimeter %f", area, perimeter) 
}
```



**命名返回值**

在定义函数时，我们可以直接给返回值命名。一旦命名了返回值，可以认为这些值在函数第一行就被声明为变量了，并且不需要明确指定返回值

```go
func rectProps(length, width float64)(area, perimeter float64) {  
    area = length * width
    perimeter = (length + width) * 2
    return // 不需要明确指定返回值，默认返回 area, perimeter 的值
}
```

**空白符（匿名变量）：**

`_`  在 Go 中被用作空白符，可以用作表示任何类型的任何值。 对于上面的函数假使我们只需要计算面积，而并不关心周长的计算结果  

```go
func main() {  
    area, _ := rectProps(10.8, 5.6) // 返回值周长被丢弃
    fmt.Printf("Area %f ", area)
}
```



## 数组

 数组是同一类型元素的集合 。

 一个数组的表示形式为 `[n]T`。`n` 表示数组中元素的数量，`T` 代表每个元素的类型。元素的数量 `n` 也是该类型的一部分 

```go
/*  使用不同方式来声明数组 */

var a [3]int  //长度为3的int数组

a := [3]int{12,32}  //简略声明，可以不为所有元素赋值

a := [...]int{12,23,13} //还可忽略长度，并使用 ... 代替
```

 **数组的大小是类型的一部分**。因此 `[5]int` 和 `[25]int` 是不同类型。数组不能调整大小 

```go
func main() {
    a := [3]int{5, 78, 8}
    var b [5]int
    b = a // not possible since [3]int and [5]int are distinct types
}
```

 通过将数组作为参数传递给 `len` 函数，可以得到数组的长度。 



**数组是值类型**

 **Go 中的数组是值类型而不是引用类型。**这意味着当数组赋值给一个新的变量时，该变量会得到一个原始数组的一个副本。如果对新变量进行更改，则不会影响原始数组。 



**使用 range 迭代数组**

```go
package main

import "fmt"

func main() {
    a := [...]float64{67.7, 89.8, 21, 78}
    //方式一：直接使用 for 循环
    for i := 0; i < len(a); i++ { //数组下标从0开始
        fmt.Printf("%d th element of a is %.2f\n", i, a[i])
    }
    
    //方式二： 使用for循环的 range 方法
    //range 返回 索引 和 该索引处的值 （返回值有两个）
    for i, v := range a { //range returns both the index and value
        fmt.Printf("%d the element of a is %.2f\n", i, v)
    }
    
    //直接丢弃索引
    for _, v := range a { //range returns both the index and value
        fmt.Printf("the element of a is %.2f\n", v)
    }
}
```





**多维数组**

```go
    //初始化并赋值
	a := [3][2]string{
        {"lion", "tiger"},
        {"cat", "dog"},
        {"pigeon", "peacock"}, // 逗号是必须的，想想go的分号插入规则
    }

    var b [3][2]string
	//也可以这样赋值
    b[0][0] = "apple"
    b[0][1] = "samsung"
    b[1][0] = "microsoft"
    b[1][1] = "google"
    b[2][0] = "AT&T"
    b[2][1] = "T-Mobile"
```



## 切片

 切片是由数组建立的一种方便、灵活且功能强大的**包装**（Wrapper）。**切片本身不拥有任何数据**。它们只是对现有数组的**引用**。 

 Go 数组的长度不可改变，在特定场景中这样的集合就不太适用，Go中提供了一种灵活，功能强悍的内置类型切片("动态数组"),与数组相比切片的长度是不固定的，可以追加元素，在追加时可能使切片的容量增大。 



 使用**语法** `a[start:end]` 创建一个从 `a` 数组索引 `start` 开始到 `end - 1` 结束的切片。 

 如果 `a [:]` 缺少开始和结束值。开始和结束的默认值分别为 `0` 和 `len (numa)`。 

**切片的修改：** 对切片所做的任何修改都会反映在底层数组中。 

**切片的长度和容量：**

-  切片的长度是切片中的元素数。
- **切片的容量是从创建切片索引开始的底层数组中元素数。** 

```go
func main() {
    a := [5]int{76, 77, 78, 79, 80}
    //创建一个切片
    var b []int = a[1:4] // creates a slice from a[1] to a[3]
    //使用简明语法，并省略开始值和结束值
    c := [:]
    fmt.Println(b,c)
    
    fmt.Printf("切片长度 %d 容量 %d", len(b), cap(b))
}
```

使用 `make` 创建一个切片：

```go
// make 函数创建一个数组，并返回引用该数组的切片。
//       类型  长度  [容量]:默认为切片长度
func make（[]T，len，cap）
```





## 字符串

 Go 语言中的字符串是一个 Go 语言中的字符串是一个字节切片。把内容放在双引号`""`之间 。

 Go 中的字符串是兼容 Unicode 编码的，并且使用 UTF-8 进行编码。 

```go
package main

import (
    "fmt"
    "unicode/utf8"
)
//获取字符串的每一个字节
func printBytes(s string) {
    fmt.Printf("\n")
    fmt.Println("printBytes获取字符串的每一个字节")
    for i:= 0; i < len(s); i++ {
        fmt.Printf("%x ", s[i]) //%x 格式限定符用于指定 16 进制编码
    }
}

//获取字符串的每一个字符 （对于某些占用两个字节的UTF-8编码输出时会有问题）
func printChars(s string) {
    fmt.Printf("\n")
    fmt.Println("printChars获取字符串的每一个字符")
    for i:= 0; i < len(s); i++ {
        fmt.Printf("%c ",s[i]) //%c 格式限定符用于打印字符串的字符
    }
}

// 使用 rune
func printCharsRune(s string) {
    fmt.Printf("\n")
    fmt.Println("使用 rune ")
    s2 := []rune(s) //字符串被转化为一个 rune 切片
    for i:= 0; i < len(s2); i++ {
        fmt.Printf("%c ",s2[i])
    }
}

//还可以使用 for range 循环
func printCharsAndBytes(s string) {
    fmt.Printf("\n")
    fmt.Println("for range 循环")
    for index, rune := range s {
        fmt.Printf("%c starts at byte %d\n", rune, index)
    }
}

func main() {
    name := "Hello World"
    fmt.Println(name) //使用UTF-8进行编码
    printBytes(name) 
    printChars(name)
    fmt.Printf("\n")
    
    name = "Señor"   // 占用了两个字符的 ñ
    fmt.Println(name) //使用UTF-8进行编码
    printBytes(name) 
    printChars(name) //这里 假定每个字符的编码只会占用一个字节
    printCharsRune(name) // 使用 rune
    printCharsAndBytes(name) //使用for range 循环
    //返回字符串中的 rune 的数量
    fmt.Println(utf8.RuneCountInString(name));
}
```

这是因为 `ñ` 的 Unicode 代码点（Code Point）是 `U+00F1`。它的 [UTF-8 编码](https://mothereff.in/utf-8#ñ)占用了 c3 和 b1 两个字节。它的 UTF-8 编码占用了两个字节 c3 和 b1。而我们打印字符时，却假定每个字符的编码只会占用一个字节 。我们可以使用 rune来解决

 `rune` 是 Go 语言的内建类型，它也是 int32 的别称。在 Go 语言中，rune 表示一个代码点。代码点无论占用多少个字节，都可以用一个 rune 来表示 。

> 字符串长度，utf8 package包中的 `func  RuneCountInString(s string) (n int) `  方法用来获取字符串的长度。 这个方法传入一个字符串参数然后**返回字符串中的 rune 的数量**。 

 字符串是不可变的。  为了修改字符串，可以把字符串转化为一个 rune 切片（和数组一样为了修改数组，我们可以将数组转化为切片）。然后这个切片可以进行任何想要的改变，然后再转化为一个字符串。 

```go
package main

import (  
    "fmt"
)
//函数接收一个 rune 切片参数
func mutate(s []rune) string {  
    s[0] = 'a' 
    return string(s)
}
func main() {  
    h := "hello"
    fmt.Println(mutate([]rune(h)))
}
```



>  为了更好的理解 go 中的字符串，需要对 Unicode 和 UTF-8 有基础的理解。我推荐阅读一下 https://naveenr.net/unicode-character-set-and-utf-8-utf-16-utf-32-encoding/ 来理解一下什么是 Unicode 和 UTF-8。 





## 指针

Go语言为程序员提供了控制数据结构指针的能力，但是，并不能进行指针运算。Go语言允许你控制特定集合的数据结构、分配的数量以及内存访问模式

指针（pointer）在Go语言中可以被拆分为两个核心概念：

- **类型指针**：允许对这个指针类型的数据进行修改，传递数据可以直接使用指针，而无须拷贝数据，类型指针不能进行偏移和运算。
- **切片**：由指向起始元素的原始指针、元素数量和容量组成。

 受益于这样的约束和拆分，Go语言的指针类型变量即拥有指针高效访问的特点，又不会发生指针偏移，从而避免了非法修改关键性数据的问题。同时，垃圾回收也比较容易对不会发生偏移的指针进行检索和回收。 

切片比原始指针具备更强大的特性，而且更为安全。切片在发生越界时，运行时会报出宕机，并打出堆栈，而原始指针只会崩溃。 

```go
//获取变量 v 的地址，赋值给指针 ptr 
ptr := &v    // v 的类型为 T
			// ptr的类型为 *T 
```

- 取地址操作：使用 `&` 操作符（前缀）获取某个变量的地址
- 指针的类型： 指针变量的类型为 **`*T`**，该指针指向一个 **T** 类型的变量。 
- 指针取值：使用 `*` 操作符，获取指针指向的值

```go
func main() {
    b := 255
    var a *int = &b //定义一个指针
    fmt.Printf("a的类型是： %T\n", a) //结果为 *int
    fmt.Println("a指针的值 ", a)
    fmt.Println("a指针所指的变量的值 " , *a)
    *a++ //修改指针所指变量的值
    fmt.Println("修改后 a指针所指的变量的值 " , *a)
    
    var c *int //指针c的值为 nil （Zero Value 零值）
    
    //创建指针的另一种方法，使用 new(类型) 函数
    strptr := new (string)
    *str = "StringPtr"
}
```

不要向函数传递数组的指针，而应该使用切片。

 Go 并不支持其他语言（例如 C）中的指针运算：

```go
func main() {  
    b := [...]int{109, 110, 111}
    p := &b
    p++  //不支持指针运算，报错
}
```





## 方法

看起来方法是用于接收器（可以把它比作类）的函数（个人说法），Go语言中并没有类。

 方法其实就是一个函数，在 `func` 这个关键字和方法名中间加入了一个特殊的接收器类型。接收器可以是结构体类型或者是**非结构体**类型。接收器是**可以在方法的内部访问**的。 

```go
//  创建了一个接收器类型为 Type 的方法 methodName
func (t Type) methodName(parameter list){
    
}
```

为了进一步弄动方法，我们来介绍一下指针接收器与值接收器，指针接收器就是指接收器类型为指针。

```go
package main

import (
    "fmt"
)

type Employee struct {
    name string
    age  int
}

/*
使用值接收器的方法。
*/
func (e Employee) changeName(newName string) {
    e.name = newName
}

/*
使用指针接收器的方法。
*/
func (e *Employee) changeAge(newAge int) {
    e.age = newAge
}

func main() {
    e := Employee{
        name: "Mark Andrew",
        age:  50,
    }
    fmt.Printf("Employee name before change: %s", e.name)
    e.changeName("Michael Andrew")
    fmt.Printf("\nEmployee name after change: %s", e.name)

    fmt.Printf("\n\nEmployee age before change: %d", e.age)
    (&e).changeAge(51)
    fmt.Printf("\nEmployee age after change: %d", e.age)
}
```

看起来感觉就是，**对于方法，我们在调用它的时候不仅给他传递参数，还给他传递了接收器**。



未完







## 依赖管理



**godep：**

godep 是一个Go语言官方提供的通过 vender 模式来**管理第三方依赖**的工具，类似的还有由社区维护的准官方包管理工具 dep。 （我还见过其他的包管理工具）

 Go语言从 1.5 版本开始开始引入 vendor 模式，如果项目目录下有 vendor 目录，那么Go语言编译器会优先使用 vendor 内的包进行编译、测试等。 

安装godep工具

```
 go get github.com/tools/godep 
```

命令执行成功后会将 godep 工具的源码下载到 GOPATH 的 src 目录下对应的文件夹中，同时还会在 GOPATH 的 bin 目录下生成一个名为 godep.exe 的可执行文件 。 为了方便使用 godep 工具，我们需要将存放 godep.exe 文件的目录添加到环境变量 PATH 中。 （我暂时无法想象）

 **go module ：**





