# WebView
高性能 webkit 内核浏览器。

两篇不错的文章，另还可参考《Android编程权威指南》

[深入讲解WebView——上-开源实验室-张涛](https://www.kymjs.com/code/2015/05/03/01/)

[Android开发：最全面、最易懂的Webview使用详解 - 简书](http://www.jianshu.com/p/3c94ae673e2a# "Android开发：最全面、最易懂的Webview使用详解 - 简书")

[android WebView详解，常见漏洞详解和安全源码 - 掘金](https://juejin.im/post/58a037df86b599006b3fade4 "android WebView详解，常见漏洞详解和安全源码 - 掘金")





## WebView保存状态

You can save the Webview in Android Cache : Use WebView Setting
```java
//表示优先使用缓存
webView.getSettings().setCacheMode(WebSettings.LOAD_CACHE_ELSE_NETWORK);
```

> 几种缓存的模式：
>
> > - LOAD_CACHE_ONLY: 不使用网络，只读取本地缓存数据
> > - LOAD_DEFAULT: 根据cache-control决定是否从网络上取数据。
> > - LOAD_CACHE_NORMAL: API level 17中已经废弃, 从API level 11开始作用同LOAD_DEFAULT模式
> > - LOAD_NO_CACHE: 不使用缓存，只从网络获取数据.
> > - LOAD_CACHE_ELSE_NETWORK，只要本地有，无论是否过期，或者no-cache，都使用缓存中的数据。



## WebView的缓存

在项目中如果使用到 WebView 控件,当加载 html 页面时,会在/data/data/包名目录下生成 database 与 cache 两个文件夹（我的手机没有root，就不截图了）。
请求的 url 记录是保存在 WebViewCache.db,而 url 的内容是保存在 WebViewCache 文件夹下.

[android 读取WebView缓存及清理WebView缓存](http://blog.csdn.net/wei_chong_chong/article/details/52189011)








## CSS注入、加载本地CSS

loadDataWithBaseURL(String baseUrl, String data, String mimeType, String encoding, String historyUrl)

该方法是loadData(...)的增强版，它不会产生乱码。

- data: 指定需要加载的HTML代码
- mimeType :指定HTML代码的MIME类型，对于HTML代码可以指定为text/html
- encoding: 指定HTML代码编码所采用的字符集

使用示例：` mWebView.loadDataWithBaseURL(null, sb.toString(), "text/html", "utf-8", null);`


### 方法一：直接在现有html数据之前添加

直接在现有html数据之前添加一段导入css的标签


> 方法一和方法二都参考了：
> [android - Rendering（渲染 HTML in a WebView with custom CSS - Stack Overflow](https://stackoverflow.com/questions/4950729/rendering-html-in-a-webview-with-custom-css "android - Rendering HTML in a WebView with custom CSS - Stack Overflow")


```java
htmlData = "<link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\" />" + htmlData;
// lets assume we have /assets/style.css file
webView.loadDataWithBaseURL("file:///android_asset/", htmlData, "text/html", "UTF-8", null);
```

And only after that WebView will be able to find and use css-files from the assets directory.

ps： And, yes, if you load your html-file form the assets folder, you don't need to specify a base url.


###  方法二：使用jsoup库

[jsoup Java HTML Parser, with best of DOM, CSS, and jquery](https://jsoup.org/ "jsoup Java HTML Parser, with best of DOM, CSS, and jquery")

[Cookbook: jsoup Java HTML parser](https://jsoup.org/cookbook/ "Cookbook: jsoup Java HTML parser")

jsoup: Java HTML Parser

```java
// jsoup HTML parser library @ https://jsoup.org/
compile 'org.jsoup:jsoup:1.10.3'
```

看起来很简单：一个简单示例，
```java
Document doc = Jsoup.connect("http://en.wikipedia.org/").get();
Elements newsHeadlines = doc.select("#mp-itn b a");
```

```java
//1. load the web-page with jsoup:
doc = Jsoup.connect("http://....").get();

//2. remove links to external style-sheets
doc.head().getElementsByTag("link").remove();

//3. set link to local stylesheet。假设文件在assets文件夹,文件名为 style.css
// <link rel="stylesheet" type="text/css" href="style.css" />
doc.head().appendElement("link").attr("rel", "stylesheet").attr("type", "text/css").attr("href", "style.css");

//4.make string from jsoup-doc/web-page:
String htmldata = doc.outerHtml();

5. display web-page in webview:
WebView webview = new WebView(this);
setContentView(webview);
webview.loadDataWithBaseURL("file:///android_asset/.", htmlData, "text/html", "UTF-8", null);
```


### 方法三: 使用JS操作DOM

> 方法三的参考： [inject CSS to a site with webview in android - Stack Overflow](https://stackoverflow.com/questions/30018540/inject-css-to-a-site-with-webview-in-android "inject CSS to a site with webview in android - Stack Overflow")

方法三，使用JS操作DOM：

```java
public class MainActivity extends ActionBarActivity {

  WebView webView;

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);

    webView = new WebView(this);
    setContentView(webView);

    // Enable Javascript
    webView.getSettings().setJavaScriptEnabled(true);

    // Add a WebViewClient
    webView.setWebViewClient(new WebViewClient() {

        @Override
        public void onPageFinished(WebView view, String url) {

            // Inject CSS when page is done loading
            injectCSS();
            super.onPageFinished(view, url);
        }
    });

    // Load a webpage
    webView.loadUrl("https://www.google.com");
}

// Inject CSS method: read style.css from assets folder
// Append stylesheet to document head
private void injectCSS() {
    try {
        InputStream inputStream = getAssets().open("style.css");
        byte[] buffer = new byte[inputStream.available()];
        inputStream.read(buffer);
                inputStream.close();
                String encoded = Base64.encodeToString(buffer, Base64.NO_WRAP);
                webView.loadUrl("javascript:(function() {" +
                        "var parent = document.getElementsByTagName('head').item(0);" +
                        "var style = document.createElement('style');" +
                        "style.type = 'text/css';" +
                        // Tell the browser to BASE64-decode the string into your script !!!
                        "style.innerHTML = window.atob('" + encoded + "');" +
                        "parent.appendChild(style)" +
                        "})()");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
```

但是这里的代码和方法可能有些问题，Stack Overflow上的讨论。

Use DOM manipulation before loading Url in webview. By doing so you can inject any script or javascript file at runtime and then load the content into webview.I have been doing so in my ePub player and it works like charm


另一个示例：

```java
private void carregaCSS() {
        final String extraStyles;
        extraStyles= "javascript: "
        + "function css(){ "
            + " document.querySelectorAll('div.live-search-container')[0].style.display = 'none';"
            + " document.querySelectorAll('div#top-bar')[0].style.display = 'none';"
            + " document.querySelectorAll('span#btn-mobile-toggle')[0].style.display = 'none';"
            + " document.querySelectorAll('div#cart')[0].style.display = 'none';"
            + " document.querySelectorAll('div.col-md-7')[0].style.display = 'none';"
            + " document.querySelectorAll('div.breadcrumb')[0].style.display = 'none';"
        + "}"
        +"css();"

        +"";
        mWebView.loadUrl(extraStyles);
        }
}
```

好吧这里我想问的是可以在同一个WebView中多次使用loadUrl加载多个资源吗？？莫非上面是先加载了html页面，再加载该JS代码？？



## JS调用Android方法：

在WebView的JavaScript中调用Android方法的步骤：

- 调用WebSettings的setJavaScriptEnabled(true)启用JS调用功能
- 调用WebView的addJavascriptInterface(Object object, String name)方法将object对象保留给JS脚本
- 在JS脚本中通过刚才暴露的name对象调用Android方法。

```java
//Activity中：

mWebView.getSettings().setJavaScriptEnabled(true);
mWebView.addJavascriptInterface(new MyObject(this), "myObj");


//MyObject是自定义的java类，代码如下：
public class MyObject{
    Context mContext;
    ...

    //该注解表示该方法会暴露给JS脚本调用
    @JavascriptInterface
    public void showToast(String name){
        Toast.makeText(...).show();
    }

    @JavascriptInterface
    public void showList(){
        ...
    }
}
```

HTML页面对应的JS代码：

```html
...
<body>
    <input type="button" value"打招呼"
        onclick="myObj.showToast('孙悟空');" />
    <input type="button" value="图书列表"
        onclick="myObj.showList();" />
</body>
...
```

