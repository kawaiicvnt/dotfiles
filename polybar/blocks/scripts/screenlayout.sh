#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

dir="~/.config/polybar/blocks/scripts/rofi"

rofi_command="rofi -dpi 150 -theme $dir/powermenu.rasi"

# Options
portable="Portable"
samsung="Samsung 4K"
usbc="USBC portable"

# Variable passed to rofi
options="$portable\n$samsung\n$usbc"

chosen="$(echo -e "$options" | $rofi_command -p "Select monitor layout:")"
case $chosen in
    $portable)
		xrandr --output eDP-1 --pos 0x0
	;;
    $samsung)
		xrandr --output eDP-1 --pos 3840x360 --output DP-1 --auto --pos 0x0
	;;
    $usbc)

	;;	
esac
