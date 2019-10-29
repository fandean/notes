#! /bin/bash

echo "备份home中必要的文件夹"

cd ~

basedir = "/home/fan/"

# 由于home空间较大，建议分类分别归档

# 坑人的选项顺序： f 选项必须放在最后，然后接文件名
 
# .AndroidStudio* 只保留一个版本

tar -cvpf homebackup.tar   Anki apktool .aria2 .asciinema .backup .bash_history .bashrc .bundle Desktop Documents .dia .eclipse .emacs .emacs.d .fbtermrc .filezilla .fonts .freemind FreeMind .gem .gemrc .Genymobile .gitconfig .git-credentials .gitignore_global .gnupg .goldendict  history.db .icons .java .m2 .mirror .mozilla .mplayer .my.cnf .mysql_history Pictures .profile .putty .sogouinput .sqlsecrets .sqlworkbench .squirrel-sql .ssh .sunpinyin .thumbnails .thunderbird  .tmux.conf .vim .viminfo .vimrc .vscode 

tar -cvpf android.tar .android  

tar -cvpf Android.tar  Android 

tar -cvpf AndroidStudio.tar .AndroidStudio*

tar -cvpf gradle.tar  .gradle

tar -cvpf workspace.tar workspace 

tar -cvpf ~/vbox/tmp/configbackup.tar ~/.config/ 

# .cache还是必须归档
 tar -cvfp ~/vbox/tmp/cachebackup.tar ~/.cache

# .tmux.conf .vim .viminfo .vimrc .vscode 
