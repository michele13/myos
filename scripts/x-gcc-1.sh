#!/bin/bash
# Build Cross GCC Core Compiler
set -e
cd $MYOS/sources
rm -rf gcc-build
rm -rf gcc-9.2.0
tar xf gcc-9.2.0.tar.xz
cd gcc-9.2.0

case $(uname -m) in
	x86_64)
		sed -e '/m64=/s/lib64/lib/' \
			-i.orig gcc/config/i386/t-linux64
	;;
esac

tar xf ../gmp-6.2.0.tar.xz
mv -v gmp-6.2.0 gmp
tar xf ../mpc-1.1.0.tar.gz
mv -v mpc-1.1.0 mpc
tar xf ../mpfr-4.0.2.tar.xz
mv -v mpfr-4.0.2 mpfr

mkdir -v ../gcc-build
cd ../gcc-build

../gcc-9.2.0/configure \
--prefix=${MYOS}/cross-tools \
  --build=${MYOS_HOST} \
  --host=${MYOS_HOST} \
  --target=${MYOS_TARGET} \
  --with-sysroot=${MYOS} \
  --disable-nls  \
  --disable-libsanitizer \
  --enable-languages=c,c++ \
  --disable-multilib \
  --with-arch=${MYOS_CPU}
make all-gcc # all-target-libgcc 
make install-gcc # install-target-libgcc
cd $MYOS/sources
