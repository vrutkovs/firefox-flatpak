#!/bin/sh
set -e
#rm -rf app repo
rm -rf app
if [ -z $1 ]; then
  echo "Usage: $0 APP"
  echo ""
  echo "Example"
  echo "  $0 org.mozilla.FirefoxDevEdition"
  exit 1
else
  APP_NAME=$1
fi


# Build repo
flatpak-builder $GPG_SETTINGS --verbose --force-clean --ccache --require-changes --repo=repo --subject="Build of $APP_NAME" app $APP_NAME/$APP_NAME.json

# Get rid of old files in repo
flatpak build-update-repo $GPG_SETTINGS --prune --prune-depth=2 repo

# Build .flatpak file
flatpak build-bundle $GPG_BUNDLE_SETTINGS repo $APP_NAME.flatpak $APP_NAME
