# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils fdo-mime multilib versionator

DESCRIPTION="Stream porn movies from torrents. Skip the downloads. Launch, click, watch."
HOMEPAGE="https://popcorntime.io/"
MY_PV=$(replace_version_separator 3 '-')

SRC_URI="x86?   ( http://porntime.ws/PornTimeX32.tar.gz )
		 amd64? ( http://porntime.ws/PornTimeX64.tar.gz )"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="splitdebug strip"

DEPEND=""
RDEPEND="dev-libs/nss
	gnome-base/gconf
	media-fonts/corefonts
	media-libs/alsa-lib
	x11-libs/gtk+:2
	net-libs/nodejs"

S="${WORKDIR}"

src_install() {
	exeinto /opt/${PN}

	insinto /opt/${PN}
    doins -r *

	dosym /opt/${PN}/Porntime /usr/bin/${PN}

	doexe Porntime

	insinto /usr/share/applications
	doins "${FILESDIR}"/${PN}.desktop

	insinto /usr/share/pixmaps
	doins "${FILESDIR}"/${PN}.png
}

pkg_postinst() {
	fdo-mime_desktop_database_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
}

