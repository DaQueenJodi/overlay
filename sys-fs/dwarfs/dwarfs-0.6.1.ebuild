# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="a read-only file system with a focus on achieving very high compression ratios"
HOMEPAGE="https://github.com/mhx/dwarfs"
SRC_URI="https://github.com/mhx/${PN}/releases/download/v${PV}/${P}.tar.bz2"

# third party git repos downloaded by dwarfs during build time:
EGIT_REPO_URI="https://github.com/fmtlib/fmt.git"


LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="sys-fs/fuse sys-devel/flex app-text/ronn dev-util/cmake sys-devel/bison sys-devel/binutils dev-libs/boost[context] dev-libs/jemalloc app-arch/lz4 dev-cpp/glog dev-libs/xxhash dev-libs/openssl sys-libs/libunwind dev-cpp/gflags dev-ml/fmt app-arch/libarchive dev-libs/double-conversion app-arch/xz-utils app-arch/zstd dev-libs/libevent"
TEST=0

S="${WORKDIR}"

RESTRICT="mirror"

src_unpack() {
	die || "dont use this lmao"
	git-r3_src_unpack
	default
}

src_compile() {
	if use test; then
		TEST="1"
	fi
	cmake -B build -S "${P}" \
   	-D CMAKE_INSTALL_PREFIX=/usr \
   	-D CMAKE_BUILD_TYPE=None \
    -D PREFER_SYSTEM_ZSTD=ON \
    -D PREFER_SYSTEM_XXHASH=ON || die
	cmake --build build
	#emake || die

	#if use test; then
	#	emake test || die "test failed"
	#fi
}
src_install() {
	cmake --install build --prefix "${D}" || die
	die
}


