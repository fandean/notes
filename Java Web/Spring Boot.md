





Spring Boot 提供了命令行工具，可以为Spring应用快速建立原型。可以参照[安装Spring Boot CLI](http://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#getting-started-installing-the-cli)使用命令行。

但是推荐使用依赖管理工具（Maven、Gradle等）来使用 spring boot



> 在Windows中可以使用下面的方法安装 Spring Boot CLI
>
> ```
> scoop bucket add extras
> scoop install springboot
> ```





Spring Boot不是一个web项目，它会被打包成一个jar包，通过java命令（带jar选项）即可运行，其入口是启动类，运行之后他会自动启动内部的web服务器。







