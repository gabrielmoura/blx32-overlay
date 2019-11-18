EAPI=7

DESCRIPTION="Creating Electron app packages"
HOMEPAGE="https://github.com/electron/asar"

RESTRICT="mirror"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

RDEPEND="dev-util/electron-bin"
DEPEND="${RDEPEND}"

S="${WORKDIR}"


src_install() {

npm install -g --prefix="${ED}/usr" asar@2.0.1
    

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
