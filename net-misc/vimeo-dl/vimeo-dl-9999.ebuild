# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( {python2_7,python3_{6,7}} )

inherit distutils-r1

DESCRIPTION="A utility to download from vimeo for personal offline use"
HOMEPAGE="https://github.com/r0oth3x49/vimeo"
LICENSE="MIT"


inherit git-r3
	EGIT_REPO_URI="https://github.com/r0oth3x49/vimeo"

RESTRICT="mirror"
IUSE=""
SLOT="0"

DEPEND="dev-python/colorama
dev-python/six
dev-python/pyopenssl
dev-python/unidecode
dev-python/requests"
RDEPEND="${DEPEND}"

python_install_all() {
	distutils-r1_python_install_all
}
