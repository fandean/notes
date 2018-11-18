

# 在IDEA中使用Docker

1. 在系统上安装Docker
2. 为idea安装Docker integration plugin
3. 配置Docker： `Setting > General >勾选 "Expose daemon on tcp://localhost:2375 without TLS"` （作用：将docker与本地的连接设置为不需要TLS加密）
4. 配置idea：`Setting >Build,Execution,Deployment > Docker > 点击+ > Connect to Docker deamon with:处选择 TCP socket > 使用默认的url ` 之后在界面中就会看到 "Connetion successful" 字样。



> 强烈推荐：[如何使用windows版Docker并在IntelliJ IDEA使用Docker运行Spring Cloud项目 - 嘿123 - 博客园](https://www.cnblogs.com/hei12138/p/ideausedocker.html "如何使用windows版Docker并在IntelliJ IDEA使用Docker运行Spring Cloud项目 - 嘿123 - 博客园")



## Docker integration plugin

[Docker - Help | IntelliJ IDEA](https://www.jetbrains.com/help/idea/docker.html "Docker - Help | IntelliJ IDEA")







## 运行应用服务器的Docker image

- 方式一：在Dockerfile中运行，只需在Dockerfile中添加类似的如下内容:

  ```dockerfile
  FROM tomcat:latest
  ```

  然后点击左侧的 `>>` 再选择 “Run on Docker”，

- 方式二：通过Docker插件，选择一个image，然后创建并运行容器。





## 在容器中部署Web应用程序



您可以通过将工件文件夹映射到应用服务器部署文件夹来部署您的Web应用程序，您也可以通过将工件复制到部署文件夹来部署您的应用程序。

创建一个新的绑定，在打开的对话框中，指定：
- 容器路径。 服务器部署文件夹的路径，例如：/usr/local/tomcat/webappsTomcat。
- 主机路径：对于WAR工件，指向工件输出目录的路径；对于分解的WAR工件，指向包含工件输出目录的目录的路径。



通过将工件复制到服务器部署文件夹来部署应用程序：

- 确保您的工件与您的工具位于同一个目录中，例如，Dockerfile。

- 在你的Dockerfile，在`FROM <app_server_image_name>:<tag>`后，例如，`FROM tomcat:latest`，添加以下内容：

  - 对于分解的工件： 

  `COPY . </server/deployment/path>`，例如，`COPY . /usr/local/tomcat/webappsTomcat`。

  - 对于WAR工件： 

  `COPY <artifactname>.war </server/deployment/path>`

- 单击  并选择“运行`'<ConfigurationName>'（Run '<ConfigurationName>'）`”。



然后，将容器http端口映射到主机端口，以便通过浏览器访问。过程如下： 

1. 尽管http服务器端口通常是8080，但请确保情况如下：在Docker工具窗口中，右键单击您的应用服务器容器，然后选择Inspect。搜索检查结果（Ctrl+F）ExposedPorts，以查看正在使用哪个端口。
2. 使主机上的容器http端口可用：选择“端口绑定（Port Bindings）”选项卡。您可以选择自己指定主机端口，或者让Docker决定应该使用哪个端口。所以，请执行以下操作之一：
   - 点击 ![img](https://7n.w3cschool.cn/attachments/image/20180623/1529722852163146.png)并指定映射。要使端口只能从本地主机访问，请为主机IP指定localhost或127.0.0.1。为了使端口可以从网络上的其他计算机访问，请指定0.0.0.0。要应用更改，请单击“保存（Save）”。
   - 选择“发布所有端口（Publish all ports）”复选框，然后单击“保存（Save）”。
     现在，您需要找出哪个主机端口映射到了容器http端口。为此，请运行容器的“检查（Inspect）”命令。然后在检查结果（Ctrl+F）中搜索NetworkSettings。该"Ports"小节将包含有关您的http主机端口的信息。



在Web浏览器中检查应用程序输出: 

要查看应用程序输出，请打开Web浏览器并转至：

- 如果您使用Docker for Windows，macOS或Linux：`http://localhost:<host-port>/<artifact-name>/`。
- 如果您使用Docker Toolbox for Windows或MacOS（不建议使用）：`http://192.168.99.100:<host-port>/<artifact-name>/`。

`<host-port>`是映射到容器的http端口上的主机端口。如果将应用程序部署为WAR，则`<artifact-name>`默认为该.war文件的名称，如果将应用程序部署为目录结构，则为该应用程序根目录的名称。







>  [在IntelliJ IDEA编辑器中选择文本_w3cschool](https://www.w3cschool.cn/intellij_idea_doc/intellij_idea_doc-xizl2ru3.html "在IntelliJ IDEA编辑器中选择文本_w3cschool")





测试：

创建一个java web项目（Maven项目），添加一个简单的 servlet，输出一句话即可，添加 index.html，然后点击 `Build > Build Artifacts`  生成 fan*.war文件，  在 target 中创建一个 Dockerfile，内容如下：

```dockerfile
FROM tomcat:8.5.32
COPY fan*.war $CATALINA_HOME/webapps/fan-webapp.war
```

点击FROM 前的  `>>`   Run 。。。

配置 端口绑定（Port Bindings） ，在浏览器中访问。





## 升级Idea后docker integration不兼容

升级后发现 docker integration 插件标识为红色，有下面的提示：

```
plugin is incompatible IntelliJ IDEA installation
```



[plugins.jetbrains.com](https://plugins.jetbrains.com/plugin/7724-docker-integration "plugins.jetbrains.com")



此次不兼容的插件有：

```
.ignore
Docker Integration
LiveEdit
Material Theme UI
NodeJS
```







> [IntelliJ IDEA中Docker使用 - CSDN博客](https://blog.csdn.net/lovelife527386108/article/details/51697081 "IntelliJ IDEA中Docker使用 - CSDN博客")
>
> [IDEA中配置及使用Docker - CSDN博客](https://blog.csdn.net/jacksonary/article/details/78974344 "IDEA中配置及使用Docker - CSDN博客")  * 







## Docker + Maven

[Using Docker from Maven and Maven from Docker](https://codefresh.io/howtos/using-docker-maven-maven-docker/ "Using Docker from Maven and Maven from Docker") 必须先看此文



> 尽管容器已经改变了应用程序打包和部署到云的方式，但它们并不总是使本地开发更容易。特别是对于Java开发人员（标准化的打包格式已经存在于表单或WAR和EAR文件中），Docker似乎乍一看另一层抽象，使本地开发变得更加困难。
>
> 确实，Docker的一些优势对Java开发人员来说并不那么令人印象深刻，但这并不意味着使用Docker开发Java应用程序必然是一个复杂的过程。实际上，在Java应用程序中使用Docker可以非常透明，因为Docker打包步骤可以轻松添加为构建过程中的额外步骤。



- spotify/docker-maven-plugin 已经去维护 spotify/dockerfile-maven

- fabric8io/docker-maven-plugin

maven 的各种 docker 插件，大概可以方便的执行下面的命令，如果其它功能相对较弱，可以直接利用 idea 的docker 插件即可 完成相应功能。

```
docker:start
```

Create and start containers

```
docker:stop
```

Stop and destroy containers

```
docker:build
```

Build images

```
docker:push
```

Push images to a registry

```
docker:remove
```

Remove images from local docker host

```
docker:logs
```

Show container logs





### **jib-maven-plugin**

Jib - Containerize your Maven project

[jib/jib-maven-plugin at master · GoogleContainerTools/jib](https://github.com/GoogleContainerTools/jib/tree/master/jib-maven-plugin "jib/jib-maven-plugin at master · GoogleContainerTools/jib")



Jib是一个快速而简单的容器镜像构建工具，它负责处理将应用程序打包到容器镜像中所需的所有步骤。它不需要你编写 Dockerfile或安装 Docker，而且可以直接集成到 Maven和 Gradle中 — 只需要将插件添加到构建中，就可以立即将 Java应用程序容器化。

docker_build_flow：

![docker_build_flow](assets/docker_build_flow.png)



jib_build_flow： 

![jib_build_flow](assets/jib_build_flow.png)



[Meet Jib: Containerizing a Java application has never been easier - JAXenter](https://jaxenter.com/jib-java-containerization-146647.html "Meet Jib: Containerizing a Java application has never been easier - JAXenter")

[Google Cloud Platform Blog: Introducing Jib — build Java Docker images better](https://cloudplatform.googleblog.com/2018/07/introducing-jib-build-java-docker-images-better.html "Google Cloud Platform Blog: Introducing Jib — build Java Docker images better")



The goals behind Jib’s creation are threefold:

- **Be fast** – Deploy your changes fast. Jib separates your application into multiple layers, splitting dependencies from classes. Now you don’t have to wait for Docker to rebuild your entire Java application – just deploy the layers that changed.
- **Be reproducible** – Rebuilding your container image with the same contents always generates the same image. Never trigger an unnecessary update again.
- **Be daemonless** – Reduce your CLI dependencies. Build your Docker image from within Maven or Gradle and push to any registry of your choice. No more writing Dockerfiles and calling docker build/push.



Jib创作背后的目标有三个：

-  快速 - 快速部署您的更改。 Jib将您的应用程序分成多个层，从类中分离依赖项。现在您不必等待Docker重建整个Java应用程序 - 只需部署更改的层即可。 
-  可重复 - 使用相同内容重建容器图像始终生成相同的图像。切勿再次触发不必要的更新。 
-  无守护 - 减少CLI依赖性。从Maven或Gradle中构建Docker镜像，然后推送到您选择的任何注册表。不再编写Dockerfiles并调用docker build / push。





According to its [GitHub repo](https://github.com/GoogleContainerTools/jib), whereas a Java application is traditionally built as a single image layer with the application JAR, “Jib’s build strategy separates the Java application into multiple layers for more granular incremental builds. When you change your code, only your changes are rebuilt, not your entire application. These layers, by default, are layered on top of a [distroless](https://github.com/GoogleCloudPlatform/distroless) base image.”

根据它的GitHub repo，虽然Java应用程序传统上是使用应用程序JAR构建为单个图像层，但“Jib的构建策略将Java应用程序分成多个层，以实现更细粒度的增量构建。更改代码时，只会重建更改，而不是整个应用程序。默认情况下，这些图层位于无基础图像的顶部。“



常用命令：

```
# Builds to a container image registry.
$ mvn compile jib:build
# Builds to a Docker daemon.
$ mvn compile jib:dockerBuild
```

由于没有 image registry，这里可以选择第二条命令 `mvn compile jib:dockerBuild`，该命令的解释： Jib can also build your image directly to a Docker daemon. This uses the `docker` command line tool and requires that you have `docker` available on your `PATH`.



示例：

直接在 Java Web项目中运行 `mvn compile jib:dockerBuild`提示 “Main class was not found”  ，问题是如何让编译后的war包在 tomcat 容器中运行？ 



在 jib-maven-plugin 官方文档的 Extended Usage 章节，有一个 from 选项，并且下面有一个示例





```dockerfile
FROM tomcat:9.0-jre8-alpine
COPY target/wizard*.war $CATALINA_HOME/webapps/wizard.war
```







