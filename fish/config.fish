if status is-interactive
	# Commands to run in interactive sessions can go here
	#macchina | sed "s/\( Type1ProductConfigId\| 103C_5335M8\)//g" | sed "s/ 13-/ 13-bf0xxx/g"| sed "s/13-bf0xxxbf0xxx/13-bf0xxx/g"
	#echo
	df -hT -t btrfs -t vfat
end

# If the term is kitty and we're not in a toolbox, do make sure we spawn a kitten when ssh-ing.
if test $TERM = "xterm-kitty"
    and test $hostname != "toolbx"
  alias ssh="kitty +kitten ssh"	
end

# Check if we're in a toolbox
if test -e "/run/.containerenv"
    and test $hostname = "toolbx"
  set -x fish_history tbx_$(grep "name=\"" /run/.containerenv | sed 's/name=\"//; s/.$//')
else
  set -x fish_history $HOSTNAME
end

set -gxa PATH ~/.nix-profile/bin
set -gxa PATH ~/.local/bin
set -gxa PATH ~/node_modules/.bin

set -gx EDITOR $(which vim)

# alias ssh="TERM=xterm-256color $(which ssh)"

alias ll="ls -lahGA --group-directories-first"
alias la="ls -lahGA --group-directories-first"
alias sl='exec dbus-launch sway -c ~/.config/sway/config'
alias spw="startplasma-wayland"
alias i3l="xinit -- :0 vt2"
alias ffmpreg="ffmpeg"
alias factorio-steam="steam steam://rungameid/427520"
alias mbit="picocom -b 115200 -c -d 8 --imap lfcrlf"
alias pause="kill -STOP $(pgrep -f \$1)"
alias cont="kill -CONT $(pgrep -f \$1)"
alias pauseall="killall -STOP"
alias contall="killall -CONT"
