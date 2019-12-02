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





# VS Code使用笔记

[Documentation for Visual Studio Code](https://code.visualstudio.com/docs) 

## First Steps

To get the most out of Visual Studio Code, start by reviewing a few introductory topics:

[Intro Videos](https://code.visualstudio.com/docs/getstarted/introvideos) - Begin your journey with VS Code through these introductory videos.

[Setup](https://code.visualstudio.com/docs/setup/setup-overview) - Install VS Code for your platform and configure the tool set for your development needs.

[User Interface](https://code.visualstudio.com/docs/getstarted/userinterface) - Introduction to the basic UI, commands, and features of the VS Code editor.

[Settings](https://code.visualstudio.com/docs/getstarted/settings) - Customize VS Code for how you like to work.

[Languages](https://code.visualstudio.com/docs/languages/overview) - Learn about VS Code's support for your favorite programming languages.

[Node.js](https://code.visualstudio.com/docs/nodejs/nodejs-tutorial) - This tutorial gets you quickly running and debugging a Node.js web app.

[Tips and Tricks](https://code.visualstudio.com/docs/getstarted/tips-and-tricks) - Jump right in with Tips and Tricks to become a VS Code power user.

[Azure](https://code.visualstudio.com/docs/azure/extensions) - VS Code is great for deploying your web applications to the cloud.

[Extension API](https://code.visualstudio.com/api) - Learn how to write a VS Code extension.

[Why VS Code?](https://code.visualstudio.com/docs/editor/whyvscode) - Read about the design philosophy and architecture of VS Code



[Writing Java with Visual Studio Code](https://code.visualstudio.com/docs/java/java-tutorial) ，**Code为Java等各种语言提供了详细的文档**



## User Guide

[Basic Editing in Visual Studio Code](https://code.visualstudio.com/docs/editor/codebasics) 

1.  **触发提示** 代码补全（Ctrl + Space） ：即显示 Snippet 。（也可在设置中开启tab补全）
2. 代码行缩进 `Ctrl+[` 、 `Ctrl+]`
3. `Ctrl+C` 、 `Ctrl+V` 复制或剪切当前行/当前选中内容
4. 代码格式化： `Shift+Alt+F`，或 `Ctrl+Shift+P` 后输入 `format code`
5. **上下移动一行**： `Alt+Up` 或 `Alt+Down`
6. **向上向下复制一行**： `Shift+Alt+Up` 或 `Shift+Alt+Down`
7. 在当前行下边插入一行 `Ctrl+Enter`
8. 在当前行上方插入一行 `Ctrl+Shift+Enter`



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



### 打开文件

打开文件的方式：

- 单击文件，进入预览模式，此时标签页中的名字显示为 *斜体*
- 双击文件，直接进入编辑模式，此时标签页中的名字正常显示

现代编辑器默认都有一个预览模式。在预览标签页中，如果继续单击其他文件，则其他文件内容会覆盖当前预览标签页窗口中的内容；如果在预览标签页中编辑文件，则该标签页自动变为编辑模式。

预览模式也可以设置中通过下面的方式关闭：

```json
"workbench.editor.enablePreview": false,
```



[ vs Code打开新的文件会覆盖窗口中的,怎么改 - SegmentFault 思否](https://segmentfault.com/q/1010000006131199)



## 设置

### 保存/自动保存

VS Code能很容易开启自动保存，在你配置延迟后或者焦点离开编辑器后自动保存你的更改文件

打开 User Setting 或者 Workspace 配置自动保存，找到如下相关设置：

files.autoSave ：设置值为off表示关闭自动保存，afterDelay 保存文件后延迟自动保存，onFocusChange 焦点移出编辑器后就会自动保存。
files.autoSaveDelay ： files.autoSave 的值是 afterDelay 时，就可以设置自动保存的延迟时间。



## Task 任务

> [Visual Studio Code中的任务](https://code.visualstudio.com/Docs/editor/tasks#_processing-task-output-with-problem-matchers)

> 看起来就像是为了更方便的让我们执行需要在终端运行的命令，你看它位于 菜单 👉终端下

许多插件可以自动执行诸如整理，构建，打包，测试或部署软件系统之类的任务 ，但安装这些插件后，在对应的工程中，它们会提供一些默认的任务。（对于maven的任务现在正在开发中）。我们可以通过快捷键` Ctrl + Shift + B `或终端菜单来列出这些任务。

任务有全局的也有仅用于当前工作空间的（它在项目的.vscode目录下）

当然你可以自定义任务（为该工程手动创建一个任务）：

菜单 👉 终端 👉 配置任务 👉 选择创建task.json文件 👉 它会提供几个模板，如果模板中没有则选择 Others。

```json
{
  // See https://go.microsoft.com/fwlink/?LinkId=733558
  // for the documentation about the tasks.json format
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Run tests",  //任务名称
      "type": "shell",		//任务类型：shell（命令）或process
      "command": "./scripts/test.sh",	//实际要执行的命令
      "windows": {	//如果在win中则优先使用下面的内容
        "command": ".\\scripts\\test.cmd"
      },
      "group": "test", //任务所属的 组
      "presentation": { //定义如何在用户界面中处理输出
         //下面表示每次执行任务都让其创建一个新的终端
        "reveal": "always",
        "panel": "new"
      }
        "options":
        "runOptions":
    },
    {
      	"label": "Client Build",
        "type":"shell",
      	"command": "gulp",
      	"args": ["build"], //参数
      	"options": { //覆盖 cwd(当前工作目录)、env(环境变量)、shell(默认shell)的值
        "cwd": "${workspaceRoot}/client"
      }
    }
  ]
}
```

另外还有：(使用ctrl+space触发提示)

- options：覆盖 cwd(当前工作目录)、env(环境变量)、shell(默认shell)的值
- runOptions： 定义何时以及如何运行任务 
- args：命令的参数 示例 `”args”:["folder"]`

 对于包含空格或其他特殊字符的命令和参数，Shell命令需要特殊对待 

- 如果提供单个命令，那么任务系统会将命令原样传递给底层shell。如果命令需要加引号或转义才能正常运行，则该命令需要包含正确的引号或转义字符。例如，要列出包含空格的名称中的文件夹的目录，命令在bash执行应该是这样的：`ls 'folder with spaces'`。 

  ```json
  {
    "label": "dir",
    "type": "shell",
    "command": "dir 'folder with spaces'"
  }
  ```

-  如果提供了命令和参数，则如果命令或参数包含空格，则任务系统将使用单引号。对于`cmd.exe`，使用双引号。如下所示的shell命令将在PowerShell中以方式执行`dir 'folder with spaces'`。 

  ```json
  {
    "label": "dir",
    "type": "shell",
    "command": "dir",
    "args": ["folder with spaces"]
  }
  ```

-  如果要控制如何对参数加引号，则参数可以是指定值和引用样式的文字。下面的示例使用转义而不是使用空格引号。 

  ```json
  {
    "label": "dir",
    "type": "shell",
    "command": "dir",
    "args": [
      {
        "value": "folder with spaces",
        "quoting": "escape"
      }
    ]
  }
  ```

> 可更改默认终端为 cmd 、bash等

**控制输出行为：**

同设置 ` presentation ` 的属性来控制终端行为，有如下属性：

-  **reveal** ：控制是否将集成终端面板置于前面。有效值为：
  - always - 面板总是放在最前面。这是默认值。
  - *never* - 用户必须使用“ **视图”** >“ **终端”**命令（Ctrl +`）将终端面板显式显示在最前面 。
  - *silent* - 仅在不扫描输出中是否有错误和警告的情况下，才将终端面板置于前面。
- **focus**：控制终端是否获取输入焦点。默认值为`false`。
- **echo**：控制是否在终端中回显执行的命令。默认值为`true`。
- **showReuseMessage**：控制是否显示“终端将被任务重用，请按任意键将其关闭”消息。
- panel：控制是否在任务运行之间共享终端实例。可能的值为：
  - *shared*：*共享*终端，并将其他任务运行的输出添加到同一终端。
  - *dedicated*：终端专用于特定任务。如果再次执行该任务，则将重新使用终端。但是，不同任务的输出将显示在不同终端中。
  - *new*：该任务的每次执行都使用新的干净终端。
- **clear**：控制在运行此任务之前是否清除终端。默认值为`false`。
- **group**：控制是否使用拆分窗格在特定的终端组中执行任务。同一组中的任务（由字符串值指定）将使用拆分终端显示，而不是新的终端面板。



## Snippets

> [Snippets in Visual Studio Code](https://code.visualstudio.com/docs/editor/userdefinedsnippets)

**触发提示** 代码补全（Ctrl + Space） ：即显示 Snippet 。（也可在设置中开启tab补全）

可以从 Marketplace 安装扩展从而来提供 snippets。

- vscode-sinppet ：适用于多种语言。才知道还有这么个**作弊网站** [cheat.sh](https://cht.sh/)  
- snippet-creator  ：简化 snippet的创建。 Select the code you want to create snippet from and use command `Create Snippet` from the command palette 



**创建自己的 Snippets：**

文件👉首选项👉用户代码片段👉选择该snippet用于哪种类型的文件或选择Global Snippets文件





## VS Code插件

> 值得欣慰的时 VS Code发展速度非常快，所以...

 [ Marketplace](https://marketplace.visualstudio.com/vscode) 中有大量流行插件，可以在这里搜索。但有必要记录一下插件的类型：

- 代码格式：Prettier  支持多种前端语言，也包括md
- 各种Lint，提示代码语法错误
- 代码补全：completion 
- Git： 补充 Git Emoji Commit 中文版
- 文本处理、编辑增强
- 正则表达式： **any-rule**  你要的"正则"都在这!  提供了各种现成的正则表达式
- Java语言： 阅读code doc中对 java 支持相关的文章
- markdown：  Markdown All in One （多观察他的Github仓库才能更多的了解到它的功能）
- 主题： One Dark Pro（Atom）、Material Theme 就这两个，浪费时间。其他看着可以，但 md 文档达不到想要的配色，这两个是最好的。
- snippet：相关插件
- task：任务相关插件， Quick Task
- 项目管理：projects manager
- Make Hidden：可以用来隐藏项目中暂时不需要的文件夹，当然之后也可以将其显示出来。
- Sass(scss) ： SCSS IntelliSense 
- psioniq File Header 强悍







- Prettier - Code formatter ：代码格式化（前端代码最好用？）



[Visual Studio Code的C/C++扩展功能](https://blogs.msdn.microsoft.com/c/2016/04/18/visual-studio-code%E7%9A%84cc%E6%89%A9%E5%B1%95%E5%8A%9F%E8%83%BD/)  





#### Evernote

Open and Save Evernote notes from VS Code using Markdown



#### Image preview
Shows image preview in the gutter and on hover.

支持鼠标悬停显示图片。



#### Google Translator

使用Google cn 翻译，可以在状态栏显示翻译结果，可以悬停翻译，可以…

#### Google Complete Me

Auto completion using Google Suggesting API.

国内还是使用不畅。


#### Dictionary Completion

word completion

Enabled for Markdown and LaTeX. 但是需要先配置以支持markdown等，见插件主页。

- Path Autocomplete 、：路径、文件自动补全code或某些扩展在特定文件中已经支持

  



### 文件头

发现了微软推出的 docs-metadata 文档元数据 导出编辑工具

Front Matter：能够快速创建和导入tag和category，更新所有文章中的tag，自动生成 slug，



#### psioniq File Header

添加文件头，自动更新文件修改时间。**没有做不到，只有想不到** 

很棒的插件

[psioniq File Header - Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=psioniq.psi-header "psioniq File Header - Visual Studio Marketplace")



```json
  // 添加文档头部注释模板。记得添加逗号,
  // 更多配置见官方说明 ，有非常完整的示例
  //全局配置
  "psi-header.config": {
    // 忽略光标位置，总是在文档最前插入
    "forceToTop": true,
    // 指定在标题注释块之后插入多少空白行
    "blankLinesAfter": 1
  },

  "psi-header.changes-tracking": {
    // 开启 更改追踪（即记录更改日期等）
    "isActive": true,
    //更改者名称填入的位置(这两个是默认值可以不填)
    "modAuthor": "Modified By: ",
    //更改日期填入的位置
		"modDate": "Last Modified: ",
    "modDateFormat": "YYYY-MM-DD h:mm:ss",
    //自动为新建的文件添加头部
    "autoHeader": "manualSave",

    //在保存文件时如果没有头部则自动添加
    //注意：建议将其关闭，并将 include 清空
    "enforceHeader": true,

    //在保存文件时则需要替换行的前缀（比如文件名被更改）
    "replace": ["title:"],
    // 要追踪的语言列表（如果为空表示所有语言）
    "include": ["markdown"],
    // 需要排除的语言
    "exclude": [
			"json", 
      "yaml",
      "toml"
		],
    //再次见到 Glob，它表示bash所使用的那种通配符规则
		"excludeGlob": [
			"out/**",
			"src/**/*.xyz"
		],
  },

  //特定语言的配置
  "psi-header.lang-config": [
    {
      "language": "markdown",
      "begin": "---",
      "prefix": "",
      "end": "---",
      "blankLinesAfter": 2,
      // 忽略光标位置，总是在文档最前插入
      "forceToTop": true,
    }
  ],

  //这里是自定义的变量和对应的值
  "psi-header.variables": [
    ["projectCreationYear","2019"],
    //自定义的变量，可以覆盖全局变量
    ["author","Felix"],
    ["authoremail", "fandean@outlook.com"],
    ["company", "Felix"]
  ],

  // 模板 : 变量使用<< >> 包围
  "psi-header.templates": [
    {
      //用于 markdown 的模板
      "language": "markdown",
      "template": [
        "title: <<filenamebase>>",
        "date: <<filecreated('YYYY-MM-DD')>>",
        "description: <<filenamebase>>",
        "toc: true",
        "draft: true",
        "comments: true",
        "keywords:",
        "- ",
        "tags:",
        "- ",
        "series:",
        "- ",
        "categories:",
        "- ",
      ]
    }
]
```



### 其它工具

#### EditorConfig for VS Code

支持 EditorConfig 的一个插件，用来在不同编辑器中保持代码格式的一致性。

[代码风格统一工具 EditorConfig](https://mp.weixin.qq.com/s?__biz=MzAwMTYwNzE2Mg==&mid=2651036611&idx=1&sn=65c9f4c95132ef4e704d165d74cea1ec#rd "代码风格统一工具 EditorConfig")






#### Project Manager

可以保存工程和在工程间切换

先将当前打开的文件夹以工程保存，之后就可以在命令面板中列出并打开。

> 推荐



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

好牛🐂 ， GitLens 10

时间格式配置：

默认： 

```
MMMM Do, YYYY h:mma		July 26th, 2018 7:18am
MMM D, YYYY			    Jul 26, 2018
```

中国格式： 年YYYY ，月M，日D，时H，分m，秒ss

通用格式：YYYY-MM-DD

### Git File History 

这种查看方式不错



### Markdown相关插件

VS Code默认就带有markdown的预览功能；按`ctrl + shift + v` 或 `Ctrl + K + V` 即可进行预览。

关于预览，只要选对主题，基本不需要再进行渲染预览。

可以自定义code的markdown主题，通过 ` "markdown.styles": [] ` 具体做法见 [editor - How can I use an online style.css on the visual studio code markdown preview? - Stack Overflow](https://stackoverflow.com/questions/32410064/how-can-i-use-an-online-style-css-on-the-visual-studio-code-markdown-preview)



#### Markdown All in One

自动列表，图片提示等



#### Markdown Preview Enhanced
预览效果不错，功能强。若无法预览可选择先将VC code关闭，再重新打开。

使用快捷键`ctrl + shift + m`预览。或输入`ctrl + shift + p`再输入 mpv 选择执行相关命令。


添加链接： `ctrl + l`      
添加图片链接： `ctrl + shift + l`    
可先选中文字。  



#### markdown Shortcuts

功能很强的编辑markdown文件的辅助工具。

对创建表格很有帮助


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

[Writing Java with Visual Studio Code](https://code.visualstudio.com/docs/java/java-tutorial) ，code为Java等各种语言提供了详细的文档

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

  



**主题图标：**

VS code默认为 "seti"，推荐 vscode-icons










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

