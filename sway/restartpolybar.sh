POLYNUM=0

while [ $POLYNUM -lt 3 ]
do
	killall polybar
	sleep 1
	$HOME/.config/i3/polybar.sh
	POLYNUM=$(ps ax | grep -vE "grep|spotify_status.py|polybar.sh" | grep "polybar --reload main -c" | wc -l)
done
