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

