# Part I 第二章：创建和配置Oracle 数据库
>《Database Administrator's Guide》oracle database 11g官方文档第一部分:Part I Basic Database Administration 第二章: Creating and Configuring an Oracle Database

## 1.关于创建Oracle数据库
可以在安装前创建和在安装有使用如下方法创建数据库：
 
1. 可以利用图形化工具Database Configuration Assistant (DBCA)创建数据库。
2. 使用`create database`SQL语句


### 1.1  创建数据库前的注意事项

### 1.1.1  创建数据库前的规划

表 2-1 : 数据库规划任务

| Action 活动 | Additional Information 附加信息 |
| -------------- | ----------------------  |
|规划数据库表和索引需要占用的空间和数量|   [Part I, "Oracle Database Structure and Storage"](http://docs.oracle.com/cd/E11882_01/server.112/e25494/part2.htm#g996990)   [Part I, "Schema Objects"](http://docs.oracle.com/cd/E11882_01/server.112/e25494/part4.htm#g996977)  |
|规划底层操作系统中的数据库文件。可以考虑使用Oracle管理文件，并使用自动存储来创建和管理这些文件|  [Chapter 17, "Using Oracle Managed Files"](http://docs.oracle.com/cd/E11882_01/server.112/e25494/omf.htm#g1018000)  |
| 选择全局数据库名；选择全局数据库名称，该名称是网络结构中数据库的名称和位置。通过设置DB_NAME和DB_DOMAIN两个初始化参数创建全局数据库名。 |["Determining the Global Database Name"]("Determining the Global Database Name")  |
|熟悉初始化文件中的初始化参数。熟悉服务器参数文件(server parameter file)的概念和操作。服务器参数文件允许您在服务器端的磁盘文件中持久存储和管理您的初始化参数。|["About Initialization Parameters and Initialization Parameter Files"](http://docs.oracle.com/cd/E11882_01/server.112/e25494/create.htm#i1013946) ["What Is a Server Parameter File?"]("What Is a Server Parameter File?")   [Oracle Database Reference](http://docs.oracle.com/cd/E11882_01/server.112/e40402/initparams_part.htm#REFRN001)  |
| 选择数据库字符集。All character data, including data in the data dictionary, is stored in the database character set. 见["Selecting a Character Set" ](http://docs.oracle.com/cd/E11882_01/server.112/e25494/create.htm#BABICDGA)  |[Oracle Database Globalization Support Guide](http://docs.oracle.com/cd/E11882_01/server.112/e10729/ch2charset.htm#NLSPG002) |
| 考虑你的数据库需要支持哪些时区。 | |
|选择标准的数据库块(block size)大小。它在创建数据库时通过指定DB_BLOCK_SIZE初始化参数来进行指定，并且在创建数据库之后不允许改变。 SYSTEM表空间和大多数其它表空间都使用该标准的数据库块大小；当然你可以在创建表空间时指定非标准的大小。||
| 如果你打算在4k扇区大小的磁盘上保存online redo log files，你必须手动指定redo log block size||
| 考虑为SYSAUX表空间设置适当的初始化大小||
| 计划为非SYSTEM的用户指定一个默认的表空间去防止他们在无意间在SYSTEM表空间保存数据库对象||
| 计划使用一个undo表空间，来管理你的 undo 数据||
| 制定一个备份和恢复策略，以在故障时保护数据库。||
|熟悉启动和关闭一个实例和安装和打开一个数据库的原则和选项。| [Chapter 3, "Starting Up and Shutting Down"](http://docs.oracle.com/cd/E11882_01/server.112/e25494/start.htm#g1011160) |



**创建数据库时需要注意的事项：**（选择几个暂时需要的）

**选择数据库字符集**
	建议使用AL32UTF8作为数据库字符集，它是Or acle内部的名字，它指的就是UTF-8。注意一定不要直接使用UTF8。

**先决条件**
1. 必须安装所需的甲骨文软件。这包括设置您的操作系统所特有的各种环境变量，并建立软件和数据库文件的目录结构。
2. 必须有足够的内存来启动“甲骨文数据库实例”。
3. 在运行数据库的计算机上，必须有足够的磁盘空间供计划中的数据库使用。



## 2. 使用DBCA创建数据库
术语： Oracle Universal Installer (OUI) 甲骨文通用安装软件；
Database Configuration Assistant (DBCA) 数据库配置助手；



### 2.1 使用交互式(interactive)的DBAC

DBAC可以进行交互操作。记得设置字符集。见[Oracle Database 2 Day DBA](http://docs.oracle.com/cd/E11882_01/server.112/e10897/install.htm#ADMQS002) 
	
	
### 2.2 使用非交互式(Noninteractive/Silent)的DBAC



示例：
```
dbca -silent -createDatabase -templateName General_Purpose.dbc
  -gdbname ora11g -sid ora11g -responseFile NO_VALUE -characterSet AL32UTF8
  -memoryPercentage 30 -emConfiguration LOCAL
 
 
  
Enter SYSTEM user password:
password
Enter SYS user password:
password
Copying database files
1% complete
3% complete
...
```

为确保完全的静默安装，你可以将输出重定向到一个文件；然而在这样做的时候你必须提供响应文件(In this case, however, you must supply passwords for the administrative accounts in command-line arguments or the response file.)。

`dbca -help`获取简明的帮助。

更多详细参数信息见response file 文件模板，

## 3 使用create database语句创建数据库

**在SQL Plus中执行**


如果你选择使用 CREATE DATABASE 语句创建数据库，你必须先完成一些附加的行为。这些行为包括在构建views on the data dictionary tables 和 安装标准的PL/SQL  packages。 通过运行提供的的脚本来执行这些操作。

如果你已经拥有创建你的数据库的脚本，可以考虑为其添加一些新的特性。

**注意： 本节中的说明仅适用于单个实例(Single-instance)安装**

>**单实例数据库single-instance database:**
它并不是意为着一台主机只允许存在一个Oracle instance(实例)。
A single-instance database is a database that is accessed(访问) by only one Oracle instance。只允许同时访问一个数据库？


使用CRECTE DATABASE语句创建示例数据库`mynewdb`的完整步骤为： 

1. Specify an Instance Identifier (SID)
2.  Ensure(确保) That the Required Environment Variables Are Set 设置需要的环境变量
3. Choose a Database Administrator Authentication Method
4. Create the Initialization Parameter File
5. (Windows Only) Create an Instance
6. Connect to the Instance
7. Create a Server Parameter File
8. Start the Instance
9. Issue the CREATE DATABASE Statement
10. Create Additional Tablespaces
11. Run Scripts to Build Data Dictionary Views
12. (Optional) Run Scripts to Install Additional Options
13.  Back Up the Database.
14. (Optional) Enable Automatic Instance Startup


### Step 1: Specify an Instance Identifier (SID)

为数据库实例指定标识符，打开命令行然后设置`ORACLE_SID`环境变量。

`ORACLE_SID`用于区分不同的数据库实例，在一些平台SID区分大小写。

> 常见的方式是设置SID等于数据库的名字。数据库名称的最大为8字符；(DB_NAME)

在Linux中的设置方式：  
```
# bash命令行
ORACLE_SID=mynewdb
export ORACLE_SID
```


在Windowns中的设置：
```
set ORACLE_SID=mynewdb
```

###Step 2  设置需要的环境变量

依赖与你的操作系统，接下来你可以使用  `SQL*Plus`，你可能必须设置环境变量，或者至少验证它们是否配置正确。

在大多数操作系统中，`ORACLE_SID`和 `ORACLE_HOME`必须被设置。此外，明智的做法是设置PATH变量包含oracle_home /bin目录。在Linux系统中这些必须通过你自己手动设置；而在Windows系统中，如果你在安装数据库软件时选择了同时创建数据库则OUI自动为你进行了相关设置。


### Step 3 选择数据库管理员身份验证的方法
您必须经过身份验证并授予适当的系统权限才能创建一个数据库。
您可以以以下方式进行身份验证，以获得所需的权限：

- 使用命令文件(password file)
- 具有操作系统认证


### Step 4 创建初始化参数文件
当一个数据库实例开启时，它会读取一个初始化参数文件。这个文件可以是一个文本文件或者是一个由数据库创建和动态修改的二进制文件。应该首选这个二进制文件；该二进制文件就叫做 server parameter file。 

在步骤4，会教你创建一个文本初始化参数文件；步骤7教你从文本文件中创建一个服务器参数文件。

创建文本初始化参数文件的一个方法是编辑“示例初始化参数文件”中的示例。

如果你手动创建初始化参数文件，确保它至少包含下表列出的参数。未列出的所有其他参数都有默认值。

表： 推荐的最小初始化参数
DB_NAME  
CONTROL_FILES  
MEMORY_TARGET  



为了方便起见，请在“数据库默认位置”中存储您的初始化参数文件，使用默认的文件名。这样你就不用在启动数据库时去刻意指定。


### Step 5: (Windows Only) Create an Instance

在“Windows”平台上，在连接到一个实例之前，必须手动创建它，如果它不已经存在的话。

使用 ORADIM 命令通过创建一个新的windows服务来创建一个甲骨文实例。

	oradim -NEW -SID sid -STARTMODE MANUAL -PFILE pfile

其中sid是所需的SID（例如mynewdb），pfile 是文本初始化参数文件的完整路径。此命令创建实例，但不启动它。

### Step 6: Connect to the Instance
例如： 
```
$ sqlplus /nolog
SQL> CONNECT SYS AS SYSDBA
```
或者
```
$ sqlplus /nolog
SQL> CONNECT / AS SYSDBA
```


### Step 7: Create a Server Parameter File

服务器参数文件使您能够使用`alter  system` 命令更改初始化参数并persist the changes across a database shutdown and startup。从您的编辑的文本初始化文件中创建服务器参数文件。

The following SQL*Plus command reads the text initialization parameter file (PFILE) with the default name from the default location, creates a server parameter file (SPFILE) from the text initialization parameter file, and writes the SPFILE to the default location with the default SPFILE name.

	CREATE SPFILE FROM PFILE;

You can also supply the file name and path for both the PFILE and SPFILE if you are not using default names and locations.

数据库必须重启，以使SPFILE 生效。



### Step 8: Start the Instance
启动一个实例而不mounting一个数据库。通常情况下，您只在数据库创建或在数据库执行维护时这样做。使用 STARTUP  NOMOUNT命令。在这个例子中，因为初始化参数文件和服务器参数文件存储在默认位置，您不需要指定 PFILE 子句：

	STARTUP NOMOUNT
	
在这一点上，实例内存被分配，它的进程开始(实例就是一个进程和内存的集合)。数据库本身还不存在。


### Step 9: Issue(发布) the CREATE DATABASE Statement(发布创建数据库语句)


**示例一：**

下面的语句用于创建名为mynewdb的数据库。该数据库名字必须与初始化参数文件中 DB_NAME 指定的文件名相同。该示例做出如下假设：

- 初始化参数文件指定了控制文件的数量和位置，通过CONTROL_FILES parameter
- 目录/u01/app/oracle/oradata/mynewdb存在
- 目录 /u01/logs/my和/u02/logs/my  存在

```
CREATE DATABASE mynewdb
   USER SYS IDENTIFIED BY sys_password
   USER SYSTEM IDENTIFIED BY system_password
   LOGFILE GROUP 1 ('/u01/logs/my/redo01a.log','/u02/logs/my/redo01b.log') SIZE 100M BLOCKSIZE 512,
           GROUP 2 ('/u01/logs/my/redo02a.log','/u02/logs/my/redo02b.log') SIZE 100M BLOCKSIZE 512,
           GROUP 3 ('/u01/logs/my/redo03a.log','/u02/logs/my/redo03b.log') SIZE 100M BLOCKSIZE 512
   MAXLOGFILES 5
   MAXLOGMEMBERS 5
   MAXLOGHISTORY 1
   MAXDATAFILES 100
   CHARACTER SET AL32UTF8
   NATIONAL CHARACTER SET AL16UTF16
   EXTENT MANAGEMENT LOCAL
   DATAFILE '/u01/app/oracle/oradata/mynewdb/system01.dbf' SIZE 325M REUSE
   SYSAUX DATAFILE '/u01/app/oracle/oradata/mynewdb/sysaux01.dbf' SIZE 325M REUSE
   DEFAULT TABLESPACE users
      DATAFILE '/u01/app/oracle/oradata/mynewdb/users01.dbf'
      SIZE 500M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED
   DEFAULT TEMPORARY TABLESPACE tempts1
      TEMPFILE '/u01/app/oracle/oradata/mynewdb/temp01.dbf'
      SIZE 20M REUSE
   UNDO TABLESPACE undotbs
      DATAFILE '/u01/app/oracle/oradata/mynewdb/undotbs01.dbf'
      SIZE 200M REUSE AUTOEXTEND ON MAXSIZE UNLIMITED;
```

示例二：
这个例子说明了创建 a database with Oracle Managed Files，它使您能够使用一个更简单的CREATE DATABASE语句。要使用Oracle Managed Files，初始化参数 DB_CREATE_FILE_DEST必须被设置。此参数定义了数据库创建和自动命名的各种数据库文件的基本目录。下面的语句是在初始化参数文件中设置此参数的一个示例：

	DB_CREATE_FILE_DEST='/u01/app/oracle/oradata'

With Oracle Managed Files and the following CREATE DATABASE statement, the database creates the SYSTEM and SYSAUX tablespaces, creates the additional tablespaces specified in the statement, and chooses default sizes and properties for all data files, control files, and redo log files.
请注意，此方法所设置的这些属性和其他默认数据库属性可能不适合您的生产环境，因此建议您检查所生成的配置，并在必要时修改它。
```
CREATE DATABASE mynewdb
USER SYS IDENTIFIED BY sys_password
USER SYSTEM IDENTIFIED BY system_password
EXTENT MANAGEMENT LOCAL
DEFAULT TEMPORARY TABLESPACE temp
UNDO TABLESPACE undotbs1
DEFAULT TABLESPACE users;
```


### Step 10: Create Additional Tablespaces

To make the database functional,，你必须为你的应用程序的数据创建额外的表空间。下面的示例脚本创建额外的表空间： 

```
CREATE TABLESPACE apps_tbs LOGGING 
     DATAFILE '/u01/app/oracle/oradata/mynewdb/apps01.dbf' 
     SIZE 500M REUSE AUTOEXTEND ON NEXT  1280K MAXSIZE UNLIMITED 
     EXTENT MANAGEMENT LOCAL;
-- create a tablespace for indexes, separate from user tablespace (optional)
CREATE TABLESPACE indx_tbs LOGGING 
     DATAFILE '/u01/app/oracle/oradata/mynewdb/indx01.dbf' 
     SIZE 100M REUSE AUTOEXTEND ON NEXT  1280K MAXSIZE UNLIMITED 
     EXTENT MANAGEMENT LOCAL;
```

### Step 11: Run Scripts to Build Data Dictionary Views
运行脚本，需要建立数据字典视图、同义词、和PL/SQL包，并支持`SQL *plus`正常运转。
。。。

### Step 12: (Optional) Run Scripts to Install Additional Options

### Step 13: Back Up the Database.
以一个完整的数据库备份，以确保您有一个完整的文件集，从该文件中，如果发生媒体故障恢复。有关备份数据库的信息，参见数据库备份和恢复用户指南。
### Step 14: (Optional) Enable Automatic Instance Startup
你可能想要配置的Oracle实例启动时自动重新启动计算机的主机。查看您的操作系统文档的说明。例如，在“Windows”上，使用以下命令来配置数据库服务，在计算机重新启动时启动实例：

	ORADIM -EDIT -SID sid -STARTMODE AUTO -SRVCSTART SYSTEM [-SPFILE]

You must use the -SPFILE argument if you want the instance to read an SPFILE upon automatic restart.



## 4. Specifying CREATE DATABASE Statement Clauses


## 5. Specifying Initialization Parameters


## 6. Managing Initialization Parameters Using a Server Parameter File
对于Oracle数据库始点值参数传统上是存储在一个文本初始化参数文件。为更好的可管理性，你可以选择保持在一个二进制服务器参数文件，是持久的跨数据库的启动和关闭初始化参数。本节介绍了服务器参数文件，并解释了如何使用存储参数的方法来管理初始化参数。下面的主题包含在本节中。




## 7. Managing Application Workloads with Database Services
### 7.1 关于数据库服务
数据库服务（服务）是在管理数据库中的工作负载的逻辑抽象。服务将工作负载划分为互不相交的分组。每个服务都代表一个具有共同属性、服务级别阈值和优先级的工作负载。分组是基于工作的属性，可能包括应用程序的功能，应用程序功能的执行优先级，要管理的作业类，或在应用程序功能或作业类中使用的数据范围。例如，甲骨文电子商务套件定义了一个服务，为每个责任，如ledger一般，应收账款，订单输入，等等。当您配置数据库服务时，您为每个服务提供了一个独特的全局名称、相关的性能目标和关联的重要性。该服务与甲骨文数据库紧密集成，并保持在数据字典中。

连接请求可以包括数据库服务名称。因此，中间层的应用程序和客户端/服务器应用程序使用一个服务通过指定服务作为连接的一部分在TNS连接数据。如果没有服务名称包含的网络服务文件listener.ora指定默认的服务，连接使用默认的服务。

服务使您能够配置一个工作负载，管理它，启用和禁用它，并测量作为一个单一实体的工作量。你可以使用标准工具如数据库配置助手做这个（DBCA）、网络配置（NetCA），和Oracle企业管理器。企业管理器支持查看和操作服务作为一个整体，并在需要时向下进入到实例级。

您还可以为服务指定版本属性。版本可以有两个或两个以上版本的相同的对象在数据库中。当您为服务指定版本属性时，指定该服务的所有后续连接都将使用此版本作为初始会话版本。

指定一个版本作为服务属性可以使它更容易管理资源使用。例如，一个版相关服务可以在Oracle RAC环境中放置在一个单独的实例和数据库资源管理器可以管理通过将资源计划与相应的服务，不同的版本使用的资源。

除了服务于所使用的应用程序的服务，甲骨文数据库还支持两个内部服务：
`SYS$BACKGROUND`仅用于后台进程；`SYS$USERS`是用户会话的默认服务


### 7.2 创建数据库服务
有几种方法来创建数据库服务，取决于您的数据库配置。

- If your single-instance database is being managed by Oracle Restart, use the SRVCTL utility to create the database service.
```
	srvctl add service -d db_unique_name -s service_name
```
- If your single-instance database is not being managed by Oracle Restart, do one of the following:
    - 添加所需的服务名称到 SERVICE_NAMES参数。
    - 调用DBMS_SERVICE.CREATE_SERVICE  package procedure(程序).
- (可选)通过Oracle Enterprise Manager或DBMS_SERVICE.MODIFY_SERVICE来定义服务的属性。


### 7.3 数据库服务数据字典视图
您可以在下面的服务特定视图中找到服务信息：

```
DBA_SERVICES
ALL_SERVICES or V$SERVICES
V$ACTIVE_SERVICES
V$SERVICE_STATS
V$SERVICE_EVENT
V$SERVICE_WAIT_CLASSES
V$SERV_MOD_ACT_STATS
V$SERVICE_METRICS
V$SERVICE_METRICS_HISTORY
```

以下的附加视图还包含有关服务的一些信息：

```
V$SESSION
V$ACTIVE_SESSION_HISTORY
DBA_RSRC_GROUP_MAPPINGS
DBA_SCHEDULER_JOB_CLASSES
DBA_THRESHOLDS
```


## 8. Considerations After Creating a Database(创建数据库之后的注意事项)


## 9.  Cloning a Database with CloneDB

## 10. Dopping a Database
删除一个数据库包括删除它的数据文件，redo日志文件，控制文件和初始化参数文件。

使用命令： 

	DROP DATABASE;


DROP DATABASE 语句首先删除在控制文件中列出的所有控制文件和所有其他数据库文件。然后关闭数据库实例。

要成功使用DROP DATABASE语句，数据库必须挂载(mounted)在“独占exclusive”和“限制restricted”模式中。

如果您使用数据库配置助手来创建您的数据库，您可以使用该工具删除（drop）您的数据库并删除文件。


## 11. Database Data Dictionary Views （数据库数据字典视图）
除了先前在“查看参数设置”中列出的视图，您可以使用以下视图查看您的数据库内容和结构的信息：


| View |  Description |
|-------|-----|
|DATABASE_PROPERTIES |Displays permanent database properties(显示永久数据库属性)|
|GLOBAL_NAME|Displays the global database name|
|`V$DATABASE`|Contains database information from the control file(包含控制文件中的数据库信息)|

