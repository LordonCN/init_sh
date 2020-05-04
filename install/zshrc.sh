#########################################################################
# File Name: zshrc.sh
# Author: Lordon
# mail: xunjtech@gmail.com
# Created Time: Mon May  4 21:24:30 2020
#########################################################################

# install zsh and oh-my-zsh and plugins
brew install zsh
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions



