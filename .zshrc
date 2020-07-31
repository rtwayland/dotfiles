# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path suggested by brew
export PATH="/usr/local/sbin:$PATH"
ZSH_DISABLE_COMPFIX=true

####################################
# oh-my-zsh setup
####################################
#export ZSH=/Users/$(whoami)/.oh-my-zsh
export ZSH=~/.oh-my-zsh
####################################
# Designate neovim as default editor
####################################
export EDITOR='nvim'

####################################
# ZSH theme https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
####################################
# ZSH_THEME="avit"
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
# Gulp
alias gw='gulp -f && gulp watch -r'
alias gs='gulp start'
# Vim
alias v='nvim'
alias vmod='git ls-files -o -m --exclude-standard | xargs nvim'
alias vdiff='git diff --name-only master | xargs nvim'
# Package Management
alias yarnup='yarn upgrade-interactive --latest'
# Directories
alias workspace='cd ~/Workspace'
alias storm='cd ~/Workspace/storm'
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
alias gdel='git branch -D'
alias stash='git stash'
alias pop='git stash pop'
alias gapply='git stash apply'
alias undo-commit='git reset --soft HEAD~1'
# Misc
# alias opus='make opus:thefoxcodes:avrdude'
alias qmk-dir='cd ~/qmk_firmware'
alias opus='qmk flash'
alias keymap='code ~/qmk_firmware/keyboards/opus/keymaps/thefoxcodes/keymap.c'
alias vkeymap='nvim ~/qmk_firmware/keyboards/opus/keymaps/thefoxcodes/keymap.c'
# Storm Dev Aliases
alias dev='ssh storm@devstorm'
alias dev-stage1='ssh raleigh@stagestorm1.l'
alias keys='ssh-add && ssh-agent'
alias mdev='sshfs storm@devstorm:/usr/local/storm ~/Workspace/storm/storm-vm'
alias umdev='sudo umount -f ~/Workspace/storm/storm-vm'
alias mstorm='umdev && mdev'
alias es='code ~/Workspace/storm/storm-vm/src'
alias ef='code ~/Workspace/storm/storm-vm/src/front-end'
alias ea='code ~/Workspace/storm/storm-vm/admin'
alias hosts='sudo nvim /etc/hosts'
alias rm_n_m_install='sudo rm -rf node_modules && npm i && start-d'
alias rm_storm-ui_install='sudo rm -rf node_modules/storm-ui && npm i && start-d'
# Aliases from Storm .bashrc
alias x='exit'
alias a='cd /usr/local/storm/admin'
alias s='cd /usr/local/storm/src'
alias f='cd /usr/local/storm/src/front-end'
alias d='cd /usr/local/storm/devops'
alias start-d='/usr/local/storm/devops/start -d'
alias mks='/usr/local/storm/devops/build; inst'
alias mkt='/usr/local/storm/devops/build --telecom; inst'
alias mku='/usr/local/storm/devops/build --ui; inst'
alias inst='/usr/local/storm/devops/install -d'
alias rns='/usr/local/storm/devops/all -d'
alias db='sudo -u postgres psql storm'
alias pretty='npm run pretty'
alias lint='npm run lint'
alias revise='npm run revise'
alias logs='sudo -HE -u root bash -c "pm2 logs"'
alias list='sudo -HE -u root bash -c "pm2 list"'
alias pm2start='sudo -HE -u root bash -c "pm2 delete all" && sudo -HE -u root bash -c "pm2 start /usr/local/storm/src/devops/pm2/pm2-dev.json"'
alias pm2restart='sudo -HE -u root bash -c "pm2 restart all"'
alias fs='PASSWD=$(sed '"'"'/socket-pass/!d; s#^.*=\(.*\)$#\1#'"'"' /etc/storm/config.ini) && fs_cli -p "$PASSWD"'
alias pull='git pull --rebase origin `git rev-parse --abbrev-ref HEAD`'
alias push='git push origin `git rev-parse --abbrev-ref HEAD`'

####################################
# Plugins ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
####################################
plugins=(git npm vi-mode zsh-syntax-highlighting zsh-autosuggestions sudo)
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
#
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
#
# function zle-keymap-select zle-line-init
# {
#   vi_mode="${${KEYMAP/vicmd/${vi_cmd_mode}}/(main|viins)/${vi_ins_mode}}"
#   PROMPT='
# $(_user_host)${_current_dir} $(git_prompt_info) $vi_mode
# %{$fg[$CARETCOLOR]%}▶%{$resetcolor%} '
#
#   # change cursor shape in iTerm2
#   case $KEYMAP in
#     vicmd)      set_cursor_shape 0;; # block cursor
#     viins|main) set_cursor_shape 1;; # line cursor
#   esac
#
#   zle reset-prompt
#   zle -R
# }
#
# function zle-line-finish
# {
#   set_cursor_shape 0 # block cursor
# }
#
# zle -N zle-line-init
# zle -N zle-line-finish
# zle -N zle-keymap-select

# STORM .bashrc CONFIG

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# END STORM .bashrc CONFIG

####################################
# Yarn config...
####################################
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
