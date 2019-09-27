#!/usr/bin/env sh

[ -f "$HOME/.xprofile" ] && . ~/.xprofile

exec dwm
exec compton -b -d

autocutsel -fork &
autocutsel -selection PRIMARY --fork &
