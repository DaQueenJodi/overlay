# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit multiprocessing


DESCRIPTION="pulseaudio command line mixer"
HOMEPAGE="https://github.com/cdemoulins/pamixer"
SRC_URI="https://github.com/cdemoulins/pamixer/archive/refs/tags/${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="mirror"

DEPEND="media-libs/libpulse dev-libs/cxxopts"
RDEPEND="${DEPEND}"
BDEPEND="dev-util/meson"



src_compile() {
	meson setup build --buildtype=release --prefix=/usr
	meson compile "-j${makeopts_jobs}" "-l${makeopts_jobs}"  -C buildi
}
src_install() {
	DESTDIR="${D}" meson install -C build
}
