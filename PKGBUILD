# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
_basename=armv7m-linux-musleabihf
pkgname=${_basename}-git
pkgver=r229.6aaee59
pkgrel=1
pkgdesc="Development tools for musl libc running on ARMv7-M processors with hard float FPv5 (16 registers)"
arch=(i686 x86_64)
url='https://github.com/richfelker/musl-cross-make'
license=(MIT)
depends=()
makedepends=(gcc git)
options=(!buildflags)
provides=(armv7m-linux-musleabihf-toolchain)
conflicts=(armv7m-linux-musleabihf-toolchain)
source=(git+https://github.com/siyka-au/musl-cross-make.git#branch=master)
sha256sums=('SKIP')

pkgver() {
	cd musl-cross-make
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cp $startdir/armv7m-linux-musleabihf-config.mak musl-cross-make/config.mak

	make -C musl-cross-make extract_all
}

build() {
	make -C musl-cross-make
}

package() {
	mkdir "$pkgdir/usr"
	make -C musl-cross-make OUTPUT="$pkgdir/usr" install
	rm $pkgdir/usr/lib/libcc1.so*
	rm -r $pkgdir/usr/share/gcc-10.2.0
	rm -r $pkgdir/usr/share/man/man7
}
