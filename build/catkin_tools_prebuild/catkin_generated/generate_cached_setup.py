# -*- coding: utf-8 -*-
from __future__ import print_function

import os
import stat
import sys

# find the import for catkin's python package - either from source space or from an installed underlay
if os.path.exists(os.path.join('/opt/ros/noetic/share/catkin/cmake', 'catkinConfig.cmake.in')):
    sys.path.insert(0, os.path.join('/opt/ros/noetic/share/catkin/cmake', '..', 'python'))
try:
    from catkin.environment_cache import generate_environment_script
except ImportError:
    # search for catkin package in all workspaces and prepend to path
    for workspace in '/home/nimish/catkin_ws/devel_isolated/ydlidar_ros;/home/nimish/catkin_ws/devel_isolated/move_base;/home/nimish/catkin_ws/devel_isolated/rotate_recovery;/home/nimish/catkin_ws/devel_isolated/global_planner;/home/nimish/catkin_ws/devel_isolated/navfn;/home/nimish/catkin_ws/devel_isolated/move_slow_and_clear;/home/nimish/catkin_ws/devel_isolated/dwa_local_planner;/home/nimish/catkin_ws/devel_isolated/clear_costmap_recovery;/home/nimish/catkin_ws/devel_isolated/carrot_planner;/home/nimish/catkin_ws/devel_isolated/base_local_planner;/home/nimish/catkin_ws/devel_isolated/nav_core;/home/nimish/catkin_ws/devel_isolated/costmap_2d;/home/nimish/catkin_ws/devel_isolated/voxel_grid;/home/nimish/catkin_ws/devel_isolated/tutorial_controller;/home/nimish/catkin_ws/devel_isolated/turtlebot3_teleop;/home/nimish/catkin_ws/devel_isolated/turtlebot3_slam;/home/nimish/catkin_ws/devel_isolated/turtlebot3_simulations;/home/nimish/catkin_ws/devel_isolated/turtlebot3_navigation;/home/nimish/catkin_ws/devel_isolated/turtlebot3_fake;/home/nimish/catkin_ws/devel_isolated/turtlebot3_example;/home/nimish/catkin_ws/devel_isolated/turtlebot3_bringup;/home/nimish/catkin_ws/devel_isolated/turtlebot3_msgs;/home/nimish/catkin_ws/devel_isolated/turtlebot3_gazebo;/home/nimish/catkin_ws/devel_isolated/turtlebot3_description;/home/nimish/catkin_ws/devel_isolated/turtlebot3_autorace_driving;/home/nimish/catkin_ws/devel_isolated/turtlebot3_autorace_msgs;/home/nimish/catkin_ws/devel_isolated/turtlebot3_autorace_detect;/home/nimish/catkin_ws/devel_isolated/turtlebot3_autorace_core;/home/nimish/catkin_ws/devel_isolated/turtlebot3_autorace_camera;/home/nimish/catkin_ws/devel_isolated/turtlebot3_autorace_2020;/home/nimish/catkin_ws/devel_isolated/turtlebot3;/home/nimish/catkin_ws/devel_isolated/test_mavros;/home/nimish/catkin_ws/devel_isolated/ros_tutorial1;/home/nimish/catkin_ws/devel_isolated/ros_lab_7;/home/nimish/catkin_ws/devel_isolated/ros_lab_5;/home/nimish/catkin_ws/devel_isolated/ros_lab_3;/home/nimish/catkin_ws/devel_isolated/ros_control_center;/home/nimish/catkin_ws/devel_isolated/ros_autonomous_slam;/home/nimish/catkin_ws/devel_isolated/robot_web_gui;/home/nimish/catkin_ws/devel_isolated/navigation;/home/nimish/catkin_ws/devel_isolated/mavros_extras;/home/nimish/catkin_ws/devel_isolated/mavros;/home/nimish/catkin_ws/devel_isolated/mavros_msgs;/home/nimish/catkin_ws/devel_isolated/libmavconn;/home/nimish/catkin_ws/devel_isolated/amcl;/home/nimish/catkin_ws/devel_isolated/map_server;/home/nimish/catkin_ws/devel_isolated/iq_sim;/home/nimish/catkin_ws/devel_isolated/gazebo_ros_pkgs;/home/nimish/catkin_ws/devel_isolated/gazebo_ros_control;/home/nimish/catkin_ws/devel_isolated/gazebo_plugins;/home/nimish/catkin_ws/devel_isolated/gazebo_ros;/home/nimish/catkin_ws/devel_isolated/gazebo_msgs;/home/nimish/catkin_ws/devel_isolated/gazebo_dev;/home/nimish/catkin_ws/devel_isolated/fake_localization;/home/nimish/catkin_ws/devel_isolated/darknet_ros;/home/nimish/catkin_ws/devel_isolated/darknet_ros_msgs;/home/nimish/catkin_ws/devel;/opt/ros/noetic'.split(';'):
        python_path = os.path.join(workspace, 'lib/python3/dist-packages')
        if os.path.isdir(os.path.join(python_path, 'catkin')):
            sys.path.insert(0, python_path)
            break
    from catkin.environment_cache import generate_environment_script

code = generate_environment_script('/home/nimish/drone_ws/devel/.private/catkin_tools_prebuild/env.sh')

output_filename = '/home/nimish/drone_ws/build/catkin_tools_prebuild/catkin_generated/setup_cached.sh'
with open(output_filename, 'w') as f:
    # print('Generate script for cached setup "%s"' % output_filename)
    f.write('\n'.join(code))

mode = os.stat(output_filename).st_mode
os.chmod(output_filename, mode | stat.S_IXUSR)
