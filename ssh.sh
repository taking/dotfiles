#!/bin/sh

export APPLE_SSH_ADD_BEHAVIOR=macos

echo "Generating a new SSH key for GitHub..."

if [ ! -d $HOME/.ssh ]; then
    echo "Creating .ssh directory..."
    mkdir ~/.ssh
    chmod 700 ~/.ssh
fi

# Generating a new SSH key
# https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key
ssh-keygen -t ed25519 -C $1 -f $HOME/.ssh/id_ed25519

# Adding your SSH key to the ssh-agent
# https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent
eval "$(ssh-agent -s)"

touch $HOME/.ssh/config
echo "Host *\n AddKeysToAgent yes\n UseKeychain yes\n IdentityFile $HOME/.ssh/id_ed25519" | tee $HOME/.ssh/config

ssh-add --apple-use-keychain $HOME/.ssh/id_ed25519

# Adding your SSH key to your GitHub account
# https://docs.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account
echo "run 'pbcopy < $HOME/.ssh/id_ed25519.pub' and paste that into GitHub"


INCLUDE_LINE="Include ~/.dotfiles/config/ssh-config"
COMMENT_LINE="# Added by taking Dotfiles"
CONFIG_FILE="$HOME/.ssh/config"

# 이미 Include 라인이 있는지 확인
if ! grep -Fxq "$INCLUDE_LINE" "$CONFIG_FILE"; then
  {
    echo "$COMMENT_LINE"
    echo "$INCLUDE_LINE"
    echo ""  # 빈 줄
    cat "$CONFIG_FILE"  # 기존 내용 유지
  } > "${CONFIG_FILE}.tmp"
  # 원본 파일 덮어쓰기
  mv -f "${CONFIG_FILE}.tmp" "$CONFIG_FILE"
  # 권한 재설정 (필요하면)
  chmod 600 "$CONFIG_FILE"
fi
