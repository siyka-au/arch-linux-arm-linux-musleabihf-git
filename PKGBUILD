# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
_basename=armv7m-linux-musleabihf
pkgname=${_basename}-git
pkgver=r224.fe96f62
pkgrel=1
pkgdesc="musl-cross-make, a "
arch=("i686" "x86_64")
url="https://github.com/richfelker/musl-cross-make"
license=("MIT")
depends=()
makedepends=("gcc" "git")
provides=("armv7m-linux-musleabihf-toolchain")
conflicts=("armv7m-linux-musleabihf-toolchain")
source=("git+https://github.com/siyka-au/musl-cross-make.git#branch=master")
sha256sums=("SKIP")

pkgver() {
    cd musl-cross-make
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cp $startdir/armv7m-linux-musleabihf-config.mak musl-cross-make/config.mak
}

build() {
	cd musl-cross-make
    make
}

package() {
	cd musl-cross-make
	make OUTPUT=/usr install
}
