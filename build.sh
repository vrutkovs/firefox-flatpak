#!/bin/sh
set -uex
rm -rf app repo
APP_NAME=org.mozilla.FirefoxDevEdition

# Build repo
flatpak-builder $GPG_SETTINGS --verbose --force-clean --ccache --require-changes --keep-build-dirs --repo=repo --subject="Firefox Developer Edition Build" app $APP_NAME.json

# Build .flatpak file
flatpak build-bundle repo $APP_NAME.flatpak $APP_NAME
