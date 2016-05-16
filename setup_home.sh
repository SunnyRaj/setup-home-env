#! /bin/sh

##Install grub customizer

sudo apt-get install -y software-properties-common python-software-properties
sudo add-apt-repository -y ppa:danielrichter2007/grub-customizer
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install -y grub-customizer

sudo apt-get install -y build-essential git vim curl zsh gparted ctags ruby rake python-pip libevent-dev

##Install gcc-6 and make it default
##http://askubuntu.com/questions/466651/how-do-i-use-the-latest-gcc-on-ubuntu-14-04
sudo apt-get install -y gcc-6 g++-6
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 60 --slave /usr/bin/g++ g++ /usr/bin/g++-6

##Install latest tmux
git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure && make
sudo mv ./tmux /usr/local/bin
cd ..

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

echo "Exit and relogin to experience your new home"
#Instructions to install on Mac
#brew install python
#sudo easy_install pip
#pip install --upgrade pip
#brew install powerline
#sudo -H pip install --user git+git://github.com/Lokaltog/powerline --verbose
#sudo -H pip install psutil
#brew remove vim
#brew install vim
