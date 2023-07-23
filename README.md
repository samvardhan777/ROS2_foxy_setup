## Setup Using Docker

### Prerequisites

- Docker 🐳

```shell
docker pull quay.io/samvardhan777/foxy_gazebo_setup
docker run --name foxy_gazebo_setup_cool  -it -p 6080:80 quay.io/samvardhan777/foxy_gazebo_setup
```

- Run the code inside the container

## Build and install:

```shell
cd ~/Desktop/ws
colcon build
```

## Setup environment variables:

```shell
. /usr/share/gazebo/setup.sh
. ~/Desktop/ws/install/setup.bash
```

## Launch project:

```
ros2 launch dolly_gazebo dolly.launch.py 
Control the robot in another terminal using teleop_keyboard 
ros2 run teleop_twist_keyboard teleop_twist_keyboard  --ros-args -r /cmd_vel:=/dolly/cmd_vel
```
