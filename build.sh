#!/bin/sh

set -uex

rm -rf app
APP_NAME=org.mozilla.FirefoxDevEdition

#export FLATPAK_BWRAP=/usr/bin/bwrap
#cgdb flatpak-builder -- --args flatpak-builder $GPG_SETTINGS --verbose --force-clean --ccache --require-changes --repo=repo --subject="Firefox Developer Edition Build" app $APP_NAME.json
flatpak-builder $GPG_SETTINGS --verbose --force-clean --ccache --require-changes --repo=repo --subject="Firefox Developer Edition Build" app $APP_NAME.json
#flatpak-builder $GPG_SETTINGS --verbose --ccache --repo=repo --subject="Firefox Developer Edition Build" app $APP_NAME.json
#flatpak-builder $GPG_SETTINGS --verbose --ccache --require-changes --repo=repo --subject="Firefox Developer Edition Build" app $APP_NAME.json
#flatpak build-update-repo $GPG_SETTINGS --generate-static-deltas --prune --prune-depth=20 repo
#flatpak build-update-repo $GPG_SETTINGS --generate-static-deltas --prune --prune-depth=20 repo

#flatpak build-update-repo $GPG_SETTINGS --generate-static-deltas --prune --prune-depth=20 repo
#flatpak build-sign repo $APP_NAME --runtime $GPG_SETTINGS  

flatpak build-bundle repo FirefoxDevEdition.flatpak $APP_NAME
