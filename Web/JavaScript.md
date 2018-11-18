
## 基础学习


传统意义上，JavaScript 是由下列三部分组成：

- **ECMAScript** 
- **文档对象模型(DOM)**  是针对 XML 但经过扩展用于 HTML 的应用程序编
  程接口(API,Application Programming Interface)
   。DOM 把整个页面映射为一个多层节点结构。
- **浏览器对象模型(BOM)** 支持可以访问和操作浏览器窗
  口

而 Mozilla 则指出 JavaScript 由**Core** JavaScript 和 **Client** JavaScript 组成。

DOM (**D**ocument **O**bject **M**odel)（文档对象模型）是用于访问 HTML 元素的正式 W3C 标准。



## 在HTML中使用JavaScript



向 HTML 页面中插入 JavaScript 的主要方法,就是使用`<script>`元素。



在使用`<script>`元素**嵌入 JavaScript 代码时**,只须为`<script>`指定 type 属性。

在解释器对`<script>` 元素内部的所有代码求值完毕以前,页面中的其余内容都不会被浏览器加载或显示。

如果要通过`<script>`元素来**包含外部 JavaScript 文件**,那么 src 属性就是必需的。这个属性的值是一个指向外部 JavaScript 文件的链接。

与解析嵌入式 JavaScript 代码一样,在解析外部 JavaScript 文件(包括下载该文件)时,页面的处理也会暂时停止。

需要注意的是,带有 `src` 属性的`<script>`元素不应该在其`<script>`和 `</script>`标签之间再
包含额外的 JavaScript 代码。如果包含了嵌入的代码,则只会下载并执行外部脚本文件,嵌入的代码会被忽略。



**标签的位置：**

按照**传统的做法**,所有`<script>`元素都应该放在页面的`<head>`元素中

这种做法的**目的**就是把所有外部文件(包括 CSS 文件和 JavaScript 文件)的引用都放在相同的地方。
可是,在文档的`<head>`元素中包含所有 JavaScript 文件,意味着必须等到全部 JavaScript 代码都被下载、
解析和执行完成以后,才能开始呈现页面的内容

为了避免这个问题，**现代 Web 应用程序**一般都把全部 JavaScript 引用放在`<body>`元素中**页面内容的后面**。





讨论下面这条语句

```javasc
<script src="vue.js"> alert("OK"); </script>
```

在这里并不会弹出警告框，原因是如果指定了`src`那么将会使用src里面的内容替换标签中的内容(也就是alert("OK"))。




### 输出数据



JavaScript 可以通过不同的方式来**输出数据**：

- 使用 **window.alert()** 弹出警告框。
- 使用 **document.write()** 方法将内容写到 HTML 文档中。
- 使用 **innerHTML** 写入到 HTML 元素。
- 使用 **console.log()** 写入到浏览器的控制台。



> 使用 document.write() 仅仅向文档输出内容。
>
> 如果在文档已完成加载后执行 document.write()，整个 HTML 页面将被覆盖。
>
> document.write()是直接写入到页面的**内容流**，如果在写之前没有调用document.open(), 浏览器会自动调用open()。每次写完关闭之后重新调用该函数，会导致页面被重写。
>
> [document.write的用处! - CSDN博客](https://blog.csdn.net/qq_34986769/article/details/52160532 "document.write的用处! - CSDN博客")



### 调试工具

DevTools

[Chrome 开发者工具  -  Web  -  Google Developers](https://developers.google.com/web/tools/chrome-devtools/)

插件DevTools的新功能 [What's New In DevTools (Chrome 61)  -  Web  -  Google Developers](https://developers.google.com/web/updates/2017/07/devtools-release-notes)



> 在百度/京东页面打开DevTools > Console下可能有招聘信息



### 字面量

| 100                         | 数值         |
| --------------------------- | ---------- |
| "foobar"                    | 字符串值       |
| true                        | 布尔值        |
| null                        | null值      |
| {x:1,y:2}                   | **Object** |
| [3,1,2]  //这里使用的是方括号，而不是大括号 | 数列         |
| function(){return ;}        | **函数**     |
| /foo/                       | 正则表达式      |




### 变量

ECMAScript 的变量是松散类型的，每个变量仅仅是一个用于保存值的占位符而已。定义变量时要使用 var 操作符。

```javascript
var message;
```

该变量可以用来保存任何值 (像这样未经过初始化的变量,会保存一个特殊的值—— **undefined**)。

注意：即用 var 操作符定义的变量将成为定义该变量的作用域中的局部变量。

> 省略 var 操作符可以定义**全局变量**,但这不是我们推荐的做法。



### 数据类型

ECMAScript 中有 5 种简单数据类型(也称为**基本数据类型**) : 

- **Undefined**
- **Null**
- **Boolean** ：只有两个字面值: true 和 false。(Number：0和NaN转换为false，其它转换为true)
- **Number**：它的一个**特殊值NaN**表示非数值(Not a Number)是一个特殊的数值，它用于表示一个本来要返回数值的操作数未返回数值的情况。它有**两个特点**：1. 任何涉及NaN的操作都会返回NaN。2. NaN与任何值都不相等(包括NaN本身)。所以为其提供了`isNaN()`函数。
- **String**

还有 1 种**复杂数据类型**——Object, Object 本质上是由**一组无序的名值对组成**的。 



> 基本数据类型(简单数据类型)有的地方又叫原始类型，相关的值称为原始值。另外一种类型是引用类型。



**typeof操作符：**

可以通过 typeof 操作符检测一个变量的数据类型。(可以用括号也可不用)

**注意：** typeof 返回 "function"——则表示这个值是**函数**。



从技术角度上讲，**函数在ECMAScript中是对象**，不是一种数据类型。然而函数确实有一些特殊的属性，因此通过typeof操作符来区分函数和其它对象是有必要的。



#### String

ECMAScript 中的字符串是不可变的,也就是说,字符串一旦创建,它们的值就不能改变。要改变
某个变量保存的字符串,首先要销毁原来的字符串,然后再用另一个包含新值的字符串填充该变量



### 操作符和语句

#### 布尔操作符*







#### 浮点型数据使用注意事项

所有的编程语言，包括 JavaScript，对浮点型数据的精确度都很难确定：

```javascript
var x = 0.1;
var y = 0.2;
var z = x + y            // z 的结果为 0.3
if (z == 0.3)            // 返回 false
```

为解决以上问题，可以用整数的乘除法来解决：

```javascript
var z = (x * 10 + y * 10) / 10;       // z 的结果为 0.3
```





#### 相等操作符*

ECMAScript提供了两组操作符：

- 相等`==`和不等`!=`：在比较之前先将对象转换成相似的类型。
- 全等`===`和不全等`!==`：在比较之前不做任何转换操作。




#### switch语句

switch 语句会使用全等运算符(===)进行比较，而非相等运算符。



#### in运算符

`in`是一种用于检测属性是否存在的运算符，结果是布尔值。



#### instanceof 运算符

`instanceof` 用于类型判断，结果为布尔值。



#### typeof 运算符

`typeof ` 用于数据类型判断的单目运算符，支持任意类型的操作数。结果为标识操作数的数据类型的字符串值。



#### void 运算符

`void` 运算符是 `undefined` 类型的单目运算符。无论向其传递什么操作数，其结果都是 `undefined`值。

```js
console.log(void 0);
> undefined
console.log(void "x");
> undefined
var x = 0;
void x++; //由于会先对操作数进行求值，所以 x 将自增
console.log(x)
> 1
```

通常会将它的操作数放在括号中：

```js
void(x);
```



使用示例：

```html
<a href="javascript:void(document.form.submit())">发送HTML表单数据但不跳转页面</a>
```

`href`属性中的表达式如果有值的话，则会被标签 a 认为是 URL 并跳转到该页面，为了阻止这一行为，可以将其值设为 `undefined`值，最常用的方法就是使用 `void` 来实现。



> [详解A标签中href=&quot;&quot;的几种用法_javascript技巧_脚本之家](https://www.jb51.net/article/121630.htm?utm_medium=referral "详解A标签中href=&quot;&quot;的几种用法_javascript技巧_脚本之家")





#### for in语句

`for in`语句是用于枚举**对象属性**名的循环语句。

`in` 的**右侧是 Object 类型**的表达式；而任何类型的值都可以转换为Object类型。

```javascript
var obj = {x:1, y:3, z:2};
for (var k in obj){ //这里并不保证枚举的顺序
    console.log(k);
}
```

数组不推荐使用 `for in` : 数组的每个元素的索引被视为对象的属性。

```javascript
var a = ['A', 'B', 'C'];
for (var i in a) {
    console.log(i); // '0', '1', '2'
    console.log(a[i]); // 'A', 'B', 'C'
}
```



**使用 `for in`的注意事项：**

- 枚举属性的顺序（无序）：由于属性之间本身不存在顺序，所以它并不保证枚举的顺序。但是数组是有顺序的，多数情况其输出也是有顺序的，但`for in`并不保证顺序，所以不要过分依赖。

- 无法被枚举的属性：比如数组对象的 length 属性。

- 由原型继承而来的属性：`for in` 还可以枚举由原型继承而来的属性。可以使用 `hasOwnProperty()` 过滤掉对象继承的属性。

  ```js
  for (var key in o) {
      if (o.hasOwnProperty(key)) {
          console.log(key); // 'name', 'age', 'city'
      }
  }
  ```



`for each in`：它与 `for in`的注意事项相同，不同之处就是它并不是把属性名赋值给临时变量，而是将属性值赋值给它。

```js
var obj = {x:1, y:3, z:2};
for each (var v in obj){
    console.log(v); // 1, 3, 2 
}
```





> 另还新增了 `for of`循环 




### 函数

JS中函数也是对象。

函数声明：

```javascript
//函数声明语句
function 函数名 (参数, 参数, ...){
    函数体
}
```



省略函数名的函数为**匿名函数**。

**匿名函数表达式**是一种表达式而非语句，所以也可以在表达式内使用。另外由于它是表达式因此也会有返回值。匿名函数的返回值是一个 Function 对象的引用。

```javascript
var sum = function(a,b){
    return Number(a) + Number(b);
}

//调用函数 sum
sum(3,4);
```



JavaScript中的**函数也是一种特殊对象**。变量名与函数名实质上是相同的。

可以把任意类型的值、对象或者函数赋值给对象的属性。

```javascript
obj.fn = function(a,b){
    return Number(a) + Number(b);
};
```



不必声明返回值：

```javascript
//没有指定是否有返回值
function sum(num1, num2) {
  	//也可以 return
	return num1 + num2;
}

function sayHi(name, message) {
  	//返回 undefined 值
	return;
}
```





####  () 函数调用运算符 

`()` 用来实现对函数的调用，其**左操作数**是一个函数；而**右操作数**是要传递给函数的参数。

需要注意的一点是，当某个函数作为另一个函数的参数时，不要在该函数名后面添加 `()`。



#### 理解参数

ECMAScript 函数不介意传递进来多少个参数,也不在乎传进来参数是什么数据类型。也就是说,即便你定义的函数只接收两个参数,在调用这个函数时也未必一定要传递两个参数。可以传递一个、三个甚至不传递参数。

之所以会这样,原因是 ECMAScript 中的参数在内部是用一个数组来表示的。函数接收
到的始终都是这个数组,而不关心数组中包含哪些参数(如果有参数的话)。如果这个数组中不包含任何元素,无所谓;如果包含多个元素,也没有问题。

实际上,在函数体内可以通过 arguments 对象来访问这个参数数组,从而获取传递给函数的每一个参数。

通过访问 arguments 对象的 length 属性可以获知有多少个参数传递给了函数。

另一个与参数相关的重要方面,就是 arguments 对象可以与命名参数一起使用；并且它的值永远与对应命名参数的值保持同步（注意它们的内存空间可是独立的）。

```javascript
// arguments与命名参数一起使用
function doAdd(num1, num2) {
	if(arguments.length == 1) {
		alert(num1 + 10);
	} else if (arguments.length == 2) {
		alert(arguments[0] + num2);
	}
}
```



另外；没有传递值的命名参数将自动被赋予 undefined 值。





#### 不能重载

ECMAScript 函数不能像传统意义上那样实现重载。如前所述,ECMAScirpt函数没有签名,因为其参数是由包含零或多个值的数组来表示的。而没有函数签名,真正的重载是不可
能做到的。

如果在 ECMAScript 中定义了两个名字相同的函数,则该名字**只属于后定义的函数**。



### 变量、作用域和内存问题

ECMAScript 变量可能包含两种不同数据类型的值: **基本类型值** 和 **引用类型值**。

> 注意：ECMAScript 中 String 也是基本类型之一。



#### 动态的属性

对于引用类型的值,我们可以为其添加属性和方法,也可以 **改变** 和 **删除** 其 **属性 和 方法**。

```javascript
var person = new Object();
person.name = "Nicholas";  //动态添加的属性
alert(person.name);   //"Nicholas"
```



#### 复制变量值

- 基本类型：复制原内存
- 引用类型：复制指针值



#### 传递参数

所有函数的参数都是按值传递的

- 基本类型：复制内存中的值
- 引用类型：复制指针值



#### 检测类型

- 基本类型：使用 typeof 操作符检测。`typeof i` 或`typeof(i)`
- 引用类型：使用 instanceof 操作符检测。`result = variable instanceof constructor`



> ECMA-262 规定任何在内部实现 `[[Call]]`方法的对象都应该在应用typeof操作符时返回 "function"。函数实现了这个方法。在Chrome 7和某些浏览器中的正则表达式也实现了这个方法，所以检测正则表达式时也会返回"function"。



in 操作符：可以用来检测某属性是否存在。



#### 执行环境及作用域

执行环境(execution context,为简单起见,有时也称为“环境”)是 JavaScript 中最为重要的一个概
念。执行环境定义了变量或函数有权访问的其他数据，决定了它们各自的行为。**每个执行环境都有一个与之关联的变量对象(variable object)，环境中定义的所有变量和函数都保存在这个对象中**。虽然我们编写的代码无法访问这个对象，但解析器在处理数据时会在后台使用它。

**全局执行环境**是最外围的一个执行环境。在 Web 浏览器中，全局执行环境被认为是 **window** 对象。因此所有全局变量和函数都是**作为 window 对象的属性和方法创建的**。

> 全局变量（以及全局函数名）是全局对象的属性。

**某个执行环境中的所有代码执行完毕后，该环境被销毁**，保存在其中的所有变量和函数定义也随之销毁。

**每个函数都有自己的执行环境**。

当代码在一个环境中执行时，会创建变量对象的一个**作用域链(scope chain)**。作用域链的用途，是保证对执行环境**有权访问**的所有变量和函数的**有序访问**。 （嵌套的作用域）

作用域链的 **前端**，始终都是当前执行的代码所在环境的变量对象。

标识符解析是沿着作用域链一级一级地搜索标识符的过程。

内部环境可以通过作用域链访问所有的外部环境，但外部环境不能访问内部环境中的任何变量和函数。这些环境之间的联系是线性、有次序的。每个环境都可以向上搜索作用域链，以查询变量和函数名;但任何环境都不能通过向下搜索作用域链而进入另一个执行环境。



#### 延长作用域链

虽然执行环境的类型总共只有两种 — **全局**和**局部**(函数)，但还是有其他办法来延长作用域链。

在下面的两种情况会在作用域的**前端** 临时 **增加一个变量对象**；该变量对象会在代码执行后被移除。

- try-catch 语句的 **catch 块** ： 对 catch 语句来说，会创建一个新的变量对象，其中包含的是被抛出的错误对象的声明。
- with语句：对 with 语句来说，会将指定的对象**添加到作用域链中**。



#### 没有块级作用域

在C语言中，由花括号封闭的代码块都有自己的作用域。而 **JavaScript 没有块级作用域**。

所以在使用 `if` 语句 和 `for` 语句时要记住这一点。



### 垃圾收集

JavaScript 具有自动垃圾收集机制，也就是说，执行环境会负责管理代码执行过程中使用的内存。



而优化内存占用的最佳方式，就是为执行中的代码只保存必要的数据。一旦数据不再有用，最好通过将其值设置为 null 来释放其引用——这个做法叫做**解除引用**(dereferencing)。



## 引用类型

引用类型的**值(对象)**是引用类型的一个实例。在 ECMAScript 中，引用类型是一种数据结构，用于将数据和功能组织在一起。它也常被称为类，但这种称呼并不妥当。 ECMAScript 它**不具备**传统的面向对象语言所支持的**类**和**接口**等基本结构。



> 虽然**引用类型**与**类**看起来相似 ， 但它们并不是相同的概念。



#### Object类型

我们看到的大多数引用类型值都是 Object 类型的实例。

创建Object实例的两种方式。

1. 使用new操作符后跟Object构造函数：

   ```javascript
   var person = new Object();
   person.name = "Nicholas";
   person.age = 29;
   ```

2. 使用**对象字面量**表示法。它是对象定义的一种简写形式，目的在于简化创建包含大量属性的对象的过程。

   ```javascript
   var person = {
       name : "Nicholas",
     	age : 29
   };
   ```

   ​

#### 访问对象属性



访问对象属性的两种方法：

- 使用点表示法。`person.name`
- 使用方括号表示法。`person["name"]`

方括号表示法的优点：可以通过变量来访问属性。

```javascript
var propertyName = "name";
//向方括号中传入一个变量
var userName = person[propertyName];
```

通常，除非必须使用变量来访问属性，否则我们建议使用**点表示法**。



属性的枚举：

可以使用for in语句对属性名进行枚举。并且可以借助中括号间接的实现对属性值的枚举。

```javascript
var obj = {x:3, y:4, z:5};
for (var key in obj){
    print('key = ', key);  //属性名的枚举
    print('val = ', obj[key]); //同时利用[]实现对属性值的枚举
}
```





#### Array类型

ECMAScript 中的数组与其他多数语言中的数组有着相当大的区别。

- ECMAScript 数组的每一项可以保存任何类型的数据。
- ECMAScript 数组的大小是可以动态调整的




创建数组：

```javascript
var colors = new Array();
var colors = new Array(20);
// 也可省略 new 
var colors = Array("red", "blue", "green");
// 使用数组字面量
var colors = ["red", "blue", "green"]; 
```



Array 的特性较多，这里不再说明。

判断某个变量是否是数组： Array.isArray() 方法。



**栈方法：**

- 数组的push()方法
- 数组的pop()方法



**队列方法：**

- 数组的shift()方法
- 数组的push()方法



**重排序方法：**

- 反转数组项的顺序：reverse() 
- 排序方法(默认升序)： sort()。也可以传入一个**比较函数**作为参数。



**操作方法：**

- concat() 方法进行连接
- slice() 切片方法
- splice() 拼接方法。可以进行删除、插入、替换。



**位置方法：**

- indexOf() : 
- lastIndexOf() : 



**迭代方法：**

迭代方法很高级，需要掌握。它们都接收一个**函数**作为参数。



ECMAScript 5 为数组定义了 5 个迭代方法：

-  map(): 对数组中的每一项运行给定函数，**返回**每次函数调用的结果组成的**数组**。进行**映射**。
-  every()：数组中的所有项是否满足条件。
-  filter()：过滤数组。
-  forEach()：对数组中的每个值都执行一次操作。
-  some()：检测数组中是否存在满足条件的值。





#### Date类型

略



#### RegExp类型

使用下面的方法就可以创建一个正则表达式：

```javascript
var expression = /pattern/flags;
```



flags: 

- g：表示全局模式
- i：表示不区分大小写模式
- m：表示多行模式



另一种创建正则表达式的方式是使用RegExp 构造函数，它接收两个参数:一个是要匹配的字符串模式，另一个是可选的标志字符串。



#### Function类型

函数实际上是对象。每个函数都是 Function 类型的实例，**而且都与其他引用类型一样具有属性和方法**。

因此函数名实际上也是一个指向函数对象的指针，**不会与某个函数绑定**。

```javascript
var sum = function(num1,num2){
    return num1 + num2;
}; //这里有分号
```



**作为值的函数：**

因为ECMAScript中的函数名本身就是一个变量，所以函数也可作为值来使用。也就是说，不仅可以像传递参数一样把一个函数传递给另一个函数，而且可以将一个函数作为另一个函数的结果返回。

**函数内部属性：**

在函数内部，有两个特殊的**对象**：**arguments** 和 **this**(对象有this)。



**函数属性和方法：**

**每个函数都包含两个属性**： length和prototype。（那么其它对象是否包含这两个属性？答：**没有**）

length表示接收到的命名参数的个数。prototype在自定义引用类型和实现继承时是非常重要的。



**apply()和call()方法：**用途都是在特定的作用域中**调用函数**，实际上等于**设置函数体内this对象**的值。传递参数并非 apply()和 call()真正的用武之地;它们真正强大的地方是能够扩充函数赖以运行的作用域（通过设置函数体内this对象来实现）。



```javascript
window.color = "red";
var o = { color: "blue" };
function sayColor(){
alert(this.color);
}
sayColor();  			//red
//这里没有传入除第一个参数以外的参数
sayColor.call(this);  	//red
sayColor.call(window);  //red
sayColor.call(o);  		//blue
```



## 面向对象的程序设计

ECMAScript中**没有类**的概念。从形式上来看 JavaScript 的对象就是一种属性的集合。

我们可以把ECMAScript的对象想象成散列表：无非就是一组名值对，其中值可以是**数据**或**函数**。

如果将JavaScript对象的属性名看作键，属性值看作值；会发现它与Java中的映射(Map)非常相似（附加功能是方法和原型继承等）。

从本质上来说，**面向对象**这一术语只不过是一种在高于内部实现的语境中所使用的、较为抽象的概念而已。

在JavaScript中，一切都是对象。对象之间的协作通过属性访问来实现。而对象之间的共性，则通过继承同一个对象的性质的方式来实现；**而JavaScript通过基于原型的形式来实现继承**。



### 创建对象



**自定义一个对象**

早期做法：*创建一个Object实例*，再为其添加属性和方法

```javascript
var person = new Object();
person.name = "Nicholas";
person.age = 29;
person.job = "Software Engineer";
person.sayName = function(){
alert(this.name);
};
```

流行做法：对象字面量

```javascript
var person = {
  name: "Nicholas",
  age: 29,
  job: "Software Engineer",
  sayName: function(){
    alert(this.name);
  }
};
```



> 作为 singleton模式的用法：
>
> 对类（构造函数）进行设计以实现singleton模式的想法完全是一种基于类的思考方式。
>
> 在JavaScript中我们只需要**直接使用对象字面量**即可。





**属性**在创建时都带有一些**特征值**(characteristic) ,JavaScript 通过这些特征值来定义它们的行为。

特征值比较高级，这里略过。



### 对象初始化和动态属性添加

首先你需要一个 Object 对象，

```js
var user=new Object();
//或
var user= {}
```



动态添加（修改）属性或方法：

```
user.name=”jack”;
user.alert=function(){
alert(“my name is:”+this.name);
}
```



> 另一个示例：
>
> 方式一：
>
> ```js
> var obj = {}; //或者 var obj=new Object();
> var key = "name";
> var value = "张三丰"
> obj[key] = value;
> console.info(obj);
> ```
> 方式二：使用eval() 动态解析字符串表达式
>
> ```js
> var obj = {};
> var key = "name";
> var value = "张三丰"
> eval("obj.p" + key + "='" + value + "'");
> console.info(obj);
> ```
>
>



删除属性：

```js
//方式一：将其置为 undefined
user.name=undefined;

```



> 移除一个对象中绑定的属性：
> `delete obj.name 或者 delete obj["name"]`
> 但是无法删除原型链中的变量也无法直接删除变量





### 构造函数

定义一个函数，我们想在之后只使用new来调用它（此时它就是构造函数）。一般我们让该函数遵守下面的规则：

- 以大写字母开头
- 没有显示的创建对象
- 直接将属性和方法赋值给了this对象
- 没有return语句





使用new操作符调用构造函数，经历的4个步骤：

1. 创建一个新对象
2. 将构造函数的作用域赋给新对象(因此该函数对象的 this 就指向了这个新对象)
3. 执行构造函数中的代码(为这个新对象添加属性)
4. 返回新对象。（隐式的执行`return this`）

任何函数只要通过new表达式调用，该函数就可以作为构造函数。





### 原型模式

**每个函数**都有一个 prototype(原型)属性,这个属性是一个指针，**指向一个对象**，而这个对象的用途是包含可以由**特定类型**的*所有实例* **共享**的属性和方法。



```javascript
function Person(){}

Person.prototype.name = "Jian";
Person.prototype.age = "10";
Person.prototype.sayName = function(){
    alert(this.name);
};

var person1 = new Person();
person1.sayName();		// Jian
var person2 = new Person();
person2.sayName(); 		// Jian
alert(person1.sayName == person2.sayName);	// true
```

使用场景：

```javascript
function MyClass(x,y){
    this.x = x;
  	this.y = y;
}

MyClass.prototype.show = function(){
    print(this.x, this.y);
}

```



**更简单的原型语法：**

常见的做法是用一个包含所有属性和方法的对象字面量来重写整个原型对象。

```javascript
function Preson(){
    name: "Jian",
    age: 10,
    sayName : function(){
        alert(this.name);
    }
};
```



**原型的动态性：**

可以随时为原型添加属性和方法,并且修改能够立即在所有对象实例中反映出来。

但如果是重写整个原型对象,那么情况就不一样了。,调用构造函数时会为**实例**添加一个指向最初原型的
`[[Prototype]]` 指针,而把原型修改为另外一个对象就等于切断了构造函数与最初原型之间的联系。





### 继承与原型链

JavaScript通过基于原型的形式来**实现继承**。同时可以使用原型的模式来**解决构造函数带来的问题**。

ECMAScript 中描述了原型链的概念,并将原型链作为实现继承的主要方法。其基本思想是利用原
型让一个引用类型继承另一个引用类型的属性和方法。



**构造函数、原型和实例的关系:**

每个构造函数都有一个原型对象(构造函数的prototype指向原型)，原型对象都包含一个指向构造函数的指针(constructor指向构造函数)，而实例都包含一个指向原型对象的内部指针(隐式链接 `__proto__`)。如图：

![](https://github.com/mqyqingfeng/Blog/raw/master/Images/prototype3.png)



原型链：

原型链最终是通过“隐式链接”连接而成。在一些JavaScript实现中具有`__proto__`这样一个属性，它指向了隐式链接所引用的对象。不过在ECMAScript的标准中并没有`__proto__`属性。

<img src="https://farm5.staticflickr.com/4405/36290989613_e756d7ffdd_o.png" width="616" height="302" alt="JS原型链">







[JavaScript深入之从原型到原型链 · Issue #2 · mqyqingfeng/Blog](https://github.com/mqyqingfeng/Blog/issues/2 "JavaScript深入之从原型到原型链 · Issue #2 · mqyqingfeng/Blog")



## 函数与闭包

通过闭包来实现对属性值进行**访问控制**（private 或 public 等）。

[学习Javascript闭包（Closure） - 阮一峰的网络日志](http://www.ruanyifeng.com/blog/2009/08/learning_javascript_closures.html "学习Javascript闭包（Closure） - 阮一峰的网络日志")





## Window和框架

Window对象具有的一些属性。

navigator：是一个Navigaor对象，包含了浏览器的版本、浏览器所支持的插件等各种与浏览器相关的信息。

location：Location对象，包含了与当前显示的URL相关的一些信息。

history：History对象，可以通过它的back()方法和forward()方法实现浏览器历史记录中的后退和前进。

screen：Screen对象包含了画面的大小与发色数等信息。

frames：框架

document：可以通过Document对象的cookie属性对Cookie进行读写操作

parent, top, self：与框架相关





然而在过去的几年中，框架不再流行，甚至从 HTML5 中完全移除(iframe 除外)。

《JavaScript基础教程》第8版，第5章：窗口与框架。

## DOM



DOM(Document Object Model，文档对象模型)。



**标签、元素、节点：**

标签：标签是一种用于标记的字符串，其作用为对文档的结构进行指定。

**节点和元素**：元素和节点之间略有写继承关系，其中**节点**是**父**概念。节点具有nodeType属性，当其值是ELEMENT_NODE(1)，该节点则是一个元素。



DOM共有12种节点它们都实现了Node接口，在HTML中文档中使用的有如下节点：

| 节点   | 节点类型常量         | 节点类型的值 | 接口       |
| ---- | -------------- | ------ | -------- |
| 元素节点 | ELEMENT_NODE   | 1      | Element  |
| 属性节点 | ATTRIBUTE_NODE | 2      | Attr     |
| 文本节点 | TEXT_NODE      | 3      | Text     |
| 注释节点 | COMMENT_NODE   | 8      | Comment  |
| 文档节点 | DOCUMENT_NODE  | 9      | Document |



### Document



Document表示DOM树的根节点，用于表示整个HTML**文档**的对象。在js中可以通过window对象的document来访问。



**Document的内置的几个提高效率的属性：**

documentElement属性：它始终指向HTML页面中的`<html>`元素。

```javascript
var html = document.documentElement;	//取得对<html>的引用
```

body属性：它直接指向`<body>`元素(使用频率高)

```javascript
var body = document.body;	//取得对<body>的引用
```





### Element



要访问元素的标签名可以使用 nodeName 属性或tagName属性。



#### 特性

取得特性（属性）：

* getAttribute()
* setAttribute()
* removeAttribute()




**通过getAttribute()来访问特性：**

注意，传递给getAttribute()的特性名与实际的特性名相同。通过该方法还可获得自定义的特性(根据HTML5规范，自定义特性应该加上data-前缀以便验证)。另外特性的名称是不区分大小写的。


```html
<div id="myDiv" my_special_attribute="hello!"></div>
```

获取上面元素的特性

```javascript
var div = document.getElementById("myDiv");

alert(div.getAttribute("id"));
alert(div.getAttribute("my_special_attribute")); //获取自定义的特性
```



元素的特性也可以**通过DOM元素本身的属性来访问**。不过，只有非自定义的特性才会以属性的形式添加到DOM对象中。

```javascript
alert(div.id); //直接通过属性获取特性
```



有两类特殊的特性：

第一类就是style，用于通过CSS为元素指定样式：

* 通过getAttribute()访问时，返回的style特性值中包含的是**CSS文本**
* 通过属性来访问时返回的是一个对象。

第二类是onclick这样的事件处理程序：

* 通过 getAttribute()访问,则会返回相应代码的**字符串**。
* 通过属性来访问时返回一个JavaScript函数



由于存在这些差别，开发人员**经常使用对象的属性**，而不是getAttribute()。只有在取得自定义特性值的情况下，才会使用getAttribute()方法。



**attributes属性：**

 attributes 属性中包含一个NamedNodeMap,与 NodeList 类似,也是一个“动态”的集合。元素的每一个特性都由一个 Attr 节点表示,每个节点都保存在 NamedNodeMap 对象中。attributes 属性中包含一系列节点,每个节点的 nodeName 就是特性的名称,而节点的 **nodeValue** 就是特性的值。

```javascript
var id = element.attributes.getNamedItem("id").nodeValue; //获取id的特性值
//使用方括号的简写形式
var id = element.attributes["id"].nodeValue;
```





### 节点的选择

查找元素element：Document类型为此提供了两个方法；getElementById()和getElement**s**ByTagName()。

#### 通过ID检索

通过Document.getElementById()选择HTML文档中的指定节点。其中id必须唯一。

```javascript
var element = document.getElementById('foo');
```



#### 通过标签名检索

Element.getElementsByTagName()方法来取得具有该标签名的所有节点，该方法返回包含零个或多个元素的NodeList，在HTML文档中，返回的是一个HTMLCollection对象。另外它还可以使用通配符`*`。

```javascript
var spanElements = document.getElementsByTagName('span'); //仅获取span元素
var allElements = document.getElementsByTagName('*');	  //获取所有的元素
```



> getElementsByTagName()方法同时存在于 Element和Document中。

> NodeList对象是一种Live对象。
>
> 对于Live对象，需要注意的一点是：Live对象始终具有DOM树实体的引用。因此，对DOM树作出的变更也会在Live对象中得到体现。





#### 通过名称检索

HTMLDocument.getElementsByName()方法。



#### 通过类名检索

HTMLDocument.getElementByClassName()方法是HTML5新增的最受人欢迎的一个方法。该方法接收一个包含一个或多个类名的字符串，返回一个NodeList。

```javascript
//取得所有类中包含 username 和 current 的元素
var allCurrentUsernames = document.getElementsByClassName("username current");
```





#### 父节点、子节点、兄弟节点



| 属性名             | 能够获取的节点              |
| --------------- | -------------------- |
| parentNode      | 父节点                  |
| childNode       | 子节点**列表** (NodeList) |
| firstChild      | 第一个子节点               |
| lastChild       | 最后一个子节点              |
| nextSibling     | 下一个兄弟节点              |
| previousSibling | 上一个兄弟节点              |



#### XPath

通过XPath可以实现复杂的节点指定操作。但是用法比较复杂。



#### Selector API 

Selector API是一种比XPath更加简单，同时又保持了相当灵活的元素获取方式。

querySelector()方法接收一个CSS选择符，返回第一个与条件相符的元素。如果没有找到则返回null。

querySelectorAll()方法返回一个 NodeList的实例。



### 节点的创建与新增

Document.createElement()方法或Document.createTextNode()方法来创建节点。然后通过Node.appendChild()、Node.insertBefore()方法将创建的节点加入DOM树中。



示例：

```html
<body>
<div id="div1">
    <p id="p1">这是一个段落</p>
    <p id="p2">这是另一个段落</p>
</div>
</body>
<script>
    //  创建新的 <p> 元素
    var para=document.createElement("p");
    //  如需向 <p> 元素添加文本，您必须首先创建文本节点。这段代码创建了一个文本节点：
    var node=document.createTextNode("这是新段落。");
    //  然后必须向 <p> 元素追加这个文本节点
    para.appendChild(node);
    //  最后您必须向一个已有的元素追加这个新元素
    var element=document.getElementById("div1");
    //  向这个已有的元素追加新元素
    element.appendChild(para);
</script>
```









### 节点的内容更改

略

### 节点的删除

Node.removeChild()方法来删除节点。





### innerHTML/textContent

HTMLElement的innerHTML属性，可以简单的给文档插入大量新 HTML 标记。

在**读模式**下,innerHTML 属性返回与调用元素的所有子节点(包括元素、注释和文本节点)对应的 HTML 标记。在**写模式**下, innerHTML 会根据指定的值创建新的 DOM 树,然后用这个 DOM 树完全替换调用元素原先的所有子节点。



innerHTML属性可以以HTML字符串的形式被引用，而textContent属性则可以取得包含子元素在内的纯文本部分。因此，如果设定 textContent 属性，就能够将子元素全部删除，并将其替换为一个文本节点。

```javascript
var elem = document.getElementById('foo');
elem.innerHTML = '<div>This is a new div element.</div>';
```



```javascript
var elem = document.getElementById('foo');
//不会创建 div元素。在浏览器中将会直接显示该字符串
elem.textContent = '<div>This is a new div element.</div>';
```



使用 innerHTML 属性也有一些限制。比如,在大多数浏览器中,通过 innerHTML 插入`<script>`
元素**并不会执行其中的脚本**。





### 焦点管理



```javascript
var button = document.getElementById("myButton");
// 通过调用方法获取焦点
button.focus();
// activeElement属性引用当前获取焦点的元素
alert(document.activeElement === button); //true
```





## 事件



document对象的readyState属性的属性值：

* loading，正在加载文档
* complete，已经加载完文档



使用 document.readyState 的最恰当方式,就是通过它来实现一个指示文档已经加载完成的指示器。在这个属性得到广泛支持之前,要实现这样一个指示器,必须借助 onload 事件处理程序设置一个标签,表明文档已经加载完毕。

基本用法：

```javascript
if (document.readyState == "complete"){
	//执行操作
}

```



### 事件流

如果你单击了某个按钮,他们都认为单击事件不仅仅发生在按钮上。换句话说,在单击按钮的同时,你也单击了按钮的容器元素,甚至也单击了整个页面。

**事件流**描述的是从页面中接收事件的顺序。事件流分为事件冒泡和事件捕获。

**事件冒泡：**即事件开始时由最具体的元素(文档中嵌套层次最深的那个节点)接收,然后**逐级向上传播**到较为不具体的节点(文档)。

**事件捕获：**事件捕获的思想是不太具体的节点应该更早接收到事件,而最具体的节点应该最后接收到事件。事件捕获的用意在于在事件**到达预定目标之前**捕获它。



“**DOM2级事件**”规定的事件流包括**三个阶段**: 

* 事件捕获阶段
* 处于目标阶段
* 事件冒泡阶段

首先发生的是事件捕获,为截获事件提供了机会。然后是实际的目标接收到事件。最后一个阶段是冒泡阶段,可以在这个阶段对事件做出响应。

<img src="https://farm5.staticflickr.com/4395/36346038434_0e0cac235b_o.png" width="345" height="215" alt="DOM2级事件">





### 事件处理程序

事件处理程序的名字以 `on` 开头。为事件指定处理程序的方式有好几种。

比如事件程序：onclick

#### HTML事件处理程序

某个元素支持的每种事件,都可以使用一个**_与相应事件处理程序同名_**的 HTML 特性(属性)来指定。该特性的**值**是js代码。(指定为HTML元素的属性)

通过与事件程序onclick相同的html特性来指定点击事件的处理程序：

```javascript
<input type="button" value="Click Me" onclick="alert('Clicked')" />
```



> 注意：这里onclick全部都是小写字母。html不会区分大小写字母，但是为了提高代码的兼容性建议全部使用小写字母。



**也可以调用在页面其他地方定义的脚本：**

```javascript
<script type="text/javascript">
	function showMessage(){
		alert("Hello world!");
	}
</script>

<input type="button" value="Click Me" onclick="showMessage()" />
```

**事件处理程序中的代码在执行时，有权访问全局作用域中的任何代码**。

首先,这样会创建一个封装着元素属性值的函数。这个函数中有一个局部变量 event,也就是**事件对象**

通过 event 变量,可以直接访问**事件对象**。



在这个函数内部，this值等于事件的目标元素：

```html
<!-- 输出: 目标元素是我input -->
<input type="button" value="目标元素是我input" onclick="alert(this.value)">
```



在 HTML 中指定事件处理程序的缺点：

* 首先,存在一个时差问题。因为用户可能会在HTML 元素一出现在页面上就触发相应的事件,但当时的事件处理程序有可能尚不具备执行条件。
* 另一个缺点是,这样扩展事件处理程序的作用域链在不同浏览器中会导致不同结果。
* 通过 HTML 指定事件处理程序的最后一个缺点是 HTML 与 JavaScript 代码紧密耦合。

而这正是许多开发人员摒弃 HTML 事件处理程序,**转而使用 JavaScript 指定事件处理程序**的原因所在。



#### DOM0级事件处理程序

通过 JavaScript 指定事件处理程序的传统方式,就是将一个函数赋值给一个事件处理程序属性。(指定为DOM元素的属性)

要使用 JavaScript 指定事件处理程序,首先必须取得一个要操作的对象的引用。每个元素(包括 window 和 document)都有自己的事件处理程序属性,这些属性通常全部小写,例如 onclick。将这种属性的值设置为一个函数,就可以指定事件处理程序

```javascript
//获取要操作对象的引用
var btn = document.getElementById("myBtn");
//为该对象的事件按处理程序属性设置为一个函数
btn.onclick = function(){
	alert("Clicked");
};

//可以这样删除事件处理程序
btn.onclick = null;
```

使用 DOM0 级方法指定的事件处理程序被认为是元素的方法。因此,这时候的事件处理程序是在元素的作用域中运行；换句话说，程序中的 **this 引用当前元素**。

**以这种方式添加的事件处理程序会在事件流的冒泡阶段被处理。**



> 在某些情况下，利用事件的执行上下文(即this)，可以简化代码。



#### DOM2级事件处理程序

“DOM2 级事件”定义了两个方法，用于处理指定和删除事件处理程序的操作: `addEventListener()`
和 `removeEventListener()`。

所有 **DOM 节点**中都包含这两个方法,并且它们都接受 3 个参数:

* 要处理的事件名
* 作为事件处理程序的函数
* 一个布尔值。如果是 true，表示在捕获阶段调用事件处理程序；如果是 false，表示在冒泡阶段调用事件处理程序。

示例：

```javascript
var btn = document.getElementById("myBtn");

btn.addEventListener("click", function(){
	alert(this.id);
}, false);

//第二个事件处理程序
btn.addEventListener("click", function(){
	alert("Hello world!");
}, false);
```

与 DOM0 级方法一样,这里添加的事件处理程序也是在其依附的元素的作用域中运行。

使用 DOM2 级方法添加事件处理程序的主要好处是 **可以添加多个事件处理程序**。并且会按顺序触发。



通过 addEventListener()添加的事件处理程序只能使用 removeEventListener()来移除;移除时传入的参数与添加处理程序时使用的参数相同。**这也意味着通过 addEventListener()添加的匿名函数将无法移除**。





#### 跨浏览器的事件处理程序

略



### 事件对象

在触发 DOM 上的某个事件时,会产生一个事件对象 event,这个对象中包含着所有与事件有关的
信息。包括导致事件的元素、事件的类型以及其他与特定事件相关的信息。



### 事件类型

“DOM3级事件”规定了以下几类事件：

* UI(User Interface，用户界面)事件，当用户与页面上的元素交互时触发;
* 焦点事件，当元素获得或失去焦点时触发;
* 鼠标事件，当用户通过鼠标在页面上执行操作时触发;
* 滚轮事件，当使用鼠标滚轮(或类似设备)时触发;
* 文本事件，当在文档中输入文本时触发;
* 键盘事件，当用户通过键盘在页面上执行操作时触发;
* 合成事件，当为 IME(Input Method Editor,输入法编辑器)输入字符时触发;
* 变动(mutation)事件，当底层 DOM 结构发生变化时触发。
* 变动名称事件，当元素或属性名变动时触发。此类事件已经被废弃,没有任何浏览器实现它们,因此本章不做介绍。




常见的UI事件：

* load：当**页面**完全加载后在 window 上面触发,当所有框架都加载完毕时在框架集上面触发,
  当**图像**加载完毕时在	`<img>`元素上面触发,或者当**嵌入的内容**加载完毕时在`<object>`元素上面
  触发。
* unload
* select



> 一般来说,在 window 上面发生的任何事件都可以在<body>元素中通过相应的特性来指定,因为在 HTML 中无法访问 window 元素。




## 客户端JavaScript实践↓



### 访问和变更样式

JavaScript实现了动态的样式变更，其目的是为用户提供视觉反馈。

**样式变更的方法：**

* 通过 className 属性更改class名

* 通过 classList 属性更改 class 名

* 更改style 属性

* 直接切换样式表







#### 通过 className 属性更改class名

即事先通过 CSS 定义好对应于**变更前**与**更改后**的 class 名的样式，然后通过 className 属性来设置 class。

同时也可利用移除 class 这一技巧。

注意：在变更 class 名后相关元素的样式也会改变。

  ```js
  var foo = document.getElementById('foo');
  foo.onclick = function toggleStyle(){
      this.className = (this.className === 'foo-before') ? 'foo-after' : 'foo-before';
  }
  ```

  



#### 通过 classList 属性更改 class 名

html5 新增的属性。比如某个标签可能会同时属于多个 class 值 ，`class="foo-before foo-after"`



  ```js
  var foo = document.getElementById('foo');
  foo.onclick = function toggleStyle(){
      this.classList.toggle('foo-before'); 
      this.classList.toggle('foo-after');
  }
  ```

  



可以使用 classList 属性的方法：

| 方法名             | 说明                                       |
| --------------- | ---------------------------------------- |
| contains(clazz) | 判断在class名中是否含有 clazz                     |
| add(clazz)      | 向class名中添加clazz                          |
| remove(clazz)   | 从class名中删除clazz                          |
| toggle(clazz)   | 如果在class名中含有clazz则将它删除，否则向class名中添加clazz |





#### 更改style 属性

通过这种方法，样式的更改范围明确的限定在这个元素。



**属性格式转换：**

在 style 特性中指定的任何 CSS 属性都将表现为这个**style对象**的相应**属性**。对于使用短划线`-`(分隔不同的词汇,例如 background-image)的 CSS 属性名，必须将其转换成驼峰大小写形式,才能通过 JavaScript 来访问；因为 `-` 在JS中被视为减号。



| CSS属性            | 对应的JavaScript属性格式     |
| ---------------- | --------------------- |
| background-image | style.backaroundImage |
| color            | style.color           |
| display          | style.display         |
| font-family      | style.fontFamily      |



但对于CSS的 float 属性比较特殊，因为float是JS中的保留字，因此不能用作属性名；但是规定了其对应的属性为cssFloat。

只要取得一个有效的 DOM 元素的引用,就可以随时使用 JavaScript 为其设置样式。

```javascript
var myDiv = document.getElementById("myDiv");
//设置背景颜色
myDiv.style.backgroundColor = "red";

//改变大小
myDiv.style.width = "100px";
myDiv.style.height = "200px";
//指定边框
myDiv.style.border = "1px solid black";
```

在以这种方式改变样式时，元素的外观会自动被更新。

如果没有为元素设置 style 特性,那么 style 对象中可能会包含一些默认的值

> 在标准模式下,所有度量值都必须指定一个度量单位。在混杂模式下,可以将
> style.width 设置为 "20" ,浏览器会 假设它是 "20px"。在实践中,最好始
> 终都指定度量单位。



style对象的一些属性和方法：

* **cssText**；可以访问和设置style特性中的CSS代码。设置 cssText 是为元素应用多项变化最快捷的方式,因为可以一次性地应用所有变化。
* length；元素的 CSS 属性的数量
* item()；返回给定位置的 CSS 属性的名称。
* getPropertyValue(propertyName) :  返回给定**属性的**字符串**值**。
* ...




#### 直接切换样式表

如果将 link 元素与 style 元素的 disabled 属性设置为 true，相应的样式表就将被 **禁用**。

对于已经事先准备了一些样式主题，需要让用户选择自己喜欢的主题以显示页面内容的情况，就可以通过这种方式实现。



```js
function change(id,enable) {
    //在勾选了复选框之后启用样式
    document.getElementById(id).disabled = !enable;
}
```



### 位置的设定

更改DOM元素的位置，这里是通过设置该元素的 `position` 属性来完成。略





### 位置

如果要实现在鼠标点击位置附近显示一个框这样的效果，则必须要知道点击位置。在 `MouseEvent`被触发时，相应的 Event 对象提供了多个属性来获取这一位置。这是的问题在于，点击的位置是以什么为基准来表示的？

略





### 动画

使样式可以以一定的速率逐渐变化，可以让js定期执行相应任务来实现，那么可以使用 `setInterval` 函数。



通过 CSS 实现的动画性能比通过 js 实现的动画性能更好。略






### AJAX

 Ajax，是对 Asynchronous JavaScript + XML 的简写。这一技术能够向服务器请求额外的数据而无须卸载页面，会带来更好的用户体验。

Ajax 技术的核心是 XMLHttpRequest 对象(简称 **XHR**)。XHR 为向服务器发送请求和解析服务器响应提供了流畅的接口。能够**以异步方式**从服务器取得更多信息。Ajax 通信与数据格式无关；这种技术就是无须刷新页面即可从服务器取得数据，但不一定是 XML 数据。



> JS 中直接使用 Ajax 推荐《JavaScript编程全解》
>
> jQuery操作 ajax 更方便





#### 同源限制（跨域问题）

安全限制：浏览器的同源策略

默认情况下，JavaScript在发送AJAX请求时，URL的域名必须和当前页面完全一致（协议、域名、端口三者全都一致）。



跨域问题，来自于浏览器的同源策略

[AJAX - 廖雪峰的官方网站](https://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000/001434499861493e7c35be5e0864769a2c06afb4754acc6000 "AJAX - 廖雪峰的官方网站") 不错，比阮大侠的更通俗易懂

[同源限制 - JavaScript 教程 - 网道](https://wangdoc.com/javascript/bom/same-origin.html "同源限制 - JavaScript 教程 - 网道")



#### CORS通信



使用CORS解决资源的跨域权限问题的方法：

- 在服务端设置response的 `Acces-Controll-Allow-Origin:某域 `



[CORS 通信 - JavaScript 教程 - 网道](https://wangdoc.com/javascript/bom/cors.html "CORS 通信 - JavaScript 教程 - 网道")



### 表单



#### 表单元素





#### 表单控件





#### 内容验证





#### 可用于验证的事件





#### 使用表单而不产生页面跳转的方法





### JSON

《JavaScript高级程序设计》



ECMAScript 5 对解析 JSON 的行 为进行规范，定义了全局对象 JSON    。

JSON 不支持变量、函数或对象实例，它就是一种表示结构化数据的格式    。



**对象：**

一个 **JavaScript 中的对象**字面量 ：

```js
// 不同点一： 有声明变量
var person = {
	name: "Nicholas", // 这里属性名也是可以加引号的
	age: 29
}; //不同点二： 末尾有分号
```

但 **JSON中的对象**必须要求给属性加**双**引号：

```json
{
	"name": "Nicholas",
	"age": 29
}
```



**数组：**

JSON 数组采用的就是 JavaScript 中的数组字面量形式。    





解析与序列化：

JSON对象的两个方法：

- `stringfy()` 用于把JS对象序列化为JSON字符串
- `parse()` 把JSON字符串解析为原生 JS 



### Cookie

[Cookie - JavaScript 教程 - 网道](https://wangdoc.com/javascript/bom/cookie.html "Cookie - JavaScript 教程 - 网道")

另见 java web 的相关文章





### 浏览器缓存Cache








## 进阶学习

《JavaScript高级程序设计》

使用QUnit测试JavaScript。





### 表单脚本



### 错误处理与调试











`evel()` 函数 

  

## 学习资料

[JavaScript 简介 - 菜鸟教程](http://www.runoob.com/js/js-intro.html "JavaScript 简介 - 菜鸟教程")

[廖雪峰:JavaScript教程](http://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000)

阮大侠当前(2017)正在创造的一部教程：[JavaScript 标准参考教程（alpha）](http://javascript.ruanyifeng.com/) ，该教程已迁移到 [JavaScript 教程 - 网道](https://wangdoc.com/javascript/index.html "JavaScript 教程 - 网道")

你不知道的JavaScritp [You-Dont-Know-JS at 1ed-zh-CN](https://github.com/getify/You-Dont-Know-JS/tree/1ed-zh-CN "getify/You-Dont-Know-JS at 1ed-zh-CN")

《JavaScript编程全解》介绍了一些实用方法。  

《JavaScript高级程序设计》  



