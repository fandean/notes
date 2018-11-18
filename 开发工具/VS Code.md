---
layout: post
title: "VS Code"
description: "VS Code"
date: 2017-07-17
tags: 
category: 
last_updated: 2017-07-24
comments: true
chare: true
---

* Kramdown table of contents
{:toc .toc}


# VS Code使用笔记


> 在我的XUbuntu 16.04中VS Code在使用过程中会出现光标乱跳的情况。
>
> 但在禁用所有vs code 的插件的时候，又没有发现问题。



## User Guide  



1. 代码行缩进 `Ctrl+[` 、 `Ctrl+]`
2. `Ctrl+C` 、 `Ctrl+V` 复制或剪切当前行/当前选中内容
3. 代码格式化： `Shift+Alt+F`，或 `Ctrl+Shift+P` 后输入 `format code`
4. **上下移动一行**： `Alt+Up` 或 `Alt+Down`
5. **向上向下复制一行**： `Shift+Alt+Up` 或 `Shift+Alt+Down`
6. 在当前行下边插入一行 `Ctrl+Enter`
7. 在当前行上方插入一行 `Ctrl+Shift+Enter`



1. 移动到定义处： `F12`
2. 定义处缩略图：只看一眼而不跳转过去 `Alt+F12`
3. 多行编辑(列编辑)：`Alt+Shift+鼠标左键`，`Ctrl+Alt+Down/Up`
4. 同时选中所有匹配： `Ctrl+Shift+L`
5. `Ctrl+D` 下一个匹配的也被选中 
6. **回退上一个光标操作**： `Ctrl+U`





1. 找到所有的引用： `Shift+F12`
2. 同时修改本文件中所有匹配的： `Ctrl+F12`
3. 重命名：比如要修改一个方法名，可以选中后按 `F2`，输入新的名字，回车，会发现所有的文件都修改了
4. 跳转到下一个 `Error` 或 `Warning`：当有多个错误时可以按 `F8` 逐个跳转
5. 查看 `diff`： 在 `explorer` 里选择文件右键 `Set file to compare`，然后需要对比的文件上右键选择 `Compare with file_name_you_chose`









[Basic Editing in Visual Studio Code](https://code.visualstudio.com/docs/editor/codebasics "Basic Editing in Visual Studio Code")





### Multiple selections (multi-cursor)

使用 `Shift+Alt+Down`或`Shift+Alt+Up`达到下图效果：       

![](https://code.visualstudio.com/images/editingevolved_multicursor.gif)

> 使用下文的扩选操作，再使用此处的快捷键，会有意想不到的效果。



先选中某单词，再按`Ctrl+D`达到下图效果：    

![](https://code.visualstudio.com/images/editingevolved_multicursor-word.gif)


### Shrink/expand selection

扩大选中区域：

- (选中文件中所有相同的字符串)每次扩选一个单词：`Ctrl+Shift+L`。（可能被markdown shortcuts插件占用）
- 每次扩选一行：`Shift+Alt+Left`或`Shift+Alt+Right`  

![](https://code.visualstudio.com/images/editingevolved_expandselection.gif)

### Column (box) selection

通过 `Shift+Alt+鼠标拖动`，实现下面的效果：     

![](https://code.visualstudio.com/images/editingevolved_column-select.gif)



> vs code的使用技巧：  
- 复制时使用的是通过 ctrl + d 选择的项目，粘贴时所选的项目也必须是通过ctrl + d选择的。（粘贴-复制时的选择文本的方法必须一样，才能正确对应）   
- 包含块后面的空格：先使用 Ctrl + d 选中部分相同的单词，再按 Ctrl + shift  + 左/右箭头调整（它能够按单词调整）  
- 在多光标的情况下，按住Ctrl再按 左/右箭头 可同时调整所有光标位置。    
- 从 `/usr/bin/xjc 几个相同的字符`复制一个 xjc 出来变成 `/usr/bin/xjc xjc`这种形式，也是可以通过vscode批量实现的    
- 默认按 alt加鼠标点击即可产生多个光标，但是我将其改为了 ctrl + 鼠标点击

### 命令面板

通过`ctrl + p`或 `F1` 弹出的对话框叫“命令面板”

打开命令面板有多个快捷键，它们的区别是:

- `ctrl + shift + p` 和 `F1`：打开命令面板时会带有 `>`
- `ctrl + p`: 打开命令面板时没有 `>`

由于快捷键冲突而导致无法触发相应插件，解决方法之一是直接在命令面板中操作。

```
> 显示并执行命令
? 获取帮助
```

如果一个文件夹中包含的文件较多，使用命令面板寻找并打开文件是不错的选择。



## 设置

### 保存/自动保存

VS Code能很容易开启自动保存，在你配置延迟后或者焦点离开编辑器后自动保存你的更改文件

打开 User Setting 或者 Workspace 配置自动保存，找到如下相关设置：

files.autoSave ：设置值为off表示关闭自动保存，afterDelay 保存文件后延迟自动保存，onFocusChange 焦点移出编辑器后就会自动保存。
files.autoSaveDelay ： files.autoSave 的值是 afterDelay 时，就可以设置自动保存的延迟时间。




## VS Code插件
[Visual Studio Code的C/C++扩展功能](https://blogs.msdn.microsoft.com/c/2016/04/18/visual-studio-code%E7%9A%84cc%E6%89%A9%E5%B1%95%E5%8A%9F%E8%83%BD/)  



> 值得欣慰的时 VS Code发展速度非常快，所以...



#### Evernote

Open and Save Evernote notes from VS Code using Markdown



#### Image preview
Shows image preview in the gutter and on hover.

支持鼠标悬停显示图片。



#### TranslationToolbox

翻译

使用快捷键 ctrl+alt+t or cmd+alt+t 启用TranslationToolbox扩展
选中想要翻译的文本，并将鼠标移至其上，即可显示翻译结果

#### Translator Plus
使用Google翻译，在状态栏显示翻译结果。很棒

但由于网络时好时坏，可能会显示"Waiting..."

#### Google Complete Me

Auto completion using Google Suggesting API.

国内还是使用不畅。


#### Dictionary Completion

word completion

Enabled for Markdown and LaTeX. 但是需要先配置以支持markdown等，见插件主页。





### 文件头
#### header source



#### File-Header-Comment Helper for Visual Studio Code

Insert File-Header-Comment

```json
    "fileHeaderCommentHelper.languageConfigs": {
        "language_markdown": { //指定语言比如 language_javascript
            "template": [
                "---",
                "layout: post",
                "title: \"$(currentFile)\"",
                "description: \"$(currentFile)\"",
                "date: 2017-",
                "tags: []",
                "category: ",
                "comments: true",
                "share: true",
                "---",
                "\n\n\n",
                "* Kramdown table of contents",
                "{:toc .toc}"
            ]
        }
    }
```



#### vscode fileheader

添加文件头，自动更新文件修改时间。


#### psioniq File Header
添加文件头，自动更新文件修改时间。

很棒的插件

[psioniq File Header - Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=psioniq.psi-header "psioniq File Header - Visual Studio Marketplace")



### 其它工具

#### EditorConfig for VS Code

支持 EditorConfig 的一个插件，用来在不同编辑器中保持代码格式的一致性。

[代码风格统一工具 EditorConfig](https://mp.weixin.qq.com/s?__biz=MzAwMTYwNzE2Mg==&mid=2651036611&idx=1&sn=65c9f4c95132ef4e704d165d74cea1ec#rd "代码风格统一工具 EditorConfig")



#### Path Intellisense

自动补全路径。(必装)




#### Project Manager

可以保存工程和在工程间切换

先将当前打开的文件夹以工程保存，之后就可以在命令面板中列出并打开。

> code 似乎已自带此功能



#### vscode-icons

~~为文件和文件夹添加图标~~。vs code已经自带

> NOTE 微软官方已经集成了图表,使用”File Icon Theme”就可更改.

#### vscode-youcompleteme

与VIM中的类似。


#### amVim

VS Code 中目前最好用的 vim 插件。


#### change-case

支持快速的选中的文本的命名格式，例如支持驼峰命名，Pascal命名，下划线分隔命名，常量命名等。


#### Auto Rename Tag

![](https://github.com/formulahendry/vscode-auto-rename-tag/raw/master/images/usage.gif)


#### Align
这个插件支持对选中的代码进行对齐操作

#### Auto Close Tag






### Git相关插件

#### Git History(git log)
Open the file to view the history, and then Press F1 and select/type "Git: View History (git log)", "Git: View File History" or "Git: View Line History".



#### Git Lens





### Markdown相关插件

VS Code貌似默认就带有markdown的预览功能；按`ctrl + shift + v`即可进行预览。

#### Markdown Preview Enhanced
预览效果不错，功能强。若无法预览可选择先将VC code关闭，再重新打开。

使用快捷键`ctrl + shift + m`预览。或输入`ctrl + shift + p`再输入 mpv 选择执行相关命令。


添加链接： `ctrl + l`      
添加图片链接： `ctrl + shift + l`    
可先选中文字。  

#### preview
预览

#### markdown Shortcuts
功能很强的编辑markdown文件的辅助工具。




#### Paste Image
> Linux系统需安装后xclip。该程序用于复制terminal内容到剪切板。

Paste image directly from clipboard to markdown(or other file)!

使用方法：   
先将图片保存到剪切板    
F1  然后输入  paste image   


[Paste Image](https://marketplace.visualstudio.com/items?itemName=mushan.vscode-paste-image "Paste Image - Visual Studio Marketplace")

![](https://raw.githubusercontent.com/mushanshitiancai/vscode-paste-image/master/res/vscode-paste-image.gif)

自定义图片保存位置。

Config Example见插件的示例。

```json
//Paste Image Configration：涉及到图片本地保存路径和文件中图片url路径
//图片保存路径
"pasteImage.path": "${projectRoot}/assets/images/post-images",
"pasteImage.basePath": "${projectRoot}",
"pasteImage.forceUnixStyleSeparator": true,
"pasteImage.prefix": "/",
```



图片命名规范，避免日后出现重复名称： `日期-图片相关信息`

#### paste image to qiniu
截图上传七牛云插件


#### Jekyll Snippets


#### vscode-hexo
VSCode extension to manage hexo commands.

另也可以自行配置部署hexo的任务：

```json
{
  "version": "0.1.0",
  "command": "hexo",
  "isShellCommand": true,
  "showOutput": "always",
  "suppressTaskName": true,
  "tasks": [
    {
      "taskName": "Generate",
      "args": ["g"]
    },
    {
      "taskName": "Deploy",
      "args": ["d"]
    },
    {
      "taskName": "Generate and Deploy",
      "args": ["d", "--g"]
    },
    {
      "taskName": "Serve",
      "args": [
        "s"
      ]
    }
  ]
}
```


貌似也可以自己配置任务来管理jekyll。



vscode 插件：  Translator plus, markdown shortcuts,  psioniq File Header，

似乎发现问题了。 原因可能是手误触到笔记本的触摸板。



### Web开发相关插件



#### ESLint

Integrates ESLint into VS Code



#### Beautify

Beautify javascript, JSON, CSS, Sass, and HTML in Visual Studio Code.



### Debugger for Chrome

Debug your JavaScript code running in Google Chrome from VS Code.

![](https://cdn.rawgit.com/Microsoft/vscode-chrome-debug/master/images/demo.gif)



### Live Server

该插件有 **在浏览器中打开文件** 和 **实时同步**功能。安装了该插件后就无需安装类似 open-in-browser 的插件。

![](https://github.com/ritwickdey/vscode-live-server/raw/master/images/Screenshot/vscode-live-server-editor-menu-3.jpg)

![](https://github.com/ritwickdey/vscode-live-server/raw/master/images/Screenshot/vscode-live-server-explorer-menu-demo-1.gif)



### Node相关

#### npm

npm support for VS Code



#### npm Intellisense



#### Node.js Modules Intellisense

该插件受启发于 npm Intellisense和AutoFileName



### veu.js相关

Vetur 和 Vue Snippets JS/HTML/PU...两个必装。

#### Vetur

vue tooling for vscode



#### Vue Snippets JS/HTML/PU...

依赖： vetur


### React相关





> ## 前端开发必备插件
>
> - PostCSS Sorting
> - stylelint
> - stylefmt
> - ESLint
> - javascript standard format
> - beautify
> - Babel ES6/ES7
> - Debugger for Chrome
> - Add jsdoc comments
> - javascript(ES6) code snippets
> - vue
> - weex
> - Reactjs code snippets
> - React Native Tools
> - Npm Intellisense
> - Instant Markdown
> - Markdown Shortcuts
> - TextTransform



### Java相关插件



#### Java Extension Pack

对于Java，先安装此插件，然后根据此插件的推荐安装其它插件即可。



#### Spring Boot Extension Pack

包含一系列Spring Boot相关的插件，相当于一个插件集合包。



#### Docker





#### IntelliJ IDEA Keybindings

绑定 IntelliJ IDEA 的快捷键







## 主题



**颜色主题：**

* One Dark Pro ：Atom's iconic One Dark theme, and one of the most downloaded themes for VS Code.
* rocket-ui
* Material Theme
* Material Syntax - Dark
* Dark+ Material
* Material Dark Soda
* Fresh Material
* Solarized Dark (推荐，与VS code最配)




推荐： Material Theme

> 搜索 "Material"  (材料)相关的主题

**主题图标：**

VS code默认为 "seti"

可以考虑：Material Icon Theme






## 学习文档
[VScode中文文档](https://www.gitbook.com/book/jeasonstudio/vscode-cn-doc/details)  
[VS Code Tips and Tricks](https://github.com/Microsoft/vscode-tips-and-tricks)  
[Visual Studio Code 配置指南](https://github.com/kaiye/kaiye.github.com/issues/14 "强烈推荐")  
[Key Bindings for Visual Studio Code](https://github.com/kaiye/kaiye.github.com/issues/14)  

查看VS Code的自带帮助，来学习它。比如： `帮助 --> 欢迎使用`

[Visual Studio Code User and Workspace Settings](https://code.visualstudio.com/docs/getstarted/settings "Visual Studio Code User and Workspace Settings")

[Microsoft/vscode-tips-and-tricks: Collection of helpful tips and tricks for VS Code.](https://github.com/Microsoft/vscode-tips-and-tricks "Microsoft/vscode-tips-and-tricks: Collection of helpful tips and tricks for VS Code.")



插件：

[掘金VS Code 收藏集](https://juejin.im/collection/58d9c70b1e35c9353d934e93 "https://juejin.im/collection/58d9c70b1e35c9353d934e93")

