#!/bin/bash

function odstart {
    killall onedrive || true
    bash ~/.config/onedrive/starter
    ps -fC onedrive
}

