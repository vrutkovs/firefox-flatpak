#!/bin/sh
set -uex
#rm -rf app repo
rm -rf app
APP_NAME=org.mozilla.FirefoxDevEdition

# Build repo
flatpak-builder $GPG_SETTINGS --verbose --force-clean --ccache --require-changes --keep-build-dirs --repo=repo --subject="Firefox Developer Edition Build" app $APP_NAME.json

# Get rid of old files in repo
flatpak build-update-repo $GPG_SETTINGS --prune --prune-depth=2 repo

# Build .flatpak file
flatpak build-bundle repo $APP_NAME.flatpak $APP_NAME
