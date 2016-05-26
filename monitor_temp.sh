#!/bin/bash
while true; do echo $(date -Ins) $(sudo smartctl -d scsi -a -l scttemp /dev/nvme0n1 | grep Current | sed 's/Current.\+:\s\+\([0-9]\+\)\s\+C/\1°C/g'); sleep 1; done;
