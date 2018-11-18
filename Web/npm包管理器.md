## npm介绍

包管理器(Package Manager)

npm 最初它只是被称为 Node Package Manager，用来解决Node.js的包管理器。但是随着其它构建工具(webpack、browserify)的发展，npm已经变成了 "the package manager for JavaScript"，它用来安装、管理和分享JavaScript包，同时会自动处理多个包之间的依赖。

## 安装npm

新版的nodejs已经集成了npm

Node.js：nodejs分为了**长期支持版**和**当前版本**。

Linux中安装nodejs的方法：

*  [官网](https://nodejs.org/en/download/) 下载压缩包解压到`/opt`目录，修改解压目录的所属用户和组，然后配置环境变量（推荐）；
*  或者使用PPA安装：[How to Install Latest Nodejs &amp; NPM on Ubuntu with PPA - TecAdmin](https://tecadmin.net/install-latest-nodejs-npm-on-ubuntu/# "How to Install Latest Nodejs &amp; NPM on Ubuntu with PPA - TecAdmin")





## 升级现有npm版本

```shell
npm install npm -g
```



> 貌似也可使用这种方法安装node，但是安装的是当前版本的node而非长期支持版本的node。



## 更换 npm 镜像站点

对于国内的情形，在使用npm安装JS包之前建议先更改npm的镜像。

有两种方式

1. 直接更换为taobao镜像

   配置 npm 的国内镜像站点为：`https://registry.npm.taobao.org` 。

   方法一：在系统的HOME目录新建`.npmrc`文件并添加 `registry = https://registry.npm.taobao.org` 

   方法二：你可以使用淘宝定制的 cnpm 命令行工具代替默认的 npm:

   ```shell
   npm install -g cnpm --registry=https://registry.npm.taobao.org
   //之后即可使用cnpm来安装包
   cnpm install <包>
   ```

2. 使用`nrm`快速切换不同的npm源

   ```shell
   # 先安装 nrm
   npm install -g nrm
   # 列出可选的源
   nrm ls
   # 测试所有源的响应时间
   nrm test
   # 切换到想要使用的源
   nrm use taobao
   ```





>  [淘宝 NPM 镜像](https://npm.taobao.org/ "淘宝 NPM 镜像")
>
> [nrm —— 快速切换 NPM 源 （附带测速功能）](https://segmentfault.com/a/1190000000473869 "nrm —— 快速切换 NPM 源 （附带测速功能） - SegmentFault 业界资讯 - SegmentFault 思否")



## 本地安装(默认)

npm 的包安装分为本地安装（local）、全局安装（global）两种。


```shell
npm install <包>      # 本地安装
# 或者
npm i <包>
```



- 将安装包放在 `./node_modules` 下（运行 npm 命令时所在的目录），如果没有 node_modules 目录，会在当前执行 npm 命令的目录下生成 node_modules 目录。
- 可以通过 require() 来引入本地安装的包。

>  `./node_modules`  文件夹是一个坑，里面包含大量文件（几万个），所以在复制移动时会特别慢，所以建议先删除该文件夹。同时在windows中也会产生大量磁盘碎片。



## 全局安装

```shell
npm install <包> -g   # 全局安装
```



- 将安装包放在 `/usr/local` 下或者你 node 的安装目录。
- 可以直接在命令行里使用。**这是使用全局安装的主要原因**。



使用下面的命令来查看全局的包安装的位置：

```shell
npm prefix -g
```



## 创建全局链接


如果你希望具备两者功能（本地安装和全局安装的功能），则需要在两个地方安装它或使用 **npm link**。


npm link的功能是在本地包和全局包之间创建符号链接。我们说过使用全局模式安装的包不能直接通过 require 使用,但通过 npm link 命令可以打破这一限制。

比如我们将 express安装到了全局环境，使用下面的命令可以将其链接到本地环境：
```shell
npm link express
```

使用 npm link命令还可以将本地的包链接到全局。使用方法是在包目录( package.json 所在目录)中运行 `npm link` 命令。



如果你的项目不再需要该模块，可以在项目目录内使用npm unlink命令，删除符号链接。



> 像gem 或 pip 总是以全局模式安装，使包可以供所有的程序使用，而 npm 默认会把包安装到当前目录下。这反映了 npm 不同的设计哲学。如果把包安装到全局，可以提高程序的重复利用程度,避免同样的内容的多份副本，但坏处是难以处理不同的版本依赖。




## 常用命令

### 查看命令帮助

```shell
npm help <某命令>
```



### 列出各命令

```shell
npm -l
```



### 查看安装信息

安装信息和它们的依赖

```shell
//全局安装信息
npm ls -g

//列出当前项目中的包
npm ls
```



### 卸载包

```shell
npm uninstall <包名>
```



### 更新包

```shell
//更新当前项目中安装的某个包
npm update <包名>

//更新当前项目中安装的所有包
npm update

//更新全局安装的包
npm update <包名> -g
```



### 搜索包

```shell
npm search <关键字>
```



### 列出npm的配置

```shell
npm config list -l
```



### 列出bin目录

```shell
npm bin
```





## 使用 package.json

当你的项目需要依赖多个包时，推荐使用 package.json。其优点为：

* 它以文档的形式规定了项目所依赖的包
* 可以确定每个包所使用的版本
* 项目的构建可以重复，在多人协作时更加方便




### 创建package.json文件



- 手动创建
- 或者 通过 `npm init` 命令生成遵守规范的 package.json文件



文件中必须包含： name 和 version



### 指定依赖包

两种依赖包：

* dependencies: 在生产环境中需要依赖的包。通过`npm install <packge> --save`命令自动添加依赖到文件（或者使用简写的参数 `-S`）。
* devDependencies：仅在开发和测试环节中需要依赖的包。通过`npm install <packge> --save-dev`命令自动添加依赖到文件（或者使用简写的参数 `-D`）。

> 当然你也可以在文件中手动添加依赖



如果其他人也需要这个项目，只需要把这个 package.json 文件给他，然后进行简单的 `npm install` 即可。



## 设置默认配置

使用 `npm set` 命令用来设置环境变量。

也可以用它来为 `npm init`设置默认值，这些值会保存在 `~/.npmrc `文件中。

```shell
$ npm set init-author-name 'Your name'
$ npm set init-author-email 'Your email'
$ npm set init-author-url 'http://yourdomain.com'
$ npm set init-license 'MIT'
```



## 更改全局安装目录

使用`npm config`命令可以达到此目的。

```shell
npm config set prefix <目录>
```

或者手动在 `~/.npmrc`文件中进行配置：

```
prefix = /home/yourUsername/npm
```

更改目录后记得在系统环境变量 `PATH`中添加该路径：

```shell
# .bashrc 文件
export PATH=~/npm/bin:$PATH
```





## 多版本管理器

Node.js 的社区开发了多版本管理器，用于在一台机器上维护多个版本的 Node.js 实例，方便按需切换。Node 多版本管理器(Node Version Manager，nvm)是一个通用的叫法，它目前有许多不同的实现。这里使用visionmedia/**n**。n 是一个十分简洁的 Node 多版本管理器。

如果已经安装好npm则可以简单的使用 `npm install -g n`来安装n。事实上，n 并不需要 Node.js 驱动，它只是 bash 脚本；我们可以在 <https://github.com/visionmedia/n> 下载它的代码，然后使用 `make install` 命令安装。

n的常用命令：

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



* `PREFIX=$CUSTOM_LOCATION make install`； 自定义 `n` 的安装路径（避免使用sudo）
* 自定义node.js的安装路径(通过n安装)；通过设置环境变量 `export N_PREFIX=$HOME`
* 自定义 source。（镜像站点）
* 自定义 架构(architecture)
* 如果使用n切换了node.js的版本后，npm没有正确运行，通过运行相关脚本解决。（见 [n: working-with-npm](https://github.com/tj/n#working-with-npm )）



**详细用法见 ：** [n: Node version management](https://github.com/tj/n)   



**注意：**n 无法管理通过其他方式安装的 Node.js 版本实例(如官方提供的安装包、发行版软件源、手动编译)，也就说无法管理不是用 n 安装的node.js。



> n 不支持在Windows上使用：“Unfortunately `n` is not supported on Windows yet”。
>
> [GNVM](https://github.com/kenshin/gnvm)   是一个简单的 `Windows` 下 Node.js 多版本管理器。





## 发布包

在发布之前,首先需要让我们的包符合 npm 的规范,npm 有一套以 CommonJS 为基础包规范,但与 CommonJS并不完全一致,其主要差别在于必填字段的不同。通过使用 `npm init` 可以根据交互问答产生一个符合标准的 package.json。 

npm init 运行示例：

```
$ npm init
name: (node) test
version: (1.0.0) 
description: 
entry point: (index.js) 
test command: 
git repository: 
keywords: 
author: 
license: (ISC) 
About to write to /tmp/node/package.json:

{
  "name": "test",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "",
  "license": "ISC"
}


Is this ok? (yes) 

```

该文件就是一个符合 npm 规范的 package.json 文件。这里的 index.js 作为包的接口。

> 也可简单的使用 `npm init -y`。其中`-y`（代表yes）



创建帐号： 

```shell
npm adduser
```

测试是否取得帐号：

```shell
npm whoami
```

发布

```shell
npm publish
```

更新包：修改 version字段，再重新发布

取消发布：

```shell
npm unpublish
```





## npm 脚本

[npm scripts 使用指南 - 阮一峰的网络日志](http://www.ruanyifeng.com/blog/2016/10/npm_scripts.html "npm scripts 使用指南 - 阮一峰的网络日志")



## npm run

`package.json`文件有一个`scripts`字段，可以用于指定脚本命令，供`npm`直接调用。

```json
  "scripts": {
    "lint": "jshint **.js",
    "test": "mocha test/"
  }
```

`npm run lint`可以运行脚本中的 lint 命令。`npm run test`可以运行脚本中的 test 命令。

`npm run`命令会自动在环境变量`$PATH`添加`node_modules/.bin`目录，所以`scripts`字段里面调用命令时不用加上路径，这就避免了全局安装NPM模块。

`start`和`test`属于特殊命令，可以省略`run`：

```shell
npm start 
npm test
```

如果仅仅使用`npm run`会列出scripts属性下所有的命令：

```shell
npm run
```





## npm模块安装机制

[npm 模块安装机制简介 - 阮一峰的网络日志](http://www.ruanyifeng.com/blog/2016/01/npm-install.html "npm 模块安装机制简介 - 阮一峰的网络日志") 必看，涉及到cache的内容。







### 缓存目录



node模块的安装过程：

1. 发出`npm install`命令
2. npm 向 registry 查询模块压缩包的网址
3. 下载**压缩包**，存放在`~/.npm`（缓存）目录
4. **解压**压缩包到当前项目的`node_modules`目录



查看缓存目录的位置（Linux默认在`~/.npm`）：

```
npm config get cache
```



注意，一个模块安装以后，本地其实保存了两份。一份是`~/.npm`目录下的**压缩包**，另一份是`node_modules`目录下**解压后**的代码。



但是，运行`npm install`的时候，只会检查`node_modules`目录，而不会检查`~/.npm`目录。也就是说，如果一个模块在`～/.npm`下有压缩包，但是没有安装在`node_modules`目录中，npm **依然会从远程仓库下载一次新的压缩包**（如果想要进行离线安装，见阮大侠的文章）。



清除缓存的命令：

```
npm cache clean --force
```



> npm cache：[https://docs.npmjs.com/cli/cache](https://docs.npmjs.com/cli/cache "https://docs.npmjs.com/cli/cache")



## 学习资料

[NPM 使用介绍 - 菜鸟教程](http://www.runoob.com/nodejs/nodejs-npm.html "NPM 使用介绍 - 菜鸟教程")

[npm Documentation](https://docs.npmjs.com/ "npm Documentation")

[如何卸载使用npm链接安装的软件包？](https://gxnotes.com/article/45185.html "如何卸载使用npm链接安装的软件包？ - 共享笔记")

[package.json文件 -- JavaScript 标准参考教程（alpha）](http://javascript.ruanyifeng.com/nodejs/packagejson.html "package.json文件 -- JavaScript 标准参考教程（alpha）")

[npm模块管理器 -- JavaScript 标准参考教程（alpha）](http://javascript.ruanyifeng.com/nodejs/npm.html "npm模块管理器 -- JavaScript 标准参考教程（alpha）")



