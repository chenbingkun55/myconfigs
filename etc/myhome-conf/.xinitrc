#!/bin/sh

#exec fvwm
# Merge custom X resources
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export GDK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XIM=fcitx
export XIM_PROGRAM=fcitx

xrdb -merge "${HOME}/.Xresources"
#synergys
#fcitx &

#exec ck-launch-session dbus-launch --sh-syntax --exit-with-session awesome -c ~/.config/awesome/rc.lua
exec dbus-launch --sh-syntax awesome -c ~/.config/awesome/rc.lua
