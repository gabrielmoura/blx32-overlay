EAPI=5
inherit eutils

EAP_VERSION='193.5233.18'
MY_PV='2019.2.5'

HOMEPAGE="https://www.jetbrains.com/go/"
DESCRIPTION="GoLand is a cross-platform IDE built specially for Go developers"
SRC_URI="
EAP? ( https://download-cf.jetbrains.com/go/goland-${EAP_VERSION}.tar.gz )
!EAP? ( https://download-cf.jetbrains.com/go/goland-${MY_PV}.tar.gz )"
IUSE="EAP"
if [[ x${EAP_VERSION} = 'x' ]]; then
	KEYWORDS="x86 amd64"
else
	KEYWORDS="~x86 ~amd64"
fi
LICENSE="IDEA"
PROGNAME="GoLand"

RESTRICT="strip mirror"
DEPEND=">=virtual/jre-1.6"
SLOT="0"
S=${WORKDIR}

src_install() {
	dodir /opt/${PN}

	cd GoLand*/
	insinto /opt/${PN}
	doins -r *

	fperms a+x /opt/${PN}/bin/goland.sh || die "Chmod failed"
	fperms a+x /opt/${PN}/bin/fsnotifier || die "Chmod failed"
	fperms a+x /opt/${PN}/bin/fsnotifier64 || die "Chmod failed"
	fperms a+x /opt/${PN}/bin/format.sh || die "Chmod failed"
	fperms a+x /opt/${PN}/bin/inspect.sh || die "Chmod failed"
	fperms a+x /opt/${PN}/bin/printenv.py || die "Chmod failed"
	fperms a+x /opt/${PN}/bin/restart.py || die "Chmod failed"

	rm -f ${D}/opt/${PN}/bin/fsnotifier-arm
	for i in $(ls ${D}/opt/${PN}/jbr/bin/)
	do
		fperms a+x /opt/${PN}/jbr/bin/${i} || die "Chmod failed"
	done;
	dosym /opt/${PN}/bin/goland.sh /usr/bin/${PN}

	doicon "bin/${PN}.png"
	make_desktop_entry ${PN} "${PROGNAME}" "${PN}"
}

pkg_postinst() {
    elog "Run /usr/bin/${PN}"
}


