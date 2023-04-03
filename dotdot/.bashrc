#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

#Diseño de la interfaz
#export PS1="[\[$(tput sgr0)\]\[\033[38;5;25m\]\t\[$(tput sgr0)\]]\[$(tput sgr0)\]\[\033[38;5;32m\]\u\[$(tput sgr0)\](\[$(tput sgr0)\]\[\033[38;5;9m\]\$?\[$(tput sgr0)\])\[$(tput sgr0)\]\[\033[38;5;43m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[$(tput sgr0)\]\w\n\\$ \[$(tput sgr0)\]"
export PS1="[\[$(tput sgr0)\]\[\033[38;5;10m\]\t\[$(tput sgr0)\]]\[$(tput sgr0)\]\[\033[38;5;12m\]\u\[$(tput sgr0)\](\[$(tput sgr0)\]\[\033[38;5;9m\]\$?\[$(tput sgr0)\])\[$(tput sgr0)\]\[\033[38;5;11m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[$(tput sgr0)\]\w\n\\$ \[$(tput sgr0)\]"

export LANGUAGE="es_ES:es"

#Añadir colores a PACMAN y man
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) #verde
export LESS_TERMCAP_md=$(tput bold; tput setaf 2) #verde
export LESS_TERMCAP_so=$(tput bold; tput setaf 3) #amarillo
export LESS_TERMCAP_se=$(tput rmso; tput sgr0) #verde
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 1) #rojo
export LESS_TERMCAP_me=$(tput sgr0)

#Programas predeterminados
export VISUAL=code
export EDITOR=nvim
export TERMCMD="st"
export TERM="st"
export TERMINAL="st"

#Aliases de acceso rápido
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
alias latexToPDF="bash ~/Scripts/compilaLatexPDF.sh"
alias latexGen="~/Scripts/generaLaTeX.sh"
alias ck="bash ~/Scripts/compilaKotlin.sh"
alias xk="bash ~/Scripts/compilaKotlin.sh 1"
#alias ls="nnn -de"
alias sincplay4cyl="rsync -vrP --delete-after ~/Documentos/Proyectos/html/JCYL_Juegos/ root@outzone.club:/var/www/play4cyl"
alias sincdqnid="rsync -vrP --delete-after ~/Documents/Proyectos/html/dqnid/ root@outzone.club:/var/www/dqnid"
alias sincoz="rsync -vrP --delete-after ~/Documents/Proyectos/Ruby/outzone/ root@outzone.club:/usr/local/webapps/outzone"

#cd_ para recuperar último directorio
function cd_
{
  [[ -d "$@" ]] || return 1
  echo "$@" > ~/.last_dir
  cd "$@"
}

# add it only if required
case ":${PATH}:" in
  *:${NPATH}:*) ;;
  *) PATH=${PATH}:$NPATH ;;
esac

#export LD_LIBRARY_PATH=/opt/oracle/instantclient_21_1:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/lib64:$LD_LIBRARY_PATH
export PATH=$LD_LIBRARY_PATH:$PATH
export PATH=/home/danih/.cargo/bin:$PATH 
export PATH=/home/danih/.local/share/gem/ruby/3.0.0/bin:$PATH 
export PATH=/home/danih/.local/bin:$PATH 
export PATH=/usr/share/sumo/tools:$PATH
export PATH=/home/danih/Paquetes/Postman:$PATH

export SUMO_HOME=/usr/share/sumo

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

# NNN config
export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='x:launch;f:finder;o:fzopen;d:diffs;t:nmount;v:imgview;s:xdgdefault;p:fzplug'
export NNN_BMS='u:/home/danih/Documentos/Universidad/'
export NNN_FCOLORS='0000E6310000000000000000'

# Powerline
#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. /usr/share/powerline/bindings/bash/powerline.sh

# Askpass
export SSH_ASKPASS=/usr/bin/xaskpass
export SUDO_ASKPASS=/usr/bin/xaskpass

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
