#!/usr/bin/env sh

[ -f "$HOME/.xprofile" ] && . ~/.xprofile
[ -f "$HOME/.xmain" ] && . ~/.xmain

exec bspwm 