Xfce4配置
======================

参考文档：  
[Xfce简体中文]()https://wiki.archlinux.org/index.php/Xfce_(简体中文)  
[如何安装新的主题](https://wiki.xfce.org/zh-cn/howto/install_new_themes)  
[Xfce/指南](https://wiki.gentoo.org/wiki/Xfce/Guide/zh-cn)  
[Xfce4 使用问题/技巧](http://tieba.baidu.com/p/3350859248# "不错哦,内容详细简单")
[Xfwm4主题how-to](https://wiki.xfce.org/zh-cn/howto/xfwm4_theme "对理解相关概念有帮助")

Xfce桌面环境美化主要从五个方面着手：  
- GTK主题：控制窗口内容外观
- 窗口标题栏主题：即xfwm4主题
- 图标主题
- 字体
- 背景图片



安装xfce4之后要做的设置
----------------------

窗口的侧边由两个像素构成，... 所以直接在侧边调整窗口大小很不方便，但将鼠标移动到窗口
左/右上脚调整就比较方便。(也可选择将窗口布局中的“菜单”按钮隐藏,以方便拉伸)


找到一个替代滚动下方窗口而不会把它提升的方法(详见截图)：  
窗口管理器：焦点：焦点模式选择“点击聚焦”，且选中聚焦新窗口选择，其它两个不选择。
(会有一个不大的问题)

框选浏览器文字到达底部时可向下滚动,需设置：
设置：工作区：边缘-下边缘设为>1


**设置管理器**    
外观：样式-Adwaita | 图标-elementary Xfce |
略过。。。窗口管理器：焦点：焦点模式-焦点跟随鼠标(滚动鼠标就会提升窗口，按键盘不会)
桌面：图标-图标大小-43，默认图标-取消可移动设备
面板：面板1:项目-添加“指示器插件”-设置指示器插件隐藏Application Menus(Global Menu) 它相当于系统托盘，该程序的名称为：xfce4-indicator-plugin，如系统没有安装则手动安装。
面板：面板2：项目-选中一个项目点击设置-高级-选中“禁用工具提示”
显示：显示器-取消使用此输出（另还有一个笔记本电脑选中，如两个都选中鼠标会出现闪烁现象）
键盘：应用程序快捷键（如设置截图软件各命令选项快捷键）

(部分设置重启相关程序后才能生效)

面板没有弹簧，所有项目都靠左侧，中间无法留空;解决方式：
添加一个「分隔符」，样式选择「透明度」，勾选「扩展」，你将会得到一个弹簧。

## 5. 图标文字的背景无法去除
摘自ArchWiki，编辑(新建)「~/.gtkrc-2.0」 配置文件

style "xfdesktop-icon-view" {
font_name = "sans Bold" #字体名称设置
XfdesktopIconView::label-alpha = 10 #透明度设置
base[NORMAL] = "#000000" #背景颜色
base[SELECTED] = "#71B9FF"
base[ACTIVE] = "#71FFAD"
fg[NORMAL] = "#ffffff" #文字颜色
fg[SELECTED] = "#71B9FF"
fg[ACTIVE] = "#71FFAD" }
widget_class "*XfdesktopIconView*" style "xfdesktop-icon-view"


## 添加音量控制插件

 xfce4-pulseaudio-plugin 


## 添加全局菜单插件
(指示器插件默认有此功能),但还可以下载其它插件。  
xfce4-topmenu** 该全局菜单只支持gtk，而不支持QT，还有一个缺点是背景是黑色，所以系统主题最好用黑色主题来搭配。安装见另一个md。


## 参考文章
[My Xubuntu Customization Guide](https://smdavis.us/2017/05/05/my-xubuntu-customization-guide/)   

参考自己的另一篇文章。

