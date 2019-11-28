# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_7 )

inherit distutils-r1  xdg-utils

DESCRIPTION="A cross platform front-end GUI of the popular youtube-dl"
HOMEPAGE="url="https://github.com/r0oth3x49/udemy-dl""
LICENSE="Unlicense"

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="url="https://github.com/r0oth3x49/udemy-dl""
else
	SRC_URI="url=https://github.com/r0oth3x49/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

RESTRICT="mirror"
IUSE=""
SLOT="0"
#depends=('python' 'python-requests' 'python-colorama' 'python-unidecode' 'python-six' 'python-pyopenssl')
#DEPEND=""
#RDEPEND=""

python_install_all() {
	distutils-r1_python_install_all
}
