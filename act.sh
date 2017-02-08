#!/bin/bash

N=1
while read AP
do
    AccessPoints[$N]=$AP
    ((N++))
done < <(awk '/Address/ {print $5}' iwlist_example.log)

N=1
while read SL
do
    SignalLevel[$N]=$SL
    ((N++))
done < <(grep "Signal level" iwlist_example.log | sed -e 's/^.*Signal level=\(.*\) dBm/\1/')

for i in $(seq 1 ${#AccessPoints[@]})
do
    echo "Access Point: ${AccessPoints[$i]}"
    echo "Signal Level: ${SignalLevel[$i]}"
done
