Java中的正则表达式



## Java中的反斜杠 `\`

Java对反斜线 `\` 的不同处理：

- 其它语言中， `\\`表示我要在正则表达式中插入一个普通的（字面上的）反斜线，请不要给他任何特殊的意义。`\d`表示一位数字（直接表示正则表达式中的 `\d` 而非普通字符）。
- 在Java中，`\\`表示，我要插入一个正则表达式的反斜线，所以其后的字符具有特殊的意义。所以需要使用 `\\d`来表示一位数字。但是普通的换行之类只需要使用单反斜杠`\n`



**普通字符串：**

在普通字符串中`\`用于表示转义。比如：在普通字符串中表示 一个 `\` 时需要 使用 `\\`。

在Java中任何不表示转义构造的 **字母字符** 之前使用反斜杠是一个错误，也就是说不能这样使用 `\w`。



**表示正则表达式的字符串：**





> 在其他语言中，`\\` 表示：**我想要在正则表达式中插入一个普通的（字面上的）反斜杠，请不要给它任何特殊的意义。**
>
> 在 Java 中，`\\` 表示：**我要插入一个正则表达式的反斜线，所以其后的字符具有特殊的意义。**
>
> 所以，在其他的语言中（如Perl），一个反斜杠 `\` 就足以具有转义的作用，而在 Java 中正则表达式中则需要有两个反斜杠才能被解析为其他语言中的转义作用。也可以简单的理解在 Java 的正则表达式中，两个 `\\` 代表其他语言中的一个 `\`，这也就是为什么表示一位数字的正则表达式是 `\\d`，而表示一个普通的反斜杠是 `\\\\`。
>
> 根据 Java Language Specification 的要求，Java 源代码的字符串中的反斜线被解释为 Unicode 转义或其他字符转义。因此必须在字符串字面值中使用两个反斜线，表示正则表达式受到保护，不被 Java 字节码编译器解释。例如，当解释为正则表达式时，字符串字面值 "`\b`" 与单个退格字符匹配，而 "`\\b`" 与单词边界匹配。字符串字面值 "`\(hello\)`" 是非法的，将导致编译时错误；要与字符串 `(hello)` 匹配，必须使用字符串字面值 "`\\(hello\\)`"。 



> 正则表达式是一种特殊的字符串模式，用于匹配一组字符串。最早出现于20世纪40年代，当时用来描述正则语言。20世纪70年代才出现在程序涉及领域。





## String中内建的正则表达式工具



### matches()检测是否匹配



检查一个String是否匹配相应的正则表达式：

```java
//: strings/IntegerMatch.java

public class IntegerMatch {
  public static void main(String[] args) {
    System.out.println("-1234".matches("-?\\d+"));
    System.out.println("5678".matches("-?\\d+"));
    System.out.println("+911".matches("-?\\d+"));
    System.out.println("+911".matches("(-|\\+)?\\d+"));
  }
} /* Output:
true
true
false
true
*///:~
```





### split()分割

`split()`的一个功能是，可以将字符串从正则表达式匹配的地方进行分割。



```java
//: strings/Splitting.java
import java.util.*;

public class Splitting {
  public static String knights =
    "Then, when you have found the shrubbery, you must " +
    "cut down the mightiest tree in the forest... " +
    "with... a herring!";
  public static void split(String regex) {
    System.out.println(
      Arrays.toString(knights.split(regex)));
  }
  public static void main(String[] args) {
    split(" "); //按空格分割（没有包含正则表达式）
    split("\\W+"); //按非单词字符分割（这里删除了标点） Non-word characters
    split("n\\W+"); //匹配字母n后跟一个或多个非单词字符 
  }
} /* Output:
[Then,, when, you, have, found, the, shrubbery,, you, must, cut, down, the, mightiest, tree, in, the, forest..., with..., a, herring!]
[Then, when, you, have, found, the, shrubbery, you, must, cut, down, the, mightiest, tree, in, the, forest, with, a, herring]
[The, whe, you have found the shrubbery, you must cut dow, the mightiest tree i, the forest... with... a herring!]
*///:~

```



`String.split()`还有一个重载版本，可以允许你限制字符串的分割次数。



### replace**() 替换



你可以只替换正则表达式**第一个**匹配的子串，或替换**所有**匹配的地方。



```java
//: strings/Replacing.java
import static net.mindview.util.Print.*;

public class Replacing {
  static String s = Splitting.knights;
  public static void main(String[] args) {
    print(s.replaceFirst("f\\w+", "located")); //f开头后跟一个或多个字母，并只替换第一个。（并非只f在每行最前）
    print(s.replaceAll("shrubbery|tree|herring","banana")); //匹配三个单词中的任意一个
  }
} /* Output:
Then, when you have located the shrubbery, you must cut down the mightiest tree in the forest... with... a herring!
Then, when you have found the banana, you must cut down the mightiest banana in the forest... with... a banana!
*///:~

/* 原字符串
Then, when you have found the shrubbery, you must cut down the mightiest tree in the forest... with... a herring!
*/
```





## 正则表达式 Pattern



`java.util.regex.Pattern`：表示编译后的正则表达式（正则表达式的编译表示）。详细介绍参考文档。

必须首先将正则表达式（指定为字符串）编译为此类的实例。 然后可以使用所得到的模式来创建一个Matcher对象，该对象可以匹配任意的character sequences与正则表达式。

典型示例：

```java
 Pattern p = Pattern.compile("a*b");
 Matcher m = p.matcher("aaaaab");
 boolean b = m.matches();
```

如果**正则表达式只使用一次**，可以参考下面的语句：

```java
boolean b = Pattern.matches("a*b", "aaaaab"); // a*b 是正则
```



Pattern类和Matcher对象都提供了相关方法：

- Pattern类提供的是静态方法；某个正则表达式只使用一次时可用这些方法。
- Matcher对象提供的方法，当某个正则表达式需要多次匹配时使用。



> Pattern 类没有公共构造方法。要创建一个 Pattern 对象，你必须首先调用其公共静态编译方法，它返回一个 Pattern 对象。该方法接受一个正则表达式作为它的第一个参数。
>
> Matcher 也没有公共构造方法。你需要调用 Pattern 对象的 matcher 方法来获得一个 Matcher 对象。  
>
> 





### Matcher





### 匹配和查找



用来检查输入字符串并**返回一个布尔值**，表示是否找到该模式：

| **序号** | **方法及说明**                                               |
| -------- | ------------------------------------------------------------ |
| 1        | **public boolean lookingAt()**   尝试将从区域开头开始的输入序列与该模式匹配。 |
| 2        | **public boolean find()**  尝试查找与该模式匹配的输入序列的下一个子序列。 |
| 3        | **public boolean find(int start）** 重置此匹配器，然后尝试查找匹配该模式、从指定索引开始的输入序列的下一个子序列。 |
| 4        | **public boolean matches()**  尝试将整个区域与模式匹配。**Java中默认为精确匹配** |



> **Java中`matches()`方法默认为精确匹配**；而在js中默认时模糊匹配（只要字符串中包含了正则表达式的内容就返回true）。



### 分割





### 替换







## 正则表达式语法



![](https://files.jb51.net/file_images/article/201509/201591091343122.png)





| 字符          | 说明                                                         |
| ------------- | ------------------------------------------------------------ |
| `\`           | 将下一字符标记为特殊字符、文本、反向引用或八进制转义符。例如，"n"匹配字符"n"。"\n"匹配换行符。序列"\\\\"匹配"\\"，"\\("匹配"("。 |
| `^`           | 匹配输入字符串开始的位置。如果设置了 **RegExp** 对象的 **Multiline** 属性，^ 还会与"\n"或"\r"之后的位置匹配。 |
| `$`           | 匹配输入字符串结尾的位置。如果设置了 **RegExp** 对象的 **Multiline** 属性，$ 还会与"\n"或"\r"之前的位置匹配。 |
| `*`           | 零次或多次匹配前面的字符或子表达式。例如，zo* 匹配"z"和"zoo"。* 等效于 {0,}。 |
| `+`           | **一次或多次**匹配前面的字符或子表达式。例如，"zo+"与"zo"和"zoo"匹配，但与"z"不匹配。+ 等效于 {1,}。 |
| `?`           | **零次或一次**匹配前面的字符或子表达式。例如，"do(es)?"匹配"do"或"does"中的"do"。? 等效于 {0,1}。**常用 ? 来表示 可选的内容**。 |
| `{n}`         | *n* 是非负整数。**正好匹配 *n* 次**。例如，"o{2}"与"Bob"中的"o"不匹配，但与"food"中的两个"o"匹配。 |
| `{n,}`        | *n* 是非负整数。至少匹配 *n* 次。例如，"o{2,}"不匹配"Bob"中的"o"，而匹配"foooood"中的所有 o。"o{1,}"等效于"o+"。"o{0,}"等效于"o*"。 |
| `{n,m}`       | *m* 和 *n* 是非负整数，其中 *n* <= *m*。匹配至少 *n* 次，至多 *m* 次。例如，"o{1,3}"匹配"fooooood"中的头三个 o。'o{0,1}' 等效于 'o?'。注意：您不能将空格插入逗号和数字之间。 |
| `?`           | 当此字符紧随任何其他限定符（*、+、?、{*n*}、{*n*,}、{*n*,*m*}）之后时，匹配模式是"非贪心的"。"非贪心的"模式匹配搜索到的、尽可能短的字符串，而默认的"贪心的"模式匹配搜索到的、尽可能长的字符串。例如，在字符串"oooo"中，"o+?"只匹配单个"o"，而"o+"匹配所有"o"。 |
| `.`           | 匹配除"\r\n"之外的任何单个字符。若要匹配包括"\r\n"在内的任意字符，请使用诸如"[\s\S]"之类的模式。 |
| `(pattern)`   | 匹配 *pattern* 并捕获该匹配的子表达式。可以使用 `$0…$9` 属性从结果"匹配"集合中检索捕获的匹配。若要匹配括号字符 ( )，请使用"`\(`"或者"`\)`"。 |
| `(?:pattern)` | 匹配 *pattern* 但不捕获该匹配的子表达式，即它是一个非捕获匹配，不存储供以后使用的匹配。这对于用"or"字符 (\|) 组合模式部件的情况很有用。例如，'industr(?:y\|ies) 是比 'industry\|industries' 更经济的表达式。 |
| `(?=pattern)` | 执行正向预测先行搜索的子表达式，该表达式匹配处于匹配 *pattern* 的字符串的起始点的字符串。它是一个非捕获匹配，即不能捕获供以后使用的匹配。例如，'Windows (?=95\|98\|NT\|2000)' 匹配"Windows 2000"中的"Windows"，但不匹配"Windows 3.1"中的"Windows"。预测先行不占用字符，即发生匹配后，下一匹配的搜索紧随上一匹配之后，而不是在组成预测先行的字符后。 |
| `(?!pattern)` | 执行反向预测先行搜索的子表达式，该表达式匹配不处于匹配 *pattern* 的字符串的起始点的搜索字符串。它是一个非捕获匹配，即不能捕获供以后使用的匹配。例如，'Windows (?!95\|98\|NT\|2000)' 匹配"Windows 3.1"中的 "Windows"，但不匹配"Windows 2000"中的"Windows"。预测先行不占用字符，即发生匹配后，下一匹配的搜索紧随上一匹配之后，而不是在组成预测先行的字符后。 |
| `x|y`         | 匹配 *x* 或 *y*。例如，'z\|food' 匹配"z"或"food"。'(z\|f)ood' 匹配"zood"或"food"。 |
| `[xyz]`       | 字符集。**匹配包含的任一字符**。例如，"[abc]"匹配"plain"中的"a"。 |
| `[^xyz]`      | 反向字符集。匹配未包含的任何字符。例如，"`[^abc]`"匹配"plain"中"p"，"l"，"i"，"n"。 |
| `[a-z]`       | 字符范围。匹配指定范围内的任何字符。例如，"[a-z]"匹配"a"到"z"范围内的任何小写字母。 |
| `[^a-z]`      | 反向范围字符。匹配不在指定的范围内的任何字符。例如，"`[^a-z]`"匹配任何不在"a"到"z"范围内的任何字符。 |
| `\b`          | 匹配一个字边界，即字与空格间的位置。例如，"er\b"匹配"never"中的"er"，但不匹配"verb"中的"er"。 |
| `\B`          | 非字边界匹配。"er\B"匹配"verb"中的"er"，但不匹配"never"中的"er"。 |
| `\cx`         | 匹配 *x* 指示的控制字符。例如，\cM 匹配 Control-M 或回车符。*x* 的值必须在 A-Z 或 a-z 之间。如果不是这样，则假定 c 就是"c"字符本身。 |
| `\d`          | 数字字符匹配。等效于 [0-9]。                                 |
| `\D`          | 非数字字符匹配。等效于 `[^0-9]`。                            |
| `\f`          | 换页符匹配。等效于 \x0c 和 \cL。                             |
| `\n`          | 换行符匹配。等效于 \x0a 和 \cJ。                             |
| `\r`          | 匹配一个回车符。等效于 \x0d 和 \cM。                         |
| `\s`          | 匹配任何空白字符，包括空格、制表符、换页符等。与 `[ \f\n\r\t\v]` 等效。 |
| `\S`          | 匹配任何非空白字符。与 `[^ \f\n\r\t\v]` 等效。               |
| `\t`          | 制表符匹配。与 \x09 和 \cI 等效。                            |
| `\v`          | 垂直制表符匹配。与 \x0b 和 \cK 等效。                        |
| `\w`          | 匹配任何字类字符，包括下划线。**与"[A-Za-z0-9_]"等效**。     |
| `\W`          | 与任何非单词字符匹配。与"`[^A-Za-z0-9_]`"等效。              |
| `\xn`         | 匹配 *n*，此处的 *n* 是一个十六进制转义码。十六进制转义码必须正好是两位数长。例如，"\x41"匹配"A"。"\x041"与"\x04"&"1"等效。允许在正则表达式中使用 ASCII 代码。 |
| `\num`        | 匹配 *num*，此处的 *num* 是一个正整数。到捕获匹配的反向引用。例如，"(.)\1"匹配两个连续的相同字符。 |
| `\n`          | 标识一个八进制转义码或反向引用。如果 \*n* 前面至少有 *n* 个捕获子表达式，那么 *n* 是反向引用。否则，如果 *n* 是八进制数 (0-7)，那么 *n*是八进制转义码。 |
| `\nm`         | 标识一个八进制转义码或反向引用。如果 \*nm* 前面至少有 *nm* 个捕获子表达式，那么 *nm* 是反向引用。如果 \*nm* 前面至少有 *n* 个捕获，则 *n* 是反向引用，后面跟有字符 *m*。如果两种前面的情况都不存在，则 \*nm* 匹配八进制值 *nm*，其中 *n* 和 *m* 是八进制数字 (0-7)。 |
| `\nml`        | 当 *n* 是八进制数 (0-3)，*m* 和 *l* 是八进制数 (0-7) 时，匹配八进制转义码 *nml*。 |
| `\un`         | 匹配 *n*，其中 *n* 是以四位十六进制数表示的 Unicode 字符。例如，\u00A9 匹配版权符号 (©)。 |





**正则表达式元字符：**

```
.^$*+?|(){}[]\-
```

这15个元字符在正则表达式中有特殊含义，用来编写匹配模式。比如`-`用来在`[]`中表示范围。

可以利用`\Q这里的任意字符都会被解释为普通字符\E`，来取消元字符的特殊含义；或者使用`\`转义单个元字符。





**字符组简写式：**

`\d`可以像`[0-9]`一样匹配任意阿拉伯数字；其中`\d`是`[0-9]`的简写。





**分组`()`：**

分组对文本加括号以帮助执行某种操作：

- 选择操作：**在两种或更多可选模式中选择一个**；比如：`(the|The|THE)`

- 子模式：子模式就是模式中的模式。多数情况下，子模式中的条件能 **得到匹配的前提** 是 ***前面的模式得到匹配***。

  示例：

  ```
  (t|T)h(e|eir)
  ```

  在上面的示例中，第二个子模式`(e|eri)`依赖于第一个子模式`(t|T)`

- 捕获一个分组以便之后进行后向引用。对于上一个示例中的每一个分组`()`，其内容会被捕获并临时存储于内存中，之后可以通过后向引用来使用该内容。在perl中可以使用`$1`来引用第一个捕获的分组；在Java中可以使用`group(index)`方法来获取某个捕获的分组。

- **对组合的模式使用某项操作**（如量词）

- 使用非捕获分组 `(?: )`。非捕获分组不会将其内容存储在内存，这样可以提高性能。比如你使用分组仅仅是为了进行选择操作，而不需要使用到捕获功能则可以使用非捕获分组。示例：`(?:the|The|THE)`

- 原子分组 `(?> )`；也是非捕获分组。



在Java代码中处理 **组(Groups)**：

组是用括号划分的正则表达式，可以根据组的编号来引用某个组。组号为0表示整个表达式，组号为1表示第一个被括号括起的组，依次类推。

```
A(B(C))D
```

上面示例中有三个组：group(0) 是 ABCD，group(1)是BC，group(2)是C。注意这里存在组的嵌套。

```java
// java中测试正则表达式的分组
static public final String POEM =
            "Twas brillig, and the slithy toves\n" +
                    "Did gyre and gimble in the wabe.\n" +
                    "All mimsy were the borogoves,\n" +
                    "And the mome raths outgrabe.\n\n" +
                    "Beware the Jabberwock, my son,\n" +
                    "The jaws that bite, the claws that catch.\n" +
                    "Beware the Jubjub bird, and shun\n" +
                    "The frumious Bandersnatch.";

    @Test
    public void test04(){
        //匹配每行的最后3个词，\\S 匹配任何非空白字符
        // (?m) 为模式标记 ，表示多行。因为默认只会匹配字符串中末尾的三个字段。
        Matcher matcher = Pattern.compile("(?m)(\\S+)\\s+((\\S+)\\s+(\\S+))$").matcher(POEM);
        //少用一个分组也行
        //Matcher matcher = Pattern.compile("(?m)(\\S+)\\s+(\\S+)\\s+(\\S+)$").matcher(POEM);

        int j = 1;
        // find()找到一个即返回。放在while中则还会进行下一次查找，直到结果为null。
        while (matcher.find()){
            System.out.println(" ");

            //返回上次 find() 匹配的字符串
            System.out.println("第" + j++ +"次find() ：【" + matcher.group() + "】");

            for (int i = 0; i <= matcher.groupCount(); i++) {
                System.out.println("group(" + i + ")：" + " [" + matcher.group(i) + "]");
            }
        }
    }

/* out
(?m)(\S+)\s+ ( (\S+)  \s+ (\S+) ) $

第1次find() ：【the slithy toves】
group(0)： [the slithy toves]
group(1)： [the]
group(2)： [slithy toves]
group(3)： [slithy]
group(4)： [toves]

... 略
*/
```










## 常用正则表达式



示例：

```
1. 用户名正则表达式模式
^[a-z0-9_-]{3,15}$
^                         # 行开始
  [a-z0-9_-]              # 匹配列表中的字符，a-z,0–9,下划线，连字符
            {3,15}        # 长度至少3个字符，最大长度为15
$                         # 行结束
2. 密码正则表达式模式
((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{6,20})
(                        # 组开始
    (?=.*\d)             # 必须包含一个数字 0-9
    (?=.*[a-z])          # 必须包含一个小写字符
    (?=.*[A-Z])          # 必须包含一个大写字符
    (?=.*[@#$%])         # 必须包含一个列表中的特殊字符"@#$%"
                .        # 检查所有字符串与前面的条件的匹配
                 {6,20}  # 长度至少为6个字符，最大长度为20
)                        # 组结束
3. 16进制颜色代码正则表达式模式
^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$
^                       # 行开始
 #                      #   必须包含一个"#"符号
  (                     #   组#1开始
   [A-Fa-f0-9]{6}       #     列表中的任意字符串,长度为6
   |                    #     ..或者
   [A-Fa-f0-9]{3}       #     列表中的任意字符串,长度为3
  )                     #   组#1结束
$                       # 行结束
4. Email 正则表达式模式
^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$
^                            # 行开始
  [_A-Za-z0-9-]+             #   必须以中括号中的字符为起始字符[],必须包含一个或多个(+)
  (                          #   组#1开始
    \\.[_A-Za-z0-9-]+        #     接下来是一个点"."和中括号内的字符[],必须包含一个或者多个(+)
  )*                         #   组#1结束, 这个组是可选的(*)
    @                        #     必须包含一个"@"符号
     [A-Za-z0-9]+            #       接下来是中括号内的字符[],必须包含一个或者多个(+)
      (                      #         组 #2开始 – 一级TLD检查
       \\.[A-Za-z0-9]+       #           接下来是一个点"."和中括号内的字符[],必须包含一个或者多个(+)
      )*                     #         组#2结束,这个组是可选的(*)
      (                      #         组#3开始 – 二级TLD检查
       \\.[A-Za-z]{2,}       #           接下来是一个点"."和中括号内的字符[], 最小长度为2
      )                      #         组#3结束
$                            # 行结束

```



这里来解释一下 “2.密码正则表达式模式”；









[java常用正则表达式模板 - CSDN博客](https://blog.csdn.net/zfszhangyuan/article/details/52451240 "java常用正则表达式模板 - CSDN博客") 这个比较准确。

[JAVA 正则表达式 （超详细） - CSDN博客](https://blog.csdn.net/allwefantasy/article/details/3136570 "JAVA 正则表达式 （超详细） - CSDN博客")

[Java 正则表达式 | 菜鸟教程](http://www.runoob.com/java/java-regular-expressions.html "Java 正则表达式 | 菜鸟教程")



