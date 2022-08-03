# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="${PN/-bin}"
MY_PV="${PV/-r*}"
MY_P="${MY_PN}-${MY_PV}"

DESCRIPTION="a read-omly file system with a focus on achieving very high compression ratios"
HOMEPAGE="https://github.com/mhx/dwarfs"
SRC_URI="https://github.com/mhx/${PN}/releases/download/v${PV}/${MY_P}-Linux.tar.xz"

RESTRICT="mirror"

S="${WORKDIR}"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""


src_compile() {
	echo ""
}

src_install() {
	dodir /usr/
	mv "${MY_P}-Linux"/* "${ED}" || die
}
