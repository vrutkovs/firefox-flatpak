#!/bin/sh
set -ux

curl -O https://sdk.gnome.org/keys/gnome-sdk.gpg
flatpak remote-add --gpg-import=gnome-sdk.gpg gnome https://sdk.gnome.org/repo/

flatpak install gnome org.gnome.Platform 3.24
flatpak install gnome org.gnome.Sdk 3.24

flatpak install gnome org.gnome.Platform 3.26
flatpak install gnome org.gnome.Sdk 3.26
