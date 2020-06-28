#!/bin/bash
#
set -e
cd $MYOS/sources
rm -rf linux-5.5.3
tar xf linux-5.5.3.tar.xz
cd linux-5.5.3
make mrproper
make ARCH=${MYOS_ARCH} headers_check
make ARCH=${MYOS_ARCH} INSTALL_HDR_PATH=dest headers_install
find dest/include -name '.*' -delete
mkdir -p ${MYOS}/usr/include
cp -rv dest/include/* ${MYOS}/usr/include


cd $MYOS/sources
rm -rf linux-5.5.3
