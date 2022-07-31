# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8


DESCRIPTION="A cli to browse and watch anime (alone AND with friends)."
HOMEPAGE="https://github.com/pystardust/ani-cli"
SRC_URI="https://github.com/pystardust/${PN}/archive/refs/tags/v${PV}.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="sys-apps/grep sys-apps/sed virtual/awk net-misc/curl dev-libs/openssl media-video/mpv net-misc/axel media-video/ffmpeg"
RDEPEND="${DEPEND}"
BDEPEND=""

RESTRICT="mirror"

S="${WORKDIR}"

src_install() {
	dodir /usr/bin
	cp "${P}/${PN}" "${ED}" || die "failed to install"
}
