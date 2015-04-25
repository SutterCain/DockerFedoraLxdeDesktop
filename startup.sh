#Start virtual frame buffer
Xvfb $DISPLAY -screen 0 1024x768x24 &
x11vnc -display $DISPLAY -rfbport 9501 -forever -passwdfile VncPassword.txt -q -bg
startlxde 2>&1 > lxde.log &
#open shell
/bin/bash