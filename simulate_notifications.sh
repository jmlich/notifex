#!/bin/bash

i=0
while /bin/true; do 
    notify-send -p -t 30000 "Title" "notification $i - stays for 30s"
    i=$((i+1))
    sleep 5
done
