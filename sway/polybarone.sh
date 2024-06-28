if type "xrandr"; then
  count=1
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    if [ $count -lt 3 ] ; then
      MONITOR=$m polybar --reload main -c $HOME/.config/polybar/blocks/config.ini &
    fi
    let "count += 1";
    #echo $count
  done
else
  polybar --reload main -c $HOME/.config/polybar/blocks/config.ini &
fi
