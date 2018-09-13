


#!/bin/bash
#filename: auto_rollback_sysweb.sh
#describe:auto rollback the sysweb
#author: udax.kr
#date: 2018/6/22

sysweb_war=/opt/udax/sysweb
sysweb_dir=/opt/tomcat
backupfile_dir=/backup/sysweb

Date=`date +%m-%d-%H%M`

chown -R ec2-user:ec2-user /opt/udax/sysweb/*

find $sysweb_war/* | xargs rm -rf 

echo "删除原有bizweb已部署的应用文件..." >> /tmp/auto_rollback_sysweb.log

cp -r  $backupfile_dir/`ls -lacr $backupfile_dir | awk -F" " NR==4'{print $9}'` $sysweb_war  

echo "sysweb回滚应用压缩包成功..." >> /tmp/auto_rollback_sysweb.log 

echo "开始解压回滚war包..." >> /tmp/auto_rollback_sysweb.log

tar -zxvf $sysweb_war/*.tar.gz  -C $sysweb_war

mv $sysweb_war/opt/udax/sysweb/* $sysweb_war >> /dev/null

#chown -R ec2-user:ec2-user /opt/udax/sysweb/*

find $sysweb_war/opt | xargs rm -rf && echo `date` >> /tmp/auto_rollback_sysweb.log

sleep 10

echo "停止服务" >> /tmp/auto_rollback_sysweb.log

tomcat_pid=`lsof -i:8081 | awk -F" " NR==2'{print $2}'`

sudo kill -9 $tomcat_pid

echo "启动服务" >> /tmp/auto_rollback_sysweb.log

sudo $sysweb_dir/bin/catalina.sh start &

sleep 10

re_pid=`lsof -i:8081 | awk -F" " NR==1'{print $2}'`

if [ "$re_pid" == "PID" ];then
	echo "=== Sysweb自动回滚成功! ==="
        echo "tomcat重启成功" >> /tmp/auto_rollback_sysweb.log
           else
	echo "=== Sysweb自动回滚失败! ==="
	echo "tomcat重启失败" >> /tmp/auto_rollback_sysweb.log
							  		            

fi 







		            

 









