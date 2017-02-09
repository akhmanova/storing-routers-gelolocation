#!/bin/bash

source vars
hostname = `cat /etc/hostname`
OUR_DIR="/tmp/geolocation/$hostname"

if [ ! -d ".git" ]
then 
    git clone https://github.com/akhmanova/storing-routers-gelolocation.git
    git push origin master
fi

if [ ! -d "$hostname" ]
then 
    mkdir $hostname
fi

cd $hostname
wget -O "geolocation.json" --post-file=post_data.json --header "Content-Type: application/json" "https://www.googleapis.com/geolocation/v1/geolocate?key=$GOOGLE_KEY"

git add geolocation.json

git commit -m "Geolocation changed"
git push origin master

