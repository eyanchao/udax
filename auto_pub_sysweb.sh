



#!/bin/bash
#filename: auto_pub_sysweb.sh
#describe:auto update & publish sysweb
#author: udax.kr
#date: 2018/6/22

sysweb_war=/opt/udax/sysweb
sysweb_dir=/opt/tomcat

Date=`date +%m-%d-%H%M`

echo `date` >> /tmp/auto_pub_sysweb.log

sudo tar -zcvPf /backup/sysweb/sysweb_$Date.tar.gz --exclude=$sysweb_war/*.war $sysweb_war >>/dev/null
echo "bizweb应用备份成功..." >> /tmp/auto_pub_sysweb.log

echo "删除旧的应用文件..." >> /tmp/auto_pub_sysweb.log

#find /opt/udax/sysweb/* | grep -v *.war | xargs rm -rf

echo "开始解压war包..." >> /tmp/auto_pub_sysweb.log 

sudo unzip -o $sysweb_war/*.war -d $sysweb_war >> /dev/null

sleep 10

echo "停止服务" >> /tmp/auto_pub_sysweb.log

tomcat_pid=`sudo lsof -i:8081 | awk -F" " NR==2'{print $2}'`

sudo kill -9 $tomcat_pid

echo "启动服务" >> /tmp/auto_pub_sysweb.log

sudo $sysweb_dir/bin/catalina.sh start &

sleep 10

re_pid=`sudo lsof -i:8081 | awk -F" " NR==1'{print $2}'`

if [ "$re_pid" == "PID" ];then
	  echo "=== Sysweb自动部署成功! ==="
	  echo "tomcat重启成功" >> /tmp/auto_pub_sysweb.log
       else
	  echo "=== Sysweb自动部署失败! ==="
	  echo "tomcat重启失败" >> /tmp/auto_pub_sysweb.log
		            
fi 




