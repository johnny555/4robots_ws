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

# Is .ssh a directory but not a sym link? 
if [ -d  ~/.ssh ] && [ ! -h ~/.ssh ]
    # then directory ~/.ssh exists! Lets copy its keys so we don't lose them on rebuild accross. 
    echo "Copying keys from ~/.ssh to /workspace/.ssh"
    mkdir /workspace/.ssh
    cp ~/.ssh/* /workspace/.ssh
    echo "symlinking /workspace/.ssh to ~/.ssh"
    rm -rf ~/.ssh 
    ln -s /workspace/.ssh ~/.ssh 
if [ ! -a "~/.ssh" ]; then
   echo "symlinking /workspace/.ssh to ~/.ssh"
   mkdir /workspace/.ssh
   ln -s /workspace/.ssh ~/.ssh
elif [ ! -a "/workspace/.ssh"]; then 
   echo "symlinking /workspace/.ssh to ~/.ssh"
   ln -s /workspace/.ssh ~/.ssh 
fi

vcs pull src
sudo apt-get update
rosdep update --rosdistro=humble
rosdep install --from-paths src --ignore-src -y --rosdistro=humble