export TOOLCHAIN=/tmp/ndk
export PATH=$TOOLCHAIN/bin/:$PATH

export CC=arm-linux-androideabi-gcc
export CFLAGS="-march=armv7-a -mfloat-abi=softfp" 
export CPPFLAGS=$CFLAGS
export LDFLAGS="-Wl,--fix-cortex-a8 -lsupc++ "
export LIBS="$TOOLCHAIN/arm-linux-androideabi/lib/libstdc++.a"

./configure --host=arm-linux-androideabi --disable-nls
make -j2 iostat pidstat mpstat cifsiostat
arm-linux-androideabi-strip iostat pidstat mpstat cifsiostat
