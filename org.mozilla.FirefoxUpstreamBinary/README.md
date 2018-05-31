# Firefox flatpak package from upstream binaries

To build flatpak package from upstream binaries use following steps:
1. go to http://archive.mozilla.org/pub/firefox/candidates/
1. find a binary which you want to pack
1. use the URL of the binary as a parameter to the `build_flatpak_from_url` script, for example:
```
 ./build_flatpak_from_url http://archive.mozilla.org/pub/firefox/candidates/60.0esr-candidates/build6/linux-x86_64/en-US/firefox-60.0esr.tar.bz2
```

This will download all langpacks available for the binary (in above example 
langpacks located at 
http://archive.mozilla.org/pub/firefox/candidates/60.0esr-candidates/build6/linux-x86_64/xpi/ ),
generates flatpak manifest file from the template and creates the 
`org.mozilla.FirefoxUpstreamBinary.flatpak` file where the bundled flatpak is stored,
to install it use:
```
flatpak install org.mozilla.FirefoxUpstreamBinary.flatpak
```

