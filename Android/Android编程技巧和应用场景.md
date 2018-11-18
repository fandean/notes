## 编程技巧

### 巧用取模运算符 %

- 循环获取某数组内的值





## 应用场景



### 使用Handle定时更换ImageView中的图片



关键代码：

```java
//包含图片的数组
int images[] = {R.drawable.image1,R.drawable.image2};
//当前显示的图片的索引
int index;

//定义一个MyRunnable内部类，在其run()方法中实现如下逻辑
//循环更换索引的方法，巧用取模运算符 % 
index++;
index = index % images.length;
imageView.setImageResource(...);
//每隔一秒中发送该myRunnable对象
handler.postDelayed(myRunnable, 1000);


//然后在主线程中同样调用该方法
handler.postDelayed(myRunnable, 1000);
```











