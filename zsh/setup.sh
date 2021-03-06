#!/usr/bin/env bash

# Check whether zsh is installed or not
command -v zsh > /dev/null || {
    echo "Please install zsh yourself before running this script!"
    exit 1
}

# Install oh-my-zsh in unattended mode - no prompts to change shell, or open a zsh prompt after it completes
echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Change oh-my-zsh theme to agnoster
echo "Changing default powerlevel10k theme from 'robbyrussell' to 'agnoster'"
sed -i -e 's|ZSH_THEME="robbyrussell"|ZSH_THEME="agnoster"|' "$HOME"/.zshrc
