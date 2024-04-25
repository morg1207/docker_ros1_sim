# Start from ROS base image
FROM osrf/ros:noetic-desktop

# Set the working directory
WORKDIR /

# Make a catkin workspace
RUN mkdir -p /catkin_ws/src

# Change the default shell to Bash
SHELL ["/bin/bash", "-c"]

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    git \
    build-essential && \ 
    apt-get install python3 && \
    ln -s /usr/bin/python3 /usr/bin/python

# Create a volume for ROS packages
COPY ./course_web_dev_ros /catkin_ws/src/course_web_dev_ros

# Build the Catkin workspace
RUN source /opt/ros/noetic/setup.bash \
    && cd /catkin_ws \
    && catkin_make

# Ensure the workspace is sourced
RUN echo "source /catkin_ws/devel/setup.bash" >> ~/.bashrc

# Set the entry point to start the ROS launch file
ENTRYPOINT ["/bin/bash", "-c","source /opt/ros/noetic/setup.bash && source /catkin_ws/devel/setup.bash && rosrun course_web_dev_ros tortoisebot_action_server.py"]