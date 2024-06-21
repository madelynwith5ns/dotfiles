#!/usr/bin/env bash

player=$(polybar-playerctl.sh)
date_formatted=$(date "+%a %F %H:%M")
uptime_formatted=$(uptime | cut -d ',' -f1  | cut -d ' ' -f4,5)
mem_formatted=$(free -m | awk 'NR==2{printf "MEM %sM (%.2f%%)\n", $3,$3*100/$2 }')
cpu_formatted=$(top -bn1 | grep load | awk '{printf "CPU %.2f%\n", $(NF-2)}')
window=$(swaymsg -t get_tree | jq -r '.. | (.nodes? // empty)[] | select(.pid and .visible) | {name} + .rect | "\(.name)"')

echo $window \| AUDIO $player \| $cpu_formatted \| $mem_formatted \| UP $uptime_formatted \| $date_formatted
