#!/bin/sh

set -ux

rm -rf app
APP_NAME=org.mozilla.FirefoxDevEdition

export FLATPAK_BWRAP=/usr/bin/bwrap
flatpak-builder --verbose --ccache --require-changes --repo=repo --subject="Firefox Developer Edition Build" app $APP_NAME.json
flatpak build-update-repo --prune --prune-depth=20 repo
flatpak build-bundle repo FirefoxDevEdition.flatpak $APP_NAME
