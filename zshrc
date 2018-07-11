# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
ZSH_DISABLE_COMPFIX=true
####################################
# oh-my-zsh setup
####################################
export ZSH=/Users/raleighwayland/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

####################################
# Designate neovim as default editor
####################################
export EDITOR='nvim'

####################################
# ZSH theme https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
####################################
ZSH_THEME="avit"

####################################
# Aliases
####################################
alias szsh='. ~/.zshrc'
alias stmux='tmux source-file ~/.tmux.conf'
alias tat='tmux a -t'
alias tsave='tmux new -s'
alias tkill='tmux kill-session -t'
alias gw='gulp -f && gulp watch -r'
alias gs='gulp start'
alias v='nvim'
alias vmod='git ls-files -o -m --exclude-standard | xargs nvim'
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

####################################
# Plugins ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
####################################
plugins=(git brew npm vi-mode)

####################################
# NVM Config
####################################
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

####################################
# Vi mode Config
####################################
bindkey -v
export KEYTIMEOUT=10
bindkey -M viins 'kj' vi-cmd-mode
# https://emily.st/2013/05/03/zsh-vi-cursor
function zle-keymap-select zle-line-init
{
	# change cursor shape in iTerm2
	case $KEYMAP in
		vicmd)      print -n -- "\E]50;CursorShape=0\C-G";;  # block cursor
		viins|main) print -n -- "\E]50;CursorShape=1\C-G";;  # line cursor
	esac

	zle reset-prompt
	zle -R
}

function zle-line-finish
{
	print -n -- "\E]50;CursorShape=0\C-G"  # block cursor
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

####################################
# Directory completion with Z
####################################
. `brew --prefix`/etc/profile.d/z.sh

####################################
# Yarn config...
####################################
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

####################################
# Terminal syntax highlighting
####################################
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

