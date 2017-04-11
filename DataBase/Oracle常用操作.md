RocBrisa01


$ORACLE_HOME/bin
- 检查监听器： 通过netmgr命令或netca配置监听器，lsnrctl检查监听器状态






使用sqlplus进行连接:
1.在启动sqlplus时不出现登录界面： sqlplus /nolog
2.使用connect 连接到数据库实例： 

conn username [as sysdba]   		-- 本地连接
conn / [as sysdba]					-- 本地连接（系统身份认证）
conn username@网络连接标识符			-- 远程连接（需配置了网络连接标识符）
conn username@host[:port][/service_name][:server][/instance_name] 
conn username@host[:port][/instance_name]  -- 远程连接，这个简便一点







