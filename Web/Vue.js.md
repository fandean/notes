

## Vue.js介绍



[介绍 — Vue.js](https://cn.vuejs.org/v2/guide/ "介绍 — Vue.js")



Vue.js（读音 /vjuː/，类似于 **view**） 是一套构建用户界面的**渐进式框架**。Vue 的核心库只关注视图层（所以可以和其它已有的框架进行整合），它不仅易于上手，还便于与第三方库或既有项目整合。



Vue.js的目的：

Vue.js的产生核心是为了解决如下三个问题：

- 解决数据绑定的问题
- 开发大量单页面应用(**SPA: Single Page Application**)（主要目的）
- 支持组件化。可以将页面封装成若干个组件，采用积木式编程，这样页面的复用度达到最高。



> 什么是 单页面应用 SPA?
>
> 为了解决H5切换页面时的卡顿问题，我们可以在一个页面上创建多个布局，然后在同一时刻只显示单个布局；这样在切换时就只是显示和隐藏同一页面的相关布局即可，这样速度就变快了。
>
> **vue的路由（vue-router）**就是决定当前显示该单页面的哪部分内容。
>
> ```
> +------------------+--------------------+-------------------+
> |                  |                    |                   |
> |                  |                    |                   |
> |                  |                    |                   |
> |                  |                    |                   |
> |                  |                    |                   |
> |                  |                    |                   |
> |                  |                    |                   |
> |                  |                    |                   |
> |                  |                    |                   |
> |                  |                    |                   |
> |                  |                    |                   |
> |                  |                    |                   |
> |                  |                    |                   |
> |                  |                    |                   |
> |                  |                    |                   |
> |                  |                    |                   |
> +------------------+--------------------+-------------------+
> 
> ```
>
> Angular.js(低版本)中对PC端支持的比较好，但是对移动端支持一般。而Vue.js主要支持移动端，也支持PC端。







Vue.js特性：

* MVVM模式
* 组件化
* 指令系统
* Vue.js 2.0开始支持虚拟 DOM


Vue.js 本身具有响应式编程和组件化的特点。所谓响应式编程 , 即为保持状态和视图的同步。






Vue.js的使用：

使用 CDN 方法或下载到本地使用。



vue.js 文件与 vue.min.js文件之间有什么不同？

- 两者在业务功能上没有差别
- vue.js 开发时用。是给程序员看的，里面是格式化的代码；另外包含了额外的错误调试功能。
- vue.min.js 线上使用。 是在生产环境中使用，里面包含的代码是经过压缩的。





> CDN是Content Delivery Network的简称，即“内容分发网络”的意思。一般我们所说的CDN加速，一般是指网站加速或者用户下载资源加速。
>
> CDN核心目的就是通过在现有的Internet中增加一层新的网络架构，使用户可就近访问网络，取得所需内容，解决网络拥挤的状况，明显提高用户访问网站的响应速度或者用户下载速度。
>
> CDN有别于镜像，因为它比镜像更智能，或者可以做这样一个比喻：CDN=更智能的镜像+缓存+流量导流。因而，CDN可以明显提高Internet网络中信息流动的效率。从技术上全面解决由于网络带宽小、用户访问量大、网点分布不均等问题，提高用户访问网站的响应速度。
>
> [CDN是什么 CDN加速有什么用？](http://www.pc841.com/article/20150605-48036.html)



下载到本地可以直接下载相关文件，或通过npm下载。



通过npm下载vue.js的脚手架：

即Vue.js的命令行工具 CLI，它可用于快速搭建大型单页应用。该工具提供开箱即用的构建工具配置，带来现代化的前端开发流程



相关工具： [vue-devtools](https://github.com/vuejs/vue-devtools#vue-devtools " Chrome devtools extension for debugging Vue.js applications.")

chrome浏览器插件 Vue-devtools，可以在 chrome 的开发者模式下直接查看当前页面的 Vue 实例的组件结
构和内部属性，方便我们直接观测。安装之后打开“开发者模式”会发现多了一个 Vue 的标签页。另外当前选中组件的 `$vm` 赋值到 `window.$vm` 上，这样在控制台中也可以对组件进行修改和调试。



声明实例 `new Vue({ data : data })` 后自然对 data 里面的数据进行了视图上的绑定。修改 data 的数据，视图中对应数据也会随之更改。Vue.js 的组件化理念和 ReactJS 异曲同工——“一切都是组件”，可以将任意封装好的代码注册成标签。



Vue.js 的一些插件：

* vue-loader：作用；我们可以将一个组件的 CSS、HTML 和 js 都写在一个文件里,
  做到模块化的开发（webpack）。
* vue-router：提供单页面路由组件的功能。
* vue-resource：异步发送http请求。（已被弃用，建议使用axios）
* vuex：提供状态管理能力



[Vue 生命周期 — Vue.js](https://cn.vuejs.org/v2/guide/instance.html#%E7%94%9F%E5%91%BD%E5%91%A8%E6%9C%9F%E5%9B%BE%E7%A4%BA "Vue 实例 — Vue.js")

![](https://raw.githubusercontent.com/fandean/images/master/PicGo/20181029153525.png)



## 学习资料

《Vue.js前端开发-快速入门与专业应用》   

《Vue.js小书》  

[Vue.js中文](https://cn.vuejs.org/index.html "Vue.js")

[Vue.js 2.x 中文文档 - vuefe.cn](https://vuefe.cn/ "Vue.js 2.x 中文文档 - vuefe.cn")

[vue.js开发（最热门的WEB前端技术）【泰牛程序员PHP培训】_腾讯课堂](https://ke.qq.com/course/180464 "vue.js开发（最热门的WEB前端技术）【泰牛程序员PHP培训】_腾讯课堂")  这套课程非常好，评价高。

[Vue2.0小白入门教程(最全) - 网易云课堂](http://study.163.com/course/introduction.htm?courseId=1004711010#/courseDetail?tab=1 "Vue2.0小白入门教程(最全) - 网易云课堂")

