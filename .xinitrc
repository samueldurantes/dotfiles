#!/bin/sh

# Load terminal style
xrdb .Xresources

if [ -f /usr/bin/i3 ]; then
  exec i3
fi
