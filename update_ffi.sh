#!/bin/sh

set -xe

if [ -z "$1" ] ; then
	echo "No libffi version specified, aborting..."
	exit 1
fi

if [ ! -e "libffi-clib.cabal" ] ; then
	echo "The script has to run inside the libffi-clib directory. Aborting!"
	exit 1
fi

FFI_VER="$1"
FFI_BALL="libffi-${FFI_VER}.tar.gz"
FFI_URL="https://github.com/libffi/libffi/releases/download/v${FFI_VER}/${FFI_BALL}"

[ -f "${FFI_BALL}" ] || curl -LO "${FFI_URL}"

[ -d "libffi-${FFI_VER}" ] || tar xf "${FFI_BALL}"

(
cd "libffi-${FFI_VER}"

rm -f include/Makefile.am
rm -f include/Makefile.in

cp acinclude.m4   ../
cp aclocal.m4     ../
cp compile        ../
cp config.guess   ../
cp config.sub     ../
cp configure.ac   ../
cp configure.host ../
cp fficonfig.h.in ../
cp -dR include    ../
cp install-sh     ../
cp ltmain.sh      ../
cp -dR m4         ../
cp -dR src        ../

)

