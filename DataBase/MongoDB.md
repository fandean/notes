## MongoDB

MongoDB是面向文档的数据库，而非关系型数据库。它扩展了关系型数据库的众多有用功能，如辅助查询、范围查询和排序。

它将原来的行的概念换成更加灵活的文档模型。它没有模式：文档的键不会事先定义也不会固定不变。

MongoDB 将数据存储为一个文档，数据结构由键值(`key=>value`)对组成。MongoDB 文档类似于 JSON 对象。字段值可以包含其他文档，数组及文档数组。

有些关系型数据库的常见功能MongoDB并不具备，比如联接(join)和复杂的多行事务。

MongoDB 的扩展性强，其采用的面向文档的数据模型使其可以自动在多台服务器之间分割数据。

MongoDB性能优越。它将内存管理工作交由操作系统处理；它利用查询优化器记住执行查询最高效的方式；它利用预分配数据文件的方式(用空间)换取性能的稳定。

MongoDB的管理理念就是尽可能的让服务器自动配置，简化数据库的管理。比如如果主服务器挂掉，它会自动切换到备份服务器上，并且将备份服务器提升为活跃服务器。



> **NoSQL简介**      
> NoSQL(NoSQL = Not Only SQL )，意即"不仅仅是SQL"。但事实上很多NoSQL数据库都放弃了对 SQL语言的支持。



## MongoDB安装启动和停止

安装方法见： 

* [Install MongoDB Community Edition ](https://docs.mongodb.com/manual/administration/install-community/ "Install MongoDB Community Edition — MongoDB Manual 3.4")   
* [How to Install MongoDB on Ubuntu 16.04 - DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-install-mongodb-on-ubuntu-16-04 )   
* [How to Install and Configure MongoDB on Ubuntu 16.04](https://www.howtoforge.com/tutorial/install-mongodb-on-ubuntu-16.04/ "How to Install and Configure MongoDB on Ubuntu 16.04")  



开启mongod：

```shell
sudo service mongod start
```

进入mongo shell：

```shell
mongo
```

列出数据库：

```shell
show dbs
```

显示当前数据库对象：

```
db
```

默认是 test 。

切换数据库：

```shell
use <database>
```

停止 mongod：

```
sudo service mongod stop
```

或者使用下面更加稳妥的方式停止MongoDB：

```
# 切换到admin数据库（让自己具有管理员权限）
use admin
db.shutdownServer()
```



> 刚安装的mongodb并没有开启用户权限验证；所以连接时不需要认证。



## MongoDB的基本概念

在mongodb中基本的概念是文档、集合、数据库。

| SQL术语/概念    | MongoDB术语/概念 | 解释/说明                   |
| ----------- | ------------ | ----------------------- |
| database    | database     | 数据库                     |
| table       | collection   | 数据库表/集合                 |
| row         | document     | 数据记录行/文档                |
| column      | field        | 数据字段/域                  |
| index       | index        | 索引                      |
| table joins |              | 表连接,MongoDB不支持          |
| primary key | primary key  | 主键,MongoDB自动将_id字段设置为主键 |



### 文档

文档类似于关系数据库中的行。多个键及其关联的值有序的放置在一起便是文档。**在JS中，文档表示为对象**。

每个文档都有一个特殊的键`_id`，它在文档所处的集合中是唯一的。



**几个重要的概念：**

* 文档中的键/值对是**有序的**。

* 文档的键是字符串。一般情况键可以使用UTF-8字符。

  * 键不能有`\0`空字符。它是用来表示键的结尾。
  * `.`和`$`只有在特定环境才能使用
  * 以`_`开头的键是保留的

* MongoDB不但**区分类型**，也**区分大小写**。下面是两组不同的文档：

  ```javascript
  {"foo":3}
  {"foo":"3"}
  ```

  ```javascript
  {"foo":3}
  {"Foo":3}
  ```

  ​

* MongoDB的文档**不能有重复的键**。





### 集合

集合可以被看作没有模式的表。



**子集合：**

组织集合的一种惯例是使用 `.` 字符分开的命名空间划分的**子集合**。比如：

blog.post和blog.authors，这样做只是了使组织结构更好些，也就是说blog这个集合（这里根本就不需要存在）及其子集合没有任何关系。



### 数据库

一个MongoDB实例可以承载多个数据库。不同的数据库存放在不同的文件中

要记住数据库名最终会变成文件系统里的文件，所以数据库名必须遵守一些约定。



保留的特殊数据库：

* admin：从权限角度上看，这是 root 数据库。
* local：这个数据库永远不会被复制，可以用来存储限于本地服务器的任意集合。
* config：但Mongo用于分片设置时，config数据库在内部使用，用于保存分片的相关信息。



命名空间：把数据库的名字放到集合名前面，得到的集合的完全限定名称。





### 数据类型

MongoDB的文档类似于JSON，在概念上和JavaScript中的对象神似。MongoDB在保留JSON基本的键/值对特性的基础上，添加了其它一些数据类型。在不同的编程语言下这些类型表示有些许差异。


* null: 

* 布尔：

* 32位整数：

* 64位整数：

* 64位浮点数：

* 字符串

* 符号

* 对象id：ObjectId()。（文档必须有一个"_id"键；这个键的值可以是任意类型，默认是ObjectId对象。）  

* 日期： new Date()  

* 正则表达式：采用JavaScript的正则表达式语法   

* 代码： 文档中还可以包含JavaScript代码  
  ```javascript
  {"x" : function(){/* */}}
  ```

* 二进制数据：

* 最大值

* 最小值

* undefined

* 数组：值的集合或者列表可以表示成数组
  ```javascript
  {"x" : ["a","b","c"]}
  ```

* 内嵌文档：  
  文档可以包含别的文档，也可以作为值嵌入到父文档中
  ```javascript
  {"x" : {"foo" : "bar"}}
  ```



## 数据库管理

默认数据目录 `/data/db`，并使用27017端口。它还会启动一个非常基本的http服务器，监听数字比主端口号高 1000 的端口，比如 28017 端口。



### MongoDB Shell

MongoDB自带一个 JavaScript shell，可以从命令行与MongoDB实例交互。它也是一个完备的JS解释器，可以运行任何JS程序。

开启的时候，shell会连接到MongoDB服务器的 test 数据库，并将这个数据库连接**赋值给全局变量 db** 。这个变量是通过 shell 访问 MongoDB的主要入口点。

shell还提供了一些语法糖，比如选择数据库的 `usr dbName` ，执行该操作后 db 变量的值也会发生改变。

```sql
# 运行 mongo 启动 shell
mongo

# 列出数据库
show dbs
# 切换数据库，如果该数据库不存在则创建该数据库
use imooc
# 删除数据库
db.dropDatabase()
```





## 增删改查


### 插入文档

对目标集使用insert方法，插入一个文档：
```javascript
db.foo.insert({"bar":"baz"})
```
> 该操作会自动增加一个 "_id" 键（要是原来没有）再保存到数据库

批量插入：  
批量插入能传递一个由文档构成的数组给数据库。


插入数据时：数据库只会验证是否包含"_id"键，然后就简单的将文档原样的存入数据库。

MongoDB在插入时并不执行代码，所以这块没有注入式攻击的可能。


### 删除文档

删除users集合中的所有文档，但不删除集合本身：
```javascript
db.users.remove()
```

remove函数可以接受一个查询文档作为可选参数。这样只有符合条件的文档才能被删除。   
示例：所有"optout"为true的将被删除：
```javascript
db.mailing.list.remove({"opt-out" : true})
```

> 直接删除集合： `db.drop_collection("bar")`


### 更新文档
使用update方法。该方法由两个参数，一个是**查询文档**，用来找出要更新的文档；另一个是**修改器(modifier)文档**，描述对找到的文档做哪些更改。

更新操作是原子的：若是两个更新同时发生，先到达服务器的先执行，接着执行另外一个。

**更新修改器**：是一种特殊的键，用来指定复杂的更新操作。

#### `"$set"`修改器  
`"$set"`修改器用来指定一个键的值。如果这个键不存在，则创建它。   
示例：添加喜欢的书籍到某用户信息
```javascript
db.users.update(
  {"_id":ObjectId("4fksdftudkf4964trub")}, //查询文档 
  {"$set":{"favorite book" : "war and peace"}} //修改器文档
  )
```

对应的可以使用 `"$unset"` 将键完全删除。


#### `"$inc"`修改器
`"$inc"`修改器：用来增加已有的值，如果键不存在则创建一个键。

它只能用于整数、长整数活浮点数。

```javascript
db.games.update({"game":"pinball","user":"joe"}, //查询文档
               {"$inc":{"score":50}})  //修改器文档
```

上面示例：满足条件的玩家加50分，如果分数键(score)不存在则先创建该键。这里增量为50。




#### `"$push"`修改器
用于数组。`"$push"`修改器会向已有的数组末尾加入一个元素，若是该键不存在则会创建一个新的数组。

注意：这里是指集合中的某个键的值为数组，现在要向这个数组中添加元素。

比如 blog.post集合如下：

```javascript
{
    id : ObjectId("4dkfs53rt9rufhvjr0fv"),
    title : "A blog post",
    content : "...",
    comments : [
        {
            name : "joe",
          	email : "joe@gmail.com",
          	content : "nice post"
        }
    ]
}
```

当我们想向comments这个数组中添加一个元素，就可以使用 `$push`。





### 查询文档
使用 find 或者 findOne 函数和查询文档对数据库执行查询。

查询简单的类型，只要指定想要查找的值就好了。示例，查找所有"age"的值为27的文档：
```javascript
db.users.find({"age":27})
```




**查询条件：**

| 相关操作符  | 描述                |
| ------ | ----------------- |
| `$lt`  | <                 |
| `$lte` | <=                |
| `$gt`  | >                 |
| `$gte` | >=                |
| `$ne`  | 不等于               |
| `$in`  | 用来查询一个键的多个值       |
| `$nin` | 返回与数组中所有条件都不匹配的文档 |
| `$or`  | 用来完成多个键值的任意给定值    |
| `$not` | 是元语句，可以用在任何其他条件之上 |



查询在 18 ~ 30岁的用户:
```javascript
db.users.find({"age": {"$gte": 18, "$lte": 30} })
```

使用`$in`对单个键做OR查询
```javascript
db.raffle.find({"ticket_no" : {"$in" : [725,542,390]}})
```

使用`$or`可以对多个键做OR查询。示例，找到 ticket_no 为 725或者winner为true的文档：
```javascript
db.raffle.find({"$or" : [{"ticket_no" : 725}, {"winner", true}]})
```


#### 查询数组

例如：数组是一个水果清单
```javascript
db.food.insert({"fruit" : ["apple","banana","peach"]})
```
下面的查询会匹配该文档：
```javascript
db.food.find({"fruit","banana"})
```

`$all`：通过多个元素来匹配数组。  
找到既有 apple 又有 banana 的文档：
```javascript
db.food.find({fruit: {$all : ["apple","banana"]}})
```

`$size`用于查询指定长度的数组。
```javascript
db.food.find({fruit: {$size : 3}})
```


#### 查询内嵌文档

如果允许通常只针对内嵌文档的特定键值进行查询才是比较好的做法，这样即便数据模式改变，也不会有太大问题。 

我们可以使用"点表示法"查询内嵌的键：
```javascript
db.people.find({"name.first" : "Joe", "name.last" : "Schome"})
```


### `"$where"`查询

`"$where"`子句可以执行任意JavaScipt作为查询的一部分。由了它的补充，使得查询能做任何事情。

最典型的应用就算比较文档中的两个键的值是否相等。

```javascript
db.foo.find({"$where" : "function(){return this.x + this.y == 10; }" })
```

注意：`"$where"`查询在速度上要比其他常规查询慢很多。


### 游标
数据库使用 游标 来返回find的执行结果。find返回的对象就是一个游标。

游标的方法：

* next()：获取下一个结果
* hasNext()：检查是否有后续结果存在
* limit()：限制结果数量
* skip()：忽略一定数量的结果
* sort()：对结果排序

> 几乎所有的游标的方法返回值也是游标，这样就可以组成方法链。



## 管理MongoDB

### 从命令行启动MongoDB
直接执行 `mongod`，即可简单的启动服务器。该命令还有很多可配置的启动选项：

| 选项        | 描述                                    |
| --------- | ------------------------------------- |
| --help    | 查看所有选项                                |
| --dbpath  | 指定数据目录。默认值是`/data/db`                 |
| --port    | 指定服务器监听的端口号                           |
| --fork    | 以守护进程的方式运行MongoDB，创建服务器进程             |
| --logpath | 指定日志输出路径，而不是输出到命令行                    |
| --config  | 指定配置文件。配置文件中 `#`是注释符号；语法形式是"选项-值"的形似。 |


每个mongod进程都需要独立的数据目录。当mongod启动时，会在数据目录中创建mongod.lock文件，该文件用于防止其他mongod进程使用该数据目录。并且要给它们指定不同的端口号。



### 停止MongoDB
这里只介绍一个稳妥的停止数据库的方法：使用shutdown命令，`{"shutdown" : 1}`，这是管理命令，要在 admin 数据库下使用。 **MongoDB shell** 提供了辅助函数，来简化这一过程：
```shell
> use admin
switched to db admin
> db.shutdownServer();
server should be down...
```




## 学习资料

《MongoDB权威指南》   
[MongoDB 教程 - 菜鸟教程](http://www.runoob.com/mongodb/mongodb-tutorial.html "MongoDB 教程 - 菜鸟教程")  
官方手册：[The MongoDB  Manual ](https://docs.mongodb.com/manual/)   
[MongoDB中文社区](http://www.mongoing.com/)   
[MongoDB中文网](http://www.mongodb.org.cn/)   
[Mongodb最佳实践-麦子学院](http://www.maiziedu.com/course/395/)   
[MongoDB基础教程-慕课网课程](http://www.imooc.com/course/list?c=mongodb)   
图形工具： [Robo 3T - formerly Robomongo — native MongoDB management tool (Admin UI)](https://robomongo.org/)   



