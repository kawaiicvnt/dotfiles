#! /bin/sh
echo "make sure this is run in and from your dotfiles directory"

# link folders / files
ln -s "$PWD/.zshrc"  	"$HOME/.zshrc"
ln -s "$PWD/dunst"   	"$HOME/.config/dunst"
ln -s "$PWD/i3"      	"$HOME/.config/i3"
ln -s "$PWD/kitty"   	"$HOME/.config/kitty"
ln -s "$PWD/picom"   	"$HOME/.config/picom"
ln -s "$PWD/polybar" 	"$HOME/.config/polybar"
ln -s "$PWD/thunar"  	"$HOME/.config/thunar"
ln -s "$PWD/waybar"  	"$HOME/.config/waybar"
ln -s "$PWD/sway"    	"$HOME/.config/sway"
ln -s "$PWD/swaylock"	"$HOME/.config/swaylock"
ln -s "$PWD/avizo"	"$HOME/.config/avizo"
ln -s "$PWD/macchina"	"$HOME/.config/macchina"
ln -s "$PWD/ascii"	"$HOME/.config/ascii"
ln -s "$PWD/fish"	"$HOME/.config/fish"
ln -s "$PWD/mpv"	"$HOME/.config/mpv"
ln -s "$PWD/hypr"	"$HOME/.config/hypr"

# install needed bins w/ pacman
sudo pacman -Sy dunst i3-wm kitty picom polybar thunar rofi zsh sway waybar

# install pipewire and audio stuff
sudo pacman -Sy pipewire pipewire-pulse alsa alsa-utils pavucontrol

paru -Sy smart-playerctl-git uwufetch oh-my-zsh-git volumectl avizo

# make github directory and clone needed repos
mkdir -p $HOME/.git/github/
cd $HOME/.git/github/
git clone --depth=1 https://github.com/Jvanrhijn/polybar-spotify.git
git clone --depth=1 https://github.com/haideralipunjabi/polybar-browsermediacontrol.git
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git
