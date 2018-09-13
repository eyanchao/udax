
#!/bin/bash
#filename: find_max_file.sh
#date: 2016/4/14
#author: udax.kr

#find / -type f -print0 | xargs -0 du -h | sort -rh | head -n 10
find / -type f -exec du -Sh {} + | sort -rh | head -n 10



