## Simple script to monitor disks usage
## Prints ok if ALL disks have usage below its limit
## Prints ko if ONE disk have usage over its limit

#!/bin/bash

declare -A disks=( ["vda1"]=60 ["sda"]=80 )
OK='ok'

for disk in "${!disks[@]}"; do
	USAGE=$(df --sync /dev/$disk | awk 'BEGIN{} {percent+=$5;} END{print percent}')
	if [ $USAGE -gt ${disks[$disk]} ]; then
		OK='ko'
	fi
done

echo $OK
