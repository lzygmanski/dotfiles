#!/usr/bin/env sh

[ -f "$HOME/.xprofile" ] && . ~/.xprofile

exec dwm

autocutsel -fork &
autocutsel -selection PRIMARY --fork &
