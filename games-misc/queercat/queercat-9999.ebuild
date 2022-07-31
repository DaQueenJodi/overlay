# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 optfeature



EGIT_REPO_URI="https://github.com/Elsa002/queercat.git"
DESCRIPTION="a version of lolcat with some lgbtq+ pride flags options"
HOMEPAGE="https://github.com/Elsa002/queercat"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="sys-apps/sed"
RESTRICT="mirror"
DESTINATION="${D}/usr/bin"

src_unpack() {
	git-r3_src_unpack
}

src_prepare() {
	# Patch the color values for the transgender flag to more accurate
	# Thanks jan Luna for the right color values! https://github.com/janLuna/queercat/tree/patch-1
	sed -i "s/#define TRA_BLUE.*/define TRA_BLU (0x55cdfc)/" main.c || die "failed to apply TRA_BLUE"
	sed -i "s/#define TRA_PNK.*/#define TRA_PNK (0xf7a8b8)/" main.c || die "failed to apply TRA_PNK"
	default
}

src_compile() {
	cc main.c -lm -o queercat || die "failed to compile"
}

src_install() {
	mkdir -p "${DESTINATION}" || die "could not create directory: ${DESTINATION}"
	cp queercat ${DESTINATION} || die "could not copy 'queercat' to directory: ${DIRECTORY}"
}

pkg_postinst() {
	optfeature "use 'neofetch | queercat -b -h 1' for free Reddit Karma"  app-misc/neofetch
}

