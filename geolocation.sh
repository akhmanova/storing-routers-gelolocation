#!/bin/bash

source vars
wget -O "geolocation.json" --post-file=post_data.json --header "Content-Type: application/json" "https://www.googleapis.com/geolocation/v1/geolocate?key=$GOOGLE_KEY"
