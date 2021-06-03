#!/bin/sh -e

if [ ! -d "build" ]; then
	mkdir "build"
fi

echo "archiving romfs..."
./tools/3dstool -cvtf romfs ./build/romfs.bin --romfs-dir ./baserom/romfs

echo "building .3ds..."
./tools/makerom -f cci -o oot3d_usa.3ds -DAPP_ENCRYPTED=false -target t -code ./copied.bin -exheader ./baserom/exheader.bin -icon ./baserom/exefs/icon.bin -banner ./baserom/exefs/banner.bin -rsf ./baserom/baserom.rsf -romfs ./build/romfs.bin -logo ./baserom/exefs/logo.bin