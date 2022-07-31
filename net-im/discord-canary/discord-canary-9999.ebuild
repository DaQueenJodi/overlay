# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Discord alpha testing release"
HOMEPAGE="https://discord.com/"
LICENSES="all-rights-reserved openasar? ( MIT )"
SLOT="0"
KEYWORDS="~amd64"

IUSE="openasar"
SRC_URI="https://discord.com/api/download/canary?platform=linux&format=tar.gz -> discord-canary.tar.gz
openasar? ( https://github.com/GooseMod/OpenAsar/releases/download/nightly/app.asar ) "
RESTRICT="mirror"
DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="app-arch/tar openasar? ( net-misc/wget ) "
DESTDIR="${D}/opt/"

S="${WORKDIR}"

src_unpack() {
	default
}

src_configure() {
	if use openasar; then
		cp "${DISTDIR}/app.asar" "${WORKDIR}/DiscordCanary/resources/app.asar"
	fi
}

src_install() {
	mv DiscordCanary discord-canary
	dodir /opt
	cp -R "${S}/discord-canary" "${DESTDIR}" || die "copying failed"
	dodir /usr/bin/
	ln -s "${DESTDIR}/discord-canary/DiscordCanary" "${D}/usr/bin/discord-canary" || die "failed to create symbolic link"
	if use openasar; then
		chmod -R 777 "${DESTDIR}/discord-canary/resources" || die "failed to apply chmod"
	fi
}

