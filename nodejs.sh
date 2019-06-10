#!/bin/sh

# Install Node.js

# Don't exit immediately if a command exits with a non-zero status
# This causes the script to stop after executing `nvm.sh`
# set -e

# Update the user's cached credentials, authenticating the user if necessary
sudo -v

# Store a local variable of the scripts current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if ! command -v "brew" > /dev/null 2>&1; then
    echo "==> Homebrew not found. Installing now..."
    ${DIV}/brew.sh
fi

if command -v "brew" > /dev/null 2>&1; then
    echo "==> Installing Node Version Manager..."

    # Install Node Version Manager
    brew install nvm

    # Allow NVM without restarting
    export NVM_DIR="$HOME/.nvm"
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

    # Allow NVM after restarting
    echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bash_profile
    echo '[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"' >> ~/.bash_profile
    echo '[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"' >> ~/.bash_profile
    echo '\n' >> ~/.bash_profile

    echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshenv
    echo '[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"' >> ~/.zshenv
    echo '[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"' >> ~/.zshenv
    echo '\n' >> ~/.zshenv

    echo "==> Node Version Manager installed."

    # Install latest Node.js with NVM
    echo "==> Installing latest Node.js LTS..."
    nvm install --lts
    echo "==> Latest Node.js LTS installed."
else
    echo "==> Homebrew not found. Aborting..."
    exit 1
fi
