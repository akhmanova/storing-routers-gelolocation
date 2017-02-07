POST_DATA='{"considerIp": "false", "wifiAccessPoints": [ { "macAddress": "00:25:9c:cf:1c:ac", "signalStrength": -43, "signalToNoiseRatio": 0}, { "macAddress":"00:25:9c:cf:1c:ad", "signalStrength": -55, "signalToNoiseRatio": 0 }]}'

wget -O "/home/eakhmanova/git_gd/storing-routers-geolocation/geolocation.json" --post-data "$POST_DATA" --header "Content-Type: application/json" "https://www.googleapis.com/geolocation/v1/geolocate?key=AIzaSyDIcHACKMEPLZ_RATwjBk51XunLc"

git add geolocation.json

git commit -m "Geolocation changed"
