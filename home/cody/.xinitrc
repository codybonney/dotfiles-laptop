includes=/etc/X11/xinit/xinitrc.d
if [ -d "$includes" ]
then
for f in "$includes/"*
do
[ -x "$f" ] && . "$f"
done
unset f
fi
unset includes

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Fix java reparenting issues when using bspwm
export _JAVA_OPTIONS='-Dsun.java2d.opengl=true'
export _JAVA_AWT_WM_NONREPARENTING=1

set -U SXHKD_SHELL /bin/sh &

xset -b &
xrdb -merge ~/.Xresources &
sxhkd &

# Change X shaped default cursor to left pointer. Window managers like BSPWM will not do this for you.
xsetroot -cursor_name left_ptr &

# disable touchpad tap-to-click and scrolling while typing
#syndaemon sudo syndaemon -t -i 0.3 -R -d &

exec bspwm
