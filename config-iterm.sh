#! /bin/bash

# download zsh theme
curl https://raw.githubusercontent.com/ahmadawais/shades-of-purple-iterm2/master/shades-of-purple.zsh-theme > ~/.oh-my-zsh/themes/shades-of-purple.zsh-theme

# change zsh theme
ITERM2_THEME="shades-of-purple"
## Find the line number where the ZSH_THEME variable is located.
LINE_NUMBER=$(grep -n "^ZSH_THEME=" ~/.zshrc | cut -d: -f1)
## Replace the ZSH_THEME value in the row.
sed -i "${LINE_NUMBER}s/ZSH_THEME=.*/ZSH_THEME=\"${ITERM2_THEME}\"/" ~/.zshrc

source ~/.zshrc
echo "The theme has been changed to ${ITERM2_THEME}"

# download shades-of-purple.itermcolors
curl https://raw.githubusercontent.com/ahmadawais/shades-of-purple-iterm2/master/shades-of-purple.itermcolors > ~/Desktop/shades-of-purple.itermcolors
