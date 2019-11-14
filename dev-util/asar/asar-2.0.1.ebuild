# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7


#inherit chromium-2

#MY_PN="${PN/-bin}"
#SRC_URI_BASE="https://github.com/electron/electron/releases/download"
DESCRIPTION="Creating Electron app packages"
HOMEPAGE="https://github.com/electron/asar"
#SRC_URI="	amd64? ( ${SRC_URI_BASE}/v${PV}/${MY_PN}-v${PV}-linux-x64.zip -> ${P}-x64.zip )"
RESTRICT="mirror"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

RDEPEND=""
DEPEND=""

S="${WORKDIR}"


src_install() {
#mkdir -p ${ED}
npm install -g --prefix="${ED}/usr" asar@2.0.1
    #cp -r "${srcdir}/usr" "${ED}"

    cd "${ED}/usr/lib/node_modules/asar"
    install -dm755 "${pkgdir}/usr/share/licenses/asar"
    ln -s \
        $(realpath --relative-to="${ED}"/usr/share/licenses/asar LICENSE.md) \
        "${ED}/usr/share/licenses/asar"

    sed -e "s|${ED}|/|" -i package.json
    find node_modules -name 'package.json' -exec sed -e "s|${ED}||" -i {} \;
    rm -r node_modules/{bluebird/js/browser,mkdirp/bin}
    modclean -r -a "*.ts,.bin,.vscode" --ignore='license'
}
