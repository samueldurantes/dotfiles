#!/bin/sh

# Load terminal style
xrdb .Xresources

# Startup applications
flameshot &

if [ -f /usr/bin/i3 ]; then
  exec i3
fi
