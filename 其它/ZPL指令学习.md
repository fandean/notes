# ZPL指令学习

标签：打印



参考：[ZPL II 简易指令集](http://blog.sina.com.cn/s/blog_5b7ee1730100hlx5.html)

[zpl指令中文参考_完整版](http://wenku.baidu.com/link?url=2RSNIE0A_AbN9SItv6xDxWsX8OmBWku-jzk3ldzO2Eqsw9cysseb57-eecrmnE22_tou1qneTFSFV1IE1rhUouam2AJOVGbgkuXVZP77JV3)

[斑马打印机 ZPL II 语言编程](http://wenku.baidu.com/view/3e032232783e0912a2162a85.html)

[ZPL II Programming Guide](http://wenku.baidu.com/view/3f9b6dd833d4b14e8524681b.html)

[ZPL II Programming Guide Volume One](https://www.zebra.com/content/dam/zebra/manuals/en-us/software/zplii-pm-vol1.pdf)

[ZPL语言中文手册](http://pan.baidu.com/share/link?shareid=367270&uk=2751777928)

[ZPL2-programmers-manual.pdf](https://ups.zebra.com/UPSZebraWeb/support/downloads/ZP450/pdf/ZPL2-programmers-manual.pdf)

[zplii-pm-vol2-en.pdf](https://www.zebra.com/content/dam/zebra/manuals/en-us/software/zplii-pm-vol2-en.pdf)

[zpl_guide.pdf](http://research.cs.washington.edu/zpl/zpl_guide.pdf)


---

二维码扫描：

上海敏用数码科技有限公司是专业从事条码产品、射频技术产品及相关标签耗材销售与售后服务的专业化公司。**可以通过该公司网站了解相关条码知识**。

[Symbol DS6708怎么才能扫描反绿的二维条码？（反白二维码）](http://www.chongshang.com.cn/news/view.asp?id=427)





---




### ^C




定义打印机默认字体`^CFf,h,w`：

例如： ^CF0,80




定义字体名称：`^CWa,d:o.x`










#### Remapping characters using the ^CI command

映射字符使用^ CI命令




^CI [Change International Font/Encoding] ZPL Command




> ^CI 13 = 美国键盘






```
^XA^LH0,0^FS^FO37,41^A0N,25,28^CI13^FR^^FDRoHS^FS^FO190,41^A0N,23,24^CI13^FR^^FDCELL^FS^FO134,25^IME:LG.GRF^FS^FO277,25^IME:IPS.GRF^FS

^FO38,92^A0N,25,25^CI13^FR^FDCUSTOMER MODEL : $Print_code$^FS

^FO38,131^A0N,25,25^CI13^FR^FDCUSTOMER P/N : $Print_code$^FS

^FO38,170^A0N,25,25^CI13^FR^FDROE MODEL : $Print_code$^FS

^FO38,209^A0N,25,25^CI13^FR^FDROE P/N : $Print_code$^FS

<!--if lot_no <= 14 then add "-" in space[if lot_no is not enough 14 word --> 

^BY2,3.0^FO478,80^BXN,8,200,22,22^FR^FD$Print_code$^FS

<!--if lot_no > 14 then sub_string 1~14 word -->  

^BY2,3.0^FO478,80^BXN,8,200,22,22^FR^FD$Print_code$^FS

<!--if lot_no <= 14 then add "-" in space[if lot_no is not enough 14 word -->

^FO38,248^A0N,25,23^CI13^FR^FDPRODUCT : $Print_code$^FS

<!--if lot_no > 14 then sub_string 1~14 word -->  

^FO38,248^A0N,25,23^CI13^FR^FDPRODUCT : $Print_code$^FS

```


























```

^XA^LH0,0^FS

^FO37,41^A0N,25,40^CI13^FR^^FDRoHS^FS 

^FO190,41^A0N,23,24^CI13^FR^^FDCELL^FS




^FO134,25^IME:LG.GRF^FS

^FO277,25^IME:IPS.GRF^FS

^LH0,0^FS

^FO38,92^A0N,25,25^CI13^FR^FDCUSTOMER MODEL : MITV49[M15]^FS

^FO38,131^A0N,25,25^CI13^FR^FDCUSTOMER P/N : D431049001505^FS

^FO38,170^A0N,25,25^CI13^FR^FDROE MODEL : Z490MI001A^FS

^FO38,209^A0N,25,25^CI13^FR^FDROE P/N : 91.26T02.095^FS

^BY2,3.0

^FO478,80^BXN,8,200,22,22^FR^FDD431049001505-W5U8L0051191111-417-S^FS

^FO38,248^A0N,25,23^CI13^FR^FDPRODUCT : W5U8L0051191111-417-S^FS

^XZ

```










```

^XA				#^XA起始指令

^LH0,0			#定义起始位置，原点位置；[x,y]含义为坐标值，但实际表示点数[见Excel]。[nX,nY]表示点数。

^FS   			#定义本行退出

 	

^FO37,41		#文本位置。条形码位移，[还是,定义相对于其实际位置指令？]；

^A0N,25,40		#调整字型。A表示可缩放/点阵字体,0表示字体类型，N表示旋转角度；[nH,nW]表示字体的高宽点数，宽代表线宽，高代表字体大小； 

^CI13			# 更改国际字体/编码。 13代表拉丁字符集	Zebra Code Page 850 — 拉丁字符集。 

^FR^			# 字段反色打印。 ^FR 命令仅适用于一个字段，且每次都要指定。

^FDRoHS			# 字段数据。后跟要打印的数据[除^~]。  必须选择 ^CI13 才能打印反斜杠 [\]。

^FS 			







^FO190,41		#

^A0N,23,24		

^CI13			

^FR^			

^FDCELL			

^FS				







^FO134,25			#位置

^IME:LG.GRF			#图像移动。可将图像从存储区域直接移动到位图中。

^FS







^FO277,25^IME:IPS.GRF^FS

^LH0,0^FS			# 这是干什么？




^FO38,92^A0N,25,25^CI13^FR^FDCUSTOMER MODEL : MITV49[M15]^FS

^FO38,131^A0N,25,25^CI13^FR^FDCUSTOMER P/N : D431049001505^FS

^FO38,170^A0N,25,25^CI13^FR^FDROE MODEL : Z490MI001A^FS

^FO38,209^A0N,25,25^CI13^FR^FDROE P/N : 91.26T02.095^FS




^BY2,3.0		#条形码宽度；初始值2，默认值3.0，初始值10

^FO478,80		#设置位置

^BXN,8,200,22,22	#Data Matrix 条码，各元素均为正方形; h指定了单位高度和行高度8；s规格级别200

^FR					#反白

^FDD431049001505-W5U8L0051191111-417-S  

^FS







^FO38,248^A0N,25,23^CI13^FR^FDPRODUCT : W5U8L0051191111-417-S^FS




^XZ				#终止指令

```










--缩写代表意义--

nW  : 宽度点数[Width]

nH  : 高度点数[Height]

nR  : 宽窄线条比例[Rate]

nTBW: 窄线条点数[Thin Bar Width]

nLW : 线宽点数[Line Width]

nXS : 水平放大比例[X-axis Scale]

nYS : 垂直放大比例[Y-axis Scale]

v   : 任何文字数据

A   : 旋转角度[Angle]: N:0,R:90,I:180,B:270

bFZ : 是否前面补零[Fill Zero]

bBT : 是否条形码底下印字[Below Text]

bAT : 是否条形码上面印字[Above Text]

bCK : 是否印检查字符[Check]

F   : 可以是 0-9,A-Z; 字型 0:向量字型; 字型 D:常用字型

vC  :打印特殊字符时的跳脱字,内定为 _

vN  :在打印机中的文件名, 如. R:SAMPLE.GRF
















### FD

^FD[Field Data:数据字段]






















### ^A

^A[可缩放/点阵字体]命令用于内置的True Type字体。可缩放字体（也可以认为是平滑矢 量字体）能够以点为单位来对横向、纵向进行扩展。点阵字体由点阵象素组成，通常高度高度大于宽度。   内置的的缩放字体[A0=CG Triumvirate Bold Condensed]默认为不旋转，15点高，12点宽。打印机将从^A命令得到字体的旋转方向、宽度、高度等参数。




^A 命令的格式： `^Afo,h,w`

f :字体名称

o :字体方向

h : 字符高度

w : 字符宽度







### SVG与JPEG的优势




首先简要解释一下矢量图像格式和位图图像格式的区别。矢量图像用点和线来描述物体，所以文件会比较小，同时也能提供高清晰的画面，适合于直接打印或输出。而位图图像的存储单位是图像上每一点的像素值，因此一般的图像文件都很大，会占用大量的网络带宽。SVG是一种矢量图形格式，GIF、JPEG是位图图像格式。




SVG较GIF、JPEG的优势显而易见：




1．任意放缩

2．文本独立

3．较小文件

4．超强显示效果

5．超级颜色控制

6．交互X和智能化













### ^DG

下载图形。~DG 命令用于下载以 ASCII 十六进制表示的图形图像。如果 .GRF 不是指定的

文件扩展名，将自动添加 .GRF。







如果将具有相同名称的两个图形发送给打印机，则第一个图形将被第二个图形擦除并

取代。










### ^DY

下载对象。




~DY 命令用于将任何受支持格式的图形对象或字体下载到打印机。此命令可用

于替代 ~DG，以便提供更多保存和加载选项。~DY 是将 TrueType 字体下载到具有

X.13 以上版本固件的打印机的首选命令
















### ^IM

图像移动。^IM可将图像从存储区域直接移动到位图中。该命令与 ^XG 命令（调用图

形）完全相同，只是缺少尺寸参数。




格式：^IMd:o.x




d = 已存储对象的位置。 接受的值：R:、E:、B: 和 A:

o = 对象名称

x = 扩展名。	固定值：.GRF 、 .PNG







```

^FO134,25^IME:LG.GRF^FS

^FO277,25^IME:IPS.GRF^FS

```







### ^XG

调用图形。 ^XG 命令用于调用一个或多个要进行打印的图形图像。

针对每种格式，可以根据需要对一个图像进行任意次数的调用和大小调整。其他图像

和数据也可以添加到格式中。




格式 ^XGd:o.x,mx,my




mx： x轴的放大系数，默认值1

my： y轴的放大系数







^FO100,100^XGR:SAMPLE.GRF,1,1^FS







### 目标对象[图像，标签格式，字体]的存储位置







存储设备：

R：　DRAM，内存，读写

B：可选的存储器

E：Flash memory，闪存  读写

Z：Internal ZPL II Stored Object Library ，只读










### ^BY

条码字段默认值。




条形码宽度：

nTBW: 窄线条点数[Thin Bar Width]；

nR  : 宽窄线条比例[Rate]；

nH  : 高度点数[Height]







^BY 命令用于更改模块宽度（以点为单位）、宽条与窄条的宽度比以及条码高

度（以点为单位）的默认值。该命令可以根据需要在标签格式中多次使用。




格式： ^BYw,r,h




w = 模块宽度（以点为单位）

r = 宽条与窄条的宽度比

h = 条码高度（以点为单位）







^BY2,3.0^FO478,80  #




^BXN,8,200,22,22   # 8表示每个点的高度和宽度；22,22表示一个二维码由22x22行构成




## ^BX

Data Matrix 条码




格式 ^BXo,h,s,c,r,f,g,a




## ^BQ

QR Code 条码：该符号的四个角中有三个为一种独特的图案，该图案可帮助

确定条码尺寸、位置和倾角。




该条码使用在后续 ^FD 字符串中指定的字段数据进行打印。







格式 ^BQa,b,c,d,e




a:字段方向

b：模式，默认2 [2增强-推荐]

c：放大系数。接受的值1-10。默认值： 在300dpi打印机上为3







```

^FO40,30^BQN,2,3,^FDLA,G16AE0F0N2BF66NG4111^FS^XZ		#此处BQ的参数在300dpi打印机上都是默认值

```




带有^FD语句的^BQ命令进行格式设置的特定命令




^FD中字符串有不同的含义，见文档。










## ^GB

方框。

^GB 命令用于绘制作为标签格式组成部分的方框和线条。




命令格式：^GBw,h,t,c,r




w 宽度，点数

h

t ：边框厚度，点数

c：线条颜色， B黑色（默认），W白色

r：圆角程度。 1-8，默认为0










