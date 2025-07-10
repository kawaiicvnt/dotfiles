if status is-interactive
	# Commands to run in interactive sessions can go here
	macchina | sed "s/\( Type1ProductConfigId\| 103C_5335M8\)//g" | sed "s/ 13-/ 13-bf0xxx/g"| sed "s/13-bf0xxxbf0xxx/13-bf0xxx/g"
	echo
	df -hT -t ext4 -t fuseblk | grep -v '/boot'
end

alias ll "ls -l"
alias la "ls -la"
alias sl='exec dbus-launch sway -c ~/.config/sway/config'
alias ssh="TERM=xterm-256color $(which ssh)"
alias spw="startplasma-wayland"
alias i3l="xinit -- :0 vt2"
alias ffmpreg="ffmpeg"
alias factorio-steam="steam steam://rungameid/427520"
alias mbit="picocom -b 115200 -c -d 8 --imap lfcrlf"
alias pause="kill -STOP $(pgrep -f \$1)"
alias cont="kill -CONT $(pgrep -f \$1)"
alias pauseall="killall -STOP"
alias contall="killall -CONT"
