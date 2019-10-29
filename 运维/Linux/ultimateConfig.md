终极配置
=============================


两者的配置见 github 中的 readme.md , 不在这啰嗦了！  


1. Ultimate Vim Config  
-----------------------------------

**spf13-vim**   是vim的终极配置   

网站：  http://spf13.com/post/ultimate-vim-config  
GitHub : https://github.com/spf13/spf13-vim  

###安装 

依赖：  
1. vim 
2. curl 
3. git 

安装命令：   
curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh  





shell终极配置
-------------------------------------

名称： oh-my-zsh
使用的是： zsh 
GitHub ： https://github.com/robbyrussell/oh-my-zsh  

依赖： 
git 

###下载安装:  
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"   



###配置文件:  
~/.zshrc  

###Getting Updates 更新：  
配置文件中写入
自动更新：		`DISABLE_UPDATE_PROMPT=true`
不自动更新：	`DISABLE_AUTO_UPDATE=true` 





###更改默认shell  

chsh -s /bin/zsh  


### Uninstalling Oh My Zsh  
输入：   
`uninstall_oh_my_zsh`  


###Themes 主题
在文件 .zshrc 中设置
如： 
ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"
ZSH_THEME="random"
