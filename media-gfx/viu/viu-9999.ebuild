# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo git-r3

EGIT_REPO_URI="https://github.com/atanunq/viu.git"
DESCRIPTION="A small command-line application to view images from the terminal written in Rust"
HOMEPAGE="https://github.com/atanunq/viu"

LICENSE="GPT-3"
RESTRICT="mirror"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~x86"

DEPEND=">=dev-lang/rust-1.62.0[rls]"
RDEPEND="${DEPEND}"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_install() {
	cargo_src_install
}
