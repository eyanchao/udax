


#!/bin/bash
#filename: auto_clear_logs.sh
#describe:auto clear containers logs
#author: ags.best
#date: 2018/10/10
 

logs=$(find /var/lib/docker/containers/ -name *-json.log)
 
for log in $logs
        do
                echo "clean logs : $log"
                cat /dev/null > $log
        done
 
