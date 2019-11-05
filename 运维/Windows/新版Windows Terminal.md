## 新版Windows Terminal

 GitHub：[microsoft/terminal](https://github.com/microsoft/terminal)



安装方式我们通过Scoop安装即可。

```shell
scoop install Ash258/WindowsTerminal
```

> 微软新推出的一个编程字体：[microsoft/cascadia-code](https://github.com/microsoft/cascadia-code)

先来看一下其配置文件profiles.json

```json

// To view the default settings, hold "alt" while clicking on the "Settings" button.
// For documentation on these settings, see: https://aka.ms/terminal-documentation

{
    "$schema": "https://aka.ms/terminal-profiles-schema",

    "defaultProfile": "{61c54bbd-c2c6-5271-96e7-009a87ff44bf}",

    "profiles":
    [
        {
            // Make changes here to the powershell.exe profile
            "guid": "{61c54bbd-c2c6-5271-96e7-009a87ff44bf}",
            "name": "Windows PowerShell",
            "commandline": "powershell.exe",
            "hidden": false
        },
        {
            // Make changes here to the cmd.exe profile
            "guid": "{0caa0dad-35be-5f56-a8ff-afceeeaa6101}",
            "name": "cmd",
            "commandline": "cmd.exe",
            "hidden": false
        },
        {
            "guid": "{c6eaf9f4-32a7-5fdc-b5cf-066e8a4b1e40}",
            "hidden": false,
            "name": "Ubuntu-18.04",
            "source": "Windows.Terminal.Wsl"
        },
        {
            "guid": "{b453ae62-4e3d-5e58-b989-0a998ec441b8}",
            "hidden": false,
            "name": "Azure Cloud Shell",
            "source": "Windows.Terminal.Azure"
        }
    ],

    // Add custom color schemes to this array
    "schemes": [],

    // Add any keybinding overrides to this array.
    // To unbind a default keybinding, set the command to "unbound"
    "keybindings": []
}

```

观察到里面有个schemes数组，在下文中 `colortool -s` 命令列出的内容和这里相似。

该文件位于： 

```
C:\Users\Fan Dean\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState
```





 使用ColorTool可以轻松地将Windows控制台更改为所需的方案。包括对iTerm主题的支持！ 安装：

```
scoop install colortool
```

参考少数派的文章：

```shell
# 安装对中文支持很好的字体 Sarasa Gothic 
scoop bucket add nerd-fonts
# 必须进行全局安装，否则可能出现权限不够无法安装
sudo scoop install SarasaGothic-SC -g
# 如果不是全局安装时出现一些列的提示权限不够
#不允许所请求的注册表访问权。
#对路径“C:\WINDOWS\Fonts\sarasa-gothic-sc-bold.ttf”的访问被拒绝。
```



```powershell
# 列出现有主题
colortool -s
# 选择某主题
colortool <主题名称>.itermcolors
```



> ## 放弃更改主题，重启Powershell后又回到原来的样子



- [告别 Windows 终端的难看难用，从改造 PowerShell 的外观开始 - 少数派](https://sspai.com/post/52868)
- [5 个 PowerShell 主题，让你的 Windows 终端更好看 - 少数派](https://sspai.com/post/52907)
- [PowerShell 美化：oh my posh | Flymia 凡事用心之事](https://ppundsh.github.io/posts/ad6e/)  必看
- [PowerShell, Cmder / ConEmu, Posh-Git, Oh-My-Posh, Powerline Customization · GitHub](https://gist.github.com/jchandra74/5b0c94385175c7a8d1cb39bc5157365e)



各安装 oh-my-posh的教程中，给我带来的三个疑问在这里解释：

-  为什么要下载 posh-git： 用于显示Git 狀態指示（它不包含git） Posh-Git（PowerShell Git）将在PowerShell提示符下为您提供 git存储库的目录中 的其他信息。
-  Oh-My-Posh将让您为PowerShell提示设置主题 
- 为什么要安装Cmder等第三方终端： 要完整使用  oh-my-posh  ，需要使用第三方 console 來加載有 Powerline 補釘的字體，個人是使用 Cmder  
-  Powerline字体 ：用于正确显示内容，避免出现`?`



> 一个可行的方法，只需要手动更改配置文件即可。
>
>   You cannot use `colortool` to apply a theme to Windows Terminal. Instead, you'll need to manually add the theme (which is in `JSON`) to WT's configuration file. 
>
> [spencerwooo/dotfiles: Dotfiles for all :D](https://github.com/spencerwooo/dotfiles) 只需复制他提供的json文件内容，粘贴到配置文件即可。



```shell
λ  Install-Module posh-git -Scope CurrentUser

需要使用 NuGet 提供程序来继续操作
PowerShellGet 需要使用 NuGet 提供程序“2.8.5.201”或更高版本来与基于 NuGet 的存储库交互。必须在“C:\Program
Files\PackageManagement\ProviderAssemblies”或“C:\Users\Fan
Dean\AppData\Local\PackageManagement\ProviderAssemblies”中提供 NuGet 提供程序。也可以通过运行
'Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force' 安装 NuGet 提供程序。是否要让 PowerShellGet
 立即安装并导入 NuGet 提供程序?
[Y] 是(Y)  [N] 否(N)  [S] 暂停(S)  [?] 帮助 (默认值为“Y”):
警告: 无法下载可用提供程序列表。请检查 Internet 连接。
PackageManagement\Install-PackageProvider : 找不到提供程序“NuGet”的指定搜索条件的匹配项。程序包提供程序要求 "Pac
kageManagement" 和 "Provider" 标记。请检查指定的程序包是否具有标记。
所在位置 C:\Program Files\WindowsPowerShell\Modules\PowerShellGet\1.0.0.1\PSModule.psm1:7468 字符: 21
...
```

无法下载，这里我们可以选择手动下载：





## PowerShell



### 新版PowerShell 6

 多年来，PowerShell 已有很多版本发布。 最初，Windows PowerShell 是在 .NET Framework 基础之上构建而成，仅适用于 Windows 系统。 在最新版本中，PowerShell Core 使用 .NET Core 2.x 作为运行时。 PowerShell Core 支持 Windows、macOS 和 Linux 平台。 

- [安装 PowerShell - PowerShell | Microsoft Docs](https://docs.microsoft.com/zh-cn/powershell/scripting/install/installing-powershell)



检查现有PowerShell版本：

 若要查看已安装的 PowerShell 版本，请启动 PowerShell 控制台（或 ISE），键入 `$PSVersionTable`，然后按“Enter”。 查找 `PSVersion` 值。 



 PowerShell Core 的执行二进制文件由 `powershell(.exe)` 更名为 `pwsh(.exe)`。这一改变使用户可以确定性的运行共存（side-by-side）安装模式下的 PowerShell Core。而且 `pwsh` 更短也更好记。 



安装：

在Github页面[PowerShell/PowerShell: PowerShell for every system!](https://github.com/PowerShell/PowerShell) 中的ReadMe文档中列出了Stable版和Preview版的下载链接。



更改了PowerShell的字体后点击确定，弹出更新快捷方式错误的提示框；通过找到该快捷方式后查看其属性后会发现，其字体设置包含在了快捷方式中。那我们可以直接修改快捷方式；这也就是该好后如果你用的是另外一个快捷键打开又会发现字体又变为默认的原因。



###  PowerShell 库



[PowerShell 库](https://docs.microsoft.com/zh-cn/powershell/scripting/gallery/overview)

 PowerShell 库：是一个包存储库，包含脚本、模块以及可供下载和使用的 DSC 资源。 可以使用 [PowerShellGet](https://docs.microsoft.com/zh-cn/powershell/module/powershellget) 模块中的 cmdlet 从 PowerShell 库安装包 。 其中一些包由 Microsoft 编写，另一些包由 PowerShell 社区编写。 



###  PowerShellGet 模块

> 手动下载：  [PowerShell Gallery](https://www.powershellgallery.com/)

 PowerShellGet 模块：包含用于发现、安装、更新和发布包含来自 [PowerShell 库](https://www.powershellgallery.com/)和其他专用存储库的模块、DSC 资源、角色功能和脚本等项目的 PowerShell 包的 cmdlet。 

 从库安装包需要 PowerShellGet 模块的最新版本。 请参阅[安装 PowerShellGet](https://docs.microsoft.com/zh-cn/powershell/scripting/gallery/installing-psget?view=powershell-6)，获取完整说明。 

 PowerShellGet 需要 .NET FrGamework 4.5 或更高版本。 你可从[此处](https://msdn.microsoft.com/library/5a4x27ek.aspx)安装 .NET Framework 4.5 或更高版本。 

 更新 PowerShellGet 前，应始终安装最新的 NuGet 提供程序。 



```powershell
$ Install-Module -Name PowerShellGet -Force
Install-Module : 在“C:\Program Files\WindowsPowerShell\Modules”中安装模块需要有管理员权限。请使用具有管理员权限的帐户
登录到计算机，然后重试；或者通过向命令添加“-Scope CurrentUser”来安装“D:\Fan Dean\Documents\WindowsPowerShell\Modules    ”。你也可以尝试使用提升的权限(以管理员身份运行)来运行 Windows PowerShell 会话。
```



安装好后具体操作见：[PowerShell 库入门](https://docs.microsoft.com/zh-cn/powershell/scripting/gallery/getting-started)



> 默认情况下，[Install-Module](https://docs.microsoft.com/zh-cn/powershell/module/powershellget/Install-Module) 将模块安装到 `$env:ProgramFiles\WindowsPowerShell\Modules`。 此操作需要管理员帐户。 如果添加 `-Scope CurrentUser` 参数，模块将安装到 `$env:USERPROFILE\Documents\WindowsPowerShell\Modules`。
>
> 默认情况下，[Install-Script](https://docs.microsoft.com/zh-cn/powershell/module/powershellget/Install-Script) 将脚本安装到 `$env:ProgramFiles\WindowsPowerShell\Scripts`。 此操作需要管理员帐户。 如果添加 `-Scope CurrentUser` 参数，脚本将安装到 `$env:USERPROFILE\Documents\WindowsPowerShell\Scripts`。





### NuGet无法下载

[NuGet 及其功能介绍 | Microsoft Docs](https://docs.microsoft.com/zh-cn/nuget/what-is-nuget)

```
λ  Install-Module posh-git -Scope CurrentUser

需要使用 NuGet 提供程序来继续操作
PowerShellGet 需要使用 NuGet 提供程序“2.8.5.201”或更高版本来与基于 NuGet 的存储库交互。必须在“C:\Program
Files\PackageManagement\ProviderAssemblies”或“C:\Users\Fan
Dean\AppData\Local\PackageManagement\ProviderAssemblies”中提供 NuGet 提供程序。也可以通过运行
'Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force' 安装 NuGet 提供程序。是否要让 PowerShellGet
 立即安装并导入 NuGet 提供程序?
[Y] 是(Y)  [N] 否(N)  [S] 暂停(S)  [?] 帮助 (默认值为“Y”):
警告: 无法下载可用提供程序列表。请检查 Internet 连接。
```



 手动从这里  [PowerShell Gallery](https://www.powershellgallery.com/) 下载，简单来说，NuGet 包是具有 `.nupkg` 扩展的单个 ZIP 文件，想要解压`.nupkg` 只需将其后缀名改为 zip。



要想解决上面的问题我们需要先来了解一下模块安装和导入的知识：

- [安装PowerShell模块-PowerShell | 微软文档](https://docs.microsoft.com/en-us/powershell/scripting/developer/module/installing-a-powershell-module)
- [导入PowerShell模块-PowerShell | 微软文档](https://docs.microsoft.com/en-us/powershell/scripting/developer/module/importing-a-powershell-module)



**Import-Module：**

Windows PowerShell将在`PSModulePath`变量中指定的目录中搜索指定的模块（安装时也会安装到这里）。找到指定目录后，Windows PowerShell将按以下顺序搜索文件：模块清单文件（.psd1），脚本模块文件（.psm1），二进制模块文件（.dll）。有关将目录添加到搜索中的更多信息，请参见“ [修改PSModulePath安装路径”](https://docs.microsoft.com/en-us/powershell/scripting/developer/module/modifying-the-psmodulepath-installation-path?view=powershell-6)。以下代码描述了如何导入模块： 



查看该变量值的方法：使用`$Env:PSModulePath`

```shell
$Env:PSModulePath

D:\Fan Dean\Documents\WindowsPowerShell\psmodules\;D:\Scoop\Applications\modules;C:\Users\Fan Dean\Documents\WindowsPowerShell\Modules;C:\Program Files\WindowsPowerShell\Modules;C:\WINDOWS\system32\WindowsPowerShell\v1.0\Modules
```







## 尝试解决问题



已经弄清除的几个点：

- PowerShell 5（系统默认的）、PowerShell 6（我自己下载的）两个不共用配置文件（它们是shell）。所以不要来回在两者之间尝试，你配置完成后PowerShell 本身是无法正常显示的最终效果，这些效果需要在第三方终端才能显示（并且还需要配置一下这些终端），比如Windows Terminal、Cmder、Fluent Terminal。【所以配置时就在这些终端中操作】
- 粘贴和复制分为外部和内部
- Windows Terminal 中默认在profiles中配置了`"commandline": "powershell.exe"`所以打开的是PowerShell 5
- 终端（比如Windows Terminal）的配置文件中配置的是终端的自身外观和内容**显示的效果**（内容如何显示）；比如包含我该用哪种字体来显示这些内容。
- 配置 PowerShell，配置输出的内容和内容的布局。比如我们安装了oh-my-posh和posh-git后，Powershell在git仓库目录时会在内容中添加一个分支符号；这段内容发送给终端后终端需要字体支持才能显示。



- [告别 Windows 终端的难看难用，从改造 PowerShell 的外观开始 - 少数派](https://sspai.com/post/52868)
- [5 个 PowerShell 主题，让你的 Windows 终端更好看 - 少数派](https://sspai.com/post/52907)
- 上面两篇文章是同一个作者，下面是作者的GitHub仓库 [spencerwooo/dotfiles: Dotfiles for all :D](https://github.com/spencerwooo/dotfiles)



问题：

```
λ  Install-Module posh-git -Scope CurrentUser

需要使用 NuGet 提供程序来继续操作
PowerShellGet 需要使用 NuGet 提供程序“2.8.5.201”或更高版本来与基于 NuGet 的存储库交互。必须在“C:\Program
Files\PackageManagement\ProviderAssemblies”或“C:\Users\Fan
Dean\AppData\Local\PackageManagement\ProviderAssemblies”中提供 NuGet 提供程序。也可以通过运行
'Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force' 安装 NuGet 提供程序。是否要让 PowerShellGet
 立即安装并导入 NuGet 提供程序?
[Y] 是(Y)  [N] 否(N)  [S] 暂停(S)  [?] 帮助 (默认值为“Y”):
警告: 无法下载可用提供程序列表。请检查 Internet 连接。
PackageManagement\Install-PackageProvider : 找不到提供程序“NuGet”的指定搜索条件的匹配项。程序包提供程序要求 "Pac
kageManagement" 和 "Provider" 标记。请检查指定的程序包是否具有标记。
所在位置 C:\Program Files\WindowsPowerShell\Modules\PowerShellGet\1.0.0.1\PSModule.psm1:7468 字符: 21
...
```



初步怀疑是网络问题，所以选择手动下载：**见上文**



> 下载 .Net Framework。
>
> 安装时提示我已经安装了，或已经安装了更高版本





---

> 成功配置示例（1、2顺序可变）参考：
>
> - [告别 Windows 终端的难看难用，从改造 PowerShell 的外观开始 - 少数派](https://sspai.com/post/52868)
> - [5 个 PowerShell 主题，让你的 Windows 终端更好看 - 少数派](https://sspai.com/post/52907)
> - 上面两篇文章是同一个作者，下面是作者的GitHub仓库 [spencerwooo/dotfiles: Dotfiles for all :D](https://github.com/spencerwooo/dotfiles)
>
> 
>
> ### 1.配置PowerShell 5 (在Windows Terminal中)

```
# 可以访问github了，尝试使用下面的方式安装
scoop install posh-git oh-my-posh 
```



```
# 如果之前没有配置文件，就新建一个 PowerShell 配置文件
if (!(Test-Path -Path $PROFILE )) { New-Item -Type File -Path $PROFILE -Force }
用记事本打开配置文件
notepad $PROFILE
```

将此内容加入文件，让模块加载和主题设置在开启时生效（更改主题也在这里）

```
Import-Module posh-git 
Import-Module oh-my-posh 
Set-Theme Paradox
```



> 保存后可能出现
>
> ```
> PS C:\Users\Fan Dean> Import-Module posh-git
> 警告: git command could not be found. Please create an alias or add it to your PATH.
> C:\Users\Fan Dean> Import-Module oh-my-posh
> ```
>
> 这里发现cmder中的git没有包含在PATH，需要添加一下。



查看主题配置：

```
# 查看当前主题配置：
$ThemeSettings
MyThemesLocation     : D:\Fan Dean\Documents\WindowsPowerShell\PoshThemes
ErrorCount           : 0
GitSymbols           : {OriginSymbols, LocalWorkingStatusSymbol, LocalDefaultStatusSymbol, BranchUntrackedSymbol...}
CurrentUser          : Fan Dean
PromptSymbols        : {SegmentSeparatorForwardSymbol, ElevatedSymbol, TruncatedFolderSymbol,
                       SegmentSeparatorBackwardSymbol...}
CurrentThemeLocation : D:\Scoop\Applications\modules\oh-my-posh\Themes\Paradox.psm1
Colors               : {AdminIconForegroundColor, PromptBackgroundColor, PromptHighlightColor, GitLocalChangesColor...}
```

将   [SpencerTechy.psm1](https://github.com/spencerwooo/dotfiles/blob/master/Windows/SpencerTechy.psm1)  文件放在，上面显示的你的主题目录下。如果要切换使用：`Set-Theme SpencerTechy`切换即可。



> 默认并没有PoshThemes目录和PowerShell 配置文件。
>
> 使用下面的命令 安装 posh-git 和 oh-my-posh 这两个模块，默认会安装到Modules目录
>
> ```
> Install-Module posh-git -Scope CurrentUser
> Install-Module oh-my-posh -Scope CurrentUser
> ```
> 单我们这样安装不了，但我们可以手动下载它们，通过`$Env:PSModulePath`获取可用模块存放路径；然后在该路径中手动下载添加模块。
>
> 这里有一个问题，再Windows Terminal中包含了D盘Documents中的modules
>
> ```
> D:\Fan Dean\Documents\WindowsPowerShell\psmodules\;D:\Scoop\Applications\modules;C:\Users\Fan Dean\Documents\WindowsPowerShell\Modules;C:\Program Files\WindowsPowerShell\Modules;C:\WINDOWS\system32\WindowsPowerShell\v1.0\Modules
> ```
>
> 而Cmder却没有包含了D盘Documents中的modules
>
> ```
> D:\Portable Software\cmder\vendor\psmodules\;D:\Scoop\Applications\modules;C:\Users\Fan Dean\Documents\WindowsPowerShell\Modules;C:\Program Files\WindowsPowerShell\Modules;C:\WINDOWS\system32\WindowsPowerShell\v1.0\Modules
> ```
>
> 一个原因时，我更改了了系统Documents的位置。
>
> 仔细观察发现Cmder中还多了cmder安装目录下的模块，查看cmder下的profile.ps1可知它通过下面一条语语句添加了该模块：
>
> ```shell
> $env:PSModulePath = $env:PSModulePath.Insert(0, "$CmderModulePath;")
> ```
>
> 
>
> #### Get-ChildItemColor
>
> 还可以使用 Get-ChildItemColor 模块来更改 ls 输出格式（和bash中的ls相似的格式）并上色，但Get-ChildItemColor我这直接安装不了，可以尝试去PowershellGet库中手动下载，然后放入正确的模块路径。
>
> 如果安装好后还需进行配置，（加入配置文件）：
>
> ```
> Import-Module Get-ChildItemColor
> Set-Alias l Get-ChildItemColor -option AllScope
> Set-Alias ls Get-ChildItemColorFormatWide -option AllScope
> ```



> ### 配置 Windows Terminal

下载字体

```
sudo scoop install FantasqueSansMono-NF --global
```



> 下载  Powerline  字体：
>
> - FantasqueSansMono NF 已经支持Powerline 。 （Windows Terminal 中没有问题）
> - 在Cmder中使用FantasqueSansMono NF会出现箭头显示不出，建议还下 DejaVu Sans Mono for Powerline 这个字体。【**只要显示不基本上就是对就是字体问题**】



将  Windows Terminal 设置文件内容全部用  [wt_profiles.json](https://github.com/spencerwooo/dotfiles/blob/master/Windows/wt_profiles.json)  文件替换，还需要将文件中的字体名字全部由原来的 `FuraCode NF`替换为我们安装的 `FantasqueSansMono NF` 。



查看现有主题

```
Set-Theme SpencerTechy  #该主题是作者定制的
Set-Theme Paradox
Set-Theme Sorin
Set-Theme Agnoster
Set-Theme Avit
Set-Theme robbyrussell 
# Set-Theme 命令支持Tab补全
Set-Theme 按Tab
```





解读： [ps_profile.ps1](https://github.com/spencerwooo/dotfiles/blob/master/Windows/ps_profile.ps1)  和 [PowerShell, Cmder / ConEmu, Posh-Git, Oh-My-Posh, Powerline Customization](https://gist.github.com/jchandra74/5b0c94385175c7a8d1cb39bc5157365e) 

```powershell

<# 多行注释
# Get-ChildItemColor 未能安装，所以这里注释
Import-Module Get-ChildItemColor

$env:PYTHONIOENCODING="utf-8"
# Remove curl alias
If (Test-Path Alias:curl) {Remove-Item Alias:curl}
If (Test-Path Alias:curl) {Remove-Item Alias:curl}
# Remove-Item alias:ls -force
Set-Alias l Get-ChildItemColor -option AllScope
Set-Alias ls Get-ChildItemColorFormatWide -option AllScope
#>

# 这里是作者自定义的一些函数
# 使git log的输出更美观
function GitLogPretty {
  git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all
}
#感觉不需要
#function GitStat {git status}
#返回上一路径
function GoBack {Set-Location ..}
#获取IP地址
function GetMyIp {curl -L tool.lu/ip}
#更新 scoop，及其所有安装的程序
#function UpdateScoop {scoop update; scoop update *}
# 功能暂不明白
#function PrettyLS {colorls --light -A}


# Helper function to change directory to my development workspace
# Change D:\Fan Dean to your usual workspace and everytime you type
# in cws from PowerShell it will take you directly there.
# cws 表示 Change to workspace
function cws { Set-Location 'D:\Fan Dean' }

# Helper function to set location to the User Profile directory
function cuserprofile { Set-Location ~ }
Set-Alias ~ cuserprofile -Option AllScope



# Ensure posh-git is loaded
Import-Module posh-git


# Start SshAgent if not already
# Need this if you are using github as your remote git repository
# 但是我这并不能识别 Start-SshAgent，所以还需要自行配置
if (! (ps | ? { $_.Name -eq 'ssh-agent'})) {
    Start-SshAgent
}



Import-Module oh-my-posh
# This will work for Agnoster, Fish, Honukai, Paradox and Sorin themes
# 上面主题在使用时如果出现的小问题时设置，并下面改为自己的用户名
#$DefaultUser = 'Felix'

# Setup other alias：为前面的函数设置别名
Set-Alias open Invoke-Item
Set-Alias .. GoBack
Set-Alias glola GitLogPretty
#Set-Alias gst GitStat
#Set-Alias myip GetMyIp
#Set-Alias pls PrettyLS
#Set-Alias suu UpdateScoop

# 感觉是设置tab补全
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# function U：用于检测当前选择的字体是否能正确显示那些特殊符号
function U
{
    param
    (
        [int] $Code
    )
 
    if ((0 -le $Code) -and ($Code -le 0xFFFF))
    {
        return [char] $Code
    }
 
    if ((0x10000 -le $Code) -and ($Code -le 0x10FFFF))
    {
        return [char]::ConvertFromUtf32($Code)
    }
 
    throw "Invalid character code $Code"
}
# 运行 . $PROFILE 重新加载配置文件， 然后在powershell中运行下面的命令
# Write-Host "$(U 0xE0B0) $(U 0x00B1) $(U 0xE0A0) $(U 0x27A6) $(U 0x2718) $(U 0x26A1) $(U 0x2699)"

# Set theme 设置主题
<# 如果这整个代码是在放在Cmder的user-profile.ps1中，
# 那么下面设置主题的语句需要添加到Cmder的profile.ps1的末尾，
# 如果放在这里，会被profile.ps1的语句覆盖，不会生效 #>
Set-Theme Paradox
#Set-Theme Sorin
#Set-Theme SpencerTechy
#Set-Theme Agnoster
#Set-Theme Avit
#Set-Theme robbyrussell
#Set-Theme pure
#Set-Theme PowerLine
#Set-Theme robbyrussell
#Set-Theme tehrob
```



想将以上内容加入 cmder 的 config目录下的 user-profile.ps1中，发现启动时并不会加载主题，但可以手动加载主题。于是乎只需将设置主题的语句需要添加到Cmder的profile.ps1的末尾即可。

你也可以让cmder直接加载Microsoft.PowerShell_profile.ps1文件。通过在cmder任务的命令组中修改：

```
PowerShell -ExecutionPolicy Bypass -NoLogo -NoProfile -NoExit -Command "Invoke-Expression '. ''D:\Fan Dean\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1'''"
```







cmder配置：

> 可选：
>
> 请注意，我还突出显示了“存储”字段中的ConEmu.xml位置。稍后我们自定义ConEmu主题时，将需要此位置 。
>
>  顶部滑动开启：您可能要自定义的另一件事是将Cmder置于Quake样式中，您可以使用`Ctrl +〜`键显示和隐藏它。为此，请将“ Quake”模式设置为如下所示： 勾选了 Quake Style 向下滑动 
>
> > ：喜欢将动画速度设置为150毫秒，因为它比默认的300毫秒要快。



完整的 PowerShell配置文件：通过 `ise $PROFILE` 打开文件并粘贴下面的内容

```powershell
# Remove trailing '\'
$ENV:CMDER_ROOT = (($ENV:CMDER_ROOT).trimend("\"))

# do not load bundled psget if a module installer is already available
# -> recent PowerShell versions include PowerShellGet out of the box
$moduleInstallerAvailable = [bool](Get-Command -Name 'Install-Module' -ErrorAction SilentlyContinue | Out-Null)

# do not load bundled psget if a module installer is already available
# -> recent PowerShell versions include PowerShellGet out of the box
$moduleInstallerAvailable = [bool](Get-Command -Name 'Install-Module' -ErrorAction SilentlyContinue | Out-Null)

# Add Cmder modules directory to the autoload path.
$CmderModulePath = Join-path $PSScriptRoot "psmodules/"

if(-not $moduleInstallerAvailable -and -not $env:PSModulePath.Contains($CmderModulePath) ){
    $env:PSModulePath = $env:PSModulePath.Insert(0, "$CmderModulePath;")
}

try {
    Get-command -Name "vim" -ErrorAction Stop >$null
} catch {
    # # You could do this but it may be a little drastic and introduce a lot of
    # # unix tool overlap with powershel unix like aliases
    # $env:Path += $(";" + $env:CMDER_ROOT + "\vendor\git-for-windows\usr\bin")
    # set-alias -name "vi" -value "vim"
    # # I think the below is safer.

    new-alias -name "vim" -value $($ENV:CMDER_ROOT + "\vendor\git-for-windows\usr\bin\vim.exe")
    new-alias -name "vi" -value vim
}

try {
    # Check if git is on PATH, i.e. Git already installed on system
    Get-command -Name "git" -ErrorAction Stop >$null
} catch {
    $env:Path += $(";" + $env:CMDER_ROOT + "\vendor\git-for-windows\cmd")
    # for bash.exe, which in the cmd version is found as <GIT>\usr\bin\bash.exe
    $env:Path += $(";" + $env:CMDER_ROOT + "\vendor\git-for-windows\bin")
}

$gitLoaded = $false
function Import-Git($Loaded){
    if($Loaded) { return }
    $GitModule = Get-Module -Name Posh-Git -ListAvailable
    if($GitModule | select version | where version -le ([version]"0.6.1.20160330")){
        Import-Module Posh-Git > $null
    }
    if(-not ($GitModule) ) {
        Write-Warning "Missing git support, install posh-git with 'Install-Module posh-git' and restart cmder."
    }
    # Make sure we only run once by alawys returning true
    return $true
}

function checkGit($Path) {
    if (Test-Path -Path (Join-Path $Path '.git') ) {
        $gitLoaded = Import-Git $gitLoaded
        Write-VcsStatus
        return
    }
    $SplitPath = split-path $path
    if ($SplitPath) {
        checkGit($SplitPath)
    }
}

if (Get-Module PSReadline -ErrorAction "SilentlyContinue") {
    Set-PSReadlineOption -ExtraPromptLineCount 1
}

# Enhance Path
$env:Path = "$Env:CMDER_ROOT\bin;$env:Path;$Env:CMDER_ROOT"

<########### 以上内容来自 cmder 内置的 profile.ps1 ########
作用是用来检测是否安装由git和vim如果没有安装则使用cmder提供的git和vim
还有 module 相关的东西（暂时没弄明白）等
-------------------
只有电脑安装了cmder的用户才需要考虑是否添加上面的内容；其他用户不需要
#>
###################



<# 多行注释 #>

# 添加 Get-ChildItemColor 所在模块的路径
$DModulePath="D:\Fan Dean\Documents\WindowsPowerShell\psmodules" 
$env:PSModulePath = $env:PSModulePath.Insert(0, "$DModulePath;")
# 多行注释
# Get-ChildItemColor 未能安装，所以这里注释
Import-Module Get-ChildItemColor

$env:PYTHONIOENCODING="utf-8"
# Remove curl alias
If (Test-Path Alias:curl) {Remove-Item Alias:curl}
If (Test-Path Alias:curl) {Remove-Item Alias:curl}
# Remove-Item alias:ls -force
Set-Alias l Get-ChildItemColor -option AllScope
Set-Alias ls Get-ChildItemColorFormatWide -option AllScope


# 这里是作者自定义的一些函数
# 使git log的输出更美观
function GitLogPretty {
  git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all
}
#感觉不需要
#function GitStat {git status}
#返回上一路径
function GoBack {Set-Location ..}
#获取IP地址
function GetMyIp {curl -L tool.lu/ip}
#更新 scoop，及其所有安装的程序
#function UpdateScoop {scoop update; scoop update *}
# 功能暂不明白
#function PrettyLS {colorls --light -A}


# Helper function to change directory to my development workspace
# Change D:\Fan Dean to your usual workspace and everytime you type
# in cws from PowerShell it will take you directly there.
# cws 表示 Change to workspace
function cws { Set-Location 'D:\Fan Dean' }

# Helper function to set location to the User Profile directory
function cuserprofile { Set-Location ~ }
Set-Alias ~ cuserprofile -Option AllScope



# Ensure posh-git is loaded
Import-Module posh-git


# Start SshAgent if not already
# Need this if you are using github as your remote git repository
# 但是我这并不能识别 Start-SshAgent，所以还需要自行配置
if (! (ps | ? { $_.Name -eq 'ssh-agent'})) {
    Start-SshAgent
}



Import-Module oh-my-posh
# This will work for Agnoster, Fish, Honukai, Paradox and Sorin themes
# 上面主题在使用时如果出现的小问题时设置，并下面改为自己的用户名
#$DefaultUser = 'Felix'

# Setup other alias：为前面的函数设置别名
Set-Alias open Invoke-Item
Set-Alias .. GoBack
Set-Alias glola GitLogPretty
#Set-Alias gst GitStat
#Set-Alias myip GetMyIp
#Set-Alias pls PrettyLS
#Set-Alias suu UpdateScoop

# 感觉是设置tab补全
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# function U：用于检测当前选择的字体是否能正确显示那些特殊符号
function U
{
    param
    (
        [int] $Code
    )
 
    if ((0 -le $Code) -and ($Code -le 0xFFFF))
    {
        return [char] $Code
    }
 
    if ((0x10000 -le $Code) -and ($Code -le 0x10FFFF))
    {
        return [char]::ConvertFromUtf32($Code)
    }
 
    throw "Invalid character code $Code"
}
# 运行 . $PROFILE 重新加载配置文件， 然后在powershell中运行下面的命令
# Write-Host "$(U 0xE0B0) $(U 0x00B1) $(U 0xE0A0) $(U 0x27A6) $(U 0x2718) $(U 0x26A1) $(U 0x2699)"

# Set theme 设置主题
<# 如果这整个代码是在放在Cmder的user-profile.ps1中，
# 那么下面设置主题的语句需要添加到Cmder的profile.ps1的末尾，
# 如果放在这里，会被profile.ps1的语句覆盖，不会生效 #>
Set-Theme Paradox
#Set-Theme Sorin
#Set-Theme SpencerTechy
#Set-Theme Agnoster
#Set-Theme Avit
#Set-Theme robbyrussell
#Set-Theme pure
#Set-Theme PowerLine
#Set-Theme robbyrussell
#Set-Theme tehrob
```



> Windows PowerShell ISE ：在命令行中对应 ise ，通常使用此工具来编辑 .ps1文件