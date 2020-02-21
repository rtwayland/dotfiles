# Install zsh, ohmyzsh, and change shell
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
upgrade_oh_my_zsh
# chsh -s `which zsh`
# Set up zsh syntax highlighting, autosuggestions, and nvm
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting 
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone git://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
brew install tmux
brew install z
brew install neovim
brew install python
pip3 install --user neovim
# Install dotfiles
cd && git clone https://github.com/rtwayland/dotfiles.git .dotfiles
cd .dotfiles
git fetch && git pull
rm ~/.zshrc && ./install
# iTerm2 Setup
open https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Meslo.zip
# Directory Setup
cd && mkdir Workspace
