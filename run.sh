#!/bin/bash

echo "=========================================================="
echo "Bootstrap vcpkg"
./vcpkg/bootstrap-vcpkg.sh

package_list=(
    "qt5-base"
    "qt5-tools"
    "qt5-translations"
    "qt5-declarative"
)

echo "=========================================================="
echo "package_list: ${package_list[@]}"

echo "=========================================================="
echo "Install packages"
./vcpkg/vcpkg install ${package_list[@]}

echo "=========================================================="
echo "Export packages"
./vcpkg/vcpkg export ${package_list[@]} --zip --output-dir=./ --output=my-qt5-libs

echo "=========================================================="
echo "Done"