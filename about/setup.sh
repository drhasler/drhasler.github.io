#!/bin/bash

# terminal profile
dconf load /org/gnome/terminal/legacy/profiles:/ <<EOF
[:b1dcc9dd-5262-4d8d-a863-c897e6d979b9]
scrollbar-policy='never'
visible-name='base'
audible-bell=false
EOF

# vim setup
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
curl https://drhasler.github.io/about/.vimrc $HOME
vim +PluginInstall +qall



