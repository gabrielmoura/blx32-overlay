# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="MUI WPS Office"
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
IUSE=" +pt_BR de_DE en_GB es_ES es_MX fr_CA fr_FR ja_JP pl_PL pt_PT ru_RU zh_HK zh_TW th_TH"

RDEPEND="
	app-arch/p7zip
	app-office/wps-office
"
DEPEND=""
BDEPEND=""

S="${WORKDIR}"
TO_DIR="/opt/kingsoft/wps-office/office6/mui"
src_install() {
    if use pt_BR ; then
		echo "Isso não esta ac"
    	_USED="pt_BR"
		#7z e "${_USED}.7z"
    	insinto "${TO_DIR}"
		# remove some extra files for a small livecd install
		#cd "${DISTDIR}"
		#7z e pt_BR.7z
		7z -y e "${DISTDIR}/${_USED}.7z" -o "${S}/${_USED}"
        #mv "${S}/${_USED}"  "${S}/${TO_DIR}"
		#newins "${S}/*" "${S}/${TO_DIR}"
	#	rm "${S}/pt_BR/work/{newfile.dps,theme.xml,FourObjectsLayout.xml,Austere.doc,wpp.cfg,default.dpt,ClipArtAndVerticalTextLayout.xml,process.gif,Pinstripe.doc,ettips.qm,Kingsoft_Et_Bubble.xlsx,Cubical.doc,Dots.png}"

		doins -r "${S}/${_USED}"
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
