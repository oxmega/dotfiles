#!/usr/bin/zsh
# Aliases 01/27/23

alias vim ="nvim"
alias rfal='less -F /var/log/apache2/raisedfist.net-access.log'
alias rfel='less -F /var/log/apache2/raisedfist.net-access.log'
alias ttal='sudo less -F /var/log/apache2/thosetits.com-access.log'
alias ttel='sudo less -F /var/log/apache2/thosetits.com-access.log'
alias ls='ls -FhG --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color'
alias ll='ls -alhG --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto'
alias vi='vim'
alias systemctl='sudo systemctl'
alias pacman='sudo pacman'
alias paceat='pacman -Rns $(pacman -Qtdq)'
alias mount='sudo mount'
alias memhog='ps auxf | sort -nr -k 4 | head -2'
alias cpuhog='ps auxf | sort -nr -k 3 | head -2'
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias df="df -h"
alias du="du -h"
alias grep='grep -i --color=auto'
alias syn='synergys -c ~/.config/Synergy/.synergy_czarface.conf -l /home/oxa/.config/Synergys/synergy.log -d ERROR --restart --daemon'
alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'
alias recordd='sleep 5; ffmpeg -f pulse -ac 2 -i default -f x11grab -s 1920x1080 -r 15 -i :0.0 -acodec libmp3lame -vcodec mpeg4 -ar 48000 -qscale 0 -framerate 24 dstream.mp4'
alias tmux='tmux -2'

# debianish stuff
alias apt-get='sudo apt-get'
alias apt='sudo apt'
systemctl='sudo systemctl'
journalctl='sudo journalct'

# safety first
alias rm='rm -iv'
#alias cp='cp -iv'
alias mv='mv -iv'


## Functions
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1        ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1       ;;
            *.rar)       rar x $1     ;;
            *.gz)        gunzip $1     ;;
            *.tar)       tar xf $1        ;;
            *.tbz2)      tar xjf $1      ;;
            *.tgz)       tar xzf $1       ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1    ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

compress() {
   FILE=$1
   shift
   case $FILE in
      *.tar.bz2) tar cjf $FILE $*  ;;
      *.tar.gz)  tar czf $FILE $*  ;;
      *.tgz)     tar czf $FILE $*  ;;
      *.zip)     zip $FILE $*      ;;
      *.rar)     rar $FILE $*      ;;
      *)         echo "Filetype not recognized" ;;
   esac
}


memusage() {
APP=$1
    ps -A --sort -rss -o comm,rss | grep "$APP" | awk '{ sum+=$2 } \
    END { print sum/1024 }'
}

function console {
  modem=`ls -1 /dev/cu.* | grep -vi bluetooth | tail -1`
  baud=${1:-9600}
  if [ ! -z "$modem" ]; then
    minicom -D $modem  -b $baud
  else
    echo "No USB modem device found in /dev"
  fi
}
