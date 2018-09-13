


#!/bin/bash
#filename: auto_check_tomcat.sh(for monitor tomcat)
#date: 2018/5/16
#author: udak.kr

###################################################
# auto check tomcat port status,if it has stopped # 
# then auto restart the tomcat.                   #    
###################################################

export  JAVA_HOME=/usr/java/jdk1.8.0_162
export  PATH=$PATH:/usr/java/jdk1.8.0_162/bin
export  CLASSPATH=.:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/jre/lib/rt.jar

url="http://127.0.0.1:8080"

tomcat_dir="/opt/tomcat"
tomcat_pid=$(ps -ef  |grep $tomcat_dir |grep -v "grep" |awk '{print $2}')
v=0
for ((i=1;i<=5;i++));do
           http_server_status=`curl --connect-timeout 20 --max-time 30 --head --silent $url |grep '200' |awk '{print $2}'`
           if [[ $http_server_status -eq 200 ]];then
                ((v++))
           fi
done

echo "The number of successful $v,time:$(date +%Y-%m-%d\ %H:%M:%S)">>/tmp/auto_check_tomcat.log
if [[ $v -eq 0 ]];then
       echo "The Tomcat isn't work!,time:$(date +%Y-%m-%d\ %H:%M:%S) ">>/tmp/auto_check_tomcat.log
       kill -9 $tomcat_pid
       systemctl restart tomcat.service

fi



