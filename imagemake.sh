#!/bin/sh

git clone -b lede-17.01 https://git.lede-project.org/source.git lede
if [ -f lede/Makefile ]; then
    cp -rf a5v11/. lede
    cd lede
    if [ -f package/utils/fusee-nano/Makefile ]; then
        ./scripts/feeds update -a
        ./scripts/feeds install -a
        make clean
        cp -f ../a5v11/.config .
        make -j12 V=1
        if [ -f bin/targets/ramips/rt305x/lede-ramips-rt305x-a5-v11-squashfs-sysupgrade.bin ]; then
            cp -f bin/targets/ramips/rt305x/lede-ramips-rt305x-a5-v11-squashfs-sysupgrade.bin ../firmware.bin
            echo "Successfully generated firmware.bin."
        else
        echo "Build failed: Built firmware.bin not present."
        fi
    else
    echo "Build failed: Can't locate Fusee."
    fi
else
echo "Build failed: Can't locate Lede."
fi