#!/bin/sh

JRE_PLUGIN_FILENAME="libnpjp2.so"

mkdir -p $HOME/.mozilla/plugins
mkdir -p $HOME/.flatpak_extras/firefox

if [ ! -f $HOME/.mozilla/plugins/$JRE_PLUGIN_FILENAME ]; then
	wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u112-b15/jre-8u112-linux-x64.tar.gz"
	tar zxf jre-8u112-linux-x64.tar.gz
	cp -r jre1.8.0_112/{bin,lib,man,plugin} $HOME/.flatpak_extras/firefox
	ln -s $HOME/.flatpak_extras/firefox/lib/amd64/libnpjp2.so $HOME/.mozilla/plugins/$JRE_PLUGIN_FILENAME
	rm -rf jre1.8.0_112 jre-8u112-linux.x64.tar-gz
fi

export PATH="$HOME/.flatpak_extras/firefox/bin:$PATH"
export LD_LIBRARY_PATH="$HOME/.flatpak_extras/firefox/lib/amd64:$HOME/.flatpak_extras/firefox/lib/amd64/jli:$LD_LIBRARY_PATH"
export JAVA_HOME="$Home/.flatpak_extras/firefox"

exec /app/bin/firefox $@
