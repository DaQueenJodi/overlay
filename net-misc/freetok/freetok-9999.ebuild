# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 optfeature

DESCRIPTION=""
HOMEPAGE=""
EGIT_REPO_URI="https://github.com/ProgrammerIn-wonderland/${PN}/"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="net-misc/curl dev-cpp/nlohmann_json"

RESTRICT="mirror"

src_unpack() {
	git-r3_src_unpack
}

src_compile() {
	cd CPP || die "could not go to directory: ${PWD}/CPP"
	c++ main.cpp -lcurl -o freetok || die "failed to compile ${PN}"
}

src_install() {
	cd CPP || die "could not go to directory: ${PWD}/CPP"
	dodir /usr/bin
	cp "${PN}" "${ED}" || die "failed to install ${PN} to ${DESTINATION}"
}

pkg_postinst() {
	optfeature "view the video with mpv" media-video/mpv
}
