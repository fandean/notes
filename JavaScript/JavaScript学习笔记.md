# JavaScript各种使用场景

```javascript
   document.write('<h3>以下是JavaScript的输出</h3>');
            alert('警示框！ document.write()用于向HTML文档中输入文本。');
            document.write('document.write()用于向HTML文档中输入文本。');
            document.write("使用alert()弹出警示框。");
            var name = prompt('what is your name?', '');
            document.write('<center><p><b>使用prompt()方法采集到的信息：</b> Welcome <big>' + name + '</big></p></center>');

            if(confirm('确认对话框confirm()')){
                document.write('你点击了"是"');
            }else{
                document.write('你点击了"否"按钮');
            }
```

#### 选择页面元素
JavaScript与页面节点通信的方法：

- getElementById(): 通过id获取一个元素
- getElementByTagName(): 获取一个元素的列表，比如获取所有链接元素a
	`var pageLinks = document.getElementsByTagName('a');`





## A标签中href=""的几种用法

强烈推荐：[详解A标签中href=&quot;&quot;的几种用法_javascript技巧_脚本之家](https://www.jb51.net/article/121630.htm?utm_medium=referral "详解A标签中href=&quot;&quot;的几种用法_javascript技巧_脚本之家")



`javascript: `是一个伪协议，其他的伪协议还有 `mail:`  `tel:`  `file:`  等等。

`javascript:`是表示在触发`<a>`默认动作时，执行一段JavaScript代码，而 `javascript:;` 表示什么都不执行，这样点击`<a>`时就没有任何反应。

一般在这种情况下，会给`<a>`绑定一个事件回调，来执行业务，如：

```javascript
document.getElementById('jsPswEdit').addEventListener('click', function(e) {
  e.preventDefault();
  // 当<a>触发click时，处理业务
}, false);
```



