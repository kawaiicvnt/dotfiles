#!/bin/sh
# Copyright (C) 2014 Julien Bonjean <julien@bonjean.info>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

CARD="${1:-0}"
MIXER="${2:-default}" # use pulse for pulseaudio, default is alsa

case $BLOCK_BUTTON in
  2) amixer -q sset Master toggle ;; # middle click
  4) amixer -q sset Master 10%+ ;;   # scroll up
  5) amixer -q sset Master 10%- ;;   # scroll down
esac

volume () {
  amixer -c $CARD -M -D $MIXER get Master
}

format () {
  ruby -ne '$_ =~ /\[(\d+)%\] \[(on|off)\]/ and (puts $2 == "off" ? "MUTE" : "#$1%"; exit)'
}

volume | format
