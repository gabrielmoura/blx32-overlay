# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="sweet looking lockscreen for linux system"
HOMEPAGE="https://github.com/pavanjadhaw/betterlockscreen"

if [[ ${PV} == "9999" ]]; then
	EGIT_REPO_URI="${HOMEPAGE}.git"
	inherit git-r3
else
	SRC_URI="${HOMEPAGE}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"
IUSE="examples"

DEPEND="
	>=x11-misc/i3lock-color-2.11
	media-gfx/imagemagick
	x11-apps/xdpyinfo
	x11-apps/xrandr
	sys-devel/bc
	media-gfx/feh
"
RDEPEND="${DEPEND}"

src_install() {
	dobin betterlockscreen

	if use examples; then
		dodoc -r examples
		docompress -x /usr/share/doc/${PF}/examples
	fi
}