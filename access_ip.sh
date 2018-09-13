
#!/bin/bash
#filename: access_ip.sh
#date: 2018/05/12
#author: udax.kr

###########################################
#collect the access ip from External hosts#
###########################################
date=`date`
echo "##################################"
cat /var/log/nginx/access.log | awk {'print $1'} | sort -fn | uniq
echo "##################################"
echo $date
#awk '{a[$1]+=1;}END{for(i in a){print a[i]" " i;}}' /var/log/nginx/access.log |sort -g
