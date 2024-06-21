#!/usr/bin/env bash

playerctlstatus=$(playerctl status 2> /dev/null)

if [[ $playerctlstatus ==  "" ]]; then
    echo "No Players"
elif [[ $playerctlstatus =~ "Playing" ]]; then
    echo "$(playerctl metadata artist) - $(playerctl metadata title)"
else
    echo "Nothing Playing"
fi

