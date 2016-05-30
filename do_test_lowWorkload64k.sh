#!/bin/bash

# if [[ "$#" < 3 ]] && [ "$#" > 6 ]  ; then
# 	echo "!!! usage: $0 testTitle blockSize queueDepth (runTime outFormat numJobs) #():optional";
# 	exit 0;
# fi;

title=${1}; #$(uname -r | sed 's/\([0-9]\.[0-9]\+\).\+/\1/g');
bssplit="64k/100";
qd=1;
runt=10;
format="json";
job=1;

echo \
"
[global]
group_reporting
numjobs=${job}
runtime=${runt}

direct=1
ioengine=libaio
iodepth=${qd}
bssplit=${bssplit}

rw=randrw
rwmixwrite=100

[fio_${title}]
filename=/dev/nvme0n1
" \
| sudo fio --output-format=${format} - ;

