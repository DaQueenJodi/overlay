# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION=""
HOMEPAGE="https://www.nsa.gov/ghidra"
SRC_URI="https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_10.1.5_build/ghidra_10.1.5_PUBLIC_20220726.zip -> ${P}.zip"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

IUSE="wm-fix"


DEPEND="|| ( >=virtual/jdk-11.0.0 >=dev-java/openjdk-bin-11.0.0 >=dev-java/openjdk-11.0.0 >=dev-java/oracle-jdk-bin-11.0.0 )"
RDEPEND="${DEPEND}"
BDEPEND=""


S=${WORKDIR}

RESTRICT="mirror"


src_unpack() {
	default
	mv "${WORKDIR}/ghidra_${PV}_PUBLIC" "${WORKDIR}/${PN}" || die "renaming failed"
}


src_prepare() {
	if use wm-fix; then
		eapply "${FILESDIR}/${PN}_wm-fix.patch"
	fi
	default
}

src_install() {
	dodir "/usr/share/"
	mv "${WORKDIR}/${PN}/" "${ED}/usr/share/" || die "installation failed"


	dodir /usr/bin
	dosym "${ED}/usr/share/${PN}/ghidraRun" "/usr/bin/${PN}"
}

