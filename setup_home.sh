#! /bin/sh

##Install grub customizer

sudo apt-get install -y software-properties-common python-software-properties
sudo add-apt-repository -y ppa:danielrichter2007/grub-customizer
sudo apt-get update && sudo apt-get install -y grub-customizer

sudo apt-get install -y build-essential tmux git vim curl zsh gparted ctags ruby rake

##Setup tmux configuration
touch .tmux.conf
cp tmux.conf ~/.tmux.conf

#Install Oh My Zsh shell
curl -L http://install.ohmyz.sh | sh

##Adding aliases:
touch .zsh_aliases

# Load the alias file
echo ". ~/.zsh_aliases" >> .zshrc

# Install Janus vim
curl -L https://bit.ly/janus-bootstrap | bash
cp vimrc.after ~/.vimrc.after
cd .vim/janus/vim/colors/
git clone https://github.com/SunnyRaj/cobalt2-vim-theme.git
cd -

## Make zsh your default shell. Do not use sudo
chsh -s /bin/zsh
