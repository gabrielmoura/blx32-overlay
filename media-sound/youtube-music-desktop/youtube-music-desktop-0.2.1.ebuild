# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit unpacker eutils

DESCRIPTION="An unofficial desktop client for YouTube Music, with integrated lyrics from MusixMatch."
HOMEPAGE="https://github.com/MaverickMartyn/youtube-music-desktop"

SRC_URI="https://github.com/MaverickMartyn/youtube-music-desktop/releases/download/v0.2.1/youtube-music-desktop_0.2.1_amd64.deb"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}"

RESTRICT="mirror"

src_unpack() {
    unpack_deb ${A}
}

src_install() {
    cp -R "${WORKDIR}/usr" "${D}" || die "install failed!"
}

