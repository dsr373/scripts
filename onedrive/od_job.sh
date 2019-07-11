#!/bin/bash

# the number of onedrive processes that should be running
N_EXPECTED=2
PROC_NAME="onedrive"

function od_restart {
    killall onedrive || true
    bash ~/.config/onedrive/starter
    ps -fC $PROC_NAME
}

# set N_OD to the number of running processes
function num_running {    
    N_OD=$(ps --no-header -fC $PROC_NAME | wc -l)
}

function mynotify {
    notify-send --urgency=low --expire-time=2000 "$1"
}

# check if the appropriate number of instances are running
# if not, killall and start them again
function conditional_restart {
    num_running
    if (( $N_OD < $N_EXPECTED )); then
        od_restart
        mynotify "OneDrive was restarted"
        echo "$DATE -- OneDrive was restarted"
    else
        echo "$DATE -- OneDrive was running fine"
    fi
}

DATE=$(date +"%F_%R:%S")
conditional_restart

