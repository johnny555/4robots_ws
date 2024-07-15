FROM osrf/ros:jazzy-desktop
WORKDIR /workspace
COPY . /workspace/.devcontainer/
RUN apt-get update \
    && apt-get install -y ros-jazzy-ros-gz  ros-jazzy-rqt-robot-steering ros-jazzy-slam-toolbox ros-jazzy-navigation2 \
    ros-jazzy-nav2-bringup ros-jazzy-gz-ros2-control ros-jazzy-rosbridge-suite python3-flask ros-jazzy-ur-description \ 
    ros-jazzy-launch-param-builder ros-jazzy-gz-ros2-control-demos ros-jazzy-moveit-planners-chomp ros-jazzy-moveit-ros-move-group \
    ros-jazzy-realsense2-description ros-jazzy-moveit-kinematics ros-jazzy-moveit-simple-controller-manager \ 
    ros-jazzy-moveit-setup-assistant ros-jazzy-joint-state-publisher-gui ros-jazzy-controller-manager ros-jazzy-moveit-configs-utils \ 
    ros-jazzy-moveit-ros-visualization wget python3-pip vim \
    && rm -rf /var/lib/apt/lists/*
RUN bash .devcontainer/setup_container.bash
