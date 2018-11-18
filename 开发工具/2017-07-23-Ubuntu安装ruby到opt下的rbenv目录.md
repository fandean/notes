---
layout: post
title: "Ubuntu安装ruby到opt下的rbenv目录"
description: "Ubuntu安装ruby到opt下的rbenv目录"
date: 2017-07-23
tags: [开发工具,Linux,ruby]
category: 开发工具
last_updated: 2017-07-24
comments: true
chare: true
---

* Kramdown table of contents
{:toc .toc}




# Ubuntu安装ruby到/opt/rbenv

演示地址：[install rbenv to opt - asciinema](https://asciinema.org/a/kMtGVBPR8a0iecxPmmy2JK3ni "install rbenv to opt - asciinema")，由于网速问题，大部分时间浪费在下载和安装ruby的过程中，可以跳过此部分。

## 安装脚本

```shell
# 安装ruby环境
# 参考： 
# https://stackoverflow.com/questions/37720892/you-dont-have-write-permissions-for-the-var-lib-gems-2-3-0-directory
# https://github.com/rbenv/rbenv
# rbenv install and system wide install on Ubuntu to /opt/rbenv ： https://gist.github.com/slayer/1513911


sudo mkdir /opt/rbenv

# 此处需要更改：  用户名.组
# 查看用户名 : 
# whoami
# 查看用户所属组，(一般选择冒号后的一个)
# groups `whoami`
sudo chown fan.fan /opt/rbenv 

sudo apt-get update 


apt-get -y install build-essential
apt-get -y install git-core

# 如果安装有错误，可试一试先安装如下依赖
# sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

git clone https://github.com/rbenv/rbenv.git  /opt/rbenv

echo 'export RBENV_ROOT=/opt/rbenv' >> ~/.bashrc
echo 'export PATH="/opt/rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

git clone https://github.com/rbenv/ruby-build.git  /opt/rbenv/plugins/ruby-build
echo 'export PATH="/opt/rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
# exec $SHELL 


rbenv install 2.3.1
rbenv global 2.3.1
ruby -v

gem install bundler
rbenv rehash

# 更改源码镜像，使用bundle时国内下载速度更快
# bundle config mirror.https://rubygems.org https://ruby.taobao.org
```

## 参考

[rubygems - You don't have write permissions for the /var/lib/gems/2.3.0 directory - Stack Overflow](https://stackoverflow.com/questions/37720892/you-dont-have-write-permissions-for-the-var-lib-gems-2-3-0-directory "rubygems - You don't have write permissions for the /var/lib/gems/2.3.0 directory - Stack Overflow")    
[GitHub - rbenv/rbenv: Groom your app’s Ruby environment](https://github.com/rbenv/rbenv "GitHub - rbenv/rbenv: Groom your app’s Ruby environment")    
[rbenv install and system wide install on Ubuntu to /opt/rbenv · GitHub](https://gist.github.com/slayer/1513911 "rbenv install and system wide install on Ubuntu to /opt/rbenv · GitHub")   
