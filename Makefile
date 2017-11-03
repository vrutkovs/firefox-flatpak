all: install-deps build prepare-repo

install-deps:
	flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
	flatpak --user install flathub org.freedesktop.Platform/x86_64/1.6 org.freedesktop.Sdk/x86_64/1.6 || true

build:
	flatpak-builder --force-clean --ccache --require-changes --repo=repo \
		--subject="Nightly build of Firefox, `date`" \
		${EXPORT_ARGS} app org.mozilla.Firefox.json

prepare-repo:
	flatpak build-update-repo --prune --prune-depth=20 --generate-static-deltas repo
