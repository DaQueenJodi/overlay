# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Discord alpha testing release"
HOMEPAGE="https://discord.com/"
LICENSES="all-rights-reserved asar? ( MIT )"
SLOT="0"
KEYWORDS="~amd64"

IUSE="asar"
SRC_URI_ASAR="https://github.com/GooseMod/OpenAsar/releases/download/nightly/app.asar"
SRC_URI="https://discord.com/api/download/canary?platform=linux&format=tar.gz asar? ( https://github.com/GooseMod/OpenAsar/releases/download/nightly/app.asar ) "
RESTRICT="mirror"
DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="app-arch/tar asar? ( net-misc/wget ) "
DESTDIR="${D}/opt/"

S="${WORKDIR}"

src_unpack() {
	cp "${DISTDIR}/canary?platform=linux&format=tar.gz" discord-canary.tar.gz || die "could not copy archive"
	unpack "${WORKDIR}/discord-canary.tar.gz"
}

src_configure() {
	if use asar; then
		cp "${DISTDIR}/app.asar" "${WORKDIR}/DiscordCanary/resources/app.asar"
	fi
}

src_install() {
	mv DiscordCanary discord-canary
	mkdir "${DESTDIR}" || die "could not create destination directory"
	cp -R "${S}/discord-canary" "${DESTDIR}" || die "copying failed"
	mkdir -p "${D}/usr/bin" || die "failed to create directory"
	ln -s "${DESTDIR}/discord-canary/DiscordCanary" "${D}/usr/bin/discord-canary" || die "failed to create symbolic link"
	if use asar; then
		chmod -R 777 "${DESTDIR}/discord-canary/resources" || die "failed to apply chmod"
	fi
}

