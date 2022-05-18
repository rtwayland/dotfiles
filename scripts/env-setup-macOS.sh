# Set up zsh syntax highlighting, autosuggestions, and nvm
echo "[SCRIPTS] Install zsh plugins"
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# zsh-nvm
git clone https://github.com/lukechilds/zsh-nvm ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-nvm
# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo "[SCRIPTS] Install cli tools"
# brew install tmux
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
# Install Node and Package Managers
nvm install node
npm i -g pnpm
