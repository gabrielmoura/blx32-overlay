# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6


DESCRIPTION="Introspected tunnels to localhost"
SRC_URI="amd64?( https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip -> ${P}.zip )
x86?( https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip -> ${P}.zip )"
HOMEPAGE="https://ngrok.com"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-arch/unzip"
src_unpack(){
	unpack ${A}
}

src_install() {
	dobin ngrok
}
