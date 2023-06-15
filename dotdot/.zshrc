#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Path
export PATH=/usr/share/sumo/tools:$PATH
export PATH=/home/danih/Paquetes/Postman:$PATH
export SUMO_HOME=/usr/share/sumo

# Aliases
alias v=nvim
alias sv="sudo nvim"
alias code="vscodium"
alias cls=clear
alias gs="git status --short"

# Customize to your needs...
eval "$(starship init zsh)"
