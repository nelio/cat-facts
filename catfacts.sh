#!/usr/bin/env bash

curl -s -o /tmp/cat_pirate.icns http://www.icons101.com/icon_icns/id_7736/cat_pirate.icns

function displayFact() {
  osascript <<EOT
    tell app "System Events"
      display dialog "$1" buttons {"OK"} default button 1 with icon file ("tmp:cat_pirate.icns") with title "Facts about cats"
      return  -- Suppress result
    end tell
EOT
}
PYTHONIOENCODING=utf8
fact=$(curl -s http://catfacts-api.appspot.com/api/facts|python -c "import sys, json; print json.load(sys.stdin)['facts'][0]")

displayFact "$fact"

rm /tmp/cat_pirate.icns