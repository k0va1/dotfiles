#! /bin/sh

# copy vim configs
yes | cp -rf $HOME/.config/nvim/init.vim .config/nvim/
yes | cp -rf $HOME/.config/nvim/UltiSnips .config/nvim/

# copy polybar configs
yes | cp -Tfr $HOME/.config/polybar .config/polybar/

# copy i3 configs
yes | cp -Tfr $HOME/.config/i3 .config/i3/

#alacritty
yes | cp -Tfr $HOME/.config/alacritty .config/alacritty/

# copy scripts
yes | cp -Tfr $HOME/.local/bin .local/bin/
