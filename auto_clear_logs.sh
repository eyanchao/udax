

#!/bin/bash
#filename: auto_clear_logs.sh
#describe:auto clear tomcat & system logs
#author: udax.kr
#date: 2018/6/22

#find / -type f -print0 | xargs -0 du -h | sort -rh | head -n 10
find / -type f -exec du -Sh {} + | sort -rh | head -n 20 >> /tmp/file_max20.log 2>&1
find /opt/apache-tomcat-8.0.52/logs/* | grep -v catalina.out | xargs rm -rf &&  find /opt/tomcat/logs/* | grep -v catalina.out | xargs rm -rf
echo > /opt/apache-tomcat-8.0.52/logs/* | grep catalina.out  &&  echo > /opt/tomcat/logs/* | grep catalina.out


