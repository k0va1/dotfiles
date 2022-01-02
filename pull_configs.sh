#! /bin/sh

# copy vim configs
yes | cp -rf $HOME/.config/nvim/init.vim .config/nvim/
yes | cp -rf $HOME/.config/nvim/UltiSnips .config/nvim/
yes | cp -rf $HOME/.config/nvim/coc-settings.json .config/nvim/

# copy polybar configs
yes | cp -Tfr $HOME/.config/polybar .config/polybar/

# copy i3 configs
yes | cp -Tfr $HOME/.config/i3 .config/i3/

#alacritty
yes | cp -Tfr $HOME/.config/alacritty .config/alacritty/

# copy scripts
yes | cp -Tfr $HOME/.local/bin .local/bin/

# picom
yes | cp -Tfr $HOME/.config/picom .config/picom/

# dunst
yes | cp -Tfr $HOME/.config/dunst .config/dunst/

# zsh configs
rsync -av --progress $HOME/.config/zsh .config/ --exclude={'.zsh_history','.zcompdump*'}
