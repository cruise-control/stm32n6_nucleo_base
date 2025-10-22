#!/bin/sh

cmake -G"Ninja" . -B build -DCMAKE_TOOLCHAIN_FILE=`pwd`/gcc-arm-none-eabi.cmake -DBUILD_CONTEXT=FSBL.

cmake --build build/ --clean-first