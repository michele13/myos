# MyOS

This repository contains some scripts to automate  the cross-compiling of my custom Operative System built upon [CLFS-EMBEDDED](http://www.clfs.org/view/clfs-embedded/), with some differences:

* It contains updated software. I use the latest [stable](http://www.linuxfromscratch.org/lfs/view/stable/) release of LFS as reference ([9.1](http://www.linuxfromscratch.org/lfs/view/9.1/) as of writing)
* It uses GLIBC instead of Musl for compatibility, however with some tweaking you can use it Musl if you wish.
* The system is all built by cross-compiling. So you can bootstrap a System for ARM on your X86 system if you wish.
* If your build stops you can restart it from the last package it didn't build.
