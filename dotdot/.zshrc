# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/dqnid/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Path
export NVM_DIR="$HOME/.nvm"


# Aliases
alias r=ranger
alias v=nvim
alias sv="sudo nvim"
alias n="nnn -e"
alias gs="git status --short"
alias gl="git log --graph --oneline --all"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
