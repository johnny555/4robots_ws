#!/bin/bash

# -----------------------------------------------------

# Now install Gazebo ign
apt-get install -y ros-humble-ros-gz

source /opt/ros/humble/local_setup.bash
rosdep update
rosdep install --from-paths src --ignore-src -y -r

# Create user ros, and allow it to install stuff. 
adduser --disabled-password --gecos "docker user" ros
echo 'ros ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/ros && chmod 0440 /etc/sudoers.d/ros
chown -R ros /workspace

# Install some extra stuff

apt-get install -y ros-humble-rqt-robot-steering ros-humble-slam-toolbox ros-humble-navigation2 \
                    ros-humble-nav2-bringup 

apt-get install clang-format 

# Do an initial build

colcon build --symlink-install

# Get python deps

sudo apt install python3-pip
pip install black

# Make it so that sourcing happens automatically
echo "source /opt/ros/humble/setup.bash" >> /home/ros/.bashrc
echo "source /workspace/install/setup.bash" >> /home/ros/.bashrc

# Suppress deprecated setuptools warning
echo "PYTHONWARNINGS=\"ignore:setup.py install is deprecated::setuptools.command.install,ignore:easy_install command is deprecated::setuptools.command.easy_install\"; export PYTHONWARNINGS" >> /home/ros/.bashrc

# Add GAZEBO path so we can easily include models
echo "export IGN_GAZEBO_RESOURCE_PATH=/workspace/install/krytn/share/krytn/models/:/opt/ros/humble/share/realsense2_description/meshes/" >> /home/ros/.bashrc
