#!/bin/bash
set -e

if [ ! -f "apps/FreeCAD.AppImage" ]; then
    echo " ============ Downloading FreeCAD ===================="
    wget -O apps/FreeCAD.AppImage https://github.com/FreeCAD/FreeCAD/releases/download/0.21.2/FreeCAD-0.21.2-Linux-x86_64.AppImage
fi
# Checks if krytn directory exist. If so, we won't try to import all the repos
if [ ! -d "src/krytn" ]; then
    vcs import src < src/workspace.repos
fi
vcs pull src
sudo apt-get update
rosdep update --rosdistro=humble
rosdep install --from-paths src --ignore-src -y --rosdistro=humble