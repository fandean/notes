# Everything

**官方帮助文档**：[Everything - voidtools](https://www.voidtools.com/zh-cn/support/everything/) 

如何开启 Everything 服务？

Everything 服务可以索引 NTFS 分卷和监控 USN 日志。

这将可以让 Everything 以标准用户方式运行，而不用每次打开Everything都提示需要管理员权限( UAC )。设置方法 工具 👉 选项 👉 常规 👉 取消以管理员运行，勾选 Everything 服务。

> 可以选择开启 **搜索历史**。

## 快捷键

通过热键打开 Everything 窗口有以下三种方式：

| 方式       | 说明                                                         |
| :--------- | :----------------------------------------------------------- |
| 新建搜索口 | 总是打开一个新建的 Everything 搜索窗口。                     |
| 打开搜索口 | 打开已存在的 Everything 搜索窗口，否则创建新的 Everything 搜索窗口。 |
| 切换搜索口 | 隐藏前台的 Everything 搜索窗口，否则激活后台的 Everything 搜索窗口，否则创建新的 Everything 搜索窗口。 |

禁用 Windows 默认热键，例如 Win + F：

- 进入开始菜单，打开 regedit。

- 进入注册表编辑器，转到：

  ```
  HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced
  ```

- 创建新字符串值 **DisabledHotkeys**。

- 设置 DisabledHotkeys 数据为您想要释放的字母，例如：**F**。

- 重启计算机。

- 在 Everything 中应用释放的热键 Win + F。



## 筛选器

 筛选器是预定义的搜索选项，例如音频和视频文件类型 。

>  书签： 可以利用一下



## 运行历史

利用运行历史来 打开经常运行文件，Everything 记忆每次结果的运行次数。

在搜索框中按 Enter 已选择最高运行次数的结果。

手动设置运行次数 ： 选中一个文件或文件夹 👉 文件 👉 设置运行次数

以运行次数排序，右键点击列表空白处并点击排序->运行次数。

> 默认开启运行历史，可在选项中设置

 使用 `runcount:`来搜索指定运行次数或运行次数范围。 

搜索运行次数大于 100：

```
runcount:>100
```

搜索运行次数至少一次：

```
runcount:
```

搜索运行次数在 10 与 20 之间：

```
runcount:10-20
```

设置默认以运行次数排序：

- 在 ***“Everything”\*** 中，打开**工具**菜单，点击**选项**。
- 点击**首页**页面。
- 更改**排序方式**为**运行次数 (降序)**。
- 点击**确定**。

## 搜索

**Everything 搜索语法和正则表达式语法的区别与联系：**

正则表达式默认覆盖搜索语法。搜索操作符、通配符、宏、修饰符和函数无法工作于正则表达式模式。

正则表达式必须从搜索菜单启用或使用搜索前缀 `regex:`



可以限定搜索某一分区，例如，搜索分区 **D:** 中文件和文件夹：

```
d:
```

搜索分区 D: 或 E: 上 mp3 文件：

```
d:|e: *.mp3
```

搜索分区 D: 上 jpg 或 png 文件：

```
d: *.jpg|*.png
```

使用双引号以转义空格，搜索 **C:\Program Files** 下文件和文件夹：

```
"c:\program files\"
```

仅搜索文件：

```
file:
```



仅搜索文件夹：

```
folder:
```

限定搜索单个文件夹（以它为父文件夹的子文件夹）：

```
parent:c:\windows
```

使用 \ 来搜索部分路径，例如，在以 **documents** 结尾文件夹中搜索文件和文件夹：

```
documents\
```

使用空格以组合搜索条件，例如，在以 **work** 开头文件夹下搜索包含 **order** 的文件和文件夹：

```
\work order
```

搜索大于 1MB 的文件：

```
size:>1mb
```

搜索 D:\music 下不包含 mp3 的文件夹：

```
d:\music\ !child:mp3
```



> ⭐ 利用 **高级搜索**框 来拼接最终的搜索字符串



**指定文件目录搜索：**  在检索条件中使用`\`，可以指定查找位置

- `TDDOWNLOAD\ abc`        在所有TDDOWNLOAD文件夹下搜索包含abc字符的文件及文件夹
- `TDDOWNLOAD\ *.jpg`      在所有TDDOWNLOAD文件夹下搜索jpg后缀文件
- `F:\TDDOWNLOAD\ abc`     在F:\TDDOWNLOAD\目录下搜索包含abc字符的文件及文件夹
- `F:\TDDOWNLOAD\ *.jpg`   在F:\TDDOWNLOAD\目录下搜索jpg后缀文件

**排除指定目录：** 使用 `!` （非）排除 

-  排除指定目录：`!绝对路径\` 
-  排除指定子目录：`!子目录名称\`  

```
!C:\*Windows* !?:\$RECYCLE.BIN* file:*.exe|*.lnk|*.ahk|*.bat|*.cmd !D:\Scoop\Applications\shims 
!D:\Scoop\Applications\shims\  

Scoop安装的程序的最新版都在 current 快捷方式下，并且旧版中的exe文件仍然保存，这样对RunAny会造成问题
- 思路一： 通过目录限定。步骤复杂，并且还需解决软链接带来的问题
- 思路二： 让其只选择日期最新的exe （推荐）

操作符: 
	space	与 (AND)
	|	或 (OR)
	!	非 (NOT)
	< >	分组
	" "	搜索引号内的词组.

修饰符：
filelist:<fn1|fn2|...>	搜索 文件名列表 中的文件.
type:<type>	搜索指定的文件类型的文件和文件夹
file:	仅匹配文件.

函数：
attrib:<attributes>	搜索指定的文件属性的文件和文件夹.
attribdupe:	搜索含有相同属性的文件和文件夹.
child:<filename>	搜索包含匹配文件名文件或文件夹的文件夹。
attributes:<attributes>	搜索指定的文件属性的文件和文件夹.
parent:<path>	搜索指定路径下的文件和文件夹 (不包含子文件夹).
```







**多关键词搜索示例：**

```
123 abc            搜索包含123和abc的文件和文件夹
123|abc            搜索包含123或abc的文件和文件夹
*.jpg|*.flv
.jpg | .flv           搜索jpg或flv后缀文件         （两种表示方式任选一种，第二种竖线|两边加空格）
```

> 竖线 |表示或，空格表示与，都可以多个连续使用
>
> 在使用之前，确保已经打开正则表达式选项（菜单Search → Enable Regex）
>
> 为了在搜索条件中包含空格，你可以使用双引号。  
> 例如，`"foo bar"`只能匹配 `foo bar`，而不能匹配fooadbar、fooibar等等。 

如何只显示二级目录内容，不显示多级子目录下文件？示例
`C:\New Folder\ parents:2`  



## 重复文件

以下搜索函数可以搜索重复文件：

| 搜索函数        | 描述                                                         |
| --------------- | ------------------------------------------------------------ |
| `dupe:`         | 搜索含有相同文件名的文件和文件夹。                           |
| `attribdupe:`   | 搜索含有相同属性的文件和文件夹。按属性排序以显示最佳结果。   |
| `dadupe:`       | 搜索含有相同访问时间的文件和文件夹。按访问时间排序以显示最佳结果。 |
| `dcdupe:`       | 搜索含有相同创建时间的文件和文件夹。按创建时间排序以显示最佳结果。 |
| `dmdupe:`       | 搜索含有相同修改时间的文件和文件夹。按修改时间排序以显示最佳结果。 |
| `namepartdupe:` | 搜索含有相同名称部分的文件和文件夹 (不包含扩展名)。          |
| `sizedupe:`     | 搜索大小相同的文件和文件夹。按大小排序以显示最佳结果。       |



重复文件将在完整索引中搜索，而不是当前搜索结果。

搜索并以重复属性类型排序以显示最佳结果。。

Everything 不会检测文件内容。使用重复搜索函数作为辅助。

实用例子：

```
dupe: .mp4
# 这个很实用
size:>1gb sizedupe:
```

> 补充：
>
> `empty:` 搜索空文件夹



## 与日期相关的搜索



| 函数/缩写             | 描述                                 |
| --------------------- | ------------------------------------ |
| `recentchange:<date>` ,`rc:<date>` | 搜索指定最近修改日期的文件和文件夹。 |
| `dateaccessed:<date>` , `da:<date>`  | 搜索指定访问时间的文件和文件夹。     |
| `datecreated:<date>` ,`dc:<date>`     | 搜索指定创建日期的文件和文件夹。     |
| `datemodified:<date>` , `dm:<date>`    | 搜索指定修改日期的文件和文件夹。     |
| `daterun:<date>` , `dr:<date>`         | 搜索指定打开时间的文件和文件夹。     |



快速搜索今日修改的文件（监控系统实时变更）：

```
dm:today
```

搜索这周创建的文件和文件夹：

```
dc:thisweek
```

搜索创建于2014 年 8 月 1 日到 2014 年 8 月 31 日的文件和文件夹:

```
dc:1/8/2014-31/8/2014
```



## 正则表达式

正则表达式默认覆盖搜索语法。搜索操作符、通配符、宏、修饰符和函数无法工作于正则表达式模式。

正则表达式必须从搜索菜单启用或使用搜索前缀 regex:

| 正则表达式 | 描述                                      |
| ---------- | ----------------------------------------- |
| `a|b`      | 匹配 a 或 b                               |
| `gr(a|e)y` | 匹配 gray 或 grey                         |
| `.`        | 匹配任一字符                              |
| `[abc]`    | 匹配任一字符：a 或 b 或 c                 |
| `[^abc]`   | 匹配任一字符, 但不包括 a、b、c            |
| `[a-z]`    | 匹配从 a 到 z 之间的任一字符              |
| `[a-zA-Z]` | 匹配从 a 到 z, 及从 A 到 Z 之间的任一字符 |
| `^`        | 匹配文件名的头部                          |
| `$`        | 匹配文件名的尾部                          |
| `*`        | 匹配前一项内容 0 或多次                   |
| `?`        | 匹配前一项内容 0 或 1 次                  |
| `+`        | 匹配前一项内容 1 或多次                   |
| `{x}`      | 匹配前一项内容 x 次                       |
| `{x,}`     | 匹配前一项内容 x 或多次                   |
| `{x,y}`    | 匹配前一项内容次数介于 x 和 y 之间        |



## 搜索历史

搜索历史是先前搜索记录列表。

搜索历史默认禁用。

当启用搜索历史后，您可以在搜索框通过组合键 Ctrl + Space 列举搜索建议。



## 文件夹索引

文件夹索引让 Everything 可以索引任何文件系统文件夹。

索引的文件夹甚至可以离线但仍旧可以通过 Everything 索引。

例如，通过文件夹索引您可以索引以下：

- 网络分享或映射的网络分区。
- FAT32 和其他分卷。
- 任何物理文件夹 。

添加方式： 工具 👉 选项 👉 索引 👉 ...



**索引的文件夹离线或不存在时会出现什么情况？**
文件夹索引将会保持不变。

但是，强制重建索引将会显示此文件夹为空。

Everything 将会在指定的时间或周期时继续重扫描此文件夹，但仅在文件夹存在时更新索引。

离线文件夹图标和文件信息显示将在数秒后超时。

您可以在文件夹存在时按 F5 来刷新缓存。

## 文件列表

[File Lists - voidtools](https://www.voidtools.com/zh-cn/support/everything/file_lists/)

Everything 文件列表(EFU) 推荐使用于离线文件或不会变动的文件，例如 CDROM、DVDROM 或只读 NAS。

EFU 文件是包含文件名、大小、日期以及属性列表的*逗号分隔值 (CSV) 文件*。

文件列表可以通过 Everything 打开或包含到 Everything 索引。

文件列表可以被搜索并可以立即按大小、日期或属性排序。

如何创建 EFU 文件列表？

- 在 ***Everything"*** 中，打开**工具**菜单，点击**文件列表编辑器...**。
- 在**文件列表编辑器**中，**拖拽**文件到列表以添加到文件列表。
- 您也可以从编辑菜单添加文件和文件夹。
- 添加完成后，打开**文件**菜单，点击**保存**。



| 函数                      | 描述                               |
| ------------------------- | ---------------------------------- |
| `filelist:<list>`         | 搜索文件名列表中的文件。           |
| `filelistfilename:<list>` | 搜索文件名列表中的文件和文件夹。   |
| `frn:<list>`              | 搜索指定文件索引号的文件和文件夹。 |



其他：

- 使用（系统）计划任务更新文件列表
- 包含文件列表到 the Everything 索引：工具 👉 选项 👉 文件列表 👉 添加



## Everything高级设置 (ini文件)

 文件 Everything.ini 保存有全部的 Everything 设置。 

一般来说， 文件 Everything.ini 将保存在 Everything.exe 相同目录 。

> 对于实用Scoop安装 everything的用户，需要更改`..\scoop\Applications\persist\everything\` 目录下的ini文件。（persist目录是scoop专门用来保存用户配置的目录）

注意：**文件 Everything.ini 是自动生成的。Everything 运行过程中对 Everything.ini 的变更将丢失。**

 请**从托盘图标中退出** "*Everything*" 然后再更改 Everything.ini 文件。  Everything.ini 文件编码格式为 UTF-8。 



语法：

```
[section] 
key=value
```



### 实现搜索排序



 **搜索相关设置** 

***sort***

最后的排序。如果 home_sort 为 1，则在打开新的搜索窗口时将还原此排序。如果always_keep_sort 为 0，则如果是慢速排序，则将忽略此值。

可以是下列排序类型之一：

| Type | Description                        |
| :--- | :--------------------------------- |
| 0    | Name 名称                          |
| 1    | Path 路径                          |
| 2    | Extension 扩展名                   |
| 3    | Type 类型                          |
| 4    | Date modified 修改日期             |
| 5    | Date created 创建日期              |
| 6    | Date accessed 访问日期             |
| 7    | Attributes 属性                    |
| 8    | Date recently changed 最近更改日期 |
| 9    | Run count 运行计数                 |
| 10   | Date run 日期运行                  |
| 11   | File list filename 文件列表文件名  |



***sort_ascending***

升序或降序排序。设置为 `1` 以升序排序。设置为 `0` 以降序排序。 



**Everything如何实现搜索时直接以修改时间为默认排序？**

找到 Everything.ini，修改如下几项参数的值为以下值：

```
sort=4
sort_ascending=0
always_keep_sort=1
home_sort=0
```

如果找到正确的 Everything.ini 文件，并按上文的操作来进行就可以更改成功。



> [Everything_SetSort | Search Everything中文版](https://www.everythingsearch.cn/284.html)



## 补充



- 搜索非NTFS格式文件：

  比如U盘，只需手动将其加入索引即可。

  工具👉选项👉索引👉文件夹👉添加👉选择U盘对应的盘符

- 对文件中的内容进行搜索：利用  `content:<text>` 默认UTF-8格式文本内容 

  由于现在用户经常使用ANSI和UNICODE两种不同的编码方式标准，因此这个参数的搜索规则是：”搜索路径” `ansicontent:`”搜索关键词”，或者”搜索路径” `utf16content:`”搜索关键词”。比如我们要在E盘的ABC这个文件夹目录中搜索“黑客”这个关键词，那么就输入`E:abc utf16content:"黑客"`这一行命令，或者`E:abc ansicontent:"黑客"`这一行命令即可 

- 是





### 语法

[Searching - voidtools](https://www.voidtools.com/zh-cn/support/everything/searching/)



- 操作符：
- 通配符：仅有 `*`  和 `?`
- 宏：无需添加额外参数
  - `zip:`搜索压缩文件，
  - `doc:` 搜索文档文件
  - 类似 `exe:` 、`pic:`、`audio:`、`video:`
- 修饰符：示例`file:` 仅匹配文件
- 函数：大多有参数，并且有函数语法





函数语法：

| `function:value`      | 等于某设定值。             |
| --------------------- | -------------------------- |
| `function:<=value`    | 小于等于某设定值。         |
| `function:            | 小于某设定值。             |
| `function:=value`     | 等于某设定值。             |
| `function:>value`     | 大于某设定值。             |
| `function:>=value`    | 大于等于某设定值。         |
| `function:start..end` | 在起始值和终止值的范围内。 |
| `function:start-end`  | 在起始值和终止值的范围内。 |



大小语法：

```
size[kb|mb|gb]
```



大小常数：

| `empty`    |                        |
| ---------- | ---------------------- |
| `tiny`     | 0 KB < 大小 <= 10 KB   |
| `small`    | 10 KB < 大小 <= 100 KB |
| `medium`   | 100 KB < 大小 <= 1 MB  |
| `large`    | 1 MB < 大小 <= 16 MB   |
| `huge`     | 16 MB < 大小 <= 128 MB |
| `gigantic` | 大小 > 128 MB          |
| `unknown`  |                        |



日期语法

```
year
```

`month/year` 或 `year/month` 取决于本地设置

`day/month/year`, `month/day/year` 或 `year/month/day` 取决于本地设置

```
YYYY[-MM[-DD[Thh[:mm[:ss[.sss]]]]]]
YYYYMM[DD[Thh[mm[ss[.sss]]]]]
```



日期常数：

```
today
yesterday
```

``

``

``

```
january|february|march|april|may|june|july|august|september|october|november|december
jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec
sunday|monday|tuesday|wednesday|thursday|friday|saturday
sun|mon|tue|wed|thu|fri|sat
unknown
```

