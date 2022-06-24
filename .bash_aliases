# This file is called from .bashrc
# if [ -f ~/.bash_aliases ]; then
#     . ~/.bash_aliases
# fi

# for when you forget your aliases
alias aliases='cat ${HOME}/.bash_aliases && echo "\n"'

# System
alias grep='grep --color=auto'
alias ls='ls --color=auto'

# Git after pre-commit-hooks annoying refusasl to modify the staging area
alias retry='git add -u && !!'

# Docker
alias up='docker-compose up -d'
alias down='docker-compose down'
alias build='docker-compose build'
alias restart='docker-compose down && sudo docker-compose up -d'
alias logs='docker-compose logs'

# sudo = "sudo !!" - you forget to sudo a command, get access denied, just use oops
alias oops='sudo !!'

# my deploy script when working on docker projects
deploy() {
  #do things with parameters like $1 such as
  ican bump $1
  docker-compose build
  docker-compose down
  docker-compose up -d
}

# other bash stuff
# prompt
#
# \[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$
#
# history stuff
#
#HISTCONTROL=ignoreboth
#shopt -s histappend
#HISTSIZE=1000
#HISTFILESIZE=2000
