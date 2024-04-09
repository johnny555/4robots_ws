FROM osrf/ros:rolling-desktop-full
WORKDIR /workspace
COPY . /workspace/.devcontainer/
RUN apt-get update \
    && apt-get install -y wget python3-pip vim \
    && rm -rf /var/lib/apt/lists/*
RUN bash .devcontainer/setup_container.bash
