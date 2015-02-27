#!/bin/bash
 
wget -c http://downloads.mysql.com/snapshots/pb/mysql-5.7.5-labs-http/mysql-5.7.5-labs-http-linux-glibc2.5-x86_64.tar.gz
sudo docker build -t mysql-http .
