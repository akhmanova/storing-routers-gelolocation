#!/bin/bash

source vars

wget -O "/home/eakhmanova/git_gd/storing/geolocation.json" --post-file=post_data.json --header "Content-Type: application/json" "https://www.googleapis.com/geolocation/v1/geolocate?key=$GOOGLE_KEY"

git add geolocation.json

git commit -m "Geolocation changed"

