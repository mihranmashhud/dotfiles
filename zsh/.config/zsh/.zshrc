# Add custom scripts folder
[[ -d $HOME/scripts ]] && export PATH=$HOME/scripts:$PATH

# Ruby path
export PATH=$HOME/.rbenv/bin:$HOME/.gem/ruby/3.0.0/bin:$PATH
eval "$(rbenv init -)"

# Use Node Version Manager
unset npm_config_prefix
source /usr/share/nvm/init-nvm.sh

# Node Modules path
export PATH=$HOME/.node_modules/bin:$PATH

# Needed here by other programs
autoload -Uz compinit
compinit

# Plugin configuration
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC="ON"

# SET HIST
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Module load
zmodload zsh/zpty

# Statically load plugins
source $HOME/.config/zsh/plugins.sh

## Vi mode enabling
#bindkey -v
#export KEYTIMEOUT=1
#
## tab complete menu vim nav
#bindkey -M menuselect 'h' vi-backward-char
#bindkey -M menuselect 'k' vi-up-line-or-history
#bindkey -M menuselect 'l' vi-forward-char
#bindkey -M menuselect 'j' vi-down-line-or-history
#bindkey -v '^?' backward-delete-char
#
## More bindings
#bindkey -M viins 'jk' vi-cmd-mode
#bindkey -M viins 'kj' vi-cmd-mode
#
## Change cursor shape based on mode
#function zle-keymap-select {
#  if [[ ${KEYMAP} == vicmd ]] ||
#     [[ $1 = 'block' ]]; then
#    echo -ne '\e[1 q'
#  elif [[ ${KEYMAP} == main ]] ||
#       [[ ${KEYMAP} == viins ]] ||
#       [[ ${KEYMAP} = '' ]] ||
#       [[ $1 = 'beam' ]]; then
#    echo -ne '\e[5 q'
#  fi
#}
#zle -N zle-keymap-select
#zle-line-init() {
#    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#    echo -ne "\e[5 q"
#}
#zle -N zle-line-init
#echo -ne '\e[5 q' # Use beam shape cursor on startup.
#preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
#
## Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='nvim'
# fi

# SSH Agent for easier remote file editing
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
  ssh-agent > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
  { eval "$(<"$XDG_RUNTIME_DIR/ssh-agent.env")"; } &>/dev/null
fi

# kitty terminal completion
kitty + complete setup zsh | source /dev/stdin
_comp_options+=(globdots)

# Personal aliases:
# Update zsh plugins
alias zsh-update="antibody bundle < $HOME/.config/zsh/plugins > $HOME/.config/zsh/plugins.sh"
# Config alias for dotfile managment
alias config="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
# rmtrash aliases
alias rm='rmtrash --forbid-root'
alias rmdir='rmdirtrash --forbid-root'
# CS server (if I ever need it)
alias cs-server="ssh -t -X -Y mmashhud@linux.student.cs.uwaterloo.ca 'zsh -l'"
alias sync-cs-server='~/scripts/push-cs-server && ~/scripts/pull-cs-server'
# Prefer neovim but not the extra character
alias vim='nvim -p'
# Zathura should 'devour' the terminal
alias zathura='~/scripts/devour zathura'
# Docker Compose
alias docker-compose='sudo docker-compose'
# Alias yay to paru
alias yay='paru'
# Alias cd + ls to cl
alias cl='cd $1 && ls'
