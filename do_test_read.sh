#!/bin/bash

if [[ "$#" < 3 ]] && [ "$#" > 6 ]  ; then
	echo "!!! usage: $0 testTitle blockSize queueDepth (runTime outFormat numJobs) #():optional";
	exit 0;
fi;

title=$1;
bs=$2;
qd=$3;
runt=${4:=60};
format=${5:="normal"};
job=${6:=8};

echo \
"
[global]
group_reporting
numjobs=${job}
runtime=${runt}

direct=1
ioengine=libaio
iodepth=${qd}
bs=${bs}

rw=randread

[nvme_read_${title}]
filename=/dev/nvme0n1
" \
| sudo fio --output-format=${format} - ;

