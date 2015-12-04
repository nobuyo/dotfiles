#!/bin/sh
 
kernel=$(uname -r)
kernel=$(echo "${kernel}" | sed -e 's/(.*)//')
 
packages=$(($(cygcheck -cd | wc -l) - 2))
 
cpu=$(cat /proc/cpuinfo | grep 'model name' | sed -e 's/^.*: *//')
# removes (R) and (TM) from the CPU name so it fits in a standard 80 window
cpu=$(echo "${cpu}" | awk '$1=$1' | sed 's/([A-Z]\{1,2\})//g')
 
memorykb=$(cat /proc/meminfo | grep MemTotal: | sed -e 's/MemTotal: *//' -e 's/kB//')
memorymb=$((memorykb/1024))
 
echo -e "
      _______________,
   .QQQQQQQQQQQQQQQQQQQQL_
  .QQQQQQQQQQQQQQQQQQQQQQQQ_
 QQQQQQQQQQQQQQQQQQQQQQFQ==
 QQQQQQQ=============!             User: $(whoami)
 QQQQQQ                            Hostname: $(hostname)
 QQQQQQ\033[0;32m  ~\"jj__,   \033[0;39m                  OS: $(uname)       
 QQQQQQ\033[0;32m     \"jjjjjjjj___    \033[0;39m           Kernel : ${kernel} ($(uname -m))
 QQQQQQ\033[0;32m      _jjjjjjjjjjj/~~~  \033[0;39m        Shell : ${SHELL}
 QQQQQQ\033[0;32m    .{jjjjj/~~~~~      \033[0;39m         Terminal : ${TERM}
 QQQQQQ\033[0;32m  .{/~~~\`         \033[0;39m            Packages: ${packages}
 QQQQQQ                            Memory: ${memorymb}MB 
 QQQQQQQL____________,             Disk: $(df -h / | tail -1 | awk '{print $2}')B
 4QQQQQQQQQQQQQQQQQQQQQQQ___
   QQQQQQQQQQQQQQQQQQQQQQQQ==
     QQQQQQQQQQQQQQQQQQQF=
"