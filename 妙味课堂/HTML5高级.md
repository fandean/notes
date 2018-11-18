# miaov HTML5高级

## 块元素及内联元素特性



### 块级元素

块级元素：就算没有内容，通过设置高宽也会占据页面



### 内联元素

**内联元素**（行内元素）：如果没有内容，就算指定高宽都不会显示，宽高由内容撑开。



- 高宽由内容撑开
- 不之处宽高
- 一行上可以显示多个内联元素
- 不支持上下的margin（支持左右的margin）
- 代码换行被解析。（内联元素之间存在可被选中的空格，**这在某些情况会带来问题**）



![](https://gitee.com/fandean/Git-Pictures/raw/master/Web/html%E5%9F%BA%E7%A1%80/inline-block01.png)



> [解决行内元素存在间隙的bug问题 - 简书](https://www.jianshu.com/p/50e6cb9aeed6 "解决行内元素存在间隙的bug问题 - 简书")
>
> **当行内元素之间有“回车”、“tab”、“空格”时就会出现间隙**。 





### inline-block

应用场景：有时我们在划分一个布局时喜欢用`div`来划分其上下左右的位置，但是 `div`是一个块元素，无法在同一行显示多个`div`。可能我们会想到使用`display:inline`将其转换微内联显示；但是这样一来又不能设置宽高；这时可以利用 `display:inline-block` 来设置，使得其既可以内联显示又可以设置高宽。

inline-block 内联块：**既能用于内联元素也能用于块元素**。

使得内联元素或者块元素，既能在一行显示又能设置宽高。

**特征：**

- 块元素能在一行上显示
- 内联元素支持设置宽高
- 没有宽度时内容撑开宽高




## 选择器的特殊性问题和chrome的使用

这里涉及到选择器特殊性问题和chrome中的查看技巧

```html
<div class="pageBox">
    <a class="pageBtn" href="">上一页</a>
    <a href="">1</a>
    <a href="">2</a>
    <a href="">3</a>
    <a class="pageBtn" href="">下一页</a>
</div>
```

相应的选择器

```css
        .pageBox a{
            width: 17px;
            height: 20px;
            line-height: 20px;
            text-align: center;
            font: 14px "宋体";
            display: inline-block;
            border: 1px solid #c0c1e2;
        }
        
        .pageBtn{
            width: 64px;
            height: 20px;
        }
```

由于 `.pageBox a{}`的特殊性比`.pageBtn{}`高，所以下图中显示`.pageBtn{}`中的高度为无效，并且它的位置也排在下面。

>  查看方式是：先在Elements中选中元素，然后就会在 Styles中看到该元素相关的样式。

![](https://gitee.com/fandean/Git-Pictures/raw/master/Web/html%E5%9F%BA%E7%A1%80/youxianji03.png)

更改了代码后，`.pageBtn{}`的特殊性比`a{}`的高，在下图中`.pageBtn{}`的位置排在上面，而`a{}`中的高宽失效。

![](https://gitee.com/fandean/Git-Pictures/raw/master/Web/html%E5%9F%BA%E7%A1%80/youxianji04.png)

![](https://gitee.com/fandean/Git-Pictures/raw/master/Web/html%E5%9F%BA%E7%A1%80/youxianji01.png)



## 浮动

**浮动的定义：**使元素脱离文档流，按照指定方向发生移动，遇到父级边界或者相邻的浮动元素便停下。



**浮动的特征：**

- 块元素在一排显示
- 内联支持宽高
- 默认内容撑开宽度 （**前三条和 inline-block 一样**）
- 脱离文档流
- 提升层级的半层




### 清除浮动

**清除浮动：**使该元素的某个方向上不能有浮动元素

 如果对某个元素(该元素自身没有浮动)使用该属性,**该元素**和**它后面的元素**就会*显示在浮动元素的下面*。



示例：item浮动，导致box无法包裹item。

```html
<div class="box">
    <!-- item 将会设置为浮动 -->
    <div class="item">
        
    </div>
</div>
```



**清除浮动的方法:**   

1. 给父级加高度 (扩展性不好)   

2. 给父级加浮动 (那么父级的父级呢？这样页面中所有元素都加浮动，margin左右自动失效（floats bad ！）)   

3. 给父级添加``.inline-block`` 清浮动方法 (缺点：margin左右auto失效)   

4. 添加 div空标签清除浮动 (缺点：IE6 最小高度 19px；（解决后IE6下还有2px偏差）)  

   ```html
   <style>
       .clearfix{clear:both;}
   </style>
   <div class="box">
       <div class="item"></div>
       <div class="clearfix"></div>
   </div>
   ```


5. br 清浮动，同样在item下添加`<br clear="all">`	(不符合工作中：结构、样式、行为，三者分离的要求)    

6. after伪类，清除浮动（现在主流方法，无任何副作用）

7. 使用overflow清除浮动（存在副作用）

   ​

由方法4，5可知，div和br都是块元素，这样我们可以通过为伪类设置display属性为block也可达到这种效果。





## 伪类和伪元素



### 伪类

示例：

```html
<ul>
    <li>11</li>
    <li>12</li>
</ul>
<ul>
    <li>21</li>
    <li>22</li>
</ul>
```

```css
/* 伪类：单冒号 */
li:first-child{
    color:red;
}
```

该选择器会选择作为父元素的第一个子元素的li元素，这里会同时让11和21显示为红色，也就是会选择到**多个元素**，这就是**伪类**的特性。



### 伪元素

示例：使用`::first-letter`或者`::first-line`选择元素的第一个字母或者第一行。

伪元素与伪类的区别：

- **伪类**选择的是**一组元素**，而**伪元素**选择的是**元素的一部分内容**
- 伪元素是HTML中并不存在的元素。比如并不存在第一个字母这样的一个元素。
- 伪类应用与一组HTML元素，而**你无需在HTML代码中用类标记他们**。

建议使用css3中的语法，既伪类前面只带一个冒号，而伪元素前面是两个冒号。







### after伪类，overflow


`:after` 选择器在被选元素的内容后面插入内容。

请使用 content 属性来指定要插入的内容。

```html
<style>
    div:after{
        /* content 内容 */
        content: "- 这是由after伪类为各元素追加的内容"
    }
</style>
<body>
    <div>
    </div>
</body>
```



> [CSS :after 选择器](http://www.w3school.com.cn/cssref/selector_after.asp "CSS :after 选择器")



BFC和haslayout：只要触发了BFC或者haslayout，那么该区域就是一个独立的渲染区域，它将不受外界影响。



**BFC**（block formatting context ：块级元素格式化上下文）适用：标准浏览器。只要下面的某个值满足所给条件就可触发BFC。

- float的值不是none
- overflow的值不为visible
- display的值是table-cell，table-caption，inline-block中的任何一个
- position的值不为relative和static
- `width | height | min-width | min-height:!aotu`



**haslayout**： IE浏览器特有 （IE6 、IE7；IE8属于半标准浏览器）它的的触发模式：

- writing-mode:tb-rl
- -ms-writing-mode:tb-rl
- zoom:(!normal)


## 浮动练习

使用浮动布局的优势：

布局时使用 inline-block 可能会存在 垂直对齐 和 内联(行内)元素 代码换行被解析的问题；如果使用浮动则可以不用考虑这些问题。





## 定位

### 相对定位

`position:relative;` 相对定位：	

- 不影响元素本身的特性；
- 不使元素脱离文档流（元素移动之后原始位置会被保留）；
- 如果没有定位偏移量，对元素本身没有任何影响；
	 提升层级定位元素位置控制		



定位元素的位置控制：

`top/right/bottom/left`  定位元素**某方向**的偏移量。该偏移量的值**表示从它的自然位置偏移的距离**。

```css
.div2{
    /*margin-top: 200px;
    margin-left: 200px;*/
    position: relative;
    left:200px;
    top:200px;
    background-color: blue;
}
```



### 绝对定位

`position:absolute;`  绝对定位：

1. 使元素完全脱离文档流；
1. 使内嵌支持宽高；
1. 块属性标签内容撑开宽度；
1. **如果有定位父级相对于定位父级发生偏移，没有定位父级相对于document发生偏移**；
1. 相对定位一般都是配合绝对定位元素使用；(这是结合第4条一起使用，即为父元素设置一个相对偏移量为0的相对定位，这样子就可以为子元素设置相对于父元素发生偏移的绝对定位)
1. 提升层级


上面第4，5条结合使用，那么第1条和第6条结合就会使得元素脱离文档并遮盖其它元素。



定位元素的位置控制：

`top/right/bottom/left`  定位元素**某方向**的偏移量。该偏移量的值**表示相对于其祖先元素偏移的距离或者相对于body偏移的距离**。



z-index:[number]；  定位层级		

- 定位元素默认后者层级高于前者；	
- 建议在兄弟标签之间比较层级`z-index:[number];`  定位层级



### 固定定位

`position:fixed;` 固定定位：	

与绝对定位的特性基本一致，的差别是始终相对整个文档进行定位；	

问题：IE6不支持固定定位。



### 定位与浮动

`position:absolute;` 绝对定位元素子级的浮动可以不用写清浮动方法；    

`position:fixed;`  固定定位元素子级的浮动可以不用写清浮动方法；（IE6不兼容）    



