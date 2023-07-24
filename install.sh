#!/bin/sh
cp ./.zshrc $HOME/.zshrc
cp i3/config $HOME/.config/i3/config
cp alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml
mkdir -p $HOME/.config/polybar && cp -r polybar/* $HOME/.config/polybar/
