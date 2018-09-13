


#!/bin/bash
#filename: zookeeper_check1.sh
#date: 2018/05/21
#author: udax.kr

###################################################             
#Use the internal command to get the corresponding#
#parameters for monitor zk-cluster-node1          # 
###################################################


echo mntr | nc 127.0.0.1 2181 | grep "$1" |awk '{print $2}'



