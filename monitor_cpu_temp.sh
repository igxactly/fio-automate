#!/bin/bash

while true; do echo $(date -Ins) $(sensors | grep "id 0"); sleep 1; done;
