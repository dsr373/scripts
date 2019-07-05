function disp-vert {
    xrandr --output eDP-1 --scale 1x1 --pos 0x2160
    xrandr --output DP-2 --scale 2x2 --pos 0x0
}

function disp-horiz {
    xrandr --output eDP-1 --scale 1x1 --pos 3840x0
    xrandr --output DP-2 --scale 2x2 --pos 0x0
}

function disp-one {
    xrandr --output eDP-1 --scale 1x1 --pos 0x0
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
fi
fi
fi
fi

