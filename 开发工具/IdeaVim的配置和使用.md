

## 切换Vim模拟器状态



这个插件允许设置一个快捷键一键开启或关闭，在切换模式时会同时自动切换keymap，十分方便。默认键位是Ctrl+Alt+V，但这个键位覆盖了很常用的“抽取局部变量”功能，建议重设，在setting->keymap中查找VIM Emulator即可。 



> 下面所说的两套keymap是指：
>
> - Idea默认的KeyMap ： Default keymap 
> - 开启IdeaVim时使用的 ： Vim keymap  （因为vim快捷键会和现有keymap有冲突，所以当启用ideavim后会自动切换到ideavim为你配置的keymap中）



由于开启和关闭状态分别使用两套keymap，因此两套都需要设定。可以把两套keymap下的都设为一样的键，也就是用同一个键切换。但个人建议设为不同的键，这样能清楚知道当前处于那种模式中。并且，如果在开启Vim的插入模式下关闭Vim模拟器，下次进入时仍然是插入模式，比较混乱（因为你关闭模拟器就是为了使用默认keymap输入大段代码，重新开启Vim模拟器就是为了使用普通模式下的命令）。因此建议把Vim keymap中的Exit Insert Mode设为与另一个keymap的Vim Emulator相同的键（也就是进入Vim模拟器的快捷键）。例如，我使用的设定是： 

- Default keymap -> Vim Emulator : Ctrl+;     (用Ctrl+分号开启Vim模拟器） 
- Vim keymap -> Vim Emulator : Ctrl+,    (用Ctrl+逗号关闭Vim模拟器） 
- Vim keymap -> Vim Emulator : Ctrl+;    (用Ctrl+分号退出插入模式，进入普通模式）


这样，在任何时候只要连按两下`ctrl+;`分号，就能保证必定在Vim模拟器的普通模式中。   



**修改快捷键的实际操作：**

settings > Keymap > Default 中 搜索（按） `Ctrl+Alt+V`； 更改掉 Vim Emulator对应的  `Ctrl+Alt+V` 为 `ctrl + ;`

然后再展开 Plug-ins 找到 Idea Vim 。。。

发现无法按照作者的方式进行修改；所以这里我就只是将其更改为`ctrl + ;`



>  针对“1. 切换Vim模拟器状态 ”这一章节说说我的理解，您看对不对：
>
> 如果我当前的keymaps为Eclipse，然后我启用了Vim模拟器，那么我当前的keymaps变为Vim，这时如果我关闭Vim模拟器，我的keymaps又自动变为Eclipse。
>
> 对么？  
>
> 是的，关闭Vim模拟器时会自动返回到进入Vim模式前的keymaps





- [IdeaVim插件使用技巧 - - ITeye博客 ](http://kidneyball.iteye.com/blog/1828427 "IdeaVim插件使用技巧 - - ITeye博客") 更多使用技巧见这里。
- [IdeaVim 进阶配置 - 简书](https://www.jianshu.com/p/ddd56ceeb83d "IdeaVim 进阶配置 - 简书")