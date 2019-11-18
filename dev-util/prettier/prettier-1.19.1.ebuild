EAPI=7

DESCRIPTION="An opinionated code formatter for JS, JSON, CSS, YAML and much more"
HOMEPAGE="https://prettier.io/"
SRC_URI="	amd64? ( http://mirror.ubrco.de/archlinux/community/os/x86_64/prettier-1.19.1-1-any.pkg.tar.xz -> ${P}-x64.tar.gz )"
RESTRICT="mirror"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="binary"

RDEPEND="sys-apps/yarn"
DEPEND="
binary? ( =dev-util/electron-bin-6.0.2 )
!binary? ( dev-util/electron )"

S="${WORKDIR}"

src_install() {
    cp -r usr   "${ED}/"
}
