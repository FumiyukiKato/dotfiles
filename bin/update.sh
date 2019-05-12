#!/usr/local/bin/bash

DIR="/Users/fumiyuki/Repository/github.com/FumiyukiKato/dotfiles"
VSCODE="/Users/fumiyuki/Library/Application Support/Code/User"

cp $HOME/.bash_profile $DIR/

cp $HOME/.bashrc $DIR/

cp $HOME/.vimrc $DIR/

cp $HOME/.emacs.d/init.el $DIR/emacs.d/

cp "$VSCODE/keybindings.json" $DIR/vscode/
cp "$VSCODE/settings.json" $DIR/vscode/

