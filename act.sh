#!/bin/bash

N=1
awk '/Address/ {print $5}' iwlist_example.log  
while read AP
do
AccessPoints[$N]=$AP
N=$((N+1))
done
N=1
cat grep "Signal level" iwlist_example.log | sed -e 's/^.*Signal level=\(.*\) dBm/\1/'  
while read SL
do
SignalLevel[$N]=$SL
N=$((N+1))
done

