#!/bin/sh

#     __ _ _           
#    / _(_) | ___  ___ 
#   | |_| | |/ _ \/ __|
#  _|  _| | |  __/\__ \
# (_)_| |_|_|\___||___/
#

set -e
set -u

setup() {

    dotfiles=$HOME/.dotfiles

    has() {
        type "$1" > /dev/null 2>&1
    }

    symlink() {
        [ -e "$2" ] || ln -s "$1" "$2"
    }

    if [ -d "$dotfiles" ]; then
        (cd "$dotfiles" && git pull --rebase)
    else
        git clone https://github.com/YOUR_ACCOUNT/.dotfiles "$dotfiles"
    fi

    has git && symlink "$dotfiles/.gitconfig" "$HOME/.gitconfig"
    has git && symlink "$dotfiles/.zshrc" "$HOME/.zshrc"
    has vim && symlink "$dotfiles/.vimrc" "$HOME/.vimrc"
}

setup