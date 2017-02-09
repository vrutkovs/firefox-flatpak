#!/bin/sh

# Launch the script that installs the plugins (if needed) in the background
# so it installs them while Firefox is already running, avoiding the user
# to wait
/app/bin/firefox-plugins-installer &
exec /app/extra/firefox/firefox-bin $@
