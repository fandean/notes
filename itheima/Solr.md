# Solr





Solr 是一个开源搜索平台，用于构建搜索应用程序。 不仅限于搜索， Solr 也可以用于存储目的。像其他 NoSQL 数据库一样，它是一种非关系数据存储和处理技术 。





## 部署 Solr (war包)



- 下载 solr 压缩包，解压

- 复制压缩包中 `solr-4.10.3/example/webapps/solr.war` 到 tomcat 下的webapps目录下，重启tomcat

- 复制 `solr-4.10.3/example/lib/ext/` 下所有 jar包到 tomcat 中 webapps 下的 `solr/WEB-INF/lib` 中

- 创建索引库，这里选择复制现有索引库及其配置：复制 `solr-4.10.3/example/solr/` 目录下的**所有内容**（索引库collection1及其配置）到 `/opt/Solr/SolrHome`下

- 为 solr指定索引库位置： 编辑tomcat中的`webapps/solr/WEB-INF/web.xml` 

  ```xml
      <env-entry>
         <env-entry-name>solr/home</env-entry-name>
         <env-entry-value>/opt/Solr/SolrHome</env-entry-value>
         <env-entry-type>java.lang.String</env-entry-type>
      </env-entry>
  ```
- 重启 Tomcat ，在浏览器中访问 solr 项目

- Solr的Logging中会有相关警告，可以选择忽略，也可以动手解决 略。







如何添加一个索引库？

- 请确保已经 复制 `solr-4.10.3/example/solr/` 目录下的**所有内容**（索引库collection1及其配置）到 `/opt/Solr/SolrHome`下，并检查SolrHome下是否存在 solr.xml  zoo.cfg两个配置文件

- 重新复制 SolrHome 下的 collection1 目录，并命名为 item
- 修改 item下的 core.properties 配置文件，将 name 的值改为 item
- 重启 tomcat







