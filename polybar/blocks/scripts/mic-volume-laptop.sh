#!/bin/bash

display_volume() {
	if [ -z "$volume" ]; then
	  echo "No Mic Found"
	else
	  volume="${volume//[[:blank:]]/}" 
	  if [[ "$mute" == *"yes"* ]]; then
	    echo "[$volume]"
	  elif [[ "$mute" == *"no"* ]]; then
	    echo "$volume"
	  else
	    echo "$volume !"
	  fi
	fi
}

SOURCE="0"
declare -i LEFT=$(pactl get-source-volume $SOURCE | tr ":" "\n" | tr "/" "\n" | tr " " "\n" | grep "%" | head -n1 | tr "%" "\n" | head -n1)
declare -i RIGHT=$(pactl get-source-volume $SOURCE | tr ":" "\n" | tr "/" "\n" | tr " " "\n" | grep "%" | tail -n1 | tr "%" "\n" | head -n1)
((combined=($RIGHT+$LEFT)/2))

if [ $combined -gt 100 ]; then
	pactl set-source-volume $SOURCE 100%
	pkill -f "bash $HOME/.config/polybar/blocks/scripts/mic-volume.sh"
fi

case $1 in
	"show-vol")
		COUNTER=3
		while [ true ]
		do
			if [ -z "$2" ]; then
  				#declare -i LEFT=$(pactl get-source-volume 0 | tr ":" "\n" | tr "/" "\n" | tr " " "\n" | grep "\%" | head -n1 | tr "\%" "\n" | head -n1)
  				#declare -i RIGHT=$(pactl get-source-volume 0 | tr ":" "\n" | tr "/" "\n" | tr " " "\n" | grep "\%" | tail -n1 | tr "\%" "\n" | head -n1)
  				#((combined=($RIGHT+$LEFT)/2))
				yes="yes"
				cmp=$(pactl get-source-mute $SOURCE | tr " " "\n" | tail -n1)
				if [ "$cmp" == "$yes" ]; then
  					echo "Muted"
  				else
  					echo $combined"%"
  				fi
			else
				echo 30
  				#volume=$(pacmd list-sources | grep "$2" -A 6 | grep "volume" | awk -F/ '{print $2}')
  				#mute=$(pacmd list-sources | grep "$2" -A 11 | grep "Muted" )
				#display_volume
			fi
			if [ $COUNTER -gt 0 ]; then
				sleep 3
				let "COUNTER--"
			else
				sleep 15
			fi

		done
		;;
	"inc-vol")
		if [ -z "$2" ] && [ $combined -lt 99 ]; then
			COUNTER=5
			#pactl set-source-volume $DEFAULT_SOURCE_INDEX +7%
			pactl set-source-volume $SOURCE +2%
			#amixer -D pulse sset Capture 2%+
			pkill -f "bash $HOME/.config/polybar/blocks/scripts/mic-volume.sh"
			#pkill -f "polybar --reload main -c /home/$USER/.config/polybar/blocks/config.ini"
		elif [ $combined -lt 100 ]; then
			pactl set-source-volume $SOURCE +1%
			pkill -f "bash $HOME/.config/polybar/blocks/scripts/mic-volume.sh"
		fi
		;;
	"dec-vol")
		if [ -z "$2" ]; then
			COUNTER=5
			#pactl set-source-volume $DEFAULT_SOURCE_INDEX -7%
			pactl set-source-volume $SOURCE -2%
			#amixer -D pulse sset Capture 2%-
			pkill -f "bash $HOME/.config/polybar/blocks/scripts/mic-volume.sh"
		else
			echo 50
		fi
		;;
	"mute-vol")
		if [ -z "$2" ]; then
			COUNTER=5
			#pactl set-source-mute $DEFAULT_SOURCE_INDEX toggle
			pactl set-source-mute $SOURCE toggle
			#amixer -D pulse sset Capture toggle
			pkill -f "bash $HOME/.config/polybar/blocks/scripts/mic-volume.sh"
		else
			#pactl set-source-mute $2 toggle
			echo 59
		fi
		;;
	*)
		echo "Invalid script option"
		;;
esac
