# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
#inherit unpacker xdg

MY_PV="$(ver_cut 4)"

DESCRIPTION="WPS Office is an office productivity suite"
HOMEPAGE="http://www.wps.cn/product/wpslinux/ http://wps-community.org/"

KEYWORDS=""
LINK="https://github.com/timxx/wps-office-mui/raw/master/mui"
SRC_URI="
	pt_BR? ( "${LINK}"/pt_BR.7z )
	de_DE? ( "${LINK}"/de_DE.7z )
    en_GB? ( "${LINK}"/en_GB.7z )
    es_ES? ( "${LINK}"/es_ES.7z )
    es_MX? ( "${LINK}"/es_MX.7z )
    fr_CA? ( "${LINK}"/fr_CA.7z )
    fr_FR? ( "${LINK}"/fr_FR.7z )
    ja_JP? ( "${LINK}"/ja_JP.7z )
    pl_PL? ( "${LINK}"/pl_PL.7z )
    pt_PT? ( "${LINK}"/pt_PT.7z )
    ru_RU? ( "${LINK}"/ru_RU.7z )
    th_TH? ( "${LINK}"/th_TH.7z )
    zh_HK? ( "${LINK}"/zh_HK.7z )
    zh_TW? ( "${LINK}"/zh_TW.7z )

"

SLOT="0"
RESTRICT="strip mirror" # mirror as explained at bug #547372
LICENSE="WPS-EULA"
IUSE="pt_BR de_DE en_GB es_ES es_MX fr_CA fr_FR ja_JP pl_PL pt_PT ru_RU zh_HK zh_TW th_TH"

RDEPEND="
	app-arch/p7zip
	app-office/wps-office
"
DEPEND=""
BDEPEND=""

S="${WORKDIR}"
DIR="/opt/kingsoft/wps-office/office6/mui"
src_install() {
    if use pt_BR ; then
    USED="pt_BR"
    insinto "${DIR}"/"${USED}"
		# remove some extra files for a small livecd install
		#cd ${DISTDIR}
		#7z e pt_BR.7z
		7z e "${DISTDIR}"/"${USED}.7z"
        doins -r "${USED}"/*
	fi

    if use pt_PT ; then
    USED="pt_PT"
    insinto "${DIR}"/"${USED}"
		# remove some extra files for a small livecd install
		#cd ${DISTDIR}
		#7z e pt_BR.7z
		7z e "${DISTDIR}"/"${USED}.7z"
        doins -r "${USED}"/*
	fi

    if use es_MX ; then
    USED="es_MX"
    insinto "${DIR}"/"${USED}"
		# remove some extra files for a small livecd install
		#cd ${DISTDIR}
		#7z e pt_BR.7z
		7z e "${DISTDIR}"/"${USED}.7z"
        doins -r "${USED}"/*
	fi
}

