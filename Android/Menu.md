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

《疯狂Android讲义》1-3部分

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



### 为菜单项设置Intent

当单击一个菜单项后，如果该单击事件既没有被MenuItemClickListener处理程序处理，也没有被Activity的onOptionsItemSelected处理程序处理，就会触发分配给这个菜单项的intent。

menuItem.setIntent(new Intent(this,MyOtherActivity.class));



## 4.使用PopupMenu创建弹出式菜单

### 4.1 创建步骤

1. 调用new PopupMenu(Context context, View anchor)创建下拉菜单，anchor代表要激发该弹出菜单的组件。
2. 调用MenuInflater的inflate()方法将菜单资源填充到PupupMenu中。
3. 调用PopupMenu的show()方法显示弹出式菜单。



## onPrepareOptionsMenu 和onCreateOptionsMenu 的区别
[onPrepareOptionsMenu 和onCreateOptionsMenu 的区别](http://www.jcodecraeer.com/a/anzhuokaifa/androidkaifa/2014/1101/1887.html)  

在android中创建菜单menu时需要重写Activity的onCreateOptionsMenu(Menumenu)方法，这个方法只在第一次创建的时候调用一次，所以如果之后想对menu进行动态的修改，那么就不能再对onCreateOptionsMenu做什么手脚,就要用到onPrepareOptionsMenu(Menumenu)方法了。

onPrepareOptionsMenu与onCreateOptionsMenu不同的是，他在每次按下menu硬键之前会被调用，所以可以在这里动态的改变menu。

注意：在onPrepareOptionsMenu(Menumenu)函数中，首先需要调用：

super.onPrepareOptionsMenu(menu);

menu.clear();

如果没有clear而直接add的话，那么菜单中菜单项是会“追加”的，这样随着你不停的点menu键，菜单项就不停的增加。



## Activity的invalidateOptionsMenu()方法
Declare that the options menu has changed, so should be recreated. The onCreateOptionsMenu(Menu) method will be called the next time it needs to be displayed.

声明选项菜单已更改，因此应重新创建。 onCreateOptionsMenu（Menu）方法将在下次菜单需要显示时被调用。



在Fragment中通过 getActivity().invalidateOptionsMenu()调用。




## 更新Menu

Fragment与Menu


1. getActivity().invalidateOptionsMenu(); 在运行时改变menu item的状态。你需要重写onPrepareOptionsMenu() ，它方便你对item移除，添加，使不可用等。在android 3.0以上，你必须调用invalidateOptionsMenu() 。

当你要update你的menu时，因为action bar是一直出现的。然后系统将调用onPrepareOptionsMenu()更改menu。

Activity与Fragment中都有关于menu的一系列的方法，并且都是自动的在框架中回调的。其中onCreateOptionsMenu()只是在创建menu时调用一次，但menu存在的时候是不会重复调用的。更新menu时，从activity中主动的调用 invalidateOptionsMenu() 方法，那么activity在显示menu之前自然会回调onPrepareOptionsMenu(Menu menu)，再在该方法内实现更新的细节即可。

如果Fragment中没有invalidateOptionsMenu()方法，并且当menu存在的时候fragment也不会调用onCreateOptionsMenu()方法，那么我们可以在Fragment中直接调用**setHasOptionsMenu()**方法，将该方法设置为true，它就会调用onCreateOptionsMenu()，如此一来我们的目的就达到了。
