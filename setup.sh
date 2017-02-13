#!/bin/bash
echo -n "Symlinking dotfiles"
python ./install.py 1>/dev/null
echo " ... Done"

echo "Installing packages with homebrew"
./brew.sh
echo " ... Done"

# Need some things for MacVim to work correctly.
echo -n "Downloading Inconsolata-dz for Powerline"
wget -q -P ~/Library/Fonts https://github.com/powerline/fonts/raw/master/InconsolataDz/Inconsolata-dz%20for%20Powerline.otf
echo " ... Done"

if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
    echo -n "Cloning Vundle"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 1>/dev/null
    echo " ... Done"
fi

echo -n "Installing Vundle plugins"
vim +PluginInstall +qall
echo " ... Done"

# For Python
echo -n "Installing ipython"
pip install ipython 1>/dev/null
echo " ... Done"
