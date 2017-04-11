# Ant

标签（空格分隔）： 开发工具

---

> 尝试参考《Tomcat与Java Web开发技术详解》的第30章：用Ant工具管理Web应用。

尽量不要太过复杂，先了解基本的使用方法。

[W3Cshchool: Apache Ant 教程](http://www.w3cschool.cn/ant/)



ANT是一个Apache的一个使用Java开发的开源项目；它克服了传统make工具的缺点。比如：跨平台性；使用XML格式配置文件。

据最初的创始人James Duncan Davidson 介绍，这个工具的名称是 another neat tool（另一个整洁的工具）的首字母缩写。




## 创建build.xml文件
每个工程都对应一个build.xml文件。target元素包含一个或多个任务元素。ANT提供了内置任务集，用户也可开发自己的任务元素。

常用ANT内置任务：

| ANT任务 | 描述 |
| --------- | ------------ |
|property | 设置name/value形式的属性（**相当于make中的宏**）|
|mkdir||
|copy||
|delete||
|javac||
|java||
|war| 为web应用打包(.war文件见'web开发入门'笔记)|



示例：bookstore应用(Web应用)的build.xml文件

```
<!-- 工程名：bookstore； 默认的taget元素: about；基路径：. -->
<project name="bookstore" default="about" basedir=".">

    <target name="init">
        <!-- property 相当于makefile中的宏 -->
        <property name="build" value="build" />
        <property name="src" value="src" />
        <!-- 设置系统环境属性 -->
        <property environment="myenv" />
        <property name="servletpath" value="${myenv.CATALINA_HOME}/lib/servlet-api.jar" />
        <property name="mysqlpath" value="WEB-INF/lib/mysqldriver.jar" />
        
        <mkdir dir="${build}" />
        <mkdir dir="${build}/WEB-INF" />
        <mkdir dir="${build}/WEB-INF/classes" />
        
        <copy todir="${build}" > <!-- 复制到的目录 -->
            <fileset dir="${basedir}" > <!-- 被复制的文件 -->
                <include name="*.jsp" />
                <include name="*.bmp" />
                <!-- **表示复制该文件夹下的所有内容；*.*表示所有文件 -->
                <include name="WEB-INF/**" /> 
                <exclude name="build.xml" />
            </fileset>
        </copy>
    </target>
    
    <!-- depends：指定在执行本target之前必须完成的target -->
    <target name="complie" depends="init">
        <javac srcdir="${src}"
            destdir="${build}/WEB-INF/classes"
            classpath="${servletpath}:${mysqlpath}" >
        </javac>
    </target>
    
    <target name="bookstorewar" depends="compile" >
        <war warfile="${build}/bookstore.war" webxml="${build}/WEB-INF/web.xml" >
            <lib dir="${build}/WEB-INF/lib" />
            <classes dir="${build}/WEB-INF/classes" />
            <fileset dir="${build}" /> <!--把build目录下的所有文件加入到war文件中 -->
        </war>
    </target>
    
    <target name="about" >
        <echo>
        This build.xml file contains targets for building bookstore web application.
        </echo>
    </target>
</project>
```


### 运行ANT
在运行ANT时，也可以通过参数来指定build.xml文件和target：
```
# 语法：
ant -buildfile <build-dir>/build.xml targetname
# 示例：
# 1. 先进入~/workspace/test/bookstore/目录，再运行
ant
# 2. 在任意目录
ant -buildfile ~/workspace/test/bookstore/build.xml
# 3. 在任意目录
ant -buildfile ~/workspace/test/bookstore/build.xml about
```

以上3种方式都执行 about target。


