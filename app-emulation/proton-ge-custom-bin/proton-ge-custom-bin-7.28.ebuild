# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

GE_NAME="GE-Proton7-28"


DESCRIPTION=""
HOMEPAGE="https://github.com/GloriousEggroll/proton-ge-custom"
SRC_URI="https://github.com/GloriousEggroll/proton-ge-custom/releases/download/${GE_NAME}/${GE_NAME}.tar.gz -> ${P}.tar.gz"



LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND="games-util/steam-meta"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

RESTRICT="mirror"



src_install() {
	dodir "/usr/share/steam/compatibilitytools.d/${GE_NAME}"
	mv "${S}/${GE_NAME}/compatibilitytool.vdf" "${D}/usr/share/steam/compatibilitytools.d/${GE_NAME}" || die

	sed -i "s%\"install_path\" \".\"%\"install_path\" \"/opt/proton-ge-custom/${GE_NAME}\"%" "${D}/usr/share/steam/compatibilitytools.d/${GE_NAME}/compatibilitytool.vdf" || die

	dodir "/opt/proton-ge-custom"
	mv "${S}/${GE_NAME}" "${D}/opt/proton-ge-custom" || die

}

