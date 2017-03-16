#!/usr/bin/env sh

##
#
#   To Update CMD + Space bar > Terminal
#   curl -sL https://raw.githubusercontent.com/rogersilvasouza/my-setup/master/osx/update-git/update-git.sh | sh
#

printf '\e[1;31mgit --version\e[0m\n'
git --version

printf '\e[1;31mbrew install git\e[0m\n'
brew install git

printf '\e[1;31mbrew link git\e[0m\n'
brew link git

printf '\e[1;31msource ~/.zshrc\e[0m\n'
source ~/zshrc
