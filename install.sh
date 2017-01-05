#!/bin/sh
APP_NAME=org.mozilla.FirefoxDevEdition

# The following commands should be performed once
flatpak install $APP_NAME.flatpak || true
