#!/bin/bash

source /opt/ros/humble/setup.bash
source install/setup.bash

if [ ! -f "apps/FreeCAD.AppImage" ]; then
    echo " ============ Downloading FreeCAD ===================="
    wget -O apps/FreeCAD.AppImage https://github.com/FreeCAD/FreeCAD/releases/download/0.21.2/FreeCAD-0.21.2-Linux-x86_64.AppImage

fi
chmod +x ./apps/FreeCAD.AppImage
echo "Starting FreeCAD, please wait ..."
./apps/FreeCAD.AppImage --appimage-extract-and-run