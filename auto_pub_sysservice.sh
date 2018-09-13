


#!/bin/bash
#filename: auto_pub_sysservice.sh
#describe:auto update & publish sysservice
#author: udax.kr
#date: 2018/6/22

sysservice_war=/opt/udax/sysservice
sysservice_dir=/opt/apache-tomcat-8.0.52

Date=`date +%m-%d-%H%M`

echo `date` >> /tmp/auto_pub_sysservice.log

sudo tar -zcvPf /backup/sysservice/sysservice_$Date.tar.gz --exclude=$sysservice_war/*.war $sysservice_war >>/dev/null
echo "bizservice应用备份成功..." >> /tmp/auto_pub_sysservice.log

echo "删除旧的应用文件..." >> /tmp/auto_pub_sysservice.log

#find /opt/udax/sysservice/* | grep -v *.war | xargs rm -rf

echo "开始解压war包..." >> /tmp/auto_pub_sysservice.log 

sudo unzip -o $sysservice_war/*.war -d $sysservice_war >> /dev/null

sleep 10

echo "停止服务" >> /tmp/auto_pub_sysservice.log

tomcat_pid=`sudo lsof -i:8080 | awk -F" " NR==2'{print $2}'`

sudo kill -9 $tomcat_pid

echo "启动服务" >> /tmp/auto_pub_sysservice.log

sudo $sysservice_dir/bin/catalina.sh start &

sleep 10

re_pid=`sudo lsof -i:8080 | awk -F" " NR==1'{print $2}'`

if [ "$re_pid" == "PID" ];then
	  echo "=== Sysservice自动部署成功! ==="
	  echo "tomcat重启成功" >> /tmp/auto_pub_sysservice.log
       else
	  echo "=== Sysservice自动部署失败! ==="
	  echo "tomcat重启失败" >> /tmp/auto_pub_sysservice.log
		            

fi 









