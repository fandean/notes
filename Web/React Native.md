# React Native

标签（空格分隔）： Android

---

[React Native](https://facebook.github.io/react-native/)
[React Native 中文网](https://reactnative.cn/)

找到工作后再考虑是否需要学习 React Native。

[ReactNative基础与入门教程-慕课网](http://www.imooc.com/learn/808 "ReactNative基础与入门教程-慕课网")

慕课网的 [ReactNative开发跨平台GitHub App](http://coding.imooc.com/class/89.html) 是一套不错的付费视频教程。



[React Native知识库 - 知识库 - 你身边的技术百科全书 - CSDN](http://lib.csdn.net/base/reactnative "React Native知识库 - 知识库 - 你身边的技术百科全书 - CSDN")



## 开发环境搭建



需要安装：

- Node.js：nodejs分为了长期支持版和当前版本。安装方法： [官网](https://nodejs.org/en/download/) 下载压缩包解压到`/opt`目录，修改解压目录的所属用户和组，然后配置环境变量（推荐）；或者参考：[How to Install Latest Nodejs &amp; NPM on Ubuntu with PPA - TecAdmin](https://tecadmin.net/install-latest-nodejs-npm-on-ubuntu/# "How to Install Latest Nodejs &amp; NPM on Ubuntu with PPA - TecAdmin")
- React Native Cli：直接通过 `npm install -g react-native-cli` 安装
- 配置 npm 的国内镜像站点为：`https://registry.npm.taobao.org` 。步骤：在HOME目录新建`.npmrc`文件并添加 `registry = https://registry.npm.taobao.org` 


运行 `react-native -h`查看帮助，运行`react-native init 项目名称` 初始化一个项目。此时会下载一些组件到 `~/.npm` 目录。



项目初始化好之后会提示：

```shell
To run your app on iOS:
   cd /tmp/FirstApp
   react-native run-ios
   - or -
   Open ios/FirstApp.xcodeproj in Xcode
   Hit the Run button
To run your app on Android:
   cd /tmp/FirstApp
   Have an Android emulator running (quickest way to get started), or a device connected
   react-native run-android
```

我们选择：To run your app on Android。先确保打开了Android虚拟机或连接手机并打开了开发者模式

切换到项目根目录，运行命令：`react-native run-android`，来构建并安装该 app 到手机或模拟器。

运行此命令还将会开启一个JS server，会有如下提示：`Starting JS Server ...` 如果该server被关闭，可以通过在该目录下运行 `npm start `开启该 server。



弹出错误：

```
FAILURE: Build failed with an exception.

* What went wrong:
Execution failed for task ':app:mergeDebugResources'.
> Error: java.util.concurrent.ExecutionException: java.lang.RuntimeException: AAPT process not ready to receive commands

* Try:
Run with --stacktrace option to get the stack trace. Run with --info or --debug option to get more log output.

BUILD FAILED
```



也可通过Android Studio以项目的方式打开该项目下的 android 目录，进行编译安装。



错误：

终端错误提示：

```
[fan 23:42:01]/tmp/FirstApp$ npm start

> FirstApp@0.0.1 start /tmp/FirstApp
> node node_modules/react-native/local-cli/cli.js start

Scanning 557 folders for symlinks in /tmp/FirstApp/node_modules (16ms)
 ┌────────────────────────────────────────────────────────────────────────────┐ 
 │  Running packager on port 8081.                                            │ 
 │                                                                            │ 
 │  Keep this packager running while developing on any JS projects. Feel      │ 
 │  free to close this tab and run your own packager instance if you          │ 
 │  prefer.                                                                   │ 
 │                                                                            │ 
 │  https://github.com/facebook/react-native                                  │ 
 │                                                                            │ 
 └────────────────────────────────────────────────────────────────────────────┘ 
Looking for JS files in
   /tmp/FirstApp 


React packager ready.

Loading dependency graph, done.
Bundling `index.android.js`  [development, non-minified, hmr disabled]  0.0% (0/1), failed.
error: bundling failed: "TransformError: /tmp/FirstApp/index.android.js: Unexpected token ) (While processing preset: \"/tmp/FirstApp/node_modules/babel-preset-react-native/index.js\")"
error: bundling failed: "TransformError: /tmp/FirstApp/index.android.js: Unexpected token ) (While processing preset: \"/tmp/FirstApp/node_modules/babel-preset-react-native/index.js\")"
```



开启的APP中的错误提示：

```
The development server returned response error code: 500

URL: http://10.0.3.2:8081/index.android.bundle?platform=android&dev=true&hot=false&minify=false

Body:
{"message":"TransformError: /tmp/FirstApp/index.android.js: Unexpected token ) (While processing preset: \"/tmp/FirstApp/node_modules/babel-preset-react-native/index.js\")","type":"TransformError","lineNumber":0,"description":"","errors":[{"description":"","lineNumber":0}]}
processBundleResult
    BundleDownloader.java:170
access$100
    BundleDownloader.java:39
onResponse
    BundleDownloader.java:139
execute
    RealCall.java:135
run
    NamedRunnable.java:32
runWorker
    ThreadPoolExecutor.java:1133
run
    ThreadPoolExecutor.java:607
run
    Thread.java:761

```



问题：build成功后，提示没有连接到服务器 js Server

```
Could not connect to development server.

Try the following to fix the issue:
• Ensure that the packager server is running
• Ensure that your device/emulator is connected to your machine and has USB debugging enabled - run 'adb devices' to see a list of connected devices
• Ensure Airplane Mode is disabled
• If you're on a physical device connected to the same machine, run 'adb reverse tcp:8081 tcp:8081' to forward requests from your device
• If your device is on the same Wi-Fi network, set 'Debug server host & port for device' in 'Dev settings' to your machine's IP address and the port of the local dev server - e.g. 10.0.1.1:8081

URL: http://10.0.3.2:8081/index.android.bundle?platform=android&dev=true&hot=false&minify=false
onFailure
    BundleDownloader.java:70
execute
    RealCall.java:142
run
    NamedRunnable.java:32
runWorker
    ThreadPoolExecutor.java:1133
run
    ThreadPoolExecutor.java:607
run
    Thread.java:761
```

进入工程文件夹，运行命令`npm start`，在安卓模拟器中点击“菜单”按钮，选择 Reload。



```

To get started, edit index.android.js

Double tap R on your keyboard to reload,

Shake or press menu button for dev menu.
```




项目文件夹下的`index.android.js`文件和`index.ios.js`是混合开发时编写代码的入口文件。



```javascript
/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

// index.ios.js 文件

/*
  第一部分：

  导入ReactNative包，导入ReactNative组件
  AppRegistry: JS运行所有 ReactNative 应用的入口
  StyleSheet：ReactNative中使用的样式表，类似CSS样式表
  各自开发中需要使用的组件
*/
import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View
} from 'react-native';

/*
ES5写法：
var HelloReact = React.createClass({
    render: function{
    return {};
  }
});
*/

// ES 6 写法
export default class HelloReact extends Component {
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>
          Welcome to React Native!
        </Text>
        <Text style={styles.instructions}>
          To get started, edit index.ios.js
        </Text>
        <Text style={styles.instructions}>
          Press Cmd+R to reload,{'\n'}
          Cmd+D or shake for dev menu
        </Text>
      </View>
    );
  }
}

/*
第三部分：

StyleSheet.create 创建样式实例
在应用中只会被创建一次，不用每次在渲染周期中重新创建
*/

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

/*
第4部分：

注册入口组件

AppRegistry：负责注册运行 ReactNative 应用程序的JavaScript入口
registerComponent注册应用程序的入口组件。告知ReactNative哪一个组件被注册为应用的根容器。

第二个参数使用了 ES6 语法，箭头函数： () => HelloReact
返回的必须是定义的组件类的名字

等价于
function() {return HelloReact}
*/

AppRegistry.registerComponent('HelloReact', () => HelloReact);

```







> 参考：[将Ubuntu, RubyGems, NPM和PyPI的源更换为国内镜像 – 思诚之道](http://www.bjhee.com/source-mirror.html "将Ubuntu, RubyGems, NPM和PyPI的源更换为国内镜像 – 思诚之道")





## 开发工具



 WebStom：免去下载各种插件的烦恼。



[学习ReactNative基础（一） - 學徒杨小胖的开发随笔](http://piglikeyoung.com/2017/03/05/Learn-ReactNative-1/ "学习ReactNative基础（一） - 學徒杨小胖的开发随笔")

xcode的ios模拟器中刷新： cmd + r

刷新Android按两次 r 



[搭建开发环境 - React Native 中文网](http://reactnative.cn/docs/0.48/getting-started.html "搭建开发环境 - React Native 中文网")

推荐安装的工具：

* Watchman
* Flow
* 配置 Gradle Deamon
* Nuclide



