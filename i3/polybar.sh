#!/bin/sh

# Check if polybar is already running
SERVICE="polybar"

if ps ax | grep -v grep | grep -v "polybar.sh" | grep $SERVICE > /dev/null
then
  echo "polybar already running! Please kill it first."
  exit 0;
fi


if type "xrandr"; then
  count=1
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    #if [ $count -lt 3 ] ; then
    MONITOR=$m polybar --reload main -c /home/v4ngbz/.config/polybar/blocks/config.ini &
    #fi
    let "count += 1";
    echo $count
  done
else
  polybar --reload main -c /home/v4ngbz/.config/polybar/blocks/config.ini &
fi
