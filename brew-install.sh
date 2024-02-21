#! /bin/bash

echo $POSIXLY_CORRECT

if ! command -v brew &> /dev/null; then
  echo "Installing Homebrew..."
  export NONINTERACTIVE=1
  export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
  export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
  export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"

  unset POSIXLY_CORRECT
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  #echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  #eval "$(/opt/homebrew/bin/brew shellenv)"
  brew --verstion

  if command -v brew &> /dev/null; then
    echo "homebrew is installed."
  else
    echo "homebrew installation failed, please install it manually."
    exit 1
  fi
else
  echo "homebrew is installed."
fi

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
brew install --cask iterm2
