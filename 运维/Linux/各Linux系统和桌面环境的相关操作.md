# 各Linux系统和桌面环境的相关操作

标签（空格分隔）： Linux

---

> 系统本身的区别

## Ubuntu及其衍生版

### 使用PPPoE联网
[ADSL（PPPOE）接入指南](http://wiki.ubuntu.org.cn/ADSL%EF%BC%88PPPOE%EF%BC%89%E6%8E%A5%E5%85%A5%E6%8C%87%E5%8D%97)
[Ubuntu连接宽带pppoe](http://www.aichengxu.com/linux/655521.htm)

这个说的比较清楚[Linux/Ubuntu下的PPPoE拨号上网方法](http://blog.csdn.net/alex_xhl/article/details/8131055)

- 在XUbuntu中右击托盘图标  
- 选择“编辑连接”  
- 选择“添加”，“DSL”  
- 填写用户名、密码；勾选"可用时自动连接到这个网络"





##  Red Hat Enterprise Linux (RHEL) and its derivatives(衍生版)
### ELRepo RHEL的社区仓库
[ELRepo.org](http://elrepo.org/tiki/tiki-index.php)
ELRepo supports Red Hat Enterprise Linux (RHEL) and its derivatives (Scientific Linux, CentOS & others).
[ELRepo - Enterprise Linux （RHEL、CentOS 及 SL）的社区仓库](http://posts.careerengine.us/p/58d385bca6f2b4181a2ba409)

如果你正在使用 Enterprise Linux 发行版（Red Hat Enterprise Linux 或其衍生产品，如 CentOS 或 Scientific Linux），并且需要对特定硬件或新硬件支持，则可以考虑添加ELRepo仓库。

清华大学开源软件镜像站，有其镜像。



> 桌面环境的区别

## Xfce Desktop Environment
> 以下是对Ubuntu 16.04中Xfce 4.12版本的描述
> **限制亮度划块的最小亮度**
> 在一些显示器下亮度等级设为0后背光会完全关掉。xfce4-power-manager 1.3.2 有一个新的隐藏选项可以调节最小亮度。用 xfconf4 添加一个名为 brightness-slider-min-level 的整数键，将其改为合适的最小亮度值。



### Thunar

**侧边栏添加项目：**在Thunar可右击文件夹并将其发送到侧边栏当作快捷方式，并可调整位置。





### 主题配置示例

外观 样式： Adwaita 。  图标：elementary Xfce

窗口管理器样式： Greybird-yosemite

![](https://gitlab.com/faner/Git-Pictures/raw/master/%E4%B8%BB%E9%A2%98%E9%85%8D%E7%BD%AE/%E4%B8%BB%E9%A2%98%E9%85%8D%E7%BD%AE01.png)



![](https://gitlab.com/faner/Git-Pictures/raw/master/%E4%B8%BB%E9%A2%98%E9%85%8D%E7%BD%AE/%E6%A1%8C%E9%9D%A2.png)

![](https://gitlab.com/faner/Git-Pictures/raw/master/%E4%B8%BB%E9%A2%98%E9%85%8D%E7%BD%AE/%E5%BA%94%E7%94%A8%E7%A8%8B%E5%BA%8F%E8%8F%9C%E5%8D%95.png)



### 桌面设置

禁止在桌面显示任何东西。这样看起来真的会很舒服。

桌面菜单：取消“在桌面上右击时包含应用程序菜单”。

桌面图标：图标类型选择“无”。





### 面板设置

底部面板0的项目列表：

![](https://gitlab.com/faner/Git-Pictures/raw/master/%E4%B8%BB%E9%A2%98%E9%85%8D%E7%BD%AE/%E9%9D%A2%E6%9D%BF0%E9%A1%B9%E7%9B%AE%E5%88%97%E8%A1%A8.png)



**时钟设置**

布局：可选 数字式、液晶式、二进制...

格式可选择自带格式或自定义格式。

**自定义时钟格式：**

`%d %b, %H:%M` : 显示效果，示例： 06 10月,00:40

`<span size="x-large">%R</span>` 还可以更改显示样式。

最终示例：`<span size="x-large">%d/%m,%R</span>`



> [xfce4-panel:clock](http://docs.xfce.org/xfce/xfce4-panel/clock)
>
> [Text Attribute Markup: Pango Reference Manual](https://developer.gnome.org/pango/stable/PangoMarkupFormat.html "Text Attribute Markup: Pango Reference Manual")





**通知区域：**用于显示当前输入法等。设置通知区域最大图标大小，取消“显示边框”(好让程序的图标与旁边的图标一样大小)；可以在其已知应用程序列表中选择隐藏该程序图标。

**指示器插件**：也可以设置图标大小和需要隐藏的图标。



**调节面板颜色：** 默认颜色为 `#242424`

绿黄色： `#93d844`  蓝莓蓝： `#3892e0`   草莓红： `#da4d45`

**放置启动器的面板：**颜色调节为白色

**窗口按钮：**设置窗口按钮的外观为“使用扁平按钮”。（窗口按钮的作用是在已打开的程序间进行切换）

**分隔符：** 外观可设置为“透明度”、分隔符、点。可勾选“扩选”这样它就会像弹簧一样将其两边的图标撑开。



#### Whisker菜单

![](https://gitlab.com/faner/Git-Pictures/raw/master/%E4%B8%BB%E9%A2%98%E9%85%8D%E7%BD%AE/Whisker%E8%8F%9C%E5%8D%95-%E5%A4%96%E8%A7%82.png)

![](https://gitlab.com/faner/Git-Pictures/raw/master/%E4%B8%BB%E9%A2%98%E9%85%8D%E7%BD%AE/Whisker%E8%8F%9C%E5%8D%95-%E8%A1%8C%E4%B8%BA.png)





### 通知设置

通知主题： Greybird

默认位置： 右下角





### 窗口管理器

![](https://gitlab.com/faner/Git-Pictures/raw/master/%E4%B8%BB%E9%A2%98%E9%85%8D%E7%BD%AE/%E7%AA%97%E5%8F%A3%E7%AE%A1%E7%90%86%E5%99%A8-%E6%A0%B7%E5%BC%8F.png)

![](https://gitlab.com/faner/Git-Pictures/raw/master/%E4%B8%BB%E9%A2%98%E9%85%8D%E7%BD%AE/%E7%AA%97%E5%8F%A3%E7%AE%A1%E7%90%86%E5%99%A8-%E7%84%A6%E7%82%B9.png)

![](https://gitlab.com/faner/Git-Pictures/raw/master/%E4%B8%BB%E9%A2%98%E9%85%8D%E7%BD%AE/%E7%AA%97%E5%8F%A3%E7%AE%A1%E7%90%86%E5%99%A8-%E9%AB%98%E7%BA%A7.png)



### uGet配置

取消勾选“使用Ubuntu的App Indicator”。让uGet显示在通知区域而非显示在指示器中。

![](https://gitlab.com/faner/Git-Pictures/raw/master/%E4%B8%BB%E9%A2%98%E9%85%8D%E7%BD%AE/uGet%E5%8F%96%E6%B6%88%E4%BD%BF%E7%94%A8App%20Indicator.png)