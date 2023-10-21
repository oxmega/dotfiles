#!/bin/bash

# mac specific configs

## Brew ENV
 if type brew &>/dev/null; then
     FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

     autoload -Uz compinit
     compinit
 fi

PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:/Users/"$whoami"/Library/     +++Python/3.9/bin:$PATH"
PATH="/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"
PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="/opt/homebrew/opt/gawk/libexec/gnubin:$PATH"
PATH="/opt/homebrew/opt/gnu-indent/libexec/gnubin:$PATH"
PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"

source /opt/homebrew/share/antigen/antigen.zsh

 ## Ruby exports
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby ruby-3.2.0 # run chruby to see actual version

export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH

# pyenv
export PYENV_ROOR="$HOME/.pyenv"
export PATH=$PYENV_ROOT/shims:$PATH
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
PATH=$(pyenv root)/shims:$PATH

# python 2.7.18
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
