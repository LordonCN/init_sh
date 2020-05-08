##""""""""""""""""""""""
#" Author:Lordon 
#" Blog: http://Tcloser.github.io
#" Version: v2.2
#" Update Time: 2020-05-05
#" Details:change vim8.2
#""""""""""""""""""""""
export ZSH=$HOME/.oh-my-zsh
#source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette_osx.sh" 
export LC_ALL=en_US.UTF-8
# every time rl auto clear the window
clear
# welcome
echo -e "Hello, `whoami`  |  `date`
 __    _____  ____  ____  _____  _  _ 
(  )  (  _  )(  _ \(  _ \(  _  )( \( )
 )(__  )(_)(  )   / )(_) ))(_)(  )  ( 
(____)(_____)(_)\_)(____/(_____)(_)\_)

           ^__^
           (oo)_______
           (__)       )--/
              ||----w||
              ||     ||

Hope you can enjoy today~ 
If you want to grow, you need to suffer more :)"

ZSH_THEME="af-magic"
plugins=(
git
Z
zsh-syntax-highlighting
zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
#""""""""""""""""""""""
#" alias settings
#""""""""""""""""""""""

alias cdgithub='cd /Volumes/MAC_软件/MY_Projects_VSCode/dong.github.io/'
# safe
# alias rm='rm -i'
move_to_trash () {
    mv "$@" /Volumes/MAC_软件/Trash_for_rm/
}
alias rm='move_to_trash'
# sleep and shutdown easy to use
alias sleep='pmset sleepnow' 
alias restart='sudo shutdown -r now'
alias shutdown='sudo shutdown -h now'
# source ~/.zshrc
alias rl="source ~/.zshrc"
alias cp="cp -i"
# open dash 
alias dash='open dash://'
# change vim8.2 installed by homebrew
alias vim='/usr/local/Cellar/vim/8.2.0400/bin/vim'
alias nvim='/usr/local/Cellar/neovim/0.4.3/bin/nvim'


