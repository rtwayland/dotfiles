# Setup xcode tools
echo "[SCRIPTS] Install Xcode Tools"
xcode-select —-install
# Install Homebrew
echo "[SCRIPTS] Install Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/raleigh.wayland/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
# Install ohmyzsh
echo "[SCRIPTS] Install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
