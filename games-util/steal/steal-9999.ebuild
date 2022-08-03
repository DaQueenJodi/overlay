# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="steaL is a free and opensource game-center and bittorrent client for Linux"
HOMEPAGE="https://github.com/AbdelrhmanNile/steal"
EGIT_REPO_URI="https://github.com/AbdelrhmanNile/steal.git"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND="sys-fs/fuse-overlayfs app-emulation/wine-staging app-arch/zpaq app-shells/tcsh  x11-misc/xclip sys-fs/dwarfs-bin net-p2p/qbittorrent dev-python/pandas dev-python/pebble"
RDEPEND="${DEPEND}"
BDEPEND="dev-lang/python"


src_unpack() {
	git-r3_src_unpack
}

src_compile() {
	chmod +x build.sh && ./build.sh || die
}

src_install() {
	dodir /usr/bin
	sudo make DESTINATION="${D}" install
}
