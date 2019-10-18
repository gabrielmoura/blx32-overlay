EAPI=7
 
SRC_URI_BASE="https://github.com/gabrielmoura/blx32-overlay/releases/download"
DESCRIPTION="A proprietary music streaming service"
HOMEPAGE="https://www.deezer.com/"
SRC_URI="${SRC_URI_BASE}/${PN}/deezer-4.17.1-1-any.pkg.tar.xz -> ${P}-x64.tar.xz"
RESTRICT="mirror"
 
LICENSE="Copyright (c) 2006-2018 Deezer S.A."
SLOT="0"
KEYWORDS="-* ~amd64"
 
RDEPEND="
	dev-util/electron-bin
"
DEPEND="${RDEPEND}"
 
S="${WORKDIR}"
 

src_install() {
	#	dodir "/${USRPATH}"
	# Note: intentionally not using "doins" so that we preserve +x bits
	#cp -r ./* "${ED}/${USRPATH}"
	mkdir -p "${ED}"/usr/share/deezer
    mkdir -p "${ED}"/usr/share/applications
    mkdir -p "${ED}"/usr/share/icons/hicolor/256x256/apps/
    mkdir -p "${ED}"/usr/bin/

	#echo "#!/bin/sh" > deezer
    #echo "exec electron /usr/share/deezer/app.asar \"\$@\"" >> deezer

	install -Dm644 /usr/share/deezer/app.asar "${ED}"/usr/share/deezer/
    install -Dm644 /usr/share/icons/hicolor/256x256/apps/deezer.png "${ED}"/usr/share/icons/hicolor/256x256/apps/
    install -Dm644 /usr/share/deezer/systray.png "${ED}"/usr/share/deezer/
    install -Dm644 /usr/share/applications/deezer.desktop "${ED}"/usr/share/applications/
    install -Dm755 /usr/bin/deezer "${ED}"/usr/bin/

}