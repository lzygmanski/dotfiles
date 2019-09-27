#!/usr/bin/env sh

[ -f "$HOME/.xprofile" ] && . ~/.xprofile

exec dwm
exec compton -b -d --config ~/.config/.compton.conf

autocutsel -fork &
autocutsel -selection PRIMARY --fork &
