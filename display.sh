function disp-vert {
    xrandr --fb 3840x4320
    xrandr --output eDP-1 --mode 3840x2160 --scale 1x1 --pos 0x2160
    xrandr --output DP-2  --mode 1920x1080 --scale 2x2 --pos 0x0
    xrandr --output eDP-1 --scale 0.9999x0.9999  # Stop flicker
}

function disp-horiz {
    xrandr --fb 7680x2160 \
        --output eDP-1 --mode 3840x2160 --scale 1x1 --pos 3840x0 \
        --output DP-2  --mode 1920x1080 --scale 2x2 --pos 0x0 --primary
    xrandr --output eDP-1 --scale 0.9999x0.9999  # Stop flicker
}

function disp-horiz-small {
    xrandr --fb 3840x1620 \
        --output eDP-1 --mode 1920x1080 --rate 120 --scale 0.9999x0.9999 --pos 1920x540 \
        --output DP-2  --mode 1920x1080 --scale 0.9999x0.9999 --pos 0x0 --primary
}

function disp-one {
    xrandr --output eDP-1 --scale 0.9999x0.9999 --pos 0x0
}

if [ $# -eq 0 ] ; then
    echo "Usage: display.sh [-o|-v|-h]"
    echo "-o : just laptop display"
    echo "-v : external monitor on top"
    echo "-h : external monitor to the left"
else if [ $1 == "-h" ] ; then
    disp-horiz
else if [ $1 == "-v" ] ; then
    disp-vert
else if [ $1 == "-o" ] ; then
    disp-one
else if [ $1 == "-s" ] ; then
    disp-horiz-small
fi
fi
fi
fi
fi

