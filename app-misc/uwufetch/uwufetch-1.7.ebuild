# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A meme system info tool for (almost) all your Linux/Unix-based systems"
HOMEPAGE="https://github.com/TheDarkBug/uwufetch/"
SRC_URI="https://github.com/TheDarkBug/uwufetch/archive/refs/tags/1.7.tar.gz"


RESTRICT="mirror"

inherit optfeature multiprocessing


IUSE=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"


src_compile() {
	cd ${P} || die "failed to change directory: ${PWD}/${P}"
	make build "-j${makeopts_jobs}" || die "failed to build"
}

src_install() {
	cd "${P}" || die "failed to switch directory: ${PWD}/${P}"
	make DESTDIR="${D}"  install || die "failed to make install"
}


pkg_postinst() {
	optfeature "display images with '--image' option" media-gfx/viu
}

