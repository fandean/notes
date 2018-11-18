RocBrisa01

`$ORACLE_HOME/bin`

- 检查监听器： 通过 netmgr 命令或 netca 配置监听器，lsnrctl 检查监听器状态



 

使用sqlplus进行连接 : 

1. 在启动sqlplus时不出现登录界面： `sqlplus /nolog`

2. 使用connect 连接到数据库实例： 

   ```
   conn username [as sysdba]   		-- 本地连接
   conn / [as sysdba]					-- 本地连接（系统身份认证）
   conn username@网络连接标识符			-- 远程连接（需配置了网络连接标识符）
   conn username@host:port:server 
   conn username@host:port  -- 远程连接，这个简便一点
   ```










