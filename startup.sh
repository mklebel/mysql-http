#/bin/bash
 
if [ ! -f /usr/local/mysql/data/ibdata1 ]; then 
	/usr/local/mysql/bin/mysql_install_db --insecure --user=mysql --datadir=/usr/local/mysql/data
 
	/usr/local/mysql/bin/mysqld_safe &
	sleep 5s

	echo "INSTALL PLUGIN myhttp SONAME 'libmyhttp.so';" | /usr/local/mysql/bin/mysql
	echo "UPDATE mysql.user SET Password=PASSWORD('foo') WHERE User='root';" | /usr/local/mysql/bin/mysql
	echo "GRANT ALL ON *.* TO root@'%' IDENTIFIED BY 'foo' WITH GRANT OPTION;" | /usr/local/mysql/bin/mysql 
	echo "FLUSH PRIVILEGES;" | /usr/local/mysql/bin/mysql

	killall mysqld
	sleep 5s
fi
 
/usr/local/mysql/bin/mysqld_safe
