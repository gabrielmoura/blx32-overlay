#version 4.17.10
 
EAPI=7
 
SRC_URI_BASE="https://github.com/gabrielmoura/blx32-overlay/releases"
DESCRIPTION="A proprietary music streaming service"
HOMEPAGE="https://www.deezer.com/"
SRC_URI="
	amd64? ( ${SRC_URI_BASE}/deezer-4.17.1-1-any.pkg.tar.xz -> ${P}-x64.zip )
"
RESTRICT="mirror"
 
LICENSE="Copyright (c) 2006-2018 Deezer S.A."
SLOT="0"
KEYWORDS="-* ~amd64"
 
RDEPEND="
	dev-libs/electron-bin
"
DEPEND="app-arch/tar"
 
S="${WORKDIR}"
 
USRPATH="usr/${PN}"
QA_PRESTRIPPED="${OPTPATH}/.*"
 
pkg_setup() {
	# Silence linux-info_pkg_setup()
	:;
}
 
 
src_install() {
	dodir "/${USRPATH}"
	# Note: intentionally not using "doins" so that we preserve +x bits
	cp -r ./* "${ED}/${USRPATH}"

}
