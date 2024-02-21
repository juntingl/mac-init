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
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s /bin/zsh

# brew
echo "Installing Homebrew..."
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
#eval "$(/opt/homebrew/bin/brew shellenv)"

brew --verstion

exit 1

# brew install
brew install git
brew install wget
brew install ripgrep
brew install autojump
brew install tree
brew install fig
brew install --cask iterm2

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
ssh-keygen
cat ~/.ssh/id_rsa.pub

echo 'save it to gitlab or https://github.com/settings/keys'

# move vscode keybindings
# cp -f keybindings.json ~/Library/Application\ Support/Code/User

# config zsh
sh ./config-iterm.sh