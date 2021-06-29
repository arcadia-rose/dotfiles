#!/bin/zsh

#
# Create symlinks to basic dotfiles.
#

ln -sfn $(pwd)/vim/.vimrc ~/.vimrc
ln -sfn $(pwd)/zsh/.aliases ~/.aliases
ln -sfn $(pwd)/zsh/.env ~/.env
ln -sfn $(pwd)/zsh/.zshrc ~/.zshrc

#
# Install useful tools.
#

if ! command -v rg &> /dev/null; then sudo apt-get install -y ripgrep; fi
if ! command -v fd &> /dev/null; then sudo apt-get install -y fd-find; fi

#
# Set up specific tools and plugins
#

# Install vim plugins
vim +PlugInstall +qall
