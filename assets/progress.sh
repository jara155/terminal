#!/bin/bash
progress(){
    i=100
    for ((i = 0 ; i <= 100 ; i+=5)); do
        sleep 0.15
        str=`printf '%*s' $i ''|tr ' . ' '#'`
        echo -n "[$str] $i"%$'\r'
    done
    echo
}
