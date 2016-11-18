#!/bin/sh

set -ux

rm -rf app
export FLATPAK_BWRAP=/usr/bin/bwrap
flatpak-builder --verbose --disable-updates --disable-download --ccache --require-changes --repo=repo --subject="Firefox Developer Edition Build" app org.mozilla.firefox-devedition.json

flatpak build-update-repo --prune --prune-depth=20 repo

# The following commands should be performed once
flatpak --user remote-add --no-gpg-verify firefox-developer-edition ./repo || true
flatpak --user -v install firefox-developer-edition org.mozilla.firefox-devedition || true

flatpak update --user org.mozilla.firefox-devedition
