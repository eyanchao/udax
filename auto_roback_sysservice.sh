





#!/bin/bash
#filename: auto_rollback_sysservice.sh
#describe:auto rollback the sysservice
#author: udax.kr
#date: 2018/6/22

sysservice_war=/opt/udax/sysservice
sysservice_dir=/opt/apache-tomcat-8.0.52
backupfile_dir=/backup/sysservice

Date=`date +%m-%d-%H%M`

#sudo chown -R ec2-user:ec2-user /opt/udax/sysservice/*

find $sysservice_war/* | xargs rm -rf 

echo "删除原有sysservice已部署的应用文件..." >> /tmp/auto_rollback_sysservice.log

cp -r  $backupfile_dir/`ls -lacr $backupfile_dir | awk -F" " NR==4'{print $9}'` $sysservice_war  

echo "sysservice回滚应用压缩包成功..." >> /tmp/auto_rollback_sysservice.log 

echo "开始解压回滚war包..." >> /tmp/auto_rollback_sysservice.log

tar -zxvf $sysservice_war/*.tar.gz  -C $sysservice_war

mv $sysservice_war/opt/udax/sysservice/* $sysservice_war >> /dev/null

chown -R ec2-user:ec2-user /opt/udax/sysservice/*

find $sysservice_war/opt | xargs rm -rf && echo `date` >> /tmp/auto_rollback_sysservice.log

sleep 10

echo "停止服务" >> /tmp/auto_rollback_sysservice.log

tomcat_pid=`lsof -i:8080 | awk -F" " NR==2'{print $2}'`

kill -9 $tomcat_pid

echo "启动服务" >> /tmp/auto_rollback_sysservice.log

$sysservice_dir/bin/catalina.sh start &

sleep 10

re_pid=`lsof -i:8080 | awk -F" " NR==1'{print $2}'`

if [ "$re_pid" == "PID" ];then
	echo "=== Sysservice自动回滚成功! ==="
        echo "tomcat重启成功" >> /tmp/auto_rollback_sysservice.log
           else
	echo "=== Sysservice自动回滚失败! ==="
	echo "tomcat重启失败" >> /tmp/auto_rollback_sysservice.log
							  		            

fi 




		            

 









