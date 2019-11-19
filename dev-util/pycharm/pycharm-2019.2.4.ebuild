EAPI="4"
inherit eutils

PVERSION='2019.2.4'
#PVERSION_EAP='4.5.2'
#EAP=''
IUSE="community"
DESCRIPTION="PyCharm Professional build, non-free RELEASE 2019.2.4, can buy license"
HOMEPAGE="www.jetbrains.com/pycharm/"

SRC_URI="
!community?(https://download-cf.jetbrains.com/python/pycharm-professional-2019.2.4.tar.gz)
community?(https://download-cf.jetbrains.com/python/pycharm-community-2019.2.4.tar.gz)"

if [[ x${PVERSION} != 'x' ]]; then
	KEYWORDS="x86 amd64"
else
	KEYWORDS="~x86 ~amd64"
fi

DEPEND="|| ( >=virtual/jre-1.8 >=virtual/jdk-1.8 )"
RDEPEND="${DEPEND}"
RESTRICT="strip mirror"
SLOT="0"
S=${WORKDIR}

src_install() {
	dodir /opt/${PN}

	insinto /opt/${PN}
	cd pycharm-${PVERSION}
	doins -r *
	fperms a+x /opt/${PN}/bin/pycharm.sh || die "fperms failed"
	fperms a+x /opt/${PN}/bin/fsnotifier || die "fperms failed"
	fperms a+x /opt/${PN}/bin/fsnotifier64 || die "fperms failed"
	fperms a+x /opt/${PN}/bin/inspect.sh || die "fperms failed"
	dosym /opt/${PN}/bin/pycharm.sh /usr/bin/${PN}

	doicon "bin/${PN}.png"
	make_desktop_entry ${PN} "${PN}" "${PN}"
}

pkg_postinst() {
    elog "Run /usr/bin/${PN}"
}

