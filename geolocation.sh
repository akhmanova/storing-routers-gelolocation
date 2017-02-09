#!/bin/bash

source vars

OUR_DIR="/tmp/geolocation/$(hostname)"

if [ ! -d ".git" ]
then 
    git init
    git remote add origin https://github.com/akhmanova/storing-routers-gelolocation.git
    git push -u origin master
fi

cd $(hostname)
wget -O "/home/eakhmanova/git_gd/storing/geolocation.json" --post-file=post_data.json --header "Content-Type: application/json" "https://www.googleapis.com/geolocation/v1/geolocate?key=$GOOGLE_KEY"

git add geolocation.json

git commit -m "Geolocation changed"

