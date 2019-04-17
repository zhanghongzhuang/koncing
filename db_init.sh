#!/bin/bash
# 启动
mysql_install_db --user=mysql
sleep 3
mysqld_safe &
sleep 3
mysqladmin -u "root" password "Admin@1233"
 
# 授权
mysql -u "root" -p"Admin@1233" -e "use mysql; grant all privileges on *.* to 'root'@'%' identified by 
'Admin@1233' with grant option;"
 
h=$(hostname)
 
# 设置用户密码
mysql -u "root" -p"Admin@1233" -e "use mysql; update user set password=password('Admin@1233') where user='root' and host='127.0.0.1';"
 
# 创建默认数据库
#mysql -u "$MARIADB_USER" -p"$MARIADB_PASS" -e "CREATE DATABASE IF NOT EXISTS default_db DEFAULT CHARSET utf8 COLLATE utf8_general_ci;"
 
# 刷新权限
mysql -u "root" -p"Admin@1233" -e "flush privileges;"
