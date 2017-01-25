#!/bin/sh

set -ux

rm -rf app
flatpak-builder --ccache --require-changes --repo=repo --subject="Nightly build of Firefox, `date`" app org.mozilla.Firefox.json

flatpak build-update-repo --prune --prune-depth=20 repo

# The following commands should be performed once
flatpak --user remote-add --no-gpg-verify nightly-firefox ./repo || true
flatpak --user -v install nightly-firefox org.mozilla.Firefox || true

flatpak update --user org.mozilla.Firefox
