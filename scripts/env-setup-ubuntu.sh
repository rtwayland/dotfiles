#!/usr/bin/env bash

# Install zsh, ohmyzsh, and change shells
sudo apt-get install zsh
sudo apt-get install git-core
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh`

# Set up zsh syntax highlighting, autosuggestions, and nvm
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting 
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone git://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

# Install dotfiles
cd && git clone https://github.com/rtwayland/dotfiles.git .dotfiles
cd .dotfiles
git fetch && git checkout ubuntu && git pull
rm ~/.zshrc && ./install

# Install NeoVim
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
sudo apt-get install python-dev python-pip python3-dev python3-pip

# Install Python
pip2 install --user --upgrade pynvim
pip3 install --user --upgrade pynvim

sudo shutdown -r 0