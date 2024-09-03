#!/usr/bin/env bash

# Modify this for your environment

if [[ -z "${ARDUPILOT_GAZEBO}" ]]; then
  export ARDUPILOT_GAZEBO="$HOME/ardupilot_gazebo"
fi

if [[ -z "${ARDUPILOT_HOME}" ]]; then
  export ARDUPILOT_HOME="$HOME/ardupilot"
fi

if [[ -z "${COLCON_WS}" ]]; then
  export COLCON_WS="$HOME/colcon_ws"
fi


# Add results of ArduSub build
export PATH=$ARDUPILOT_HOME/build/sitl/bin:$PATH

# Add results of colcon build
source ${COLCON_WS}/install/setup.bash

# Add ardupilot_gazebo plugin
export GZ_SIM_SYSTEM_PLUGIN_PATH=${ARDUPILOT_GAZEBO}/build:${COLCON_WS}/build/plugins:$GZ_SIM_SYSTEM_PLUGIN_PATH

# Add bluerov2_ignition models and worlds
export GZ_SIM_RESOURCE_PATH=${COLCON_WS}/src/bluerov2_ignition/models:${COLCON_WS}/src/bluerov2_ignition/worlds:$GZ_SIM_RESOURCE_PATH

# Add orca4 models and worlds
export GZ_SIM_RESOURCE_PATH=${COLCON_WS}/src/orca4/orca_description/models:${COLCON_WS}/src/orca4/orca_description/worlds:${COLCON_WS}/src/orca4/ust_seabed/models:$GZ_SIM_RESOURCE_PATH

export GZ_SIM_RESOURCE_PATH=${COLCON_WS}/src/orca4/turbidity_generator/models:$GZ_SIM_RESOURCE_PATH

export GZ_SIM_RESOURCE_PATH=${COLCON_WS}/src/dave/models:$GZ_SIM_RESOURCE_PATH

# Build ros_gz on the humble branch for Gazebo Garden
export GZ_VERSION=harmonic



