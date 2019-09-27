#!/bin/sh

echo "Linking"
files=(
	".vimrc"
	".xinitrc"
	".zshrc"
	".config/compton.conf"
)

backup=$HOME/.dotfilebackup
mkdir -p $backup
 
for file in "${files[@]}"
do
	filepath="$HOME/$file"
	if [ ! -f "$filepath" ]; then
		echo "$filepath exist (backing up)"
		mv $filepath $backup
		rm $filepath
	fi
	ln -s $HOME/.dotfiles/$file $filepath
	echo "$filepath cerated!"
done 
