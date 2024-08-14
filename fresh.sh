#!/bin/sh

echo "Setting up your Mac..."

# Oh My Zsh 설치 확인
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Homebrew 설치 확인
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# 기존에 .zshrc 가 있다면 제거하고, .dotfiles/.zshrc 를 심볼링 링크로 연결
rm -rf $HOME/.zshrc
ln -sw $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Homebrew telemetry 끄기
brew analytics off

# Homebrew 레시피 업데이트
brew update

# homebrew Bundle로 일괄 설치 실행(cf. taking.Brewfile)
brew tap homebrew/bundle
brew bundle --file=./brewfile/taking.Brewfile

# Symlink the Mackup config file to the home directory
ln -s ./.mackup.cfg $HOME/.mackup.cfg

# Set macOS preferences - we will run this last because this will reload the shell
source ./.macos

# Todo: vs code extensions 설치
