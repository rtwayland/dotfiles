# Setup xcode tools
echo "[SCRIPTS] Install Xcode Tools"
xcode-select —-install
# Install Homebrew
echo "[SCRIPTS] Install Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
# Install zsh, ohmyzsh, and change shell
echo "[SCRIPTS] Install ZSH"
brew install zsh
echo "[SCRIPTS] Install Oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# chsh -s `which zsh`