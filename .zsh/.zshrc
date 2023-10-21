#!/bin/bash
# 'living' zshrc that should work in both macos as well as nearly all linux


## source extra configs (alias.zsh, etc)
ZSHCONFDIR="$HOME/.dotfiles/.zsh"
[ -d "$ZSHCONFDIR/" ] && for i in "$ZSHCONFDIR";
    do source "$i"; 
done

# if mac export mac configs
if [ $(uname -s) = Darwin ]; then
    source "$ZSHCONFDIR/mac.zsh"
fi

# colors and other aesthetics
export CLICOLOR=1
#export LSCOLORS=GxFxCxDxBxegedabagaced

## History 
HISTSIZE=100000
SAVEHIST=1000000
setopt inc_append_history 
setopt share_history




## Autcomplete
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'
zstyle ':completion:*' format '%B%F{blue}%d%f%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:default' menu select=2


## Keys
export GPG_TTY=/dev/ttys000

source /opt/homebrew/share/antigen/antigen.zsh

## prompt (basic)
newline='\n'
case $(hostname -s) in
    czarface) PS1="%(?.%F{cyan}.%F{red})✗ %f%F{187}%f%n.%m%F %f%~» " ;;
    *) PS1="%n.%m %~ %(?.%F{magenta}.%F{red})"$'\n'"» %f" ;;
esac

### Ruby exports
#source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
#source /opt/homebrew/opt/chruby/share/chruby/auto.sh
#chruby ruby-3.2.0 # run chruby to see actual version
#
#export GEM_HOME=$HOME/gems
#export PATH=$HOME/gems/bin:$PATH
#
## pyenv
#export PYENV_ROOR="$HOME/.pyenv"
#export PATH=$PYENV_ROOT/shims:$PATH
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
#PATH=$(pyenv root)/shims:$PATH
#
## python 2.7.18
#export PYENV_ROOT="$HOME/.pyenv"
#command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"
