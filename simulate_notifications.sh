#!/bin/bash

i=0
while /bin/true; do 
    notify-send "test" "hello world $i"
    i=$((i+1))
    sleep 5
done
