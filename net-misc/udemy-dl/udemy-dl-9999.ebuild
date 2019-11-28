# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_7 )

inherit distutils-r1

DESCRIPTION="A utility to download courses from udemy for personal offline use"
HOMEPAGE="https://github.com/r0oth3x49/udemy-dl"
LICENSE="MIT"

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/r0oth3x49/udemy-dl"
else
	SRC_URI="https://github.com/r0oth3x49/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

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
cp "${FILESDIR}/setup.py" "${WORKDIR}/${P}"
	distutils-r1_python_install_all
}
