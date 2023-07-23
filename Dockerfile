FROM tiryoh/ros2-desktop-vnc:foxy

# Set a specific working directory
WORKDIR /home/ubuntu/Desktop

# Install ROS key
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

# Clone the repository into the desired location
RUN mkdir -p /home/ubuntu/Desktop/ws/src && \
    cd /home/ubuntu/Desktop/ws/src && \
    git clone https://github.com/chapulina/dolly -b foxy

# Install ROS packages and dependencies
RUN apt update && \
    apt install ros-foxy-turtlesim && \
    sudo rosdep update

WORKDIR /home/ubuntu/Desktop/ws

RUN rosdep install --from-paths src --ignore-src -r -y

# Set environment variables
ENV ROS_DOMAIN_ID=0
ENV DISPLAY=:1

CMD ["ros2", "pkg", "executables", "turtlesim"]