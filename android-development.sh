#!/bin/sh

# Android Development Environment

# Exit immediately if a command exits with a non-zero status
set -e

# Update the user's cached credentials, authenticating the user if necessary
sudo -v

if ! command -v 'brew' >/dev/null 2>&1 ; then
    echo '==> Homebrew not found. Installing now...'
    ./brew.sh
fi

if command -v 'brew' >/dev/null 2>&1 ; then
    echo '==> Installing Android development environment...'
    brew cask install android-studio

    echo 'export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools/' >> ~/.bash_profile
    echo 'export PATH=$PATH:$HOME/Library/Android/sdk/tools/' >> ~/.bash_profile
else
    echo '==> Homebrew not found. Aborting...'
    exit 1
fi
