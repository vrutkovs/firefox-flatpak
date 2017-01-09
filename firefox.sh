#!/bin/sh

JRE_PLUGIN_FILENAME="libnpjp2.so"

mkdir -p $HOME/.mozilla/plugins
mkdir -p $HOME/.flatpak_extras/firefox

if [ ! -f $HOME/.mozilla/plugins/$JRE_PLUGIN_FILENAME ]; then
	ff-oracle-jre-installer &
fi

export PATH="$HOME/.flatpak_extras/firefox/bin:$PATH"
export LD_LIBRARY_PATH="$HOME/.flatpak_extras/firefox/lib/amd64:$HOME/.flatpak_extras/firefox/lib/amd64/jli:$LD_LIBRARY_PATH"
export JAVA_HOME="$Home/.flatpak_extras/firefox"

exec /app/bin/firefox $@
