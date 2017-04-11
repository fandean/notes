# 菜单  

**Menu接口**有两个子接口：  

- SubMenu：它代表一个子菜单。可以包含1~N个MenuItem（形成菜单项）
- ContextMenu：上下文菜单。可以包含1~N个MenuItem（形成菜单项）


有三种菜单：  

1. 选项菜单(Option Menu)
2. 子菜单(SubMenu)
3. 上下文菜单(ContextMenu)


>选项菜单(Option Menu)
>Android 3.0之前，按"Menu"键会显示选项菜单；而在它之后手机没有了这个按键，所以建议使用ActionBar来代替菜单。


## 1.选项菜单和子菜单

### 1.1 Menu添加菜单项和子菜单的提供的方法
MenuItem add()  
SubMenu addSubMenu()  

#### 1.1.1 子菜单提供的额外方法：  

- SubMenu setHeaderIcon()：设置菜单头的图标
- SubMenu setHeaderTitle()：设置菜单头的标题
- SubMenu setHeaderView()：使用View设置菜单头


### 1.2 添加菜单或子菜单的步骤

1. 重写Activity的`onCreateOptionsMenu(Menu menu)`方法，在该方法中调用Menu对象来为添加菜单或子菜单。
2. 如果希望应用程序能响应菜单项的单击事件，重写Activity的onOptionsItemSelected(MenuItem mi)方法即可。


> Android 5.0 采用了Material主题，这种主题不会显示子菜单的标题。



### 1.3 设置与菜单管理的Activity
单击某个菜单项时可以启动其它Activity（包括Service）。  
只需要调用MenuItem的 `setIntent(Intent intent)`方法即可，该方法把该菜单项与指定的Intent关联在一起 ... 




## 2.上下文菜单(ContextMenu)
当用户一直按住某个组件时，该组件所关联的上下文菜单就会显示出来。 


### 2.1开发上下文菜单的步骤如下：   

1. 重写Activity的`onCreateContextMenu()`方法
2. 调用Activity的`registerForContextMenu(View view)`方法，为view组件注册上下文菜单。
3. 如果希望应用程序能为菜单提供响应，则可重写`onContextItemSelected(MenuItem mi)`方法。


## 3. 使用XML文件定义菜单
菜单资源文件通常放在 "res\menu" 目录下。

菜单资源的根元素通常是`<menu .../>`该元素无需指定任何属性，该元素内可包含如下子元素：  

- `<item.../>`元素： 定义菜单项
- `<group.../>`元素：将多个`<item.../>`定义的菜单项包装成一个菜单组

	item可以 <item /> 也可 <item></item>

其中item元素用于定义菜单项，它又可嵌套menu元素，该内部的menu元素就代表了子菜单。

item可指定如下常用属性：  

- android:id
- android:title
- android:icon
- android:alphabeticShortcut
- android:numericShortcut
- android:checkable
- android:checked
- android:visible
- android:enable


在xml文件中定义了菜单资源后，接下来还是重写onCreateOptionsMenu()方法(或上下文的那个)，在这些方法中调用
MenuInflater对象的inflate方法加载指定资源对应的菜单即可。


## 4.使用PopupMenu创建弹出式菜单

### 4.1 创建步骤

1. 调用new PopupMenu(Context context, View anchor)创建下拉菜单，anchor代表要激发该弹出菜单的组件。
2. 调用MenuInflater的inflate()方法将菜单资源填充奥PupupMenu中。
3. 调用PopupMenu的show()方法显示弹出式菜单。


