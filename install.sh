#!/bin/zsh

set -e +x

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
if ! command -v fdfind &> /dev/null; then sudo apt-get install -y fd-find; fi

#
# Aliases
#
alias styletest="dev style --include-branch-commits && dev t --include-branch-commits"

#
# Set up specific tools and plugins
#

# Install vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Set up my plugins
vim +PlugInstall +qall
vim +"Copilot setup" +qall

# Copilot secrets
if [ -f /etc/spin/secrets/copilot_hosts.json ]; then
  mkdir -p "${HOME}/.config/github-copilot"
  cp /etc/spin/secrets/copilot_hosts.json "${HOME}/.config/github-copilot/hosts.json"
fi
