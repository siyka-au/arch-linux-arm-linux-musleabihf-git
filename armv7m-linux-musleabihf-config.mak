BINUTILS_VER = 2.35.1
GCC_VER = 10.2.0
MUSL_VER = 1.2.1
GMP_VER = 6.2.1
MPC_VER = 1.2.1
MPFR_VER = 4.1.0
# ISL_VER =
# LINUX_VER =

TARGET = armv7m-linux-musleabihf
#GCC_CONFIG += --with-arch=armv7-m
GCC_CONFIG += --with-cpu=cortex-m7
GCC_CONFIG += --with-fpu=fpv5-d16
GCC_CONFIG += --enable-languages=c,c++
GCC_CONFIG += --disable-libquadmath --disable-decimal-float
GCC_CONFIG += --enable-default-pie
GCC_CONFIG += --enable-cxx-flags="-ffunction-sections"
MUSL_CONFIG += --enable-debug
COMMON_CONFIG += CFLAGS="-g0 -Os" CXXFLAGS="-g0 -Os" LDFLAGS="-s"
COMMON_CONFIG += --disable-nls
COMMON_CONFIG += --with-debug-prefix-map=\$(CURDIR)=
