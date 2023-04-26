#!/bin/bash

echo "=========================================================="
echo "Update submodules"
echo "=========================================================="
git submodule update --init

echo "=========================================================="
echo "Bootstrap vcpkg"
echo "=========================================================="
./vcpkg/bootstrap-vcpkg.sh

package_list=(
    "qt5-base"
    "qt5-tools"
)

echo "=========================================================="
echo "package_list: ${package_list[@]}"

echo "=========================================================="
echo "Copy triplet file"
echo "=========================================================="
cp ./x64-osx125.cmake ./vcpkg/triplets/

echo "=========================================================="
echo "Install packages"
echo "=========================================================="
./vcpkg/vcpkg install ${package_list[@]} --triplet x64-osx125 --recurse --clean-after-build

echo "=========================================================="
echo "Export packages"
echo "=========================================================="
./vcpkg/vcpkg export ${package_list[@]} --zip --output-dir=./ --output=vcpkg-export

echo "=========================================================="
echo "Done"
echo "=========================================================="