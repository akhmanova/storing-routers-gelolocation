$GOOGLE_KEY="AIzaSyDIcQLFKJrvON96_G76_RATwjBk51XunLc"

$OUR_DIR="/home/eakhmanova/git_gd"

$POST_DATA='{"considerIp": "false", "wifiAccessPoints": [ { "macAddress": "00:25:9c:cf:1c:ac", "signalStrength": -43, "signalToNoiseRatio": 0}, { "macAddress":"00:25:9c:cf:1c:ad", "signalStrength": -55, "signalToNoiseRatio": 0 }]}'

wget -O "$OUR_DIR/geolocation.json" —post-data "$POST_DATA" —header "Content-Type: application/json" "https://www.googleapis.com/geolocation/v1/geolocate?key=$GOOGLE_KEY"
