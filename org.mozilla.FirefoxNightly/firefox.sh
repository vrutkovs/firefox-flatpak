#!/bin/bash
export TMPDIR=$XDG_CACHE_HOME/tmp
if [ "$WAYLAND_DISPLAY" ]; then
  export GDK_BACKEND=wayland
else
  export GDK_BACKEND=x11
fi
firefox-bin $*

