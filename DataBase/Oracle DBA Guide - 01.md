# Part I - 第一章：Getting Started with Database Administration
>[《Database Administrator's Guide》](http://docs.oracle.com/cd/E11882_01/server.112/e25494/dba.htm)oracle database 11g官方文档，第一部分:Part I Basic Database Administration 第一章


## 1.1 Submitting Commands and SQL to the Database提交命令和SQL到数据库
这里有三种方式进行上述提交：

- 直接使用 SQLPlus
- 使用图形化的Oracle Enterprise Manager
- 使用SQL Developer

### 1.2 About SQL*Plus
你可以使用SQL Plus启动和关闭数据库，... 设置数据库，创建数据库对象，查询插入更新数据等

在提交SQL 语句和命令之前，你需要先连接数据库。你可以使用sqlplus进行本地和远程连接。
### 1.3 Connecting to the Database with SQL*Plus 使用sqlplus连接数据库
Oracle数据库包含了如下组件：

- The Oracle Database instance, which is a collection of processes and memory。数据库实例，它是进程和内存的集合
- A set of disk files that contain user data and system data(一些包含了用户和系统的磁盘文件)

**当你使用sqlplus连接时，你连接的是数据库实例**，每一个实例都有一个实例ID，或叫做system ID (SID)。由于一个电脑中可以存在多个实例，所以必须指定你想连接哪个实例。对于本地连接，你可以通过**设置系统环境变量**的方法来识别一个实例；对于远程连接，通过指定网络地址和数据库服务名(a database service name)

**1. 设置系统变量**：
在大多数平台：ORACLE_SID and ORACLE_HOME must be set。添加ORACLE_HOME/bin到PATH。

对于UNIX and Linux 有相应的两个脚本, `oraenv` and `coraenv`, that you can use to easily set environment variables可以利用这两个脚本设置环境变量（不管了在.bashrc中设置就可以了）. For more information, see Administrator's Reference for UNIX Systems.

如果你需要在不同的oracle home间切换不同的实例，你必须更改ORACLE_HOME环境变量；如果多个实例共享一个oracle home，则必须更改ORACLE_SID。

**2. Start SQLPlus**
sqlplus命令位于目录ORACLE_HOME/bin；如果设置了环境变量则直接使用`sqlplus  /nolog`命令。

**3. Submit the SQL*Plus CONNECT Statement提交连接语句**
提交连接语句来初始化连接oracle实例；`CONNECT`语法格式如下：
```
CONN[ECT] [logon] [AS {SYSOPER | SYSDBA}]
```
其中`logon`的语法如下：
```
{username | /}[@connect_identifier] [edition={edition_name | DATABASE_DEFAULT}]
```

语法中各语句的意义：

| Sysntax Commponent | Description |
|--------------------------| -----------------|
| `/`   |  Calls for external authentication(外部身份验证) of the connection request。通常它是直接通过操作系统进行身份验证(只要该操作系统用户满足某种条件即可) |
|``AS {SYSOPER | SYSDBA}`` | 只有事先添加的管理员用户才可选择使用 sysoper或 sysdba特权  |
| username |  用户名 |
| connect_identifier (1) | An Oracle Net connect identifier(网络连接标识符)，准确的语法由Oracle Net配置决定，省略即进行本地连接。一般为net service name；它是一个网络连接描述符的别名，它通常在 tnsnames.ora 文件中设定|
| connect_identifier (2) | 它是一个可替代的 Easy connect syntax(更易于使用的语法?)，`"host[:port][/service_name][:server][/instance_name]"`，`service_name`如果默认的service没有配置，则必须提供service_name。每一个数据库通常都提供了一个标准的service，它的名字等于全局数据库名the global database name，它由DB_NAME和DB_DOMAIN一同构成，例如: `DB_NAME.DB_DOMAIN`如果没有DB_DOMAIN，则它就是`DB_NAME.`。 `server`是服务处理程序的类型，由监听器配置，一般为 shared类型否则就是dedicated类型。`instance_name`实例名，你可以同时指定服务名和实例名；在Oracle RAC或单一实例环境中，如果只指定了实例名，你可以连接默认的数据库服务(它定义在listener.ora文件，如果文件中没有指定，则会出现错误)，你可以通过初始化参数 instance_name中获取实例名称。|
|``edition={edition_name | DATABASE_DEFAULT}``|为此次数据库会话指定版本(edition)，指定的版本必须存在，且你必须对其有USE权限；如果未指定则使用默认版本 |


>Oracle Real Application Clusters (Oracle RAC)：Oracle应用集群。

连接示例：
```
connect system
connect sys as sysdba
connect / as sysdba
connect salesadmin@"dbhost.example.com/sales.example.com"
connect salesadmin@"dbhost.example.com/sales.example.com:dedicated"
connect salesadmin@"192.0.2.5/sales.example.com"
...
```


### 1.3 About Database Administrator Security and Privileges(特权)

**The Database Administrator's Operating System Account**
对数据库进行维护执行administrative duties(管理职责)，你必须能够执行操作系统相关命令。你必须有操作系统的用户帐号。

**Administrative(行政) User Accounts**
以下两个管理用户是在安装数据库时默认创建：  

- SYS （default password: CHANGE_ON_INSTALL安装时指定）授予 DBA role(角色)
- SYSTEM  (default password: MANAGER  经理) 授予 DBA role

创建至少一个额外的administrative user授予该用户适当的管理权限，并使用他管理日常任务。避免使用 SYS 和 SYSTEM。

**SYS：**
几乎所有的元数据(数据字典)都存储在the schema SYS。永远不要更改The SYS schema，包括管理员； 必须确保一般用户无法使用SYS帐户连接数据库。

**SYSTEM:**
SYSTEM用于创建额外的（用于显示管理员信息的）tables和views 和 (用于各种数据库选项和工具的)内部的tables and views

**The DBA Role**
This role contains most database system privileges.（The DBA role does not include the SYSDBA or SYSOPER system privileges.）

### 1.4 Database Administrator Authentication(数据库管理员认证)

#### 1.4.1 Administrative Privileges
要想获得管理员特权，至少被授予SYSDBA 或 SYSOPER 这两个特殊的系统特权之一
。

#### 1.4.2 SYSDBA and SYSOPER
这两个特权可执行的操作见docs中的表格。

**SYSDBA：** 

- Perform STARTUP and SHUTDOWN operations
- ALTER DATABASE: open, mount, back up, or change character set
- CREATE DATABASE
- DROP DATABASE
- CREATE SPFILE
- ALTER DATABASE ARCHIVELOG
- ALTER DATABASE RECOVER
- Includes the RESTRICTED SESSION privilege
- Effectively, this system privilege allows a user to connect as user SYS.

**SYSOPER： **

- Perform STARTUP and SHUTDOWN operations
- CREATE SPFILE

- ALTER DATABASE OPEN/MOUNT/BACKUP

- ALTER DATABASE ARCHIVELOG

- ALTER DATABASE RECOVER (Complete recovery only. Any form of incomplete recovery, such as UNTIL TIME|CHANGE|CANCEL|CONTROLFILE requires connecting as SYSDBA.)

- Includes the RESTRICTED SESSION privilege
- 允许执行基本的操作任务，但不能查看用户数据。

>When you connect with SYSDBA or SYSOPER privileges, you connect with a default schema, not with the schema that is generally associated(通常相关) with your username. For SYSDBA this schema is SYS; for SYSOPER the schema is PUBLIC.


#### 1.4.3 Selecting an Authentication Method for Database Administrators
数据库管理员可以通过data dictionary 数据字典进行数据库管理员认证（with the SYSDBA or SYSOPER privilege）。

**认证的方法有：**

- 操作系统认证
- 密码文件
- 通过网络认证服务 

![ Database Administrator Authentication Methods](http://docs.oracle.com/cd/E11882_01/server.112/e25494/img/admin001.gif  "Database Administrator Authentication Methods")

**使用操作系统认证：**
两个特定的操作系统组的成员(用户)允许使用操作系统认证而不需要使用密码。
 这两个操作系统组的名称一般由OSDAB或OSOPER两个选项指定 。（比如在安装配置界面标签名`OSDAB Group`有一个下拉选项其中就有 dba）
 该组被创建和指定的特定名称作为数据库安装过程的一部分。**默认名称**取决于您的操作系统而有所不同，并在下表中列出：
 
 |Operating System Group| UNIX User Group  | Windows User Group |
 | --- | --- | ------ |
 | OSDAB | dba | ORA_DBA |
 | OSOPER | oper | ORA_OPER |

也可以在安装数据库程序时对其进行覆盖。

**Connecting Using Operating System Authentication使用操作系统认证进行连接**
本地连接：  `connect / as sysdba`或`connect / as sysoper` （记住这里说的都是管理员）
远程连接：`CONNECT /@net_service_name AS SYSDBA`

**Using Password File Authentication**

1. 准备工作：
	1. 必须事先拥有password file，如果没有则需要使用 ORAPWD 进行创建，如：
`ORAPWD  FILE=filename ENTRIES=max_users`
另可通过Database Configuration Assistant (**DBCA**)创建该文件。
	2. Set the REMOTE_LOGIN_PASSWORDFILE initialization parameter to EXCLUSIVE. (This is the default).它是静态的初始化参数，所以更改后必须重启数据库。
	3. Connect to the database as user SYS (or as another user with the administrative privileges).
	4. If the user does not already exist in the database, create the user and assign a password.如果用户不存在则创建用户，并设置密码。
	5. Grant the SYSDBA or SYSOPER system privilege to the user:
	`GRANT SYSDBA to oe;`该语句添加oe用户到password file, thereby(从而) enabling connection AS SYSDBA.（注意这里并没有指定SYSOPER特权，所以连接时不能使用 AS SYSOPER）
2. 连接示例（oe用户）： `CONNECT oe AS SYSDBA`

### 1.5 Creating and Maintaining a Password File(创建和管理password file)  
略



### 1.6 Data Utilities
**SQL Loader**
允许(一般)用户从操作系统加载文件到数据库表tables中。

