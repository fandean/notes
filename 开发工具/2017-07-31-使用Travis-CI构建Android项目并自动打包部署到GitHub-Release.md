---
layout: post
title: "使用Travis-CI构建Android项目并自动打包部署到GitHub-Release"
description: "使用Travis-CI构建Android项目并自动打包部署到GitHub-Release"
date: 2017-07-31
tags: [CI,Android]
category: CI
last_updated: 2017-08-01
comments: true
chare: true
---

* Kramdown table of contents
{:toc .toc}




## CI 

 CI (Continuous Integration,持续集成),CI 是 XP(Extreme Programming,极限编程)的实践之一。近年来
人们普遍使用 Jenkins 等软件来实现这一目的。

让 CI 软件监视仓库,可以在开发者发送提交后立刻执行**自动测试**或**构建**。通过持续执行这样一个操作,**可以检测出**开发者意外发送的提交或无意的逻辑偏差,让代码保持在一定质量以上。

在现代的软件开发中持续集成已经不可或缺,甚至逐渐成为开发中的常识。在开源世界中也是同样。

常见的CI有：　Travis CI 、 Jenkins 、Circle CI


## 基于Travis CI的Android自动发布流程

Travis CI对Github上的开源Repo是免费的，私有Repo收费。

可以将表示Travis CI的执行结果的图片嵌入到markdown中 [![Build Status](https://travis-ci.org/FanDean/fizzbuzz.svg)](https://travis-ci.org/FanDean/fizzbuzz)，这个图片在很多GitHub上的项目中都有见到。

Travis CI使用YAML文件作为构建脚本。


这里我们利用Travis CI来自动根据我们打的Git Tag来构建APK并Push到自己的Github Release上（也可设置分发到fir.im）。


使GitHub帐号登录Travis CI；点击右上将脚的头像，点击"Sync account"按钮，然后打开对自己项目的Hook开关；最后在对应的项目中添加`.travis.yml`文件来配置 Travis CI即可。


> 使用Travis CI时，刚开始一直无法发现仓库里面的其它分支；后来再仓库页面 setting -> Integrations & services -> ... -> Test serviece ；对其进行测试后，Travis CI才有反映。


### Android项目对应的 .travis.yml 文件

下面是一个最基本的Android项目下的 .travis.yml 文件

```yml
# .travis.yml 文件

# 声明构建语言环境
language: android
android:		# 配置信息
  components:
    # 你可能需要修改下面两项的版本
    - build-tools-25.0.0
    - android-25
	  # Android Support Repository
    - extra-android-m2repository
	  # Support Library
    - extra-android-support
script:
  # 生成 APK
  - ./gradlew assembleRelease

# 部署
deploy:
  # 部署到GitHub Release。
  # 除此之外，Travis CI还支持发布到fir.im、AWS、Google App Engine等
  provider: releases
  # Github oauth token
  api_key: "GITHUB OAUTH TOKEN"
  # 部署文件路径；对于Android就部署生成的 apk 文件
  file: "FILE TO UPLOAD"
  # 避免 Travis CI在部署之前清空生成的APK文件
  skip_cleanup: true
  # 发布时机
  on:
    # tags设置为true表示只有在有tag的情况下才部署
    tags: true
```

先来测试上面的文件。 创建一个简单的Android工程进行测试；在工程的根目录添加 上述 .travis.yml 文件。

根据实际情况修改文件中相关内容，这里修改`file: app-release-unsigned.apk`；还有api_key就参考下文 "[方法一：将GitHub的token设置为环境变量](#方法一：将GitHub的token设置为环境变量)"



然后测试 Travis CI服务： 
```
GitHub对应仓库页面 setting -> Integrations & services -> ... -> Test serviece 
```


这里生成的 `app-release-unsigned.apk` 并没有进行过签名。


> 一份示例文件： [android_Travis_CI_Test/travis.yml.1.bak](https://github.com/FanDean/android_Travis_CI_Test/blob/master/travis.yml.1.bak)   
> Travis CI中有这样一句提示： Please note that deploying GitHub Releases works only for tags, not for branches.   
> 在这里可以检测你的`.travis.yml`有没有基本的语法错误： [Validate your .travis.yml file](http://lint.travis-ci.org/ "Validate your .travis.yml file")


### 遇到的问题

错误1： 
```
Error: Could not find or load main class org.gradle.wrapper.GradleWrapperMain
```
原因：推送到GitHub中的Android项目中没有： `gradle/wrapper/gradle-wrapper.jar` 文件(被.gitignore_global忽略了)。




错误2：
```
FAILURE: Build failed with an exception.
* What went wrong:
A problem occurred configuring project ':app'.
> You have not accepted the license agreements of the following SDK components:
  [ConstraintLayout for Android 1.0.2, Solver for ConstraintLayout 1.0.2].
  Before building your project, you need to accept the license agreements and complete the installation of the missing components using the Android Studio SDK Manager.
```

如果使用了ConstraintLayout则会出现错误2。
上面的意思是：您尚未接受以下SDK组件的许可协议：[ConstraintLayout for Android 1.0.2，Solver for ConstraintLayout 1.0.2]。在构建项目之前，您需要接受许可协议，并使用Android Studio SDK Manager完成缺少组件的安装。

解决办法在文件中添加如下内容：  
```
before_install:
  - mkdir "$ANDROID_HOME/licenses" || true
  - echo -e "\n8933bad161af4178b1185d1a37fbf41ea5269c55" > "$ANDROID_HOME/licenses/android-sdk-license"
  - echo -e "\n84831b9409646a918e30573bab4c9c91346d8abd" > "$ANDROID_HOME/licenses/android-sdk-preview-license"
```

> [Accept ConstraintLayout licenses · Issue #6617 · travis-ci/travis-ci](https://github.com/travis-ci/travis-ci/issues/6617 "Accept ConstraintLayout licenses · Issue #6617 · travis-ci/travis-ci")   
[android - Travis CI failed because cannot accept license Constrain Layout - Stack Overflow](https://stackoverflow.com/questions/42731625/travis-ci-failed-because-cannot-accept-license-constrain-layout "android - Travis CI failed because cannot accept license Constrain Layout - Stack Overflow")  




错误3: 
```
Dpl does not have permission to upload assets. Make sure your token contains the repo or public_repo scope.
dpl.2
Preparing deploy
failed to deploy
```
之前误以为 `public access`就是`public_repo`；回到 GitHub页面修改token的访问权限，添加 `public_repo` scope 然后更新。



错误4：
```
/home/travis/.rvm/gems/ruby-2.2.7/gems/octokit-4.6.2/lib/octokit/client/releases.rb:86:in `initialize': No such file or directory @ rb_sysopen - app/build/outputs/apk/app-release.apk (Errno::ENOENT)

/home/travis/.rvm/gems/ruby-2.2.7/gems/octokit-4.6.2/lib/octokit/client/releases.rb:86:in `initialize': No such file or directory @ rb_sysopen - app/build/outputs/apk/app-debug.apk (Errno::ENOENT)
```
   
在部署前使用ls命令查看`app/build/outputs/apk/`路径下的文件。添加如下语句：

```yml
before_deploy:
  - ls app/build/outputs/apk/
```
Log输出：
```yml
$ ls app/build/outputs/apk/
app-release-unsigned.apk
```

解决方法： 


### 为构建添加缓存

构建速度好慢，尝试添加缓存： 

```yml
before_cache:
 - rm -f $HOME/.gradle/caches/modules-2/modules-2.lock
 - rm -fr $HOME/.gradle/caches/*/plugin-resolution/

cache:
 directories:
 - $HOME/.gradle/caches/
 - $HOME/.gradle/wrapper/
```

手动清楚缓存：

![](https://faner.gitlab.io/assets/images/post-images/2017-07-31-delete-travis-ci-cache.png)



> 参考：[Caching Dependencies and Directories - Travis CI](https://docs.travis-ci.com/user/caching/ "Caching Dependencies and Directories - Travis CI") ，




### 加密自动化构建中使用到的密码和token


自动化构建中需要用到密码和证书，我们必须保证的安全性。为此Travis CI为此提供了2种解决方案：

- 一种是对敏感信息、密码、证书、token等进行对称加密，在CI构建环境时解密
- 另一种是将密码等通过Travis CI的控制台（即网站）设置为构建时的环境变量。


### 获取GitHub的认证

将apk部署到GitHub Release需要向Github传送文件，就需要获得GitHub的相关认证。

获取认证的方法：

- 可以是在配置文件`.travis.yml`中使用明文密码。极不安全。
- 或使用 Github Personal Access Token 进行验证。下面介绍。


### 创建 Github Personal Access Token

在Github -> settings -> Personal access token 生成一个勾选了`public_repo scope`的Github Personal Access Token。

> 生成 token:  [Github auth token on TravisCI](https://blog.wyrihaximus.net/2015/09/github-auth-token-on-travis/)  
[Creating a personal access token for the command line - User Documentation](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/ "Creating a personal access token for the command line - User Documentation")

生成了Github Personal Access Token后我们就将其应用到 `.travis.yml`中。



### 应用Github Personal Access Token的两种方法

#### 方法一：将GitHub的token设置为环境变量

![](https://faner.gitlab.io/assets/images/post-images/2017-07-31-delete-travis-ci-cache.png)

- 在Travis CI网站中对应的项目页面，点击"More options"然后选择上图中的 setting 。  
- 在“Environment Variables”下添加环境变量：这里我添加 "GH_TOKEN"变量名称，值就复制你之前生成的token，并确保"Display value in build log" 为"OFF"状态。

然后在`.travis.yml`文件中这样使用该环境变量：
```yml
api_key:
    secure: ${GH_TOKEN}
```


> Github Personal Access Token在第一次复制后就会自动隐藏，无法再次查看；如果忘记了token就只有重新生成 token。



#### 方法二：在本地安装travis并使用travis的相关命令对token进行加密

token可以重复使用，但是对于特定的仓库必须重新运行上面的命令进行加密并指定仓库。

- 安装ruby。可参考：[Ubuntu安装ruby到opt下的rbenv目录](https://fandean.github.io/blog/2017/07/23/Ubuntu%E5%AE%89%E8%A3%85ruby%E5%88%B0opt%E4%B8%8B%E7%9A%84rbenv%E7%9B%AE%E5%BD%95/ "Ubuntu安装ruby到opt下的rbenv目录")
- 查询最新的Travis CI的版本： `gem search travis`。我这里是 travis (1.8.8)
- 安装该版本的travis: `gem install travis -v 1.8.8 --no-rdoc --no-ri`
- 查看是否安装完成： `travis --version`，然后会提示你“shellcompletion not installed ...” shell补全没有安装是否需要安装，输入 y。重新打开终端即可对该命令使用tab补全。
- 如果首次运行，travis会提示需要登录，可以通过运行`travis login`并输入Github用户名密码即可。或者如果你不想输入密码，使用`travis login --github-token <之前生成的github-token>`也可进行登录。
- 更简单一点的是直接使用`travis encrypt <之前生成的token> -r <owner>/<repo>`其中 `-r`用于指定仓库。然后有根据命令输出添加相关信息到`.travis.yml`文件。示例：
  ```yml
  deploy:
  api_key:
    secure: "XR0ZYSp+eWOhHwO0az80nEZoOOyaOIeV7brTekEdl7APUfPziQHrV4G/xPxPZB2Fcn13efyiwpPbmXpSVkIqJJZg2Ok/efBviUIwgl5pqGrddgXEskW8+lebHJA/17JjmXoo2ZT9BcmMlVrT0Dj5WCJXH2QOSAXzVy/9DO7e3pEijAImCHgh0oH/hQzlO86IMBn3Fzlb520bplEI4fnuJNU/nKZrl05dTRCso2ZB2/MXt1X5vfYm4zrwjTgZXOpfSVur6kv/EMNQFDiGLa3F22m1FDQULDfHY7evT79hYlcRKVGx7hoQRrOxXr0Ag6wcb+4buvwaxutNPjaEXkH3FfocrIGxZtox1kE19ebqjc6fT/CH85Lf+AqT2rR86Wr5aaEQcKAxNZxUJtir5MAIo0j7vkx1PUi0MCb9K6JHca9lkFsoYP1L0pjDztD8w4J15rv5TCV/JjMxhCGQkGwDH+M3Z7dQOgikoRaO11o6C5/fC8qfCeGKT3GzL9966dy0UY9ZDQbB7y3donlWgoTZHn6xahGNlP4CYiP6Ax94egDmbSmyiJud5Y0NmwXMY0IEuJPWEFkmBdGEbZuqqsL3mxqxebox7q7gz613ToZSsfbNhKw3ouETftjXoMnlfRFIl7LSAOwAtL5Wig5zlwCMafGTFaGpLH0zl02Udjy3UbU="
  ```
- 或者使用命令`travis encrypt GITHUB_TOKEN=<之前生成的token>  -r <owner>/<repo>`,**加密环境变量GITHUB_TOKEN**。其中 `-r`用于指定仓库。这里解密之后得到`GITHUB_TOKEN=<之前生成的token>`而并非`<之前生成的token>`。


对于加密环境变量`GITHUB_TOKEN`的形式，需这样使用：
```yml
env:
  global:
    secure: "XR0ZYSp+eWOhHwO0az80nEZoOOyaOIeV7brTekEdl7APUfPziQHrV4G/xPxPZB2Fcn13efyiwpPbmXpSVkIqJJZg2Ok/efBviUIwgl5pqGrddgXEskW8+lebHJA/17JjmXoo2ZT9BcmMlVrT0Dj5WCJXH2QOSAXzVy/9DO7e3pEijAImCHgh0oH/hQzlO86IMBn3Fzlb520bplEI4fnuJNU/nKZrl05dTRCso2ZB2/MXt1X5vfYm4zrwjTgZXOpfSVur6kv/EMNQFDiGLa3F22m1FDQULDfHY7evT79hYlcRKVGx7hoQRrOxXr0Ag6wcb+4buvwaxutNPjaEXkH3FfocrIGxZtox1kE19ebqjc6fT/CH85Lf+AqT2rR86Wr5aaEQcKAxNZxUJtir5MAIo0j7vkx1PUi0MCb9K6JHca9lkFsoYP1L0pjDztD8w4J15rv5TCV/JjMxhCGQkGwDH+M3Z7dQOgikoRaO11o6C5/fC8qfCeGKT3GzL9966dy0UY9ZDQbB7y3donlWgoTZHn6xahGNlP4CYiP6Ax94egDmbSmyiJud5Y0NmwXMY0IEuJPWEFkmBdGEbZuqqsL3mxqxebox7q7gz613ToZSsfbNhKw3ouETftjXoMnlfRFIl7LSAOwAtL5Wig5zlwCMafGTFaGpLH0zl02Udjy3UbU="

deploy:
  api_key:
    secure: ${GITHUB_TOKEN}
```


> 这里可以对 `secure: 字串`的作用做一个猜测： Travis读取到 secure 时便会解密该字串，并将解密后得到的值替换 secure 这行内容。比如如果加密的是 `变量=值`，那么当其出现在上文的 `global: ` 时，就是定义了一个全局的环境变量，然后就可在后面使用该变量。


- 另外还可以直接使用 `travis setup releases`命令： 
[GitHub Releases Uploading - Travis CI](https://docs.travis-ci.com/user/deployment/releases/ "GitHub Releases Uploading - Travis CI")。    




> 可以使用 `travis help encrypt`查看命令帮助；  
使用 `travis repos`列出所有仓库；参考：[travis-ci/travis.rb: Travis CI Client (CLI and Ruby library)](https://github.com/travis-ci/travis.rb#repos "travis-ci/travis.rb: Travis CI Client (CLI and Ruby library)")  

> [Travis CI's use of GitHub API Scopes - Travis CI](https://docs.travis-ci.com/user/github-oauth-scopes/ "Travis CI's use of GitHub API Scopes - Travis CI")   



### 加密签名apk时使用到的密码和keystore文件（方式一）

> 事先创建好key和keystore文件。 这里我把keystore文件的后缀名变为了.keystore，大家使用的都是 .jks

1、 加密keystore文件`my.keystore`:  `travis encrypt-file my.keystore -r FanDean/android_Travis_CI_Test`。根据命令输出的提示，将加密后的keystore文件 my.keystore.enc 放入Android工程的根目录；并在 `.travis.yml` 文件中添加如下内容：    
  
```yml
before_install:
  - openssl aes-256-cbc -K $encrypted_f6c9a5f058a8_key -iv $encrypted_f6c6a5f053a8_iv -in my.keystore.enc -out my.keystore -d
```
  
2、 加密keystore password 、 key password 和 keyAlias。方法和加密 GitHub Token 一样；也可使用添加环境变量的方式。

这里我们准备下面三个环境变量，并通过在travis网站添加环境变量的形式进行添加：   

- KEYSTORE_PWD 
- KEY_PWD
- KEY_ALIAS

具体添加方式略（后面我们使用另外一种方法）。

`.travis.yml` 文件中添加如下内容对apk进行签名： 
```yml
before_deploy:
- cp $TRAVIS_BUILD_DIR/.keystore $HOME
# 记住这里已经将当前工作目录切换到 apk 下
- cd app/build/outputs/apk/
# Signing 签名
- jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore $HOME/my.keystore -storepass $KEYSTORE_PWD -keypass $KEY_PWD app/build/outputs/apk/app-release-unsigned.apk $KEY_ALIAS

# Verification 验证您的 APK 是否已签署
- jarsigner -verify app-release-unsigned.apk
- "${ANDROID_HOME}/build-tools/24.0.2/zipalign -v 4 app-release-unsigned.apk app-release.apk"
```

`jarsigner` - JAR **Signing** and **Verification** Tool；也可以用来对apk进行签名。

看起来比较麻烦。


### 加密签名apk时使用到的密码和keystore文件（方式二）

**参考下面的文章，我们可以使用一种新的方式：**

- [保护您的密钥 - 签署您的应用](https://developer.android.com/studio/publish/app-signing.html#secure-key "签署您的应用")   
- [构建未签署 APK 并手动签署它 - 签署您的应用](https://developer.android.com/studio/publish/app-signing.html#signing-manually "签署您的应用 - Android Studio")    
- [基于Travis CI搭建Android自动打包发布工作流（支持Github Release及fir.im）](http://avnpc.com/pages/android-auto-deploy-workflow-on-travis-ci "基于Travis CI搭建Android自动打包发布工作流（支持Github Release及fir.im）")    
- [android - Sign APK without putting keystore info in build.gradle - Stack Overflow](https://stackoverflow.com/questions/20562189/sign-apk-without-putting-keystore-info-in-build-gradle "android - Sign APK without putting keystore info in build.gradle - Stack Overflow")


#### 创建并加密 keystore.properties 文件

在Android项目根目录创建 `keystore.properties`文件保存keyPwd等变量。

```ini
storePwd=***
keyPwd=***
keyAlias=test_key
storeFileLocal=/home/fan/.android/my_keystore/my.keystore
storeFileCI=../my.keystore
```

同样加密 `keystore.properties` 文件： `travis encrypt-file keystore.properties  -r FanDean/android_Travis_CI_Test`
同样添加 "openssl aes-256-cbc -K $encrypted_ad23ea9b533c_key -iv $encrypted_ad23ca6e583c_iv -in keystore.properties.enc -out keystore.properties -d" 到 before_install 下面。


#### 修改app/build.gradle 文件

然后在 app/build.gradle 文件中添加如下内容，用于保护您的密钥和判断当前是在本地还是在 CI服务器： 

```java
// Create a variable called keystorePropertiesFile, and initialize it to your
// keystore.properties file, in the rootProject folder.
def keystorePropertiesFile = rootProject.file("keystore.properties")

// Initialize a new Properties() object called keystoreProperties.
def keystoreProperties = new Properties()

// Load your keystore.properties file into the keystoreProperties object.
keystoreProperties.load(new FileInputStream(keystorePropertiesFile))

def keyStoreFile = file(keystoreProperties['storeFileLocal'])

// 判断是位于本地还是CI服务器
if (!keyStoreFile.exists()){
	keyStoreFile = file(keystoreProperties['storeFileCI'])
}

android {
    signingConfigs {
        release {
            keyAlias keystoreProperties['keyAlias']
            keyPassword keystoreProperties['keyPwd']
            storeFile keyStoreFile
            storePassword keystoreProperties['storePwd']
        }
    }

  ...

    buildTypes {
        release {
            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
            signingConfig signingConfigs.release
        }
    }

  ...
```

#### 忽略 keystore.properties文件

在 .gitignore_global 文件中添加： 
```
keystore.properties
```

> 示例文件： [android_Travis_CI_Test/.travis.yml](https://github.com/FanDean/android_Travis_CI_Test/blob/master/.travis.yml "android_Travis_CI_Test/.travis.yml")


## 一些配置

```yml
script: ./gradlew testRelease assembleRelease

script:
- "./gradlew clean build connectedCheck -PdisablePreDex --stacktrace"
```


[Travis Config · kawa89/Testing Wiki](https://github.com/kawa89/Testing/wiki/Travis-Config "Travis Config · kawa89/Testing Wiki")
```shell
script:
  - ./travis/test.sh

./gradlew clean testDebugUnitTest
./gradlew connectedAndroidTest --info
./gradlew clean assembleDebug
```

[GoIV/.travis.yml at master · farkam135/GoIV](https://github.com/farkam135/GoIV/blob/master/.travis.yml "GoIV/.travis.yml at master · farkam135/GoIV")
```yml
script:
   - ./gradlew assembleDebug testOnlineDebugUnitTest testOfflineDebugUnitTest checkstyle
```

> 查找`android .travis.yml` 的相关配置，可尝试在GitHub中搜索 "android travis"然后选择查看 issues 和 wiki 。


## 参考： 

- [Customizing the Build - Travis CI](https://docs.travis-ci.com/user/customizing-the-build/ "Customizing the Build - Travis CI")
* [Building an Android Project - Travis CI](https://docs.travis-ci.com/user/languages/android/ "Building an Android Project - Travis CI")   
* [GitHub-Android持续集成 - skyJC](http://www.jincanshen.com/2016/09/03/GitHub-Android%E6%8C%81%E7%BB%AD%E9%9B%86%E6%88%90/)   
* [用Travis CI给Android项目部署Github Release · Kesco Lin](http://kescoode.com/travis-ci-android-github-release/)   
* [基于Travis CI搭建Android自动打包发布工作流（支持Github Release及fir.im）](http://avnpc.com/pages/android-auto-deploy-workflow-on-travis-ci)   
* [Travis CI Android example – Matti – Medium](https://medium.com/@harmittaa/travis-ci-android-example-357f6e632fc4 "Travis CI Android example – Matti – Medium")  完整示例，并且提供了对应的 GitHub 示例。推荐。  
* [Adding GitHub token to Travis CI configuration](http://blog.code4hire.com/2016/06/Adding-GitHub-token-to-Travis-CI-configuration/ "Adding GitHub token to Travis CI configuration")  
[Github auth token on TravisCI — Cees-Jan Kiewiet's blog](https://blog.wyrihaximus.net/2015/09/github-auth-token-on-travis/ "Github auth token on TravisCI — Cees-Jan Kiewiet's blog")  
* [Environment Variables - Travis CI](https://docs.travis-ci.com/user/environment-variables/ "Environment Variables - Travis CI")

> Jenkins学习资料 [Jenkins Overview](https://www.tutorialspoint.com/jenkins/jenkins_overview.htm "Jenkins Overview")
