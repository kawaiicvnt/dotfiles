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

case $1 in
	"show-vol")
		while [ true ]
		do
			if [ -z "$2" ]; then
  				declare -i LEFT=$(amixer -D pulse sget Capture | grep "Front Left" | grep "\[on\]" | cut -c 30-31)
  				declare -i RIGHT=$(amixer -D pulse sget Capture | grep "Front Left" | grep "\[on\]" | cut -c 30-31)
  				((combined=($RIGHT+$LEFT)/2))
  				if [ $combined -eq 0 ]; then
  					echo "muted"
  				else
  					echo $combined
  				fi
			else
				echo 30
  				#volume=$(pacmd list-sources | grep "$2" -A 6 | grep "volume" | awk -F/ '{print $2}')
  				#mute=$(pacmd list-sources | grep "$2" -A 11 | grep "muted" )
				#display_volume
			fi
		sleep 3
		done
		;;
	"inc-vol")
		if [ -z "$2" ]; then
			#pactl set-source-volume $DEFAULT_SOURCE_INDEX +7%
			amixer -D pulse sset Capture 2%+
			pkill -f "mic-volume.sh"
		else
			#pactl set-source-volume $2 +7%
			echo 42
		fi
		;;
	"dec-vol")
		if [ -z "$2" ]; then
			#pactl set-source-volume $DEFAULT_SOURCE_INDEX -7%
			amixer -D pulse sset Capture 2%-
			pkill -f "mic-volume.sh"
		else
			echo 50
		fi
		;;
	"mute-vol")
		if [ -z "$2" ]; then
			#pactl set-source-mute $DEFAULT_SOURCE_INDEX toggle
			amixer -D pulse sset Capture toggle
			pkill -f "mic-volume.sh"
		else
			#pactl set-source-mute $2 toggle
			echo 59
		fi
		;;
	*)
		echo "Invalid script option"
		;;
esac
