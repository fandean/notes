> 《ECMAScript入门》摘抄

## ECMAScript 6简介

ECMAScript 6.0（以下简称 ES6）是 JavaScript 语言的下一代标准，已经在2015年6月正式发布了。

ECMAScript 和 JavaScript 的关系是，前者是后者的规格，后者是前者的一种实现（另外的 ECMAScript 方言还有 Jscript 和 ActionScript）。



### 转码器

Babel转码器：

[**Babel**](https://babeljs.io/) 是一个广泛使用的 ES6 转码器，可以将 ES6 代码转为 ES5 代码，从而在现有环境执行。

Babel 的配置文件是`.babelrc`，存放在项目的根目录下。使用 Babel 的第一步，就是配置这个文件。

Babel提供`babel-cli`工具，用于命令行转码。

Babel 提供一个[REPL在线编译器](https://babeljs.io/repl/)，可以在线将 ES6 代码转为 ES5 代码。转换后的代码，可以直接作为 ES5 代码插入网页运行。



Traceur转码器：

Google 公司的[Traceur](https://github.com/google/traceur-compiler)转码器，也可以将 ES6 代码转为 ES5 代码。

Traceur 允许将 ES6 代码直接插入网页。首先，必须在网页头部加载 Traceur 库文件。





## let和const命令

**let：**

使用`let`，声明的变量仅在**块级作用域**内有效。(之前在js中是没有块级作用域的)。

`let`实际上为 JavaScript 新增了块级作用域。

使用let可以避免下面的场景：

* 第一种场景，内层变量可能会覆盖外层变量。
* 第二种场景，用来计数的循环变量泄露为全局变量。




**const:**

`const`声明一个只读的常量。一旦声明，常量的值就不能改变。

`const`的作用域与`let`命令相同：只在声明所在的块级作用域内有效。

如果const用于引用类型，则说明该指针是常量。



ES6为了保持兼容性，`var`命令和`function`命令声明的全局变量，依旧是顶层对象的属性；另一方面规定，`let`命令、`const`命令、`class`命令声明的全局变量，不属于顶层对象的属性。也就是说，从ES6开始，全局变量将逐步与顶层对象的属性脱钩。



## 变量的解构赋值

ES6 允许按照一定模式，**从数组和对象中提取值**，对变量进行赋值，这被称为**解构（Destructuring）**。

注意：这里重点是赋值。

### 数组的结构赋值

```javascript
//ES6之前：定义变量，并赋值
let a = 1;
let b = 2;
let c = 3;
```

```javascript
//ES6 中相同的效果：定义变量a b c，并赋值
let [a, b, c] = [1, 2, 3];
```

本质上，这种写法属于“模式匹配”，**只要等号两边的模式相同**，左边的变量就会被赋予对应的值。

事实上，只要某种数据结构具有 Iterator 接口，都可以采用数组形式的解构赋值。



### 默认值

```javascript
let [x, y = 'b'] = ['a']; // x='a', y='b'
//对应的值为 undefined 时才能使用默认值
let [x, y = 'b'] = ['a', undefined]; // x='a', y='b'
```



### 对象的解构赋值

```javascript
//变量名与属性名相同，不要求顺序
let { bar, foo } = { foo: "aaa", bar: "bbb" };
foo // "aaa"
bar // "bbb"

let { baz } = { foo: "aaa", bar: "bbb" };
baz // undefined

let abc = { foo2: "aaa", bar2: "bbb" };
//也可以这样
let { bar2, foo2 } = abc;
```



### 字符串的解构赋值

```javascript
const [a, b, c, d, e] = 'hello';
a // "h"
b // "e"
c // "l"
d // "l"
e // "o"
```



### 函数参数的解构赋值

```javascript
//在传入参数的那一刻，数组参数就被解构成变量x和y
//并且可以使用默认值
function add([x=0, y=0]){
  return x + y;
}

add([1, 2]); // 3
```



用途：

* 交换变量的值：`[x,y]=[y,x];`
* 从函数返回多个值：`return [1,2,3];`
* 函数参数的定义
* 提取Json数据：尤其有用
* 函数参数的默认值
* 遍历Map结构



## 字符串的扩展

ES6 加强了对 Unicode 的支持，并且扩展了字符串对象。



### 模板字符串

传统JS，输出模板通常使用下面的写法，通过 加号 相连：

```javascript
$('#result').append(
  'There are <b>' + basket.count + '</b> ' +
  'items in your basket, ' +
  '<em>' + basket.onSale +
  '</em> are on sale!'
);
```

而利用ES6的模板字符串可以这样解决：(类似shell中的字符串)

```javascript
$('#result').append(`
  There are <b>${basket.count}</b> items
   in your basket, <em>${basket.onSale}</em>
  are on sale!
`);
```

模板字符串（template string）是增强版的字符串，用反引号（`）标识。它可以当作普通字符串使用，也可以用来定义多行字符串，或者在字符串中嵌入变量。

```javascript
// 普通字符串
`In JavaScript '\n' is a line-feed.`

// 多行字符串
`In JavaScript this is
 not legal.`

console.log(`string text line 1
string text line 2`);

// 字符串中嵌入变量
var name = "Bob", time = "today";
`Hello ${name}, how are you ${time}?`

/* 还能进行计算 */
var x = 1;
var y = 2;

`${x} + ${y} = ${x + y}`
// "1 + 2 = 3"

`${x} + ${y * 2} = ${x + y * 2}`
// "1 + 4 = 5"

var obj = {x: 1, y: 2};
`${obj.x + obj.y}`
// "3"

/* 还可以调用函数 */
function fn() {
  return "Hello World";
}

`foo ${fn()} bar`
// foo Hello World bar
```





## 正则的扩展

略



## 数值的扩展

ES6 在`Number`对象上，新提供的方法：

`Number.isFinite()`用来检查一个数值是否为有限的（finite）。

`Number.isNaN()`用来检查一个值是否为`NaN`。



ES2016 新增了一个指数运算符（`**`）。



## 函数的扩展

ES6 允许为函数的参数设置默认值，即直接写在参数定义的后面。（之前是不能这样做的）

参数默认值不是传值的，而是每次都重新计算默认值表达式的值。也就是说，参数默认值是惰性求值的。

```javascript
let x = 99;
function foo(p = x + 1) {
  console.log(p);
}

foo() // 100

x = 100;
foo() // 101
```



参数默认值可以与解构赋值的默认值，结合起来使用。



### 参数的位置

通常情况下，定义了默认值的参数，应该是函数的尾参数。因为这样比较容易看出来，到底省略了哪些参数。如果**非尾部的参数设置默认值**，实际上这个参数是**没法省略**的。



### 作用域

一旦设置了参数的默认值，函数进行声明初始化时，参数会形成一个单独的作用域（context）。等到初始化结束，这个作用域就会消失。

```javascript
var x = 1;

function f(x, y = x) {
  console.log(y);
}

f(2) // 2
```



### rest参数

ES6 引入 rest 参数（形式为`...变量名`），用于获取函数的多余参数，这样就不需要使用`arguments`对象了。rest 参数搭配的变量是一个数组，该变量将多余的参数放入数组中。

注意，rest 参数之后不能再有其他参数

```javascript
function add(...values) {
  let sum = 0;

  for (var val of values) {
    sum += val;
  }

  return sum;
}

add(2, 5, 3) // 10
```



### 箭头函数

ES6 允许使用“箭头”（`=>`）定义函数。

```javascript
var f = function(v) {
  return v;
};

//等效的箭头函数
var f = v => v;
```

如果箭头函数不需要参数或需要多个参数，就使用一个圆括号代表参数部分。

```javascript
var f = () => 5;
// 等同于
var f = function () { return 5 };

var sum = (num1, num2) => num1 + num2;
// 等同于
var sum = function(num1, num2) {
  return num1 + num2;
};
```

如果箭头函数的代码块部分多于一条语句，就要使用大括号将它们括起来，并且使用`return`语句返回。

```javascript
var sum = (num1, num2) => { return num1 + num2; }
```

由于大括号被解释为代码块，所以如果箭头函数直接返回一个对象，必须在对象外面加上括号，否则会报错。

```javascript
// 报错
let getTempItem = id => { id: id, name: "Temp" };

// 不报错
let getTempItem = id => ({ id: id, name: "Temp" });
```



箭头函数的一个用处是简化回调函数。

```javascript
// 正常函数写法
var result = values.sort(function (a, b) {
  return a - b;
});

// 箭头函数写法
var result = values.sort((a, b) => a - b);
```



### 注意点

（1）函数体内的`this`对象，就是定义时所在的对象，而不是使用时所在的对象。

（2）不可以当作构造函数，也就是说，不可以使用`new`命令，否则会抛出一个错误。

（3）不可以使用`arguments`对象，该对象在函数体内不存在。如果要用，可以用 rest 参数代替。

（4）不可以使用`yield`命令，因此箭头函数不能用作 Generator 函数。

上面四点中，第一点尤其值得注意。`this`对象的指向是可变的，但是在箭头函数中，它是固定的。

```javascript
function foo() {
  setTimeout(() => {
    console.log('id:', this.id);
  }, 100);
}

var id = 21;

foo.call({ id: 42 });
// id: 42
```

上面代码中，`setTimeout`的参数是一个箭头函数，这个箭头函数的定义生效是在`foo`函数生成时，而它的真正执行要等到100毫秒后。如果是普通函数，执行时`this`应该指向全局对象`window`，这时应该输出`21`。但是，箭头函数导致`this`总是指向函数定义生效时所在的对象（本例是`{id: 42}`），所以输出的是`42`。



> 还有很多内容，略



## 数组的扩展

略



## 对象的扩展

略





## ...





## Promise对象

> 这个也是重点

Promise 是异步编程的一种解决方案，比传统的解决方案——回调函数和事件——更合理和更强大。

所谓`Promise`，简单说就是一个容器，里面保存着某个未来才会结束的事件（通常是一个异步操作）的结果。

`Promise`对象有以下两个特点：

* 对象的状态不受外界影响。`Promise`对象代表一个异步操作，有三种状态：`pending`（进行中）、`fulfilled`（已成功）和`rejected`（已失败）。只有异步操作的结果，可以决定当前是哪一种状态，任何其他操作都无法改变这个状态。这也是`Promise`这个名字的由来，它的英语意思就是“承诺”，表示其他手段无法改变。
* 一旦状态改变，就不会再变，任何时候都可以得到这个结果。`Promise`对象的状态改变，只有两种可能：从`pending`变为`fulfilled`和从`pending`变为`rejected`。只要这两种情况发生，状态就凝固了，不会再变了，会一直保持这个结果，这时就称为 resolved（已定型）。如果改变已经发生了，你再对`Promise`对象添加回调函数，也会立即得到这个结果。这与事件（Event）完全不同，事件的特点是，如果你错过了它，再去监听，是得不到结果的。

有了`Promise`对象，就可以将异步操作以同步操作的流程表达出来，避免了层层嵌套的回调函数。此外，`Promise`对象提供统一的接口，使得控制异步操作更加容易。



`Promise`也有一些缺点：

* 首先，无法取消`Promise`，一旦新建它就会立即执行，无法中途取消。
* 其次，如果不设置回调函数，`Promise`内部抛出的错误，不会反应到外部。
* 第三，当处于`pending`状态时，无法得知目前进展到哪一个阶段（刚刚开始还是即将完成）。

如果某些事件不断地反复发生，一般来说，使用 [Stream](https://nodejs.org/api/stream.html) 模式是比部署`Promise`更好的选择。



> [Promise对象 -- JavaScript 标准参考教程（alpha）](http://javascript.ruanyifeng.com/advanced/promise.html )
>
> [Promise - 廖雪峰的官方网站](https://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000/0014345008539155e93fc16046d4bb7854943814c4f9dc2000)
>
> [Promise 对象 - ECMAScript 6入门](http://es6.ruanyifeng.com/#docs/promise "Promise 对象 - ECMAScript 6入门")
>
> 你不知道的JavaScript [You-Dont-Know-JS](https://github.com/getify/You-Dont-Know-JS/blob/1ed-zh-CN/async%20%26%20performance/README.md "You-Dont-Know-JS/README.md at 1ed-zh-CN · getify/You-Dont-Know-JS")



## Class的基本语法

ES6 提供了更接近传统语言的写法，引入了 Class（类）这个概念，作为对象的模板。通过`class`关键字，可以定义类。

基本上，ES6 的`class`可以看作只是一个**语法糖**，它的绝大部分功能，ES5 都可以做到，新的`class`写法只是让对象原型的写法更加清晰、更像面向对象编程的语法而已。

```javascript
//定义类
class Point {
  constructor(x, y) {
    this.x = x;
    this.y = y;
  }

  toString() {
    return '(' + this.x + ', ' + this.y + ')';
  }
}
```

注意，定义“类”的方法的时候，前面不需要加上`function`这个关键字，直接把函数定义放进去了就可以了。另外，方法之间不需要逗号分隔，加了会报错。

类必须使用`new`调用，否则会报错。这是它跟普通构造函数的一个主要区别，后者不用`new`也可以执行。



### Class表达式

与函数一样，类也可以使用表达式的形式定义。

```javascript
const MyClass = class Me {
  getClassName() {
    return Me.name;
  }
};
```





## Class的继承



```javascript
class ColorPoint extends Point {
  constructor(x, y, color) {
    super(x, y); // 调用父类的constructor(x, y)
    this.color = color;
  }

  toString() {
    return this.color + ' ' + super.toString(); // 调用父类的toString()
  }
}
```

上面代码中，`constructor`方法和`toString`方法之中，都出现了`super`关键字，它在这里表示父类的构造函数，用来新建父类的`this`对象。

子类必须在`constructor`方法中调用`super`方法，否则新建实例时会报错。这是因为子类没有自己的`this`对象，而是继承父类的`this`对象，然后对其进行加工。如果不调用`super`方法，子类就得不到`this`对象。

如果子类没有定义`constructor`方法，这个方法会被默认添加，代码如下。也就是说，不管有没有显式定义，任何一个子类都有`constructor`方法。



## Module的语法



模块功能主要由两个命令构成：`export`和`import`。`export`命令用于规定模块的对外接口，`import`命令用于输入其他模块提供的功能。



### export命令

一个模块就是一个独立的文件。该文件内部的所有变量，外部无法获取。如果你希望外部能够读取模块内部的某个变量，就必须使用`export`关键字输出该变量。`export`还可用于函数和类。

示例：

```javascript
//单个输出
export var firstName = 'Michael';
export var lastName = 'Jackson';
export var year = 1958;
```

```javascript
//profile文件中
var firstName = 'Michael';
var lastName = 'Jackson';
var year = 1958;

export {firstName, lastName, year};
```


```javascript
//输出函数
export function multiply(x, y) {
  return x * y;
};
```


```javascript
//使用as进行重命名
function v1() { ... }
function v2() { ... }

export {
  v1 as streamV1,
  v2 as streamV2,
  v2 as streamLatestVersion
};
```


```javascript
/*   
 *	错误写法 
 */
// 报错
export 1;

// 报错
var m = 1;
export m;

/*   
 *	正确写法 
 */
// 写法一
export var m = 1;

// 写法二
var m = 1;
export {m};

// 写法三
var n = 1;
export {n as m};
```




### import命令


```javascript
// main.js
import {firstName, lastName, year} from './profile';

function setName(element) {
  element.textContent = firstName + ' ' + lastName;
}
```



### export default命令

从前面的例子可以看出，使用`import`命令的时候，用户**需要知道所要加载的变量名或函数名**，否则无法加载。

为了给用户提供方便，可以用`export default`命令，为模块**指定默认输出**。

```javascript
// export-default.js
export default function () {
  console.log('foo');
}
```



其他模块加载该模块时，`import`命令可以为该匿名函数**指定任意名字**。

```javascript
// import-default.js
import customName from './export-default';
customName(); // 'foo'
```





## 学习资料

[ECMAScript 6 入门 - 阮一峰](http://es6.ruanyifeng.com/ "ECMAScript 6 入门 - ECMAScript 6入门")

[下一代JavaScript标准ES6【育知同创】_腾讯课堂](https://ke.qq.com/course/229156 "下一代JavaScript标准ES6【育知同创】_腾讯课堂")

[ECMAScript 6 快速入门_腾讯课堂](https://ke.qq.com/course/181775 "ECMAScript 6 快速入门_腾讯课堂")
