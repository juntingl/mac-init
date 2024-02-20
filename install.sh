#! /bin/bash

# check if xcode is installed
if xcode-select -p &> /dev/null
then
  echo "Xcode is installed."
else
  echo "Xcode is not installed."
  xcode-select --install
fi

# wait for xcode installation to complete.
while ! xcode-select -p > /dev/null; do
  sleep 5
done

# oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s /bin/zsh

# brew
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
git clone --depth=1 https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/install.git brew-install
/bin/bash brew-install/install.sh
rm -rf brew-install
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

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
