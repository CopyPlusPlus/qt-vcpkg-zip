#!/bin/bash

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
echo "Install packages"
echo "=========================================================="
./vcpkg/vcpkg install ${package_list[@]}

echo "=========================================================="
echo "Export packages"
echo "=========================================================="
./vcpkg/vcpkg export ${package_list[@]} --x-all-installed --zip --output-dir=./ --output=my-qt5-libs

echo "=========================================================="
echo "Done"
echo "=========================================================="