#!/bin/sh

# Load terminal style
xrdb .Xresources

# Exports
export GTK_IM_MODULE=xim

if [ -f /usr/bin/i3 ]; then
  exec i3
fi
