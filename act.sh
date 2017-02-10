#!/bin/bash
echo -n "{\"considerIp\": \"false\", \"wifiAccessPoints\": [" > post_data.json
N=1
while read AP
do
    AccessPoints[$N]=$(echo $AP | tr "[:upper:]" "[:lower:]")
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
    while [ $i -ne 1 ]
    do
        echo -n "," >> post_data.json
        break
    done
    echo -n " { \"macAddress\": \"${AccessPoints[$i]}\", " >> post_data.json
    echo -n "\"signalStrength\": ${SignalLevel[$i]} }" >> post_data.json
done

echo -n "]}" >> post_data.json


