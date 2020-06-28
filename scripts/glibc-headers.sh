#!/bin/bash
#
set -e
cd $MYOS/sources
rm -rf glibc-2.30 
tar xf  glibc-2.30.tar.xz
cd  glibc-2.30

mkdir -v build
cd build


echo "libc_cv_forced_unwind=yes" > config.cache 
echo "libc_cv_c_cleanup=yes" >> config.cache
echo "libc_cv_ssp=no" >> config.cache
../configure --prefix=/usr --host=${MYOS_TARGET} \
	--build=${MYOS_HOST} \
	--with-headers=${MYOS}/usr/include \
	--disable-multilib \
	--cache-file=config.cache

# Install C Library Headers, Startup files, and stubs

make install-bootsrap-headers=yes install-headers DESTDIR=${MYOS}
#make install-headers DESTDIR=${MYOS}
make csu/subdir_lib
mkdir -pv ${MYOS}/usr/lib
install -v csu/crt1.o csu/crti.o csu/crtn.o ${MYOS}/usr/lib
${MYOS_TARGET}-gcc -nostdlib -nostartfiles -shared -x c /dev/null -o ${MYOS}/usr/lib/libc.so
touch ${MYOS}/usr/include/gnu/stubs.h

cd $MYOS/sources
