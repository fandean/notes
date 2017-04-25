# 总结、记录Android编程中出现的错误和一些收获


## 1.错误

### List 链表错误
1. 在循环中向List中添加数据，而该临时数据的定义却也在循环中。导致添加的都是同一个内存空间中，List中的引用都指向了该地址。




## 2.总结

1. AppCompatActivity中的findViewById通过通过委托类来调用View.findViewById()，而Activity中也是最终调用View.findById()。

