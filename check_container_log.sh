


#!/bin/bash
#filename: auto_clear_logs.sh
#describe:auto clear tomcat & system logs
#author: udax.kr
#date: 2018/6/22


ls -lh $(find /var/lib/docker/containers/ -name *-json.log)
