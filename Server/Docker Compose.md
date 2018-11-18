# Docker Compose



## Docker Compose 介绍

> compose：组成, 构成  

Define and run multi-container applications with Docker.



然而， 在日常工作中， 经常会碰到需要多个容器相互配合来完成某 项任务的情况。 例如要实现一个 Web 项目， 除了 Web 服务容器本身， 往往还需要再加上后 端的数据库服务容器， 甚至还包括负载均衡容器等。

 Compose 恰好满足了这样的需求。 它允许用户通过一个单独的 docker-compose.yml 模板文件 （ YAML 格式） 来定义一组相关联的应用容器为一个项目（ project） 。    



**Compose 中有两个重要的概念：** 

- 服务 ( service )： 一个应用的容器， 实际上可以包括若干运行**相同镜像**的容器实例。 
- 项目 ( project )： 由一组关联的应用容器组成的一个完整业务单元， 在 dockercompose.yml 文件中定义。    

可见， 一个项目可以由多个服务（ 容器） 关联而成， Compose 面向项目进行管理。    



注意每个服务都必须通过 image 指令指定镜像 **或** build 指令（ 需要 Dockerfile） 等来自动 构建生成镜像。    



## 安装



安装：直接在此[Releases · docker/compose](https://github.com/docker/compose/releases "Releases · docker/compose")下载安装包安装





## 入门示例



参考：[Docker Compose Tutorial: Orchestrate Containers for Development](https://blog.codeship.com/orchestrate-containers-for-development-with-docker-compose/ )



### Docker Compose Workflow

There are three steps to using Docker Compose:

1. Define each service in a **Dockerfile**.
2. Define the *services* and their *relation to each other* in the **docker-compose.yml** file.
3. Use **docker-compose up** to start the system.



### 示例一：基本结构



docker-compose.yml文件的语法紧密反映了底层的Docker操作。为了证明这一点，我将从Redis Commander源构建一个容器并将其连接到Redis数据库。









> 运维大神 [docker：编排与部署小神器Compose-DevOps(甘兵)-51CTO博客](http://blog.51cto.com/ganbing/2083806 "docker：编排与部署小神器Compose-DevOps(甘兵)-51CTO博客") 
>
> 官方示例解析：[A Practical Introduction to Docker Compose – Hacker Noon](https://hackernoon.com/practical-introduction-to-docker-compose-d34e79c4c2b6 "A Practical Introduction to Docker Compose – Hacker Noon") 文章中有到github资源的链接。





