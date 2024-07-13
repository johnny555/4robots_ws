FROM osrf/ros:jazzy-desktop
WORKDIR /workspace
COPY . /workspace/.devcontainer/
RUN apt-get update \
    && apt-get install -y ros-jazzy-ros-gz  ros-jazzy-rqt-robot-steering ros-jazzy-slam-toolbox ros-jazzy-navigation2 \
    ros-jazzy-nav2-bringup wget python3-pip vim \
    && rm -rf /var/lib/apt/lists/*
RUN bash .devcontainer/setup_container.bash
