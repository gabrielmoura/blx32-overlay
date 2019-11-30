EAPI=7

SRC_URI_BASE="http://repo.srmoura.com.br/aarch64"
DESCRIPTION="A proprietary music streaming service"
HOMEPAGE="https://www.deezer.com/"
SRC_URI="${SRC_URI_BASE}/deezer-4.18.0-1-any.pkg.tar.xz -> ${P}-x64.tar.xz"
RESTRICT="mirror"

LICENSE="Deezer"
SLOT="0"
KEYWORDS="-* ~amd64"
IUSE="binary"

DEPEND="
binary? ( =dev-util/electron-bin-6.1.5 )
!binary? ( dev-util/electron )
"
#DEPEND="${RDEPEND}"

S="${WORKDIR}"


src_install() {
	#	dodir "/${USRPATH}"
	# Note: intentionally not using "doins" so that we preserve +x bits
	#cp -r ./* "${ED}/${USRPATH}"
	mkdir -p "${ED}"/usr/share/deezer
    mkdir -p "${ED}"/usr/share/applications
    mkdir -p "${ED}"/usr/share/icons/hicolor/256x256/apps/
    mkdir -p "${ED}"/usr/bin/

	echo "#!/bin/sh" > deezer
	echo "exec electron /usr/share/deezer/app.asar \"\$@\"" >> deezer

	install -Dm644 usr/share/deezer/app.asar "${ED}"/usr/share/deezer/
    install -Dm644 usr/share/icons/hicolor/256x256/apps/deezer.png "${ED}"/usr/share/icons/hicolor/256x256/apps/
    install -Dm644 usr/share/deezer/systray.png "${ED}"/usr/share/deezer/
    install -Dm644 usr/share/applications/deezer.desktop "${ED}"/usr/share/applications/
    install -Dm755 deezer "${ED}"/usr/bin/

}


