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
	--prefix=${MYOS}/cross-tools \
	--target=${MYOS_TARGET} \
	--with-sysroot=${MYOS} \
	--disable-nls \
       	--disable-multilib
make configure-host
make
make install
cd $MYOS/sources
rm -rf binutils-2.34
rm -rf binutils-build
