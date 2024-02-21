#! /bin/bash

# check if xcode is installed
if xcode-select -p &> /dev/null; then
  echo "Xcode is installed."
else
  echo "Xcode is not installed."
  xcode-select --install

  # wait for xcode installation to complete.
  while ! xcode-select -p > /dev/null; do
    sleep 5
  done

  if xcode-select -p &> /dev/null; then
    echo "Xcode is installed."
  else
    echo "Xcode installation failed, please install it manually."
    exit 1
  fi
fi

# oh my zsh
if ! command -v zsh &> /dev/null; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  chsh -s /bin/zsh
else
  echo "chsh -s /bin/zsh"
fi
# brew
echo "${POSIXLY_CORRECT}"
echo "Installing Homebrew..."
export NONINTERACTIVE=1
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"

unset POSIXLY_CORRECT
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# brew upgrade
echo "Homebrew is upgrading......"
brew upgrade

brew --version

# brew install
brew install git
brew install wget
brew install ripgrep
brew install autojump
brew install tree
brew install fig
brew install iterm2

git config --global user.name  'Junting'
git config --global user.email '342766475@qq.com'

echo '[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh' >> ~/.zshrc
# 替换 brew 国内源
echo 'export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"' >> ~/.zshrc

echo 'export PATH="/opt/homebrew/bin:$PATH"' >> ~/.zshrc
echo '[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh' >> ~/.zshrc
source ~/.zshrc

# vim
curl -L https://bit.ly/janus-bootstrap | bash

# prepare folders
mkdir -p ~/workspace/github

# node version manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.zshrc

nvm install stable
nvm alias default node

# npm registry manager
npm install -g nrm

# ssh-keygen
if [ ! -e "$HOME/.ssh/id_rsa.pub" ]; then
  ssh-keygen
  sleep 5
  cat ~/.ssh/id_rsa.pub

  echo 'save it to gitlab or https://github.com/settings/keys'
fi
# move vscode keybindings
# cp -f keybindings.json ~/Library/Application\ Support/Code/User

# config zsh
## download zsh theme
curl https://raw.githubusercontent.com/ahmadawais/shades-of-purple-iterm2/master/shades-of-purple.zsh-theme > ~/.oh-my-zsh/themes/shades-of-purple.zsh-theme

## change zsh theme
chsh -s /bin/zsh
ITERM2_THEME="shades-of-purple"
### Find the line number where the ZSH_THEME variable is located.
LINE_NUMBER=$(grep -n "^ZSH_THEME=" ~/.zshrc | cut -d: -f1)
### Replace the ZSH_THEME value in the row.
sed -i "${LINE_NUMBER}s/ZSH_THEME=.*/ZSH_THEME=\"${ITERM2_THEME}\"/" ~/.zshrc

source ~/.zshrc
echo "The theme has been changed to ${ITERM2_THEME}"

# download shades-of-purple.itermcolors
curl https://raw.githubusercontent.com/ahmadawais/shades-of-purple-iterm2/master/shades-of-purple.itermcolors > ~/Desktop/shades-of-purple.itermcolors
