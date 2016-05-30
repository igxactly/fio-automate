#!/bin/bash

# if [[ "$#" < 3 ]] && [ "$#" > 6 ]  ; then
# 	echo "!!! usage: $0 testTitle blockSize queueDepth (runTime outFormat numJobs) #():optional";
# 	exit 0;
# fi;

title=${1}; # "$(uname -r)_normalWorkload";
bssplit="4k/70:8k/10:16k/10:64k/10";
qd=8;
runt=10;
format="json";
job=4;

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
rwmixwrite=90

[fio_${title}]
filename=/dev/nvme0n1
" \
| sudo fio --output-format=${format} - ;

