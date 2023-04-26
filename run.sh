#!/bin/bash

triplet="x64-osx125"

package_list=(
    "qt5-base"
    "qt5-tools"
)

echo "=========================================================="
echo "Update submodules"
echo "=========================================================="
git submodule update --init

echo "=========================================================="
echo "Set environment variables"
echo "=========================================================="

echo "export VCPKG_DEFAULT_HOST_TRIPLET=${triplet}"
export VCPKG_DEFAULT_HOST_TRIPLET=${triplet}

echo "export VCPKG_DEFAULT_TRIPLET=${triplet}"
export VCPKG_DEFAULT_TRIPLET=${triplet}

echo "=========================================================="
echo "Bootstrap vcpkg"
echo "=========================================================="
./vcpkg/bootstrap-vcpkg.sh

echo "=========================================================="
echo "package_list: ${package_list[@]}"

echo "=========================================================="
echo "Copy triplet file to vcpkg/triplets"
echo "=========================================================="
cp ./${triplet}.cmake ./vcpkg/triplets/

echo "=========================================================="
echo "Install packages"
echo "=========================================================="
./vcpkg/vcpkg install ${package_list[@]} --clean-after-build

echo "=========================================================="
echo "Export packages"
echo "=========================================================="
./vcpkg/vcpkg export ${package_list[@]} --7z --output-dir=./ --output=vcpkg-export

echo "=========================================================="
echo "Done"
echo "=========================================================="
