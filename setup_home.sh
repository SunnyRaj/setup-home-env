#! /bin/sh


sudo apt-get install -y build-essential tmux git vim curl zsh gparted

mkdir Projects && sudo wget -O - https://github.com/sunnyraj/vimrc/raw/master/autoinstall.sh | sh

curl -L http://install.ohmyz.sh | sh

##Adding aliases:

touch .zsh_aliases

echo "

alias nimbus=\"ssh -X sundarcs@nimbus.seas.gwu.edu\"


## Colorize the ls output
alias ls=\'ls --color=auto\'

## Use a long listing format ##
alias ll=\'ls -la\'

## Show hidden files ##
alias l.=\'ls -d .* --color=auto\'

" >> .zsh_aliases

# Load the alias file
echo ". ~/.zsh_aliases" >> .zshrc

## Make zsh your default shell. Do not use sudo

chsh -s /bin/zsh

##Install grub customizer

sudo apt-get install -y software-properties-common python-software-properties && sudo add-apt-repository ppa:danielrichter2007/grub-customizer && sudo apt-get update && sudo apt-get install -y grub-customizer

##Setup tmux configuration

touch .tmux.conf

cp tmux.conf ~/.tmux.conf
