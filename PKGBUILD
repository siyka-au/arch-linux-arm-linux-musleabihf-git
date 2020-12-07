# Maintainer: malleblas <malleblas@siyka.com>
_target=armv7m-linux-musleabihf
pkgname=${_target}-git
pkgver=r229.6aaee59
pkgrel=1
pkgdesc="Development tools for musl libc running on ARMv7-M processors with hard float FPv5 (16 registers)"
arch=(i686 x86_64)
url='https://github.com/richfelker/musl-cross-make'
license=(GPL LGPL MIT)
depends=()
makedepends=(gcc git)
options=(!buildflags !strip !emptydirs libtool staticlibs)
provides=(${_target}-binutils ${_target}-gcc)
conflicts=(${_target}-binutils ${_target}-gcc)
source=(${pkgname}-${pkgver}::git+https://github.com/siyka-au/musl-cross-make.git#branch=master)
sha256sums=('SKIP')

_configfile=${pkgname}-${pkgver}/config.mak
_cpu=cortex-m7
_fpu=fpv5-d16
_binutilsver=2.35.1
_gccver=10.2.0
_muslver=1.2.1
_gmpver=6.2.1
_mpcver=1.2.1
_mpfrver=4.1.0
_islver=
_linuxver=
_configsubrev=3d5db9ebe860

pkgver() {
	cd ${pkgname}-${pkgver}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	echo "BINUTILS_VER = ${_binutilsver}
		GCC_VER = ${_gccver}
		MUSL_VER = ${_muslver}
		GMP_VER = ${_gmpver}
		MPC_VER = ${_mpcver}
		MPFR_VER = ${_mpfrver}
		# ISL_VER = ${_islver}
		# LINUX_VER = ${_linuxver}
		# CONFIG_SUB_REV = ${_configsubrev}

		TARGET = ${_target}
		GCC_CONFIG += --with-cpu=${_cpu}
		GCC_CONFIG += --with-fpu=${_fpu}
		GCC_CONFIG += --enable-languages=c,c++
		GCC_CONFIG += --disable-libquadmath --disable-decimal-float
		GCC_CONFIG += --enable-default-pie
		GCC_CONFIG += --enable-cxx-flags="-ffunction-sections"
		MUSL_CONFIG += --enable-debug
		COMMON_CONFIG += CFLAGS=\"-g0 -Os\" CXXFLAGS=\"-g0 -Os\" LDFLAGS=\"-s\"
		COMMON_CONFIG += --disable-nls
		COMMON_CONFIG += --with-debug-prefix-map=\$(CURDIR)=" > ${_configfile}

	make -C ${pkgname}-${pkgver} extract_all
}

build() {
	make -C ${pkgname}-${pkgver}
}

package() {
	make -C ${pkgname}-${pkgver} OUTPUT="${pkgdir}/opt/cross/${_target}" install
}
