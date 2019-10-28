# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Dictionary WPS Office"
HOMEPAGE="http://www.wps.cn/product/wpslinux/ http://wps-community.org/"

KEYWORDS=""
LINK="http://wps-community.org/download/dicts"
SRC_URI="
	pt_BR? ( "${LINK}"/pt_BR.zip )
	de_DE? ( "${LINK}"/de_DE.zip )
    en_GB? ( "${LINK}"/en_GB.zip )
    es_ES? ( "${LINK}"/es_ES.zip )
    es_MX? ( "${LINK}"/es_MX.zip )
    fr_CA? ( "${LINK}"/fr_CA.zip )
    fr_FR? ( "${LINK}"/fr_FR.zip )
    ja_JP? ( "${LINK}"/ja_JP.zip )
    pl_PL? ( "${LINK}"/pl_PL.zip )
    pt_PT? ( "${LINK}"/pt_PT.zip )
    ru_RU? ( "${LINK}"/ru_RU.zip )
    th_TH? ( "${LINK}"/th_TH.zip )
    zh_HK? ( "${LINK}"/zh_HK.zip )
    zh_TW? ( "${LINK}"/zh_TW.zip )

"

SLOT="0"
RESTRICT="strip mirror" # mirror as explained at bug #547372
LICENSE="WPS-EULA"
IUSE="pt_BR de_DE en_GB es_ES es_MX fr_CA fr_FR ja_JP pl_PL pt_PT ru_RU zh_HK zh_TW th_TH"

RDEPEND="
	app-office/wps-office
"
DEPEND=""
BDEPEND=""

S="${WORKDIR}"
DIR="/usr/lib/office6/dicts/spellcheck"
src_install() {
    if use pt_BR ; then
    USED="pt_BR"
    insinto "${DIR}"/"${USED}"
		# remove some extra files for a small livecd install
		#cd ${DISTDIR}
		#unzip pt_BR.zip
		unzip "${DISTDIR}"/"${USED}.zip"
        doins -r "${USED}"/*
	fi

    if use pt_PT ; then
    USED="pt_PT"
    insinto "${DIR}"/"${USED}"
		# remove some extra files for a small livecd install
		#cd ${DISTDIR}
		#unzip pt_BR.zip
		unzip "${DISTDIR}"/"${USED}.zip"
        doins -r "${USED}"/*
	fi

    if use es_MX ; then
    USED="es_MX"
    insinto "${DIR}"/"${USED}"
		# remove some extra files for a small livecd install
		#cd ${DISTDIR}
		#unzip pt_BR.zip
		unzip "${DISTDIR}"/"${USED}.zip"
        doins -r "${USED}"/*
	fi
}
