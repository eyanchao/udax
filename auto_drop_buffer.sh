
#!/bin/bash
#filename: auto_drop_buffer.sh
#describe:auto drop buffer to memeory
#author: cod777.io
#date: 2018/6/22

######################################
#  auto drop the buffer to memeory   #
######################################

echo 3 > /proc/sys/vm/drop_caches 2>&1
