# 各Linux系统和桌面环境的相关操作

标签（空格分隔）： Linux

---

>系统本身的区别

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
**限制亮度划块的最小亮度**
在一些显示器下亮度等级设为0后背光会完全关掉。xfce4-power-manager 1.3.2 有一个新的隐藏选项可以调节最小亮度。用 xfconf4 添加一个名为 brightness-slider-min-level 的整数键，将其改为合适的最小亮度值。

**侧边栏添加项目：**在Thunar可右击文件夹并将其发送到侧边栏当作快捷方式，并可调整位置。



