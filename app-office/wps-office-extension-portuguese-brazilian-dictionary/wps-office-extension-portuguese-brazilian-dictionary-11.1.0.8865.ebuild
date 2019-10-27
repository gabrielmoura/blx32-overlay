# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit unpacker xdg

MY_PV="$(ver_cut 4)"

DESCRIPTION="WPS Office is an office productivity suite"
HOMEPAGE="http://www.wps.cn/product/wpslinux/ http://wps-community.org/"

KEYWORDS="amd64 pt_BR"
LINK="https://github.com/timxx/wps-office-mui/raw/master/mui/"
SRC_URI="
	pt_BR? ( "${LINK}"/pt_BR.7z )
	de-DE? ( "${LINK}"/de-DE.7z )
    en-GB? ( "${LINK}"/en-GB.7z )
    es-ES? ( "${LINK}"/es-ES.7z )
    es-MX? ( "${LINK}"/es-MX.7z )
    fr-CA? ( "${LINK}"/fr-CA.7z )
    fr-FR? ( "${LINK}"/fr-FR.7z )
    ja-JP? ( "${LINK}"/ja-JP.7z )
    pl-PL? ( "${LINK}"/pl-PL.7z )
    pt-PT? ( "${LINK}"/pt-PT.7z )
    ru-RU? ( "${LINK}"/ru-RU.7z )
    th-TH? ( "${LINK}"/th-TH.7z )
    zh-HK? ( "${LINK}"/zh-HK.7z )
    zh-TW? ( "${LINK}"/zh-TW.7z )

"

SLOT="0"
RESTRICT="strip mirror" # mirror as explained at bug #547372
LICENSE="WPS-EULA"
IUSE=""

RDEPEND="
	app-arch/p7zip

"
DEPEND=""
BDEPEND=""

S="${WORKDIR}"

src_install() {
	
	insinto /opt/kingsoft/wps-office/office6/mui
	doins -r pt_BR
}
