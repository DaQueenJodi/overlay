# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python{2_7,3_4,3_5,3_10} )

inherit distutils-r1

DISTUTILS_IN_SOURCE_BUILD=1

RESTRICT="mirror"

S="${WORKDIR}"

DESCRIPTION=""
HOMEPAGE="https://kivy.org"
SRC_URI="https://github.com/kivy/${PN}/releases/download/${PV}/${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

IUSE="sdl gstreamer"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	die "dont use this lmao"
}

python_prepare_all() {
	export USE_SDL2=$(usex sdl 1 0)
	export USE_GSTREAMER=$(usex gstreamer 1 0)
	export KIVY_USE_SETUPTOOLS=1
	distutils-r1_python_prepare_all
}


python_compile() {
	esetup.py build_ext --inplace
	esetup.py build
}
python_install_all() {
	distutils-r1_python_install_all
}




