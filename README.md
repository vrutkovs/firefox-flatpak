# firefox-flatpak
This is a set of patches, scripts and a manifest to build latest Firefox using Flatpak. It is using GNOME 3.22 as base runtime.

# Usage

Run ```setup_repo.sh``` to download GNOME 3.20 SDK and setup a local Flatpak repo.

Now we're ready to run ```build.sh```, which will build Firefox from master branch (using Github's mirror).

After the build is finished you can start sandboxed Firefox:
```
$ flatpak run org.mozilla.Firefox
```
