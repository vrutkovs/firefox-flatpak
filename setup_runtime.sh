#!/bin/sh
set -ux

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install flathub org.gnome.Platform//3.24 org.gnome.Sdk//3.24
flatpak install flathub org.gnome.Platform//3.26 org.gnome.Sdk//3.26
