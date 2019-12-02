EAPI=7
DESCRIPTION="The new beautiful, fluffy client for Mastodon in React + TypeScript"
HOMEPAGE="https://github.com/hyperspacedev/hyperspace"
SLOT=0
SRC_URI="${HOMEPAGE}/releases/download/v1.0.4/hyperspace_1.0.4_amd64.deb"

inherit unpacker

DEPEND="
bin? ( >=dev-util/electron-bin-6.0.2 )
!bin? ( dev-util/electron )
"
IUSE="bin"
src_unpack(){
	unpack_deb ${A}
}
S="${WORKDIR}"
src_install(){
	cp -R "${WORKDIR}/usr" "${D}" || die "install failed!"
	cp -R "${WORKDIR}/opt" "${D}" || die "install failed!"
}

