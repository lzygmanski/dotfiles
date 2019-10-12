#!/bin/sh

echo "Linking Started"
files=(
	".vimrc"
	".xinitrc"
	".zshrc"
	".bashrc"
	".config/compton.conf"
	".config/nvim/nvim.init"
)

backup=$HOME/.dotfiles-backup
rm -R $backup
mkdir -p $backup
 
for file in "${files[@]}"
do
	filepath="$HOME/$file"
	if [ -f "$filepath" ]; then
		# TODO Handle backup
		rm $filepath
	fi
	ln -s $HOME/.dotfiles/$file $filepath
	echo "$filepath cerated!"
done
echo "Linkig Finished"
