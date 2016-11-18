#!/bin/sh
APP_NAME=org.mozilla.FirefoxDevEdition


# The following commands should be performed once
flatpak --user remote-add --no-gpg-verify firefox-developer-edition ./repo || true
flatpak --user -v install firefox-developer-edition $APP_NAME || true

flatpak update --user $APP_NAME
