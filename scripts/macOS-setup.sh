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