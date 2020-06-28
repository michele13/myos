#!/bin/bash
#
set -e
cd $MYOS/sources
rm -rf linux-5.5.3
tar xf linux-5.5.3.tar.xz
cd linux-5.5.3
make mrproper

if [ MYOS_CPU=i*86 ]; then 
	make ARCH=${MYOS_ARCH} CROSS_COMPILE=${MYOS_TARGET}- i386_defconfig
else
	make ARCH=${MYOS_ARCH} CROSS_COMPILE=${MYOS_TARGET}- defconfig
fi

make ARCH=${MYOS_ARCH} CROSS_COMPILE=${MYOS_TARGET}- 
make ARCH=${MYOS_ARCH} CROSS_COMPILE=${MYOS_TARGET}- \
       	INSTALL_MOD_PATH=${MYOS} modules_install

cp -v arch/${MYOS_ARCH}/boot/bzImage ${MYOS}/boot/vmlinuz-5.5.3
cp -v System.map ${MYOS}/boot/System.map-5.5.3 
cp -v .config ${MYOS}/boot/config-5.5.3 

# ${MYOS}/cross-tools/bin/depmod.pl -F ${MYOS}/boot/System.map-5.5.3 \
#	-b ${MYOS}/lib/modules/5.5.3 

cd $MYOS/sources
rm -rf linux-5.5.3
