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
export PATH=/home/danih/.local/share/nvim/mason/bin:$PATH
export PATH=/usr/bin:$PATH
export SUMO_HOME=/usr/share/sumo

# Aliases
alias home="cd /home/danih/"
alias usb="cd /run/media/danih"
alias calendario=calcurse
alias r=ranger
alias v=nvim
alias sv="sudo nvim"
alias limpiar="stty sane"
alias copiar="xclip"
alias pegar="xclip -o"
alias n="nnn -e"
alias latexToPDF="bash ~/Scripts/Compilers/compilaLatexPDF.sh"
alias latexGen="~/Scripts/Tools/generaLaTeX.sh"
alias ck="bash ~/Scripts/compilaKotlin.sh"
alias xk="bash ~/Scripts/compilaKotlin.sh 1"
#alias ls="nnn -de"
alias cls=clear
alias notes="cd ~/Remote/Cloud/Documents/notes/md/ && nvim ."
alias gs="git status --short"
alias gl="git log --graph --oneline --all"

# TODO: use some kind of keyring
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/id_new_server_dqnid
# ssh-add ~/.ssh/id_github
# ssh-add ~/.ssh/id_rsa_dqnid
# ssh-add ~/.ssh/id_localserver_coquer
# clear

# Customize to your needs...
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# bun completions
[ -s "/home/danih/.bun/_bun" ] && source "/home/danih/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
