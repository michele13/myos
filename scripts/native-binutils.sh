#!/bin/bash
#
set -e
cd $MYOS/sources
rm -rf binutils-2.34  
rm -rf binutils-build
tar xf binutils-2.34.tar.xz
cd binutils-2.34
mkdir -v ../binutils-build
cd ../binutils-build
../binutils-2.34/configure \
	--prefix=/usr \
	--build=${MYOS_HOST} \
	--target=${MYOS_TARGET} \
	--host=${MYOS_TARGET} \
	--disable-nls \
       	--disable-multilib
make
make install DESTDIR=${MYOS}
cd $MYOS/sources
rm -rf binutils-2.34
rm -rf binutils-build
