#!/bin/bash
 
sudo docker run -d -p 3306:3306 -p 8080:8080 -v /data/mysql:/usr/local/mysql/data mysql-http
