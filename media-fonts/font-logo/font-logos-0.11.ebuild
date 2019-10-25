# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit font

MY_PV="0.11"
MY_PN="${PN}-${MY_PV}"

DESCRIPTION="An icon font providing popular linux distro's logos"
HOMEPAGE="https://github.com/lukas-w/font-logos"
SRC_URI="https://github.com/lukas-w/font-logos/archive/v${MY_PV}.zip"

LICENSE="unlicense"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 s390 sh sparc x86"

IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_PN}"
FONT_SUFFIX="ttf"
FONT_S="${S}/assets"


