- [ ] Java基础补充： 
- [ ] 字符串，
- [ ] 数组，
- [ ] 垃圾处理
- [ ] Java NIO
- [ ] Integer.valueOf(int) ，导致 两个Integer为 1000的值的比较时结果为false
- [ ] 









疑难知识点



- [Integer.parseInt(&quot;&quot;) Integer.valueOf(&quot;&quot;)和new Integer(&quot;&quot;)之间的区别 - CSDN博客](https://blog.csdn.net/suifeng3051/article/details/52101411 "Integer.parseInt(&quot;&quot;) Integer.valueOf(&quot;&quot;)和new Integer(&quot;&quot;)之间的区别 - CSDN博客") 该文章评论说文中有错误，也确实有误：

  ```java
  System.out.println(Integer.valueOf(5) == Integer.valueOf(5));  //true
  System.out.println(Integer.valueOf(500) == Integer.valueOf(500)); //false
  ```

  注意：`Integer.valueOf(int)`和`Integer.valueOf(String)`的区别。





