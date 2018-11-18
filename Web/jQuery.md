## jQuery介绍



`$`表示jQuery本身，所有`$`都可使用 jquery替换。



jQuery核心特性：

* 取得文档中的元素：

  ```javascript
  $('div.content').find('p');
  ```

* 修改页面的外观：提供跨浏览器的解决方案

  ```javascript
  $('ul > li:first').addClass('active');
  ```

* 改变文档的内容：

  ```javascript
  $('#container').append('<a href="more.html">more</a>');
  ```

* 响应用户的交互操作：消除浏览器的不一致性

  ```javascript
  $('button.show-details').click(function(){
  	$('div.details').show();
  });
  ```

* 为页面添加动态效果：jQuery中内置了一批淡入、擦除之类的效果，以及制作新效果的工具包

  ```javascript
  $('div.details').slideDown();
  ```

* 无需刷新页面从服务器获取信息：消除浏览器的不一致性

  ```javascript
  $('div.details').load('more.html #content');
  ```

* 简化场景的JavaScript任务：

  ```javascript
  $.each(obj, function(key, value){
     total += value; 
  });
  ```

  ​



jQuery采用的策略：

* 利用CSS的已有优势。通过将查找页面元素的机制构建于CSS选择符之上。
* 支持扩展。为了避免特性蠕变(feature creep)，jQuery将特殊情况下使用的工具归入插件当中。
* 抽象浏览器的不一致性。
* **总是面向集合**。`.hide()` 之类的方法被设计成自动操作对象集合,而不是单独的对象。利用这种称作隐式迭代(implicit iteration)的技术,就可以抛弃那些臃肿的循环结构,从而大幅地减少代码量。
* 将多重操作集于一行。



**下载jQuery：**

开发时使用未压缩版；正式发布时使用压缩版。或者利用CDN(内容分发网络)。

下载最新版本，然后将其重命名为 jquery.js 。

**注意**：引用jQuery库文件的`<script>`标签,必须放在引用自定义脚本文件的`<script>`标签之前。否则,在我们编写的代码中将引用不到jQuery框架。



通常，JavaScript代码在浏览器初次遇到它们时就会执行(当然，当有一个函数，只有我们在代码中调用时它才会执行)，而在浏览器处理头部时,HTML还不会呈现样式。因此,我们需要将代码延迟到DOM可用时再执行。

通过使用`$(document).ready()`方法, jQuery支持我们预定在DOM加载完毕后调用某个函数，而不必等待页面中的图像加载。



jQuery 语法是通过选取 HTML 元素，并对选取的元素执行某些操作。

基础语法： `$(selector).action()`



为了创建jQuery对象,就要使用`$()`函数。通常，该函数需要一个**字符串参数**，参数中可以包含**任何CSS选择符表达式**。 该函数会返回一个新的jQuery对象实例。jQuery对象中会封装零个或多个DOM元素,并允许我们以多种不同的方式与这些DOM元素进行交互。





## 选择元素

有三种基本的选择符：标签名，ID和类。

还有jQuery独有的完全不同的自定义选择符。



### 基本过滤选择器

有用



```js
//获取 除首尾之外的 li
// 选择器一：
$("ul.nav li:not(:first,:last)")
//选择器二： 
$("ul.nav).children(":not(:first,:last)")
//可能需要加 '
$("ul.nav).children(":not(':first,:last')")
```







### 自定义选择符

但是其查找速度就会变慢。

自定义选择符通常跟在一个CSS选择符后面,基于已经选择的元素集的位置来查找元素。自定义选择符的语法与CSS中的伪类选择符语法相同,即选择符以冒号( :)开头。比如(`:eq()`)

> 注意：JavaScript数组采用从0开始的编号方式。而CSS时从1开始的。



示例：每隔一行为表格添加样式

通过两个非常有用的选择符：`:odd`(奇数)和`:even`(偶数)。注意这里奇偶是说数组(集合)的下标。

`:nth-child()`选择符：该选择符相对于元素的父元素而非当前选择的所有元素来计算位置。



基于上下文的内容选择元素：`:contains()`选择符

```javascript
$(document).ready(function() {
	$('tr:nth-child(odd)').addClass('alt');
	$('td:contains(Henry)').addClass('highlight');
});
```







基于表单的选择符：略











### DOM遍历方法

取得某个元素的父元素或者祖先元素都是基本的操作，而这正是jQuery的DOM遍历方法的用武之地。

`.filter()`筛选方法

`.next()`方法：只选择下一个最接近的同辈元素。

`.nextAll()`，`.prev()`，`.prevAll()`。

`.siblings()`能够选择处于相同DOM层次的所有其他元素，无论这些元素处于当前元素之前还是之后。

`.addBack()` 

`.parent()`，`.children()`



> 方法连缀的原理：几乎所有的jQuery方法都会返回一个jQuery对象。



### 访问DOM元素

使用场景：可能需要为另一个JavaScript库提供一组元素的结果集合。

为此jQuery提供了 `.get()`方法。比如 `.get(0)`，表示要访问jQuery对象所引用的第一个DOM元素，可以使用`.get(0)`。

jQuery为 `.get()` 方法提供了一种简写方式。比如 `.get(0)` 可以写成 `[0]`。



## jQuery表单校验插件

jQuery validation plugin ，学习方法，将官方提供的 demo。







## 事件

### 响应网页加载事件

让jQuery**响应网页的加载事件**,`$(document).ready()`事件处理程序可以用来触发函数中的代码。原生的window.onload事件也可以实现相同的效果。但是,它们在触发操作的时间上存在着微妙的差异,这种差异只有在加载的资源多到一定程度时才会体现出来。

当文档完全下载到浏览器中时,会触发`window.onload`事件。

通过 `$(document).ready()` 注册的事件处理程序,则会在DOM完全就绪并可以使用时调用。虽然这也意味着所有元素对脚本而言都是可以访问的,但是,**却不意味着**所有关联的文件都已经下载完毕。换句话说,当HTML下载完成并解析为DOM树之后,代码就可以运行。



并且可以通过 `$(document).ready()`**添加多个处理函数**，这些函数会按照注册它们的顺序依次执行。

> 为了保证JavaScript代码执行以前页面已经应用了样式,最好是在`<head>`
> 元素中把 `<link rel="stylesheet">` 标签和`<style>` 标签放在 `<script>`标
> 签前面。

> ```javascript
> function doStuff() {
> 	//执行某种任务......
> }
>
> window.onload = doStuff;
> ```
>
> **引用函数与调用函数：**
> 这里在将函数指定为处理程序时,省略了后面的圆括号,只使用了函数名。如果带着圆括号,函数会被立即调用;没有圆括号,函数名就只是函数的标识符或函数引用,可以用于在将来再调用函数。



### 处理简单的事件

通过`.on()`方法，可以指定任何DOM事件，并为该事件添加一种行为。多次调用`.on()`也没有任何问题，即可以按需为同一个事件追加更多的行为。



## 样式与动画





## 操作DOM





## 通过Ajax发送数据



还记得Promise对象吗？jQuery的`jqXHR`对象类似一个Promise对象，我们可以用链式写法来处理各种回调： 

```js
'use strict';

function ajaxLog(s) {
    var txt = $('#test-response-text');
    txt.val(txt.val() + '\n' + s);
}
```



```js
var jqxhr = $.ajax('/api/categories', {
    dataType: 'json'
}).done(function (data) {
    ajaxLog('成功, 收到的数据: ' + JSON.stringify(data));
}).fail(function (xhr, status) { //这里 xhr 应该是 jqXHR 对象
    ajaxLog('失败: ' + xhr.status + ', 原因: ' + status);
}).always(function () {
    ajaxLog('请求完成: 无论成功或失败都会调用');
});
```



接收的数据类型：缺省情况下根据响应的`Content-Type`猜测 



jQuery还提供了几个简便方法：

- get

  ```js
  var jqxhr = $.get('/path/to/resource', {
      name: 'Bob Lee',
      check: 1
  });
  ```

- post

  ```js
  var jqxhr = $.post('/path/to/resource', {
      name: 'Bob Lee',
      check: 1
  });
  ```

- getJSON：（通过get来获取一个JSON对象）

  ```js
  var jqxhr = $.getJSON('/path/to/resource', {
      name: 'Bob Lee',
      check: 1
  }).done(function (data) {
      // data已经被解析为JSON对象了
  });
  ```

  





> [AJAX - 廖雪峰的官方网站](https://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000/00143450046645491e306a4f74746daaef4d172f66335b5000 "AJAX - 廖雪峰的官方网站")





## 学习资料

《JQuery基础教程(第4版)》

[jQuery 教程 - 菜鸟教程](http://www.runoob.com/jquery/jquery-tutorial.html "jQuery 教程 - 菜鸟教程")

[jquery基础应用视频教程-麦子学院](http://www.maiziedu.com/course/789/ "jquery教程-jquery视频教程-jquery基础应用视频教程-麦子学院")







jQuery插件： (搜索)

- 17素材





jquery 1.8 用的多

jquery 2.* 版本开始不支持IE6~IE8



jquery的替代：

- MVVM
- 原生JS（JS标准和浏览器的进步）



如果不需要支持过于陈旧的浏览器版本，还有迭代成本，可以考虑放弃jquery

