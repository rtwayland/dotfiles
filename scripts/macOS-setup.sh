# Setup xcode tools
echo "[SCRIPTS] Install Xcode Tools"
xcode-select —-install
# Install Homebrew
echo "[SCRIPTS] Install Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Install ohmyzsh
echo "[SCRIPTS] Install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
