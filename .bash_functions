#!/bin/bash

function odstart {
    killall onedrive || true
    bash ~/.config/onedrive/starter
    ps -fC onedrive
}

function bboff {
    sudo tee /proc/acpi/bbswitch <<<OFF
}

function bbon {
    sudo tee /proc/acpi/bbswitch <<<ON
}

function odsync {
    onedrive --synchronize --confdir="~/.config/onedrive/personal" &
    onedrive --synchronize --confdir="~/.config/onedrive/uni" &
}

function mtl-run {
    full_path=`readlink -f $1`
    echo "Running matlab on $full_path"
    matlab -nosplash -nodesktop -r "run('$full_path')"
}

function bat_pw {
    if [ $# -eq 0 ] ; then
        bat="BAT0"
    else
        bat=$1
    fi
    curr=$(cat /sys/class/power_supply/$bat/current_now)
    volt=$(cat /sys/class/power_supply/$bat/voltage_now)
    str="scale=2; $curr * $volt / 10^12"
    watt=$(echo "$str" | bc -l)
    echo "$watt W"
}

