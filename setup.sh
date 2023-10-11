#! /bin/sh

ln -sf .config/nvim $HOME/.config/nvim
ln -sf .config/alacritty $HOME/.config/alacritty
ln -sf .config/zsh $HOME/.config/zsh
ln -sf .local/bin $HOME/.config/.local/bin

# create symlink to zprofile in HOME dir
ln -sf $HOME/.config/zsh/.zprofile $HOME/.zprofile
