xrandr --setprovideroutputsource modesetting NVIDIA-0
xbindkeys

#export GDK_SCALE=2
#export GDK_DPI_SCALE=0.5
#export QT_SCREEN_SCALE_FACTORS=1
#export QT_AUTO_SCREEN_SCALE_FACTOR=0
#export QT_FONT_DPI=96 vym
#export QT_SCALE_FACTOR=1.5

xrandr --dpi 260

# gnome keyring

eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
dbus-update-activation-environment --systemd DISPLAY

xrdb -merge ~/.Xresources &

syndaemon -t -i 1 -d &

#autocutsel -fork &
#autocutsel -selection PRIMARY -fork &

exec i3
