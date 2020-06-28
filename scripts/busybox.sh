#!/bin/bash
#
set -e
cd $MYOS/sources
rm -rf busybox-1.31.1 
tar xf busybox-1.31.1.tar.bz2
cd busybox-1.31.1
# make defconfig does not exit with code zero, so we use the 'true' trick
make CROSS_COMPILE="${MYOS_TARGET}-" defconfig make || true

make CROSS_COMPILE="${MYOS_TARGET}-"  
make CROSS_COMPILE="${MYOS_TARGET}-" CONFIG_PREFIX="${MYOS}" install
cp -v examples/depmod.pl ${MYOS}/cross-tools/bin
chmod 755 ${MYOS}/cross-tools/bin/depmod.pl



cd $MYOS/sources
rm -rf busybox-1.31.1
