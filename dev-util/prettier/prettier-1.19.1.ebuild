# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7


#MY_PN="${PN/-bin}"
DESCRIPTION="An opinionated code formatter for JS, JSON, CSS, YAML and much more"
HOMEPAGE="https://prettier.io/"
SRC_URI="	amd64? ( https://github.com/prettier/prettier/archive/1.19.1.tar.gz -> ${P}-x64.zip )"
RESTRICT="mirror"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

RDEPEND="sys-apps/yarn"
DEPEND="
binary? ( =dev-util/electron-bin-6.0.2 )
!binary? ( dev-util/electron )"

S="${WORKDIR}"

src_build(){
	yarn
	yarn build
}
src_install() {
    install -d "$pkgdir/usr/lib/$pkgname"
	cd "$pkgdir/usr/lib/$pkgname"
	cp -a "$srcdir/$pkgname-$pkgver/dist/"* .

	# https://github.com/prettier/prettier/issues/6900
	chmod +x "bin-$pkgname.js"

	install -d "$pkgdir/usr/bin"
	ln -s "/usr/lib/$pkgname/bin-$pkgname.js" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$pkgname-$pkgver/LICENSE"
}
