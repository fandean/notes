# 改进simple texture主题

## 收集改进点

- 支持在配置文件_config.yml中指定`lang=zh`，作者已经回复，改为`lang=cn`即可。但还是需要更正。最好在配置后能够同时更改网页头部的lang属性，不然每次在移动端Google翻译提示此网站为英文网站，是否需要翻译。
- 支持在配置文件中直接为 disqus 指定 id 即可添加评论功能。
- ~~在文章开头添加：本篇文章的更新时间。原作者的中文版blog [Yi Zeng 的中文版个人网站](http://cn.yizeng.me/ "Yi Zeng 的中文版个人网站")，中有此功能。（默认就有无需添加）~~
- 支持自定义的addthis分享按钮样式。
- 404页面修复。
- 添加更多图标，比如GitLab。
- 尝试修复点击"Show Comments"后Disqus评论有时无法出现的问题；Chrome提示"此网站试图从未验证的来源加载脚本"阻止了Disqus评论的加载。如果强行加载Chrome会提示不安全。
- 添加可直接显示 Disqus评论 的配置项。
- 尝试为首页添加分页功能。
- ~~更改代码字体~~。已解决，只需调整浏览器最小字体大小即可。
- 使网站图标能够适配各平台，特别是移动端。比如在安卓的chrome中使用“将网站发送到主屏幕”功能时能够正常使用网站提供的图标。(可参考极客公园的效果)。可查找一下jekyll是否有相关的插件。
- 添加博客文章访问量的功能。
- 可以自行选择 Back to Top 的显示形式。

> 可以通过向源GitHub仓库提出... 的方式，学习与他人合作。


可参考的文章：

[Favicon 站点图标的各平台适配与移动端优化](https://www.null17.com/blog/coding/HTML/20160126-favicon/ "Favicon 站点图标的各平台适配与移动端优化  十七的空指针 - 陈十七的技术博客, Blog of Sykie Chen or HKEY_C17")    
[HTML5 移动端 head 头标签生成器](http://mr-why.com/frontend/gen_h5_head "HTML5 移动端 head 头标签生成器")    
[移动前端不得不了解的 HTML5 head 头标签（2016 最新版） - 前端 - 掘金](https://juejin.im/entry/58085b3267f3560057a0053a "移动前端不得不了解的 HTML5 head 头标签（2016 最新版） - 前端 - 掘金")   

