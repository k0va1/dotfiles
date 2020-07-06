#! /bin/sh

# copy vim configs
cp -nf $HOME/.config/nvim/init.vim .config/nvim/
cp -nfr $HOME/.config/nvim/UltiSnips .config/nvim/

# copy polybar configs
cp -nTfr $HOME/.config/polybar .config/polybar/

# copy i3 configs
cp -nTfr $HOME/.config/i3 .config/i3/

# copy scripts
cp -nTfr $HOME/.local/bin .local/bin/
