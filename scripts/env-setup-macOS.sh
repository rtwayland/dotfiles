# Setup xcode tools
echo "[SCRIPTS] Install Xcode Tools"
xcode-select —-install
# Install Homebrew
echo "[SCRIPTS] Install Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# Install zsh, ohmyzsh, and change shell
echo "[SCRIPTS] Install ZSH"
brew install zsh
echo "[SCRIPTS] Install Oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "[SCRIPTS] Upgrade Oh-my-zsh"
upgrade_oh_my_zsh
# chsh -s `which zsh`
# Set up zsh syntax highlighting, autosuggestions, and nvm
echo "[SCRIPTS] Install zsh plugins"
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting 
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone git://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
echo "[SCRIPTS] Install cli tools"
brew install tmux
brew install z
brew install neovim
brew install python
pip3 install --user neovim
# Install dotfiles
echo "[SCRIPTS] Install personal dotfiles"
cd && git clone https://github.com/rtwayland/dotfiles.git .dotfiles
cd .dotfiles
git fetch && git pull
echo "[SCRIPTS] Execute install script"
rm ~/.zshrc && ./install
# iTerm2 Setup
echo "[SCRIPTS] Download terminal font"
open https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Meslo.zip
# Directory Setup
cd && mkdir Workspace
