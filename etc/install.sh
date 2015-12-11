#!/bin/sh

#     __ _ _           
#    / _(_) | ___  ___ 
#   | |_| | |/ _ \/ __|
#  _|  _| | |  __/\__ \
# (_)_| |_|_|\___||___/
#

set -e
set -u

export SHELLOPTS
set -o igncr

is_available() {
	which "$1" >/dev/null 2>&1
	return $?
}

if [ -z "${DOTPATH:-}" ]; then
	DOTPATH=~/.dotfiles; export DOTPATH
fi

DOTGIT="https://github.com/nobuyo/dotfiles.git"; export DOTGIT

get_dotfile() {
	if [ -d "$DOTPATH" ]; then
		echo "$DOTPATH already exists"
		exit 1
	fi

	if is_available "git"; then
			git clone --recursive "$DOTGIT" "$DOTPATH"

	elif is_available "curl"; then

		local tarball="https://github.com/nobuyo/dotfiles/archive/master.tar.gz"
		if is_available "curl"; then
		   curl -L "$tarball"
		fi | tar xvz
		if [ ! -d dotfiles-master ]; then
			log_fail "dotfiles-master: not found"
			exit 1
		fi
		command mv -f dotfiles-master "$DOTPATH"

	else
		   echo "curl required"
		   exit 1
	fi
	
	echo "Done"
}

deploy() {
	echo ""
	echo "Deploying dotfiles..."

	if [ ! -d $DOTPATH ]; then
		log_fail "$DOTPATH: not found"
		exit 1
	fi

	cd "$DOTPATH"

	make deploy &&

	echo "Done"
}

setup() {
	get_dotfile && dotfiles_deploy 
}

setup