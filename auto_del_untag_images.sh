

#!/bin/bash
#filename: auto_del_untag_images.sh
#date: 2018/05/09
#author: ags.best

###############################
# auto clear the untag images #
###############################

#delete the tag as "none" or untag images.

docker rmi -f  `docker images | grep '<none>' | awk '{print $3}'`
