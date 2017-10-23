#!/bin/bash

rm -rf build
mkdir build
#cd build && cmake -DCMAKE_SYSTEM_PREFIX_PATH=/opt/drake .. && make -j5
cd build && cmake -Ddrake_DIR=/opt/drake/lib/cmake .. && make -j5
cd ..

