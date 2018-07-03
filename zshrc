# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
ZSH_DISABLE_COMPFIX=true
# Path to your oh-my-zsh installation.
export ZSH=/Users/raleighwayland/.oh-my-zsh

export EDITOR='nvim'

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="bira"
ZSH_THEME="avit"


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias szsh='. ~/.zshrc'
alias stmux='tmux source-file ~/.tmux.conf'
alias tat='tmux a -t'
alias tsv='tmux new -s'
alias gw='gulp -f && gulp watch -r'
alias gs='gulp start'
alias v='nvim'
alias redx='cd ~/Documents/RedX'
alias vortex='cd ~/Documents/vortex-app'
alias sphere='cd ~/Documents/RedX/soi/client'

alias go='git checkout'
alias gd='git diff'
alias ga='git add'
alias pull='git pull'
alias push='git push'
alias gall='git add .'
alias gb='git branch'
alias gcm='git commit -m'
alias gcam='git commit -am'
alias gmr='git merge'
alias gsup='git push --set-upstream origin'
alias gdel='git branch -D'
alias stash='git stash'
alias gapply='git stash apply'

alias pg_dump='/Applications/Postgres.app/Contents/Versions/10/bin/pg_dump'
alias jmeter='/Applications/apache-jmeter-4.0/bin/jmeter'

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew npm vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration
# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# nvm use auto
#
autoload -U add-zsh-hook
load-nvmrc() {
	local node_version="$(nvm version)"
	local nvmrc_path="$(nvm_find_nvmrc)"

	if [ -n "$nvmrc_path" ]; then
		local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

		if [ "$nvmrc_node_version" = "N/A" ]; then
		nvm install
		elif [ "$nvmrc_node_version" != "$node_version" ]; then
		nvm use
		fi
	elif [ "$node_version" != "$(nvm version default)" ]; then
		echo "Reverting to nvm default version"
		nvm use default
	fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Allow bash keybindings ( ^k, ^y, etc)
bindkey -e

source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
. `brew --prefix`/etc/profile.d/z.sh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
