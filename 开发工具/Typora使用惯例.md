---
typora-root-url: ..\..\..\..\Pictures\Git-Pictures\markdown
---







## 图片



图片命名规则：

```
文档名（简写） +  .  + 图片内容 
```

为图片的名称添加 文档名前缀能方便以后知晓该图片使用的位置





1. 问题场景：如果从剪贴板得到的图片能复制到文章（拖拽图片），而且能够自动保存在某一位置就好了。

   步骤一：`File`–>`Preference`–>`Editor`–>`Image Insert`–>`Allow copy images to given folder`

   步骤二：`Edit`–>`ImageTools`–>`When Insert Local Images`–> `Copy Image File to Folder...`

   > 以上步骤目的：在编辑文章时从剪贴板获得的图片或者拖拽图片，自动会将该图片存储到指定文件夹下。步骤二会出现文件夹选择框，选择你将要保存图片文件的文件夹位置。
   >
   > TIP：图片支持拖拽，但是图片不支持粘贴复制，但是却可以从剪贴板中粘贴，不知道为什么。

2. 问题场景：如果拖拽的图片，粘贴的图片自动使用相对路径，就可以方便上传到GitHub了。

   > 将图片与文章放在同一个文件夹下，方便使用相对路径表示图片。

   方法一：`File`–>`Preference`–>`Editor`–>`Image Insert`–>`Allow relative path if possible`

   方法二：`Edit`–>`ImageTools`–>`When Insert Local Images`–> `Use Image Root Path`

3. 问题场景：轻松发布到别的地方，比如CSDN博客？

   > 没有很好的方法，有人推荐用MWeb+一系列工具，但是MWeb收费。我就先上传到GitHub，然后就手动给图片加上路径。



[Windows版本的Typora使用技巧 - CSDN博客](https://blog.csdn.net/qq_21184771/article/details/57466568 "Windows版本的Typora使用技巧 - CSDN博客")



















