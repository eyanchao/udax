

#!/bin/bash
#filename: auto_pub_src.sh
#describe:auto update & publish backend-manager
#author: udax.kr
#date: 2018/6/22

src_dir=/opt/udax/web

Date=`date +%m-%d-%H%M`

echo `date` >> /tmp/auto_pub_src.log

sudo tar -zcvPf /backup/web/src_$Date.tar.gz $src_dir >>/dev/null
echo "src后端web应用备份成功..." >> /tmp/auto_pub_src.log

echo "删除旧的应用文件..." >> /tmp/auto_pub_src.log
sleep 10




