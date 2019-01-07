#!/bin/bash

cd "/opt/atlassian/crucible/fecru-4.6.1/bin"

case "$1" in
    start)
        ./start.sh
        ;;
    
    stop)
        ./stop.sh
        ;;
    
    *)
        echo "Usage: $0 {start|stop}"
        exit 1
        ;;

esac