#!/bin/bash
# Exit on error
set -e

# Set topdir
export top=$(pwd)

# Create necessary dirs
mkdir -pv $top/stage $top/logs

# Load config where it loads ARCH and MYOS
# ARCH is used to execute build a package to target 
# a certain a specific  architecture

source $top/config.txt

# Load functions
echo $top
source $top/lib/include.sh

# Write a text file that will be used later to load environment variables
cat > $top/logs/env.txt << EOF
export HOME=$HOME
export TERM=$TERM
export MYOS=$MYOS
export MYOS_ARCH=$MYOS_ARCH
export MAKEFLAGS=$MAKEFLAGS
export PS1='\u:\w\$ '
umask 022
LC_ALL=POSIX
PATH=${MYOS}/cross-tools/bin:/bin:/usr/bin
export MYOS LC_ALL PATH 
export MYOS_HOST=$(echo ${MACHTYPE} | sed "s/-[^-]*/-cross/")
export MYOS_TARGET=$MYOS_TARGET
export MYOS_CPU=$MYOS_CPU
EOF

# Clear all Environment variables
# and source the ones from the file created earlier
unset $(env|cut -d= -f1)
export top=$(pwd)
. $top/logs/env.txt
env
echo
echo Downloading Packages
step get-packages
echo Building Linux Headers
step linux-headers
echo Building Cross-Binutils
step cross-binutils
echo Building Cross-GCC - Pass 1
step x-gcc-1
echo Building Glibc Headers and Stubs
step glibc-headers
echo Building Cross-Libgcc 
step x-libgcc
echo Building Glibc
step glibc
echo Building Cross-GCC - Final
step x-gcc-2

echo
echo NOW BUILDING THE FINAL SYSTEM!
echo 

# Update Environment before cross-compiling final system
source $top/lib/env.sh

echo Creating Root filesystem
step rootfs
echo Building Busybox
step busybox
echo "Building Binutils (Native)"
step native-binutils
echo "Building GCC (Native)"
step native-gcc
echo Building Make
step make
echo Builing Bash
step bash
echo Building Tar
step tar
echo Building E2fsprogs
step e2fsprogs
echo Building Linux Kernel
step linux-kernel
echo Installing Bootscripts
step bootscripts
echo Installing Grub
step grub
echo 
echo BUILD COMPLETE SUCCESSFULLY!
