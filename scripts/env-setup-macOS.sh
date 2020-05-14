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
