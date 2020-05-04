#""""""""""""""""""""""
#" Author:Lordon 
#" Blog: http://Tcloser.github.io
#" Version: v2.1
#" Update Time: 2020-04-13
#" Details: 
#""""""""""""""""""""""

# welcome
echo -e "Hello, `whoami`
`date`

If you want to grow, you need to suffer more :)"

export PS1='\033[01;31m\]\u\033[01;33m\]@Mac\033[01;35m\]\$\033[01;36m\]\W \033[00;32m\] '
export CLICOLOR=1  
export LSCOLORS=GxFxCxDxBxegedabagacedi


#""""""""""""""""""""""
#" alias settings
#""""""""""""""""""""""
alias cdgithub='cd /Volumes/MAC_软件/MY_Projects_VSCode/dong.github.io/'
# safe
alias rm='rm -i'
# source ~/.bash_profile
alias rl='source ~/.bash_profile'
# sleep and shutdown easy to use
alias sleep='pmset sleepnow' 
alias restart='sudo shutdown -r now'
alias shutdown='sudo shutdown -h now'


