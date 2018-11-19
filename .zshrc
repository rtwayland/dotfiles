# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
ZSH_DISABLE_COMPFIX=true
####################################
# oh-my-zsh setup
####################################
export ZSH=/Users/$(whoami)/.oh-my-zsh

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
alias sz='. ~/.zshrc'
alias stmux='tmux source-file ~/.tmux.conf'
alias tat='tmux a -t'
alias tsave='tmux new -s'
alias tkill='tmux kill-session -t'
alias gw='gulp -f && gulp watch -r'
alias gs='gulp start'
alias v='nvim'
alias vmod='git ls-files -o -m --exclude-standard | xargs nvim'
alias vdiff='git diff --name-only master | xargs nvim'
alias workspace='cd ~/Workspace'
alias redx='cd ~/Workspace/redx'
alias vortex='cd ~/Workspace/redx/vortex/vortex-app'
alias sphere='cd ~/Workspace/redx/soi/client'

alias pull='git pull'
alias push='git push'
alias gdel='git branch -D'
alias stash='git stash'
alias gapply='git stash apply'

alias pg_dump='/Applications/Postgres.app/Contents/Versions/10/bin/pg_dump'
alias jmeter='/Applications/apache-jmeter-4.0/bin/jmeter'

alias dev='ssh raleigh@devstorm'
alias keys='ssh-add && ssh-agent'

####################################
# Plugins ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
####################################
plugins=(git brew npm zsh-nvm tmux vi-mode)
source $ZSH/oh-my-zsh.sh

####################################
# NVM Config
####################################
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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
# Set a fast timeout.
# Remap esc
# Customize cursor shape.
# https://github.com/jcorbin/home/blob/master/.zsh/rc.d/vi-mode-cursor
# http://pawelgoscicki.com/archives/2012/09/vi-mode-indicator-in-zsh-prompt
# https://superuser.com/questions/151803/how-do-i-customize-zshs-vim-mode
# https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/avit.zsh-theme
####################################
bindkey -v
export KEYTIMEOUT=10
bindkey -M viins 'kj' vi-cmd-mode
vi_ins_mode="%{$fg[blue]%}[ I ]%{$reset_color%}"
vi_cmd_mode="%{$fg[green]%}[ N ]%{$reset_color%}"
# Change cursor shape depending on insert/command mode for vi-mode
function print_dcs
{
  print -n -- "\EP$1;\E$2\E\\"
}

function set_cursor_shape
{
  if [ -n "$TMUX" ]; then
    # tmux will only forward escape sequences to the terminal if surrounded by
    # a DCS sequence
    print_dcs tmux "\E]50;CursorShape=$1\C-G"
  else
    print -n -- "\E]50;CursorShape=$1\C-G"
  fi
}

function zle-keymap-select zle-line-init
{
  vi_mode="${${KEYMAP/vicmd/${vi_cmd_mode}}/(main|viins)/${vi_ins_mode}}"
  PROMPT='
$(_user_host)${_current_dir} $(git_prompt_info) $(_ruby_version) $vi_mode
%{$fg[$CARETCOLOR]%}▶%{$resetcolor%} '

  # change cursor shape in iTerm2
  case $KEYMAP in
    vicmd)      set_cursor_shape 0;; # block cursor
    viins|main) set_cursor_shape 1;; # line cursor
  esac

  zle reset-prompt
  zle -R
}

function zle-line-finish
{
  set_cursor_shape 0 # block cursor
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

