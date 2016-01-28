#! /bin/sh

##Install grub customizer

sudo apt-get install -y software-properties-common python-software-properties
sudo add-apt-repository -y ppa:danielrichter2007/grub-customizer
sudo apt-get update && sudo apt-get install -y grub-customizer

sudo apt-get install -y build-essential tmux git vim curl zsh gparted ctags ruby rake python-pip

##Setup tmux configuration
cp tmux.conf ~/.tmux.conf

#Install Oh My Zsh shell
cd ~/
curl -L http://install.ohmyz.sh | sh

##Adding aliases:
touch .zsh_aliases

# Load the alias file
echo ". ~/.zsh_aliases" >> .zshrc

# Install Janus vim
curl -L https://bit.ly/janus-bootstrap | bash
cp ~/setup-home-env/vimrc.after ~/.vimrc.after
cd ~/.vim/janus/vim/colors/
git clone https://github.com/SunnyRaj/cobalt2-vim-theme.git
cd ~/

## Powerline installation
sudo pip install git+git://github.com/Lokaltog/powerline

## Powerline Font installation
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
sudo mv PowerlineSymbols.otf /usr/share/fonts/
sudo fc-cache -vf
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
cat ~/setup-home-env/zshrc >> ~/.zshrc

## Make zsh your default shell. Do not use sudo
chsh -s /bin/zsh
