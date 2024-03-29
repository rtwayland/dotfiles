# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path suggested by brew
# export PATH="/usr/local/sbin:$PATH"
export PATH=$PATH:~/.local/bin

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
ZSH_THEME="powerlevel10k/powerlevel10k"

####################################
# Aliases
####################################
# Sourcing
alias ez='code ~/.zshrc'
alias sz='. ~/.zshrc'
# Tmux
alias stmux='tmux source-file ~/.tmux.conf'
alias tat='tmux a -t'
alias tsave='tmux new -s'
alias tkill='tmux kill-session -t'
# Vim
alias v='lvim'
alias vmod='git ls-files -o -m --exclude-standard | xargs nvim'
alias vdiff='git diff --name-only master | xargs nvim'
# Directories
alias workspace='cd ~/Workspace'
alias notebox='~/Library/Mobile\ Documents/iCloud\~md\~obsidian/Documents/Note\ Box'
alias wavv='cd ~/Workspace/wavv'
alias rm-nm='find ./ -name "node_modules" -type d -prune -exec rm -rf "{}" +'
grepTerm() {
  grep -rnw $1 -e $2
}
multicrop() {
  ./multicrop ../raw/Scan\ $1.png $1_rotated.png
}
rangeLoop() {
  for x in {$1}; do $2 $x; done
}
# Git
alias pull='git pull'
alias push='git push'
alias gdel='git branch -D'
alias stash='git stash'
alias pop='git stash pop'
alias gapply='git stash apply'
alias undo-commit='git reset --soft HEAD~1'
alias list-authors='g shortlog -s -e'
alias which-email='git config user.email'
alias set-work-email='git config user.email raleigh.wayland@wavv.com'
alias set-personal-email='git config user.email rtwayland@gmail.com'
alias branches='git for-each-ref --sort=committerdate refs/heads/ --format="%(committerdate:short) %(refname:short)"'
# Keyboards
alias qmk-dir='cd ~/qmk_firmware'
alias opus='qmk flash'
alias keymap='code ~/qmk_firmware/keyboards/opus/keymaps/thefoxcodes/keymap.c'
alias vkeymap='nvim ~/qmk_firmware/keyboards/opus/keymaps/thefoxcodes/keymap.c'
# Package Manager
alias p='pnpm'
# Storm Dev Aliases
alias dev='ssh devstorm'
alias keys='ssh-add && ssh-agent'
alias hosts='sudo nvim /etc/hosts'
alias wavv="node /Users/raleigh.wayland/Workspace/storm/wavv-docker/cli/index.js"
alias reinstall-wavv-ui="rm -rf node_modules/wavv-ui package-lock.json && npm i"

####################################
# Plugins ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
####################################
plugins=(zsh-nvm git brew npm vi-mode zsh-syntax-highlighting zsh-autosuggestions sudo)
source $ZSH/oh-my-zsh.sh

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
# bindkey -v
# export KEYTIMEOUT=10
# bindkey -M viins 'kj' vi-cmd-mode
# vi_ins_mode="%{$fg[blue]%}[ I ]%{$reset_color%}"
# vi_cmd_mode="%{$fg[green]%}[ N ]%{$reset_color%}"
# # Change cursor shape depending on insert/command mode for vi-mode
# function print_dcs
# {
#   print -n -- "\EP$1;\E$2\E\\"
# }

# function set_cursor_shape
# {
#   if [ -n "$TMUX" ]; then
#     # tmux will only forward escape sequences to the terminal if surrounded by
#     # a DCS sequence
#     print_dcs tmux "\E]50;CursorShape=$1\C-G"
#   else
#     print -n -- "\E]50;CursorShape=$1\C-G"
#   fi
# }

# function zle-keymap-select zle-line-init
# {
#   vi_mode="${${KEYMAP/vicmd/${vi_cmd_mode}}/(main|viins)/${vi_ins_mode}}"
#   PROMPT='
# $(_user_host)${_current_dir} $(git_prompt_info) $vi_mode
# %{$fg[$CARETCOLOR]%}▶%{$resetcolor%} '

#   # change cursor shape in iTerm2
#   case $KEYMAP in
#     vicmd)      set_cursor_shape 0;; # block cursor
#     viins|main) set_cursor_shape 1;; # line cursor
#   esac

#   zle reset-prompt
#   zle -R
# }

# function zle-line-finish
# {
#   set_cursor_shape 0 # block cursor
# }

# zle -N zle-line-init
# zle -N zle-line-finish
# zle -N zle-keymap-select

####################################
# Directory completion with Z
####################################
. `brew --prefix`/etc/profile.d/z.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# pnpm
export PNPM_HOME="/Users/raleigh.wayland/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end