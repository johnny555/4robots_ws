#!/bin/bash
bash .vscode/scripts/build.sh

source install/setup.bash

export IGN_GAZEBO_RESOURCE_PATH=$IGN_GAZEBO_RESOURCE_PATH:/workspace/install/share/sprayerbot/models
export GZ_SIM_RESOURCE_PATH=$IGN_GAZEBO_RESOURCE_PATH 

ros2 launch sprayerbot gazebo.launch.py