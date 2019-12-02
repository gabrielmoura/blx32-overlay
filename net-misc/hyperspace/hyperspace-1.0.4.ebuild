EAPI=7
DESCRIPTION="The new beautiful, fluffy client for Mastodon in React + TypeScript"
HOMEPAGE="https://github.com/hyperspacedev/hyperspace"

SRC_URI="${HOMEPAGE}/releases/download/v1.0.4/hyperspace_1.0.4_amd64.deb"

inherit unpacker
src_unpack(){
	unpack_deb ${A}
}

src_install(){
	cp -R "${WORKDIR}/usr" "${D}" || die "install failed!"
}
