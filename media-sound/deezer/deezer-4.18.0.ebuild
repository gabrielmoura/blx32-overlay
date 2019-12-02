EAPI=7

SRC_URI_BASE="https://github.com/gabrielmoura/blx32-overlay/releases/download"
DESCRIPTION="A proprietary music streaming service"
HOMEPAGE="https://www.deezer.com/"
SRC_URI="${SRC_URI_BASE}/${PN}/deezer-4.18.0.tar.xz -> ${P}-x64.tar.xz"
RESTRICT="mirror"

LICENSE="Deezer"
SLOT="0"
KEYWORDS="-* ~amd64"
IUSE="bin"

DEPEND="
bin? ( =dev-util/electron-bin-6.1.5 )
!bin? ( dev-util/electron )
"
#DEPEND="${RDEPEND}"

S="${WORKDIR}"

src_install() {
	echo "#!/bin/sh" > "${WORKDIR}/usr/bin/deezer"
	echo "exec electron /usr/share/deezer/app.asar \"\$@\"" >> "${WORKDIR}/usr/bin/deezer"
	cp -R "${WORKDIR}/usr" "${D}" || die "install failed!"

}
