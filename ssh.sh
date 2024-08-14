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
