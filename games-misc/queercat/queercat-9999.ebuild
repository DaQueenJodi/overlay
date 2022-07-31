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

src_unpack() {
	git-r3_src_unpack
}

src_prepare() {
	# Patch the color values for the transgender flag to more accurate
	# Thanks jan Luna for the right color values! https://github.com/janLuna/queercat/tree/patch-1
	eapply "${FILESDIR}/${PN}_trans.patch"
	default
}

src_compile() {
	cc main.c -lm -o "${PN}" || die "failed to compile"
}

src_install() {
	dodir /usr/bin
	cp queercat "${ED}" || die "could not copy 'queercat' to directory: ${ED}"
}

pkg_postinst() {
	optfeature "use 'neofetch | queercat -b -h 1' for free Reddit Karma"  app-misc/neofetch
}

