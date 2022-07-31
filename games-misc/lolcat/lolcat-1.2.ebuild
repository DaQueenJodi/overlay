# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2


# uses a much faster and less-dependency rich fork of lolcat


EAPI=8

inherit optfeature


DESCRIPTION="Rainbows and unicorns!"
HOMEPAGE="https://github.com/jaseg/lolcat/"
SRC_URI="https://github.com/jaseg/lolcat/archive/refs/tags/v${PV}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""


RESTRICT="mirror"

src_compile() {
	make || die "building failed"
}
src_install() {
	dodir /usr/bin/
	make DESTDIR="${ED}" install || die "installation failed"
}

pkg_postinst() {
	optfeature "use 'neofetch | lolcat -b -h 1' for free Reddit Karma"  app-misc/neofetch
}
