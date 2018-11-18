## webpack



## 了解模块和组件

建议先通过 《React全栈》了解模块打包的发展过程。

[Javascript模块化编程（一）：模块的写法 - 阮一峰的网络日志](http://www.ruanyifeng.com/blog/2012/10/javascript_module.html "Javascript模块化编程（一）：模块的写法 - 阮一峰的网络日志")



**模块(module)：**是语言层面的。在前端领域一般指 JavaScript module，往往表现为一个单独的JS文件，对外暴露一些属性或者方法。

**组件(component)：**则更多的是业务层面的概念。比如一个可独立使用的功能实现。



### JavaScript模块化方案

大致分为3个阶段：

1. 全局变量 + 命名空间
2. AMD & CommonJS
3. ES6模块



### 前端的模块化和组件化

前端组件化方案，大致可划分为4个阶段：

1. 基于命名空间的多入口文件组件：基于前面介绍的第一种模块化方案。不同资源分包手动引入。
2. 基于模块的多入口文件组件：使用AMD规范来组织JS实现，把自己暴露为一个模块。然而，样式内容和其它的依赖资源(图片、字体等)还没有纳入整体的模块化方案里面。
3. 单JavaScript入口组件（主流）：它们允许我们将一般的资源视作与JS平等的模块，并以一致的方式加载进来。
4. Web Component （并不流行）



> React推荐通过webpack或browserify进行应用的构建，搭配对应的loader或plugin可以实现通过JavaScript入口文件实现同一管理依赖资源。从整体上看，这是一个典型的“单JavaScript入口组件”方案。
>
> 另：一些知名的脚手架工具，也大多基于`webpack`(比如`create-react-app`)。



> 对大多数前端开发者而言，以往我们接触的各种库，要么类似`jQuery`,通过`$`符在前端项目中直接运行，所做的事情只在前端生效，要么类似`express.js`,在`node.js`项目中直接`require`后就可以使用，所做的事情只在后端生效。`webpack`的不同之处就在于，虽然我们的配置文件位于前端项目中，但实际上它却运行于`node.js`，之后的处理结果又供前端使用（也可能供node使用）。所以学习之前，我们转变一下思维，从`node.js`的角度来看`webpack`，很多事情就会简单起来。



## webpack



webpack已成为当下最流行的打包解决方案。



### webpack安装

**全局安装**：不推荐

安装webpack：

```shell
npm install -g webpack
```



webpack-dev-server 是一个基于 Express 框架的 Node.js服务器。我们可以用它来辅助开发与调试。它除了提供最基本的自动刷新，还提供了如模块热替换这样的强大功能。

```shell
npm install webpack-dev-server -g
```

> webpack-dev-server@2.8.1   (此次安装版本) 
> webpack@2.7.0   (事先存在的版本)
>
> 问题：
>
> ```
> npm ERR! peer dep missing: webpack@^2.2.0 || ^3.0.0, required by webpack-dev-server@2.8.1
> npm ERR! peer dep missing: webpack@^1.0.0 || ^2.0.0 || ^3.0.0, required by webpack-dev-middleware@1.12.0
>
> $ webpack-dev-server
> module.js:471
>     throw err;
>     ^
>
> Error: Cannot find module 'webpack'
>     at Function.Module._resolveFilename (module.js:469:15)
>     at Function.Module._load (module.js:417:25)
>     at Module.require (module.js:497:17)
>     at require (internal/module.js:20:19)
>     at Object.<anonymous> (/opt/node-v6.9.5-linux-x64/lib/node_modules/webpack-dev-server/lib/Server.js:21:17)
>     at Module._compile (module.js:570:32)
>     at Object.Module._extensions..js (module.js:579:10)
>     at Module.load (module.js:487:32)
>     at tryModuleLoad (module.js:446:12)
>     at Function.Module._load (module.js:438:3)
> ```
>
> 解决办法：重新安装 webpack
>
> 新安装的版本 webpack@3.5.6



**局部安装**：推荐

```shell
npm install webpack --save-dev
# 或者安装某特定版本的 webpack
npm install webpack@<version> --save-dev
```

如果你的项目使用了 npm script，npm 会在项目本地目录下查找已安装的 webpack。

```shell
"scripts": {
    "start": "webpack --config mywebpack.config.js"
}
```

**局部安装是标准且推荐的安装方式**。

> 如果需要使用本地安装的 webpack，可以通过如下路径 `node_modules/.bin/webpack`。
>
> 全局安装会把你锁定在某个 webpack 版本上，如果遇到其他项目使用了不同版本的 webpack 就可能导致运行失败。





### 示例1：简单演示

1. 安装webpack：`npm install -g webpack`

2. 创建文件夹"my-webpack-demos"，然后运行命令初始化项目 `npm init`(一路回车)

3. 新建 index.html，app.js两个文件。文件内容：

   ```html
   <!DOCTYPE html>
   <html lang="en">
   <head>
       <meta charset="UTF-8">
       <title>webpack</title>
   </head>
   <body>
   	<!-- 添加下面的标签 （仅仅引入输出文件bundle.js） -->
       <script src="bundle.js"></script>
   </body>
   </html>
   ```

   ```javascript
   // app.js
   alert("Hello app");
   ```

4. 运行命令：`webpack app.js bundle.js`，这里指定 app.js为入口文件，bundle.js为输出文件。[该命令将我们的入口文件和其所有的依赖都打包到一个单一的文件。]

5. 在浏览器中打开 index.html 文件，就会看到弹出一个对话框。神奇之处在于我们仅仅在 index.html 文件中引入了 bundle.js文件而已。

6. 接下来我们再创建一个 people.js文件

   ```javascript
   // people.js
   /* 1. */
   //module.exports = "Hello People";

   /*2. */
   function getHello(){
       return "Hello Everyone"
   }
   module.exports = getHello(); //带有括号表示会调用此函数
   ```

7. 修改 app.js 文件，让其使用 people.js 文件

   ```javascript
   //app.js
   //alert("Hello app");
   alert(require('./people.js'));
   ```

8. 运行命令：`webpack app.js bundle.js`，然后在浏览器中打开 index.html 文件，就会看到弹出的对话框内容发生了改变。

9. 每次更改文件就需要再次运行 webpack 命令，是不是比较烦。我们可以在运行此命令的时候添加 `--watch`选项，来对文件进行监听。比如：`webpack app.js bundle.js --watch`



> 引入自己创建的文件必须以 `./`开头，这样是为了区分其不是从服务器中下载的文件。



### 示例2：用于第三方库

还是在上一个项目中进行操作，先安装jqurey： `npm install jquery --save`

创建cats.js文件：

```javascript
var cats = ['dave','henry','martha'];
module.exports = cats;
```

修改app.js文件为：

```javascript
let cats = require('./cats.js');
let $ = require('jquery');

$("body").append("<h1>" + cats[0] + "</h1>");
console.log($);
console.log(cats[1]);
```

运行webpack命令，在浏览器中打开index.html查看效果。

### 如何将一个静态文件CSS模块化？

创建一个CSS文件：

```javascript
body{
    background-color: skyblue;
}
```

要想对静态文件进行模块化，需要借助loader才行。这里借助 css-loader 和 style-loader。(这里没有添加extract-text-webpack-plugin 这个插件)

```shell
npm install css-loader style-loader --save-dev
```

在app.js文件中引入：添加如下语句，注意这里需要添加修饰"!style-loader!css-loader!"

```javascript
require("!style-loader!css-loader!./style.css");
```

然后重新运行：`webpack app.js bundle.js --watch`

对于单个 css 文件还好，但是如果有多个文件建议使用 `webpack.config.js`配置文件。





配置 webpack.config.js 文件后        ---------  只需运行命令  webpack 而不需要额外的参数

配置 package.json 后  ---------  则使用 npm  run build 替代 webpack 命令，（任务名称为build，任务内容为 webpack 命令） 

但是此时访问 index.html 文件还是通过复制粘贴该文件的路径来访问。

安装使用 webpack-dev-server 后 就可通过 http://locallhost;8080 的形式访问。但在访问之前，一般先在 package.json 文件中配置 script 中的任务(这里任务名为 start，任务内容为 webpack-dev-server )；再运行 npm start 在本地开启服务，才可以使用上面的链接地址访问。



使用 babel ：

注意：这里我们需要设置如下内容`exclude: /node_modules/,`来排除项目中的node_modules文件夹。



### loader





### 配置文件





### 使用plugin











## 学习资料

入门：[Webpack前端必备模块打包机_腾讯课堂](https://ke.qq.com/course/238556#term_id=100281453 "Webpack前端必备模块打包机_腾讯课堂")

Webpack示例：

 [阮大侠/webpack-demos](https://github.com/ruanyf/webpack-demos "ruanyf/webpack-demos: a collection of simple demos of Webpack") 推荐。

[官方示例 webpack-examples](https://github.com/webpack/webpack/tree/master/examples "webpack/examples at master · webpack/webpack")

[中文官网：核心概念](https://doc.webpack-china.org/concepts/ "核心概念") 推荐。

[webpack 从入门到工程实践](http://gitbook.cn/books/599270d5625e0436309466c7/index.html "webpack 从入门到工程实践")

