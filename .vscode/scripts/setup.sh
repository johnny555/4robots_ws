#!/bin/bash
set -e

vcs import < src/workspace.repos src
sudo apt-get update
rosdep update --rosdistro=humble
rosdep install --from-paths src --ignore-src -y --rosdistro=humble