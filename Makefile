all: prepare-repo install-deps build update-repo

prepare-repo:
	[[ -d repo ]] || ostree init --mode=archive-z2 --repo=repo
	[[ -d repo/refs/remotes ]] || mkdir -p repo/refs/remotes && touch repo/refs/remotes/.gitkeep

install-deps:
	flatpak --user remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
	flatpak --user install -y flathub org.gnome.Platform/x86_64/3.30 org.gnome.Sdk/x86_64/3.30 || true

build:
	flatpak-builder --force-clean --ccache --require-changes --repo=repo \
		--subject="Nightly build of Firefox, `date`" \
		${EXPORT_ARGS} app org.mozilla.Firefox.json

update-repo:
	flatpak build-update-repo --prune --prune-depth=20 --generate-static-deltas repo
	rm -rf repo/.lock
