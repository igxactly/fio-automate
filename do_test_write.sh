#!/bin/bash

if [ "$#" -ne 3 ] ; then
	echo "!!! usage: $0 testTitle blockSize queueDepth";
	exit 0;
fi;

title=$1;
bs=$2;
qd=$3;

echo \
"
[global]
group_reporting
numjobs=8
runtime=60

direct=1
ioengine=libaio
iodepth=${qd}
bs=${bs}

rw=randwrite

[nvme_read_${title}]
filename=/dev/nvme0n1
" \
| sudo fio - ;

