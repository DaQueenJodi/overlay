# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 cargo

DESCRIPTION=""
HOMEPAGE="https://lapce.dev/"
EGIT_REPO_URI="https://github.com/lapce/lapce.git"
LICENSE="Apache-2.0 Apache-2.0-with-LLVM-exceptions"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=">=dev-lang/rust-1.62.0[rls]"
RDEPEND="${DEPEND}"
BDEPEND=""


RESTRICT="mirror"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_install() {
	cargo_src_install
}
