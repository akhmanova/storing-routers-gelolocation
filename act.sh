N=1
cat iwlist_example.log | awk '/Address/ {print $5}'| while read AP
do
AccessPoints[$N]=$AP
N=$((N+1))
done
