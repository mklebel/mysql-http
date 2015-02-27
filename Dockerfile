FROM ubuntu

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update && apt-get upgrade -y && apt-get install -y libaio1 psmisc

RUN groupadd -r mysql && useradd -r -g mysql mysql

ADD mysql-5.7.5-labs-http-linux-glibc2.5-x86_64.tar.gz /usr/local/
RUN ln -s /usr/local/mysql-5.7.5-labs-http-linux-glibc2.5-x86_64 /usr/local/mysql 

RUN mkdir /usr/local/mysql/data
RUN chown -RL root:mysql /usr/local/mysql
RUN chown -RL mysql:mysql /usr/local/mysql/data

ADD ./startup.sh /opt/startup.sh
EXPOSE 3306
CMD ["/bin/bash", "/opt/startup.sh"]
