EAPI=7

#SRC_URI_BASE="https://github.com/gabrielmoura/blx32-overlay/releases/download"
DESCRIPTION="A proprietary music streaming service"
HOMEPAGE="https://www.deezer.com/"
SRC_URI="
https://www.deezer.com/desktop/download/artifact/win32/x86/4.17.21/deezer-4.17.21-setup.exe -> deezer-4.17.21-setup.exe
https://github.com/SibrenVasse/deezer/raw/mpris/node_modules.tar.xz -> ${P}-node_modules.tar.xz" 
RESTRICT="mirror"

LICENSE="Copyright (c) 2006-2018 Deezer S.A."
SLOT="0"
KEYWORDS="-* ~amd64"
IUSE="binary"
DEPEND="
	dev-util/electron-bin
	app-arch/p7zip
	dev-utils/asar
	media-gfx/imagemagick
	binary? ( =dev-util/electron-bin-6.0.2 )
	!binary? ( dev-util/electron )
"

S="${WORKDIR}"

src_prepare(){
    7z x -so deezer-4.17.21-setup.exe "\$PLUGINSDIR/app-32.7z" > app-32.7z
    # Extract app archive
    7z x -y -bsp0 -bso0 app-32.7z

    # Extract png from ico container
    convert resources/win/app.ico resources/win/deezer.png

    cd resources/
    rm -r app || true
    asar extract app.asar app
    # Remove NodeRT from package (-205.72 MiB)
    rm -r app/node_modules/@nodert

    cd app

    prettier --write "build/*.js"
    # Fix crash on startup since 4.14.1 (patch systray icon path)
    #eapply "${FILESDIR}/systray.patch"
	patch -p1 < "${FILESDIR}/systray.patch"
    # Disable menu bar
    #eapply "${FILESDIR}/menu-bar.patch"
	patch -p1 < "${FILESDIR}/menu-bar.patch"
    # Fix oauth login
    #eapply "${FILESDIR}/ouath.patch"
	patch -p1 < "${FILESDIR}/oauth.patch"

    # Monkeypatch MPRIS D-Bus interface
    #eapply "${FILESDIR}/0001-MPRIS-interface.patch"
	patch -p1 < "${FILESDIR}/0001-MPRIS-interface.patch"
    #eapply_user

	#wget https://github.com/SibrenVasse/deezer/raw/mpris/node_modules.tar.xz
	tar -xvf "${P}-node_modules.tar.xz"

    cd ..
    asar pack app app.asar
}
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

	install -Dm644 resources/app.asar "$ED"/usr/share/deezer/
    install -Dm644 resources/win/deezer.png "$ED"/usr/share/icons/hicolor/256x256/apps/
    install -Dm644 resources/win/systray.png "$ED"/usr/share/deezer/
    install -Dm644 "$PN".desktop "$ED"/usr/share/applications/
    install -Dm755 deezer "$ED"/usr/bin/

}

