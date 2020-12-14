#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")" || exit 1;

git pull origin main;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".osx" \
		--exclude "keyboard" \
		--exclude "terminal" \
		--exclude "theme" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;
	# source ~/.zshrc;
}

if [ "$1" == "--force" ] || [ "$1" == "-f" ]; then
	doIt;
else
	read -rp "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;