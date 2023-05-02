#!/bin/bash

socat -d pty,link=$SOCAT_PRINTER_LINK,raw,user=root,mode=777 $SOCAT_PRINTER_TYPE:$SOCAT_PRINTER_HOST:$SOCAT_PRINTER_PORT &
/usr/local/bin/octoprint serve --iknowwhatimdoing --host 0.0.0.0 --port 8080

