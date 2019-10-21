# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CATEGORY="dev-util"
DESCRIPTION="A website development tool for building responsive websites"
HOMEPAGE="https://pinegrow.com"
SRC_URI="
http://download.pinegrow.com/PinegrowLinux64.${PV}.zip
${HOMEPAGE}/Pinegrow_EULA.pdf
${HOMEPAGE}/favicon.ico"
#RESTRICT="mirror"

LICENSE="Pinegrow"
SLOT="0"
KEYWORDS="-* ~amd64"

RDEPEND="
	dev-libs/nss
	media-libs/alsa-lib
	x11-libs/gtk+:3
	x11-libs/libXtst
"
# dependency gtk2 gconf   libxss
DEPEND="${RDEPEND}
app-arch/unzip"

S="${WORKDIR}"




#src_prepare() {
  #unzip -qqo "PinegrowLinux64.${pkgver}.zip" -d "Pinegrow-${pkgver}"
  #gendesk --pkgname "${PN}" --pkgdesc "${DESCRIPTION}"
#}

src_install() {
  install -D -m644 Pinegrow_EULA.pdf ${ED}/usr/share/licenses/${PN}/LICENSE.md
  install -d ${ED}/usr/share/pinegrow/
  cd Pinegrow-${PV}
  cp -R * ${ED}/usr/share/pinegrow/
  install -Dm644 "${FILESDIR}/${PN}.desktop" "$ED/usr/share/applications/$PN.desktop"
  install -Dm644 favicon.ico $ED/usr/share/pixmaps/$PN.ico
  ln -fs /usr/share/pinegrow/PinegrowLibrary /usr/bin/pinegrow
}
