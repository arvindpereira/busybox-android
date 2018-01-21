#!/bin/sh

NDK=`which ndk-build`
NDK=`dirname $NDK`
NDK=`readlink -f $NDK`

export CFLAGS="-Os"

# Find the toolchains
i686path=`find $NDK -name i686-linux-android-gcc`
i686path=`dirname $i686path`
armpath=`find $NDK -name arm-linux-androideabi`
armpath=`dirname $armpath`
mipspath=`find $NDK -name mipsel-linux-android`
mipspath=`dirname $mipspath`

export PATH="${i686path}":"${armpath}":"${mipspath}":$PATH
./build.sh $NDK x86-4.9 x86 4.9 android-14 `pwd`/build/x86 || exit 1
./build.sh $NDK arm-linux-androideabi-4.9 armeabi 4.9 android-14 `pwd`/build/arm || exit 1
#./build.sh $NDK mipsel-linux-android-4.8 mips 4.8 android-14 `pwd`/build/mips || exit 1

#export CFLAGS="-Os -flto"
#export LDFLAGS="-flto"
#./build.sh $NDK x86-4.8 x86 4.8 android-14 `pwd`/build-gcc4.8/x86 || exit 1
#./build.sh $NDK arm-linux-androideabi-4.8 armeabi 4.8 android-14 `pwd`/build-gcc4.8/arm || exit 1
#./build.sh $NDK mipsel-linux-android-4.8 mips 4.8 android-14 `pwd`/build-gcc4.8/mips || exit 1
