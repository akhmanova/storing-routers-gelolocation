#!/bin/bash
echo -n "'{\"considerIp\": \"false\", \"wifiAccessPoints\": [" > post_data.json
N=1
while read AP
do
    AccessPoints[$N]=$AP
    ((N++))
done < <(awk '/Address/ {print $5}' iwlist_example.log)

N=1
while read AP
do
    Channel[$N]=$CN
    ((N++))
done < <(grep -e "Channel:" iwlist_example.log | while read l1; do echo $l1; done  | sed -e 's/Channel://')

N=1
while read SL
do
    SignalLevel[$N]=$SL
    ((N++))
done < <(grep "Signal level" iwlist_example.log | sed -e 's/^.*Signal level=\(.*\) dBm/\1/')

N=1
while read SL
do
    Quality[$N]=$QL
    ((N++))
done < <(grep -e "Address:" -e "level=" -e "Channel:" iwlist_example.log | while read l1 && read l2 && read l3; do echo $l1 $l2 $l3; done | awk '{print $7;}' | sed -e 's/Quality=//' | sed -e 's/\(.*\)\/.*/\1/')

for i in $(seq 1 ${#AccessPoints[@]})
do
    while [ $i -ne 1 ]
    do
        echo -n "," >> post_data.json
        break
    done
    echo -n " { \"macAddress\": \"${AccessPoints[$i]}\", " >> post_data.json
    echo -n " { \"Channel\": \"${Channel[$i]}\", " >> post_data.json
    signalToNoiseRatio[$i]=3

    echo -n "\"signalStrength\": ${SignalLevel[$i]}, \"signalToNoiseRatio\": ${signalToNoiseRatio[$i]}" >> post_data.json
done

echo -n "]}'" >> post_data.json


