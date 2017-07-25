#!/bin/bash

export NOTIFY_ID=$(dunstify -u normal -t -1 -a "DMailManager" -i ~/Pictures/dman.png -h int:value:0 "Fetching emails..." "Starting DMailManager" -p)
astroid --start-polling

dmailmanager

astroid --stop-polling
dunstify -u normal -t 2 -a "DMailManager" -i ~/Pictures/dman.png -h int:value:100 "Fetching emails..." "DONE!" -r $NOTIFY_ID
notifymuch
