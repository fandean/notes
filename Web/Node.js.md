

亲，小店自动发货百度网盘下载地址： 
2017整理妙味合集 在群组文件库里 
**<https://pan.baidu.com/mbox/homepage?short=c23xvDe> 
妙味远程班-官方明码标价的课目-总价值超2000元 
链接： **<http://pan.baidu.com/s/1pLftX8Z> 密码：i1lc 
请及时转存到您自己的网盘，方便今后永久学习。 

赠品一 传智播客Web大前端-北京就业班
链接： **<http://pan.baidu.com/s/1jICBS9o> 密码：5val 
赠品二 最新某内web前端教程 
链接： **<http://pan.baidu.com/s/1dFjadBr> 密码：t04r 

提醒：五星好评自动送大礼包： 
《赠品三 上百个实战项目视频教程600G》 
《赠品四 极客学院WEB前端教程+后端》 
《赠品五 麦子学院web前端开发工程师》 

注意: 资源文件数量过多。百度限制一次只能保存1000个文件。需要分多次保存, 不能一次性存过去



svn、git同步
本机装好node后，利用watch监听文件变化，**发现文件修改可自动提交到svn或git**。
团队共享的待办事项同步可以用这种方式处理。





## Node.js介绍


Node.js或者 Node，是一个可以让 JavaScript 运行在服务器端的平台。它可以让JavaScript **脱离浏览器**的束缚运行在一般的服务器环境下，**就像运行 Python**、 Perl、 PHP、 Ruby程序一样。

Node.js 不是一种独立的语言，与 PHP、Python、Perl、Ruby 的“既是语言也是平台”不同。Node.js 也不是一个 JavaScript 框架。

Node.js 是一个让 JavaScript 运行在浏览器之外的平台。它实现了诸如文件系统、模块、包、操作系统 API、网络通信等 Core JavaScript 没有或者不完善的功能。

Node.js 内建了 HTTP 服务器支持，所以不需要安装Apache之类的HTTP服务器。Node.js 还可以部署到非网络应用的环境下，比如一个命令行工具。Node.js 还可以调用C/C++ 的代码。



**异步式 I/O 与事件驱动：**

**Node.js 最大的特点就是采用异步式 I/O 与事件驱动的架构设计**。对于高并发的解决方案，传统的架构是多线程模型。Node.js 使用的是单线程模型,对于所有 I/O 都采用异步式的请求方式，避免了频繁的上下文切换Node.js 在执行的过程中会维护一个事件队列，程序在执行时进入事件循环等待下一个事件到来，每个异步式 I/O 请求完成后会被推送到事件队列，等待程序进程进行处理。

查询数据库示例：

```javascript
db.query('SELECT * from some_table', function(res) {
	res.output();
});
```

第二个参数是回调函数。进程不会阻塞直接执行后面的语句，直到进入事件循环。当数据库查询结果返回时,会将事件发送到事件队列,等到线程进入事件循环以后,才会调用之前的回调函数继续执行后面的逻辑。

Node.js 的异步机制是基于事件的,所有的磁盘 I/O、网络通信、数据库查询都以非阻塞的方式请求,返回的结果由事件循环来处理。

**异步事件模型的弊端：**它不符合开发者的常规线性思路,往往需要把一个完整的逻辑拆分为一个个事件,增加了开发和调试难度。针对这个问题,Node.js第三方模块提出了很多解决方案。

多线程带来的好处仅仅是在多核 CPU 的情况下利用更多的核，而Node.js的单线程也能带来同样的好处。



## 安装 Node.js

新版的Nodejs已经集成了npm。

Node.js：nodejs分为了**长期支持版**和**当前版本**。

Linux中安装nodejs的方法：

*  [官网](https://nodejs.org/en/download/) 下载压缩包解压到`/opt`目录，修改解压目录的所属用户和组，然后配置环境变量（推荐）；
*  或者使用PPA安装：[How to Install Latest Nodejs &amp; NPM on Ubuntu with PPA - TecAdmin](https://tecadmin.net/install-latest-nodejs-npm-on-ubuntu/# "How to Install Latest Nodejs &amp; NPM on Ubuntu with PPA - TecAdmin")


### npm 

见 npm 相关文章。




### 安装多版本管理器

Node.js 的社区开发了多版本管理器，用于在一台机器上维护多个版本的 Node.js 实例，方便按需切换。Node 多版本管理器(Node Version Manager,nvm)是一个通用的叫法，它目前有许多不同的实现。这里使用visionmedia/**n**。n 是一个十分简洁的 Node 多版本管理器。

如果已经安装好npm则可以简单的使用 `npm install -g n`来安装n。事实上，n 并不需要 Node.js 驱动，它只是 bash 脚本；我们可以在 <https://github.com/visionmedia/n> 下载它的代码，然后使用 `make install` 命令安装。

n的常用命令

```shell
# 查看帮助 
n --help

# 安装 6.9.5版本的nodejs。 
# 通过 n 获取的 Node.js 实例都会安装在 /usr/local/n/versions/ 目录中（看情况吧）
n 6.9.5

# 列出已经安装的 Node.js 。结果中 * 表示默认版本
n

# 版本切换，与安装node.js一样
n 6.9.5

# 指明使用某版本的 node.js 执行某脚本(比如 script.js)
n use 6.9.5 script.js
```

**注意：**n 无法管理通过其他方式安装的 Node.js 版本实例(如官方提供的安装包、发行版软件源、手动编译)





### 调试工具

node-inspector：是一个完全基于Node.js的开源在线调试工具，提供了强大的调试功能和友好的用户界面。

安装：

```
npm install -g node-inspector
```

连接要排错的脚本(这里是debug.js)的调试服务器：

```
node --debug-brk=5858 debug.js
```

然后启动node-inspector:

```
node-inspector
```

在浏览器(Chrome或Safari)中打开如下链接，即可显示出优雅的Web调试工具：

```
http://127.0.0.1:8080/debug?port=5858
```





## Node.js快速入门

《Node.js开发指南》在这一章讲解的非常清晰易懂。且章节短，可快速阅读并掌握。



Node.js REPL (Read Eval Print Loop:交互式解释器)



### 模块

可以把包理解成是实现了某个功能模块的集合。对使用者来说，模块和包的区别是透明的，因此经常**不作区分**。

模块是 Node.js 应用程序的基本组成部分,文件和模块是一一对应的。一个Node.js 文件就是一个模块。

如何在其他文件中获取这个模块？

Node.js 提供了 exports 和 require 两个对象,其中 exports 是模块公开的接口，require 用于从外部获取一个模块的接口,即所获取模块的 exports 对象。

> 详见： [module - Node.js API 文档](http://nodejs.cn/api/modules.html#modules_the_module_object) （必看）

示例：

```javascript
//module.js文件
var name;
//为exports对象添加属性
exports.setName = function(thyName){
    name = thyName;
};

exports.sayHello = function(){
    console.log('Hello ' + name);
};
```



```javascript
// getmodule.js

//获取到 模块中的 exports 对象
var myModule = require('./module');
//调用对象中的方法
myModule.setName('ByVoid');
myModule.sayHello();
```



**单次加载：**require不会重复加载模块

```javascript
var hello1 = require('./module');
hello1.setName('ByVoid');

//不会重复加载模块机制，意味着 hello2 和 hello1引用的是同一个对象
var hello2 = require('./module');
hello2.setName('ByVoid 2');

hello1.sayHello();
//输出结果为 Hello ByVoid 2 
```



**覆盖exports：**

有时我们只是想把一个对象封装到模块中，比如：

```javascript
//singleObject.js
function Hello(){
  var name;
  this.setName = function(thyName){
    name = thyName;
  };
  
  this.sayHello = function(){
      console.log('Hello ' + name);
  };
};

exports.Hello = Hello;
```

在其它文件中通过 `require('./singleObject').Hello`(即 先获取 exports，再调用其Hello属性)。

**但是这里我们可以使用简化方法：**

更改singleObject文件

```javascript
function Hello(){
      var name;
  this.setName = function(thyName){
    name = thyName;
  };
  
  this.sayHello = function(){
      console.log('Hello ' + name);
  };
};

//修改的内容
//表示直接输出 Hello对象，而非输出 exports 对象
module.exports = Hello;
```

然后我们可以通过如下方法获得该对象(Hello)：

```javascript
var Hello = require('./singleObject');
hello = new Hello();
hello.setName('ByVoid');
hello.sayHello();
```

讨论下面这条语句：

```javascript
//表示直接输出 Hello对象，而非输出 exports 对象
module.exports = Hello;
```

事实上， exports 本身仅仅是一个普通的空对象，即 `{}`，它专门用来声明接口，本质上是通过它为模块闭包1的内部建立了一个有限的访问接口。因为它没有任何特殊的地方，**所以可以用其他东西来代替**。



### 包

Node.js 的包是一个目录，其中包含一个 JSON 格式的包说明文件 package.json。

**严格**符合 CommonJS 规范的包应该具备以下特征:

* package.json 必须在包的顶层目录下;
* 二进制文件应该在 bin 目录下;
* JavaScript 代码应该在 lib 目录下;
* 文档应该在 doc 目录下;
* 单元测试应该在 test 目录下。




Node.js 在调用某个包时，会首先检查包中 package.json 文件的 main 字段，将其作为包的接口模块，如果 **package.json** 或 **main** 字段不存，会尝试寻找 index.js 或 index.node 作为包的接口。



main字段示例：

```javascript
{
	"main" : "./lib/interface.js"
}
```





### package.json

通过定制package.json，我们可以创建更复杂、更完善、更符合规范的包用于发布。

package.json 是 CommonJS 规定的用来描述包的文件





## Node.js核心模块



### global全局变量

全局变量无需使用调用 `require()` 引入。

全局变量在所有模块中均可使用。 但以下变量的**作用域**只在模块内:

* `__dirname`：当前模块的文件夹名称。等同于 [`__filename`](http://nodejs.cn/api/modules.html#modules_filename) 的 [`path.dirname()`](http://nodejs.cn/api/path.html#path_path_dirname_path) 的值。
* `__filename`：当前模块的文件名称---解析后的绝对路径。
* exports：这是一个对于 `module.exports` 的更简短的引用形式。
* module：对当前模块的引用。 `module.exports` 用于指定一个模块所导出的内容，即可以通过 `require()`访问的内容。
* require()：引入模块。



其它的全局对象：

* console：控制台，用于打印 `stdout` 和 `stderr`。
* process：用于描述当前node.js进程状态，提供了一个与操作系统的简单接口。
* Buffer：用于读取和操作二进制流。`Buffer` 类的实例类似于整数数组，但 `Buffer` 的大小是固定的、且在 V8 堆外分配物理内存。



其值是下面列出的特定元素类型的类型化数组构造函数。在下面的页面中，你会找到可用于包含任何类型的元素的任何类型数组的常见属性和方法



### Buffer

在 ECMAScript 2015 (ES6) 引入 [`TypedArray`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray) 之前，JavaScript 语言没有读取或操作二进制数据流的机制。 `Buffer` 类被引入作为 Node.js API 的一部分，使其可以在 TCP 流或文件系统操作等场景中处理二进制数据流。



> 参考：
>
> [Buffer - Node.js API 文档](http://nodejs.cn/api/buffer.html) 和下方的  腾讯课堂。

### 常用工具util

util提供常用函数的集合，用于弥补核心JavaScript的功能过于精简的不足。



* util.inspect()：能将任意对象转换为字符串，通常用于调试和错误输出。
* util.isArray()
* util.isRegExp()
* util.isDate()
* util.isError()
* util.format()







### 事件驱动 events

**events模块**：是Node.js最重要的模块。

**events 模块**不仅用于用户代码与Node.js下层事件循环的交互，还几乎被所有的模块依赖。

**events模块只提供了一个对象**，该对象就是 events.EventEmitter。

EventEmitter的核心就是事件发射与事件监听器功能的封装。



```javascript
//为指定事件注册一个监听器
//event为字符串；listener为回调函数(即监听器)
EventEmitter.on(event,listener)
```



```javascript
//发射 event 事件
//若干的可选参数用于传递给监听器(listener回调函数)的参数列表
EventEmitter.emit(event,[arg1],[arg2],[...])
```



EventEmitter定义了一个特殊的事件 `error`。在我们遇到异常的时候通常会发射 error事件。



**继承EventEmitter：**

大多数时候我们不会直接使用EventEmitter，而是在对象中继承它。

包括 fs、net、http在内的，只要是支持事件响应的核心模块都是 EventEmitter 的子类。

比如你会看到类似下面的代码：

```javascript
var server = http.createServer();

//server也可注册事件监听器
server.on('error', function(err){
    console.log(err);
  //如果端口被占用，可以在此重新绑定其它端口
});

//也可以为 http 相关的 listening 和 request 等事件注册监听器

server.listen(80);

```





### 文件系统 fs

>  异步式I/O与事件驱动

fs模块是文件操作的封装，它提供了文件的读取、写入、更名、删除、遍历目录、链接等**POSIX**文件系统操作。

与其它模块不同的是，fs模块中所有的操作都提供了**异步**的和同步的两个版本。

```javascript
//[]内为可选参数。callback回调函数的data参数为文件内容。
fs.readFile(filename,[encoding],[callback(err,data)])
```



```javascript
//同步读取文件。
//读取到的内容会以函数返回值的形式返回。需要使用try-catch处理异常。
fs.readFileSync(filename,[encoding])
```



```javascript
//POSIX的 open 函数的封装
fs.open(path,flags,[mode],[callback(err,fd)])
```



```javascript
//POSIX的 read 函数的封装
fs.read(fd,buffer,offer,length,position,[callback(err,bytesRead,buffer)])
```









### HTTP服务器与客户端

http模块中封装了一个高效的HTTP服务器和一个简易的HTTP客户端。http.Server是一个基于事件的HTTP服务器。


http.Server: Http服务器   
http.request：Http客户端工具   

#### http.Server

响应对象(res)的 end方法：该方法用于结束发送。

http.Server的事件：

* request：当客户端请求到来时
* connection: 当TCP连接建立时
* close：当服务器关闭时

其中 request 最常用，所以提供了一个捷径：
```javascript
http.createServer([requestListener])
```
其功能是创建一个Http服务器并将 requestListener 作为request事件的监听函数。



**http.ServerRequest：**     







#### http.request






## express


> [基于 Node.js 平台的下一代 web 开发框架 **Koa**](http://www.jikexueyuan.com/course/1518.html)
>
> **Koa** 是由 Express 原班人马打造的，致力于成为一个更小、更富有表现力、更健壮的 Web 框架。

```shell
# 先安装 
$ npm install -g express-generator
# 查看帮助
$ express -h
# 使用 ejs 模板引擎初始化一个项目
$ express -v ejs microblog

   create : microblog
   create : microblog/package.json
   create : microblog/app.js
   create : microblog/public
   create : microblog/routes
   create : microblog/routes/index.js
   create : microblog/routes/users.js
   create : microblog/views
   create : microblog/views/index.ejs
   create : microblog/views/error.ejs
   create : microblog/bin
   create : microblog/bin/www
   create : microblog/public/javascripts
   create : microblog/public/images
   create : microblog/public/stylesheets
   create : microblog/public/stylesheets/style.css

   install dependencies:
     $ cd microblog && npm install

   run the app:
     $ DEBUG=microblog:* npm start

$ cd microblog && npm install
$ DEBUG=microblog:* npm start

# 然后在浏览器中打开 http://localhost:3000 
```



这里做一些解释:

* routes是一个文件夹形式的本地模块，它的功能是为指定路径组织返回内容，相当于MVC架构中的控制器。在该模块中用到的方法：
  * `app.get(path,callback)`是一个路由控制器，路由规则创建函数，这里的 `get`表示使用get请求，另外还有 app.post()等函数。
  * `res.render('index', {title:'Express'})`功能是调用模板解析引擎，渲染名为index的模板，并传入一个对象作为参数。
* `app.set`是Express的参数设置工具，接受一个键和一个值。
* `app.use`用来启用中间件。
* `.ejs`为模板文件；比如 index.ejs
* 对于像style.css这样的静态文件，当浏览器像服务器发出请求该文件时app.js 中并没有一个路由规则指派到 /stylesheets/style.css，但 app 通过`app.use(express.static(__dirname + '/public'))`配置了静态文件服务器。这样也能进行正确的路由。





> ejs(Embedded JavaScript)是一个标签替换引擎,其语法与 ASP、 PHP 相似,易于学习,目前被广泛应用。 Express默认提供的引擎是 jade,它颠覆了传统的模板引擎,制定了一套完整的语法用来生成 HTML 的每个标签结构,功能强大但不易学习。





## koa

[基于 Node.js 平台的下一代 web 开发框架 **Koa**](http://www.jikexueyuan.com/course/1518.html)

**Koa** 是由 Express 原班人马打造的，致力于成为一个更小、更富有表现力、更健壮的 Web 框架。





## Meteor

node.js上最新HTML5开发框架-**Meteor** 是一组新的技术用于构建高质量的 Web 应用，提供很多现成的包，可直接在浏览器或者云平台中运行。





## 学习资料

通过这里快速了解：

[NPM 使用介绍 - 菜鸟教程](http://www.runoob.com/nodejs/nodejs-npm.html "NPM 使用介绍 - 菜鸟教程")

[Node.js 中文网](http://nodejs.cn/ "Node.js 中文网")

[Node入门 » 一本全面的Node.js教程](https://www.nodebeginner.org/index-zh-cn.html#javascript-and-nodejs "Node入门 » 一本全面的Node.js教程")

[Node.js 实战开发：博客系统_腾讯课堂](https://ke.qq.com/course/185893 "Node.js 实战开发：博客系统_腾讯课堂") 推荐。

[node.js从入门到进阶-node.js从入门到进阶教程-麦子学院](http://www.maiziedu.com/course/515/ "node.js从入门到进阶-node.js从入门到进阶教程-麦子学院")

[玩转node.js全栈开发之博客系统-玩转node.js全栈开发之博客系统教程-麦子学院](http://www.maiziedu.com/course/627/ "玩转node.js全栈开发之博客系统-玩转node.js全栈开发之博客系统教程-麦子学院")

《Node.js开发指南》

[60分钟学会使用Node.js+Express+Ejs+mongoDB - 从零到壹全栈部落](https://segmentfault.com/a/1190000010145057 )

[node.js上最新HTML5开发框架 Meteor-node.js教程-麦子学院](http://www.maiziedu.com/course/342/ "node.js上最新HTML5开发框架 Meteor-node.js教程-麦子学院")

[从零玩转Node.js - 网易云课堂](http://study.163.com/course/introduction.htm?courseId=1005269026 "从零玩转Node.js - 网易云课堂")

