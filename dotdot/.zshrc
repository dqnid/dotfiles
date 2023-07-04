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
alias code="vscodium"
#alias ls="nnn -de"
alias cls=clear
alias gs="git status --short"

# Customize to your needs...
eval "$(starship init zsh)"
