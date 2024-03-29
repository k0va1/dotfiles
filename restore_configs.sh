#! /bin/sh

# copy vim configs
yes | cp -Trf .config/nvim $HOME/.config/nvim/

# alacritty
yes | cp -Trf .config/alacritty $HOME/.config/alacritty/

# i3
yes | cp -Trf .config/i3 $HOME/.config/i3/

# polybar
yes | cp -Trf .config/polybar $HOME/.config/polybar/

# alacritty
yes | cp -Trf .config/alacritty $HOME/.config/alacritty/

# picom
yes | cp -Trf .config/picom $HOME/.config/picom/

# scripts
yes | cp -Trf .local/bin $HOME/.local/bin/

# dunst
yes | cp -Tfr .config/dunst $HOME/.config/dunst

# zsh
yes | cp -Tfr .config/zsh $HOME/.config/zsh/

# create symlink to zprofile in HOME dir
ln -sf $HOME/.config/zsh/.zprofile $HOME/.zprofile
