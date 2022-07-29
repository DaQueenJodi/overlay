EAPI=7

inherit git-r3 multiprocessing

EGIT_REPO_URI="https://github.com/godotengine/godot.git"
DESCRIPTION="2D and 3D cross-platform game engine"
HOMEPAGE="https://github.com/godotengine/godot"
LICENSE="MIT"
RESTRICT="mirror"
SLOT="0"
IUSE="debug"
KEYWORDS="~amd64"

DEPEND="dev-util/scons x11-libs/libX11 x11-libs/libXcursor x11-libs/libXinerama x11-libs/libXi media-libs/mesa media-libs/glu media-libs/alsa-lib media-sound/pulseaudio"



S="${WORKDIR}"

src_unpack() {
	git-r3_src_unpack
}

src_compile() {
	cd "${P}"
	scons -j$(makeopts_jobs) platform=linuxbsd target=release_debug || die "compilation failed"
}

src_install() {
	cp "${S}/${P}/bin/godot.linuxbsd.opt.tools.64" "${D}/godot" || die "copying failed"
}
