

#!/bin/bash
#filename: auto_check_redis.sh
#date: 2018/5/15
#author: udax.kr

port='6379'
passwd=‘udaxkrredis8888’

status_redis=$(redis-cli -h '127.0.0.1' -p $port -a $passwd ping)
if [ "$status_redis" == 'PONG' ];then
        echo 'The redis is not work!'
        systemctl restart redis.service
else
        echo 'The redis is running!'
fi
