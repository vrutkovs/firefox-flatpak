include Makefile.config

json := org.mozilla.Firefox.json
app := firefox

all: test

test: repo $(json)
	flatpak-builder --force-clean --repo=repo --ccache --require-changes $(app) $(json)
	flatpak build-update-repo repo

release: release-repo $(json)
	if [ "x${RELEASE_GPG_KEY}" == "x" ]; then echo Must set RELEASE_GPG_KEY in Makefile.config, try \'make gpg-key\'; exit 1; fi
	flatpak-builder --force-clean --repo=release-repo  --ccache --gpg-homedir=gpg --gpg-sign=${RELEASE_GPG_KEY} $(app) $(json)
	flatpak build-update-repo --generate-static-deltas --gpg-homedir=gpg --gpg-sign=${RELEASE_GPG_KEY} release-repo

clean:
	rm -rf $(app)/*

repo:
	ostree init --mode=archive-z2 --repo=repo

release-repo:
	ostree init --mode=archive-z2 --repo=release-repo

gpg-key:
	if [ "x${KEY_USER}" == "x" ]; then echo Must set KEY_USER in Makefile.config; exit 1; fi
	mkdir -p gpg
	gpg2 --homedir gpg --quick-gen-key ${KEY_USER}
	echo Enter the above gpg key id as RELEASE_GPG_KEY in Makefile.config

$(app).flatpakref: $(app).flatpakref.in
	sed -e 's|@URL@|${URL}|g' -e 's|@GPG@|$(shell gpg2 --homedir=gpg --export ${RELEASE_GPG_KEY} | base64 | tr -d '\n')|' $< > $@
