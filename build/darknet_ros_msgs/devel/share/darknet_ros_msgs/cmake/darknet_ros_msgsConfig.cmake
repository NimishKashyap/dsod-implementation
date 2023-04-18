# generated from catkin/cmake/template/pkgConfig.cmake.in

# append elements to a list and remove existing duplicates from the list
# copied from catkin/cmake/list_append_deduplicate.cmake to keep pkgConfig
# self contained
macro(_list_append_deduplicate listname)
  if(NOT "${ARGN}" STREQUAL "")
    if(${listname})
      list(REMOVE_ITEM ${listname} ${ARGN})
    endif()
    list(APPEND ${listname} ${ARGN})
  endif()
endmacro()

# append elements to a list if they are not already in the list
# copied from catkin/cmake/list_append_unique.cmake to keep pkgConfig
# self contained
macro(_list_append_unique listname)
  foreach(_item ${ARGN})
    list(FIND ${listname} ${_item} _index)
    if(_index EQUAL -1)
      list(APPEND ${listname} ${_item})
    endif()
  endforeach()
endmacro()

# pack a list of libraries with optional build configuration keywords
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_pack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  set(_argn ${ARGN})
  list(LENGTH _argn _count)
  set(_index 0)
  while(${_index} LESS ${_count})
    list(GET _argn ${_index} lib)
    if("${lib}" MATCHES "^(debug|optimized|general)$")
      math(EXPR _index "${_index} + 1")
      if(${_index} EQUAL ${_count})
        message(FATAL_ERROR "_pack_libraries_with_build_configuration() the list of libraries '${ARGN}' ends with '${lib}' which is a build configuration keyword and must be followed by a library")
      endif()
      list(GET _argn ${_index} library)
      list(APPEND ${VAR} "${lib}${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}${library}")
    else()
      list(APPEND ${VAR} "${lib}")
    endif()
    math(EXPR _index "${_index} + 1")
  endwhile()
endmacro()

# unpack a list of libraries with optional build configuration keyword prefixes
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_unpack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  foreach(lib ${ARGN})
    string(REGEX REPLACE "^(debug|optimized|general)${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}(.+)$" "\\1;\\2" lib "${lib}")
    list(APPEND ${VAR} "${lib}")
  endforeach()
endmacro()


if(darknet_ros_msgs_CONFIG_INCLUDED)
  return()
endif()
set(darknet_ros_msgs_CONFIG_INCLUDED TRUE)

# set variables for source/devel/install prefixes
if("TRUE" STREQUAL "TRUE")
  set(darknet_ros_msgs_SOURCE_PREFIX /home/nimish/drone_ws/src/darknet_ros/darknet_ros_msgs)
  set(darknet_ros_msgs_DEVEL_PREFIX /home/nimish/drone_ws/build/darknet_ros_msgs/devel)
  set(darknet_ros_msgs_INSTALL_PREFIX "")
  set(darknet_ros_msgs_PREFIX ${darknet_ros_msgs_DEVEL_PREFIX})
else()
  set(darknet_ros_msgs_SOURCE_PREFIX "")
  set(darknet_ros_msgs_DEVEL_PREFIX "")
  set(darknet_ros_msgs_INSTALL_PREFIX /usr/local)
  set(darknet_ros_msgs_PREFIX ${darknet_ros_msgs_INSTALL_PREFIX})
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "WARNING: package 'darknet_ros_msgs' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  message("${_msg}")
endif()

# flag project as catkin-based to distinguish if a find_package()-ed project is a catkin project
set(darknet_ros_msgs_FOUND_CATKIN_PROJECT TRUE)

if(NOT "/home/nimish/drone_ws/build/darknet_ros_msgs/devel/include " STREQUAL " ")
  set(darknet_ros_msgs_INCLUDE_DIRS "")
  set(_include_dirs "/home/nimish/drone_ws/build/darknet_ros_msgs/devel/include")
  if(NOT " " STREQUAL " ")
    set(_report "Check the issue tracker '' and consider creating a ticket if the problem has not been reported yet.")
  elseif(NOT "https://github.com/leggedrobotics/darknet_ros " STREQUAL " ")
    set(_report "Check the website 'https://github.com/leggedrobotics/darknet_ros' for information and consider reporting the problem.")
  else()
    set(_report "Report the problem to the maintainer 'Marko Bjelonic <marko.bjelonic@mavt.ethz.ch>' and request to fix the problem.")
  endif()
  foreach(idir ${_include_dirs})
    if(IS_ABSOLUTE ${idir} AND IS_DIRECTORY ${idir})
      set(include ${idir})
    elseif("${idir} " STREQUAL "include ")
      get_filename_component(include "${darknet_ros_msgs_DIR}/../../../include" ABSOLUTE)
      if(NOT IS_DIRECTORY ${include})
        message(FATAL_ERROR "Project 'darknet_ros_msgs' specifies '${idir}' as an include dir, which is not found.  It does not exist in '${include}'.  ${_report}")
      endif()
    else()
      message(FATAL_ERROR "Project 'darknet_ros_msgs' specifies '${idir}' as an include dir, which is not found.  It does neither exist as an absolute directory nor in '/home/nimish/drone_ws/src/darknet_ros/darknet_ros_msgs/${idir}'.  ${_report}")
    endif()
    _list_append_unique(darknet_ros_msgs_INCLUDE_DIRS ${include})
  endforeach()
endif()

set(libraries "")
foreach(library ${libraries})
  # keep build configuration keywords, target names and absolute libraries as-is
  if("${library}" MATCHES "^(debug|optimized|general)$")
    list(APPEND darknet_ros_msgs_LIBRARIES ${library})
  elseif(${library} MATCHES "^-l")
    list(APPEND darknet_ros_msgs_LIBRARIES ${library})
  elseif(${library} MATCHES "^-")
    # This is a linker flag/option (like -pthread)
    # There's no standard variable for these, so create an interface library to hold it
    if(NOT darknet_ros_msgs_NUM_DUMMY_TARGETS)
      set(darknet_ros_msgs_NUM_DUMMY_TARGETS 0)
    endif()
    # Make sure the target name is unique
    set(interface_target_name "catkin::darknet_ros_msgs::wrapped-linker-option${darknet_ros_msgs_NUM_DUMMY_TARGETS}")
    while(TARGET "${interface_target_name}")
      math(EXPR darknet_ros_msgs_NUM_DUMMY_TARGETS "${darknet_ros_msgs_NUM_DUMMY_TARGETS}+1")
      set(interface_target_name "catkin::darknet_ros_msgs::wrapped-linker-option${darknet_ros_msgs_NUM_DUMMY_TARGETS}")
    endwhile()
    add_library("${interface_target_name}" INTERFACE IMPORTED)
    if("${CMAKE_VERSION}" VERSION_LESS "3.13.0")
      set_property(
        TARGET
        "${interface_target_name}"
        APPEND PROPERTY
        INTERFACE_LINK_LIBRARIES "${library}")
    else()
      target_link_options("${interface_target_name}" INTERFACE "${library}")
    endif()
    list(APPEND darknet_ros_msgs_LIBRARIES "${interface_target_name}")
  elseif(TARGET ${library})
    list(APPEND darknet_ros_msgs_LIBRARIES ${library})
  elseif(IS_ABSOLUTE ${library})
    list(APPEND darknet_ros_msgs_LIBRARIES ${library})
  else()
    set(lib_path "")
    set(lib "${library}-NOTFOUND")
    # since the path where the library is found is returned we have to iterate over the paths manually
    foreach(path /home/nimish/drone_ws/build/darknet_ros_msgs/devel/lib;/home/nimish/drone_ws/devel/lib;/home/nimish/catkin_ws/devel_isolated/ydlidar_ros/lib;/home/nimish/catkin_ws/devel_isolated/move_base/lib;/home/nimish/catkin_ws/devel_isolated/rotate_recovery/lib;/home/nimish/catkin_ws/devel_isolated/global_planner/lib;/home/nimish/catkin_ws/devel_isolated/navfn/lib;/home/nimish/catkin_ws/devel_isolated/move_slow_and_clear/lib;/home/nimish/catkin_ws/devel_isolated/dwa_local_planner/lib;/home/nimish/catkin_ws/devel_isolated/clear_costmap_recovery/lib;/home/nimish/catkin_ws/devel_isolated/carrot_planner/lib;/home/nimish/catkin_ws/devel_isolated/base_local_planner/lib;/home/nimish/catkin_ws/devel_isolated/nav_core/lib;/home/nimish/catkin_ws/devel_isolated/costmap_2d/lib;/home/nimish/catkin_ws/devel_isolated/voxel_grid/lib;/home/nimish/catkin_ws/devel_isolated/tutorial_controller/lib;/home/nimish/catkin_ws/devel_isolated/turtlebot3_teleop/lib;/home/nimish/catkin_ws/devel_isolated/turtlebot3_slam/lib;/home/nimish/catkin_ws/devel_isolated/turtlebot3_simulations/lib;/home/nimish/catkin_ws/devel_isolated/turtlebot3_navigation/lib;/home/nimish/catkin_ws/devel_isolated/turtlebot3_fake/lib;/home/nimish/catkin_ws/devel_isolated/turtlebot3_example/lib;/home/nimish/catkin_ws/devel_isolated/turtlebot3_bringup/lib;/home/nimish/catkin_ws/devel_isolated/turtlebot3_msgs/lib;/home/nimish/catkin_ws/devel_isolated/turtlebot3_gazebo/lib;/home/nimish/catkin_ws/devel_isolated/turtlebot3_description/lib;/home/nimish/catkin_ws/devel_isolated/turtlebot3_autorace_driving/lib;/home/nimish/catkin_ws/devel_isolated/turtlebot3_autorace_msgs/lib;/home/nimish/catkin_ws/devel_isolated/turtlebot3_autorace_detect/lib;/home/nimish/catkin_ws/devel_isolated/turtlebot3_autorace_core/lib;/home/nimish/catkin_ws/devel_isolated/turtlebot3_autorace_camera/lib;/home/nimish/catkin_ws/devel_isolated/turtlebot3_autorace_2020/lib;/home/nimish/catkin_ws/devel_isolated/turtlebot3/lib;/home/nimish/catkin_ws/devel_isolated/test_mavros/lib;/home/nimish/catkin_ws/devel_isolated/ros_tutorial1/lib;/home/nimish/catkin_ws/devel_isolated/ros_lab_7/lib;/home/nimish/catkin_ws/devel_isolated/ros_lab_5/lib;/home/nimish/catkin_ws/devel_isolated/ros_lab_3/lib;/home/nimish/catkin_ws/devel_isolated/ros_control_center/lib;/home/nimish/catkin_ws/devel_isolated/ros_autonomous_slam/lib;/home/nimish/catkin_ws/devel_isolated/robot_web_gui/lib;/home/nimish/catkin_ws/devel_isolated/navigation/lib;/home/nimish/catkin_ws/devel_isolated/mavros_extras/lib;/home/nimish/catkin_ws/devel_isolated/mavros/lib;/home/nimish/catkin_ws/devel_isolated/mavros_msgs/lib;/home/nimish/catkin_ws/devel_isolated/libmavconn/lib;/home/nimish/catkin_ws/devel_isolated/amcl/lib;/home/nimish/catkin_ws/devel_isolated/map_server/lib;/home/nimish/catkin_ws/devel_isolated/iq_sim/lib;/home/nimish/catkin_ws/devel_isolated/gazebo_ros_pkgs/lib;/home/nimish/catkin_ws/devel_isolated/gazebo_ros_control/lib;/home/nimish/catkin_ws/devel_isolated/gazebo_plugins/lib;/home/nimish/catkin_ws/devel_isolated/gazebo_ros/lib;/home/nimish/catkin_ws/devel_isolated/gazebo_msgs/lib;/home/nimish/catkin_ws/devel_isolated/gazebo_dev/lib;/home/nimish/catkin_ws/devel_isolated/fake_localization/lib;/home/nimish/catkin_ws/devel_isolated/darknet_ros/lib;/home/nimish/catkin_ws/devel_isolated/darknet_ros_msgs/lib;/home/nimish/catkin_ws/devel/lib;/opt/ros/noetic/lib)
      find_library(lib ${library}
        PATHS ${path}
        NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
      if(lib)
        set(lib_path ${path})
        break()
      endif()
    endforeach()
    if(lib)
      _list_append_unique(darknet_ros_msgs_LIBRARY_DIRS ${lib_path})
      list(APPEND darknet_ros_msgs_LIBRARIES ${lib})
    else()
      # as a fall back for non-catkin libraries try to search globally
      find_library(lib ${library})
      if(NOT lib)
        message(FATAL_ERROR "Project '${PROJECT_NAME}' tried to find library '${library}'.  The library is neither a target nor built/installed properly.  Did you compile project 'darknet_ros_msgs'?  Did you find_package() it before the subdirectory containing its code is included?")
      endif()
      list(APPEND darknet_ros_msgs_LIBRARIES ${lib})
    endif()
  endif()
endforeach()

set(darknet_ros_msgs_EXPORTED_TARGETS "darknet_ros_msgs_generate_messages_cpp;darknet_ros_msgs_generate_messages_eus;darknet_ros_msgs_generate_messages_lisp;darknet_ros_msgs_generate_messages_nodejs;darknet_ros_msgs_generate_messages_py")
# create dummy targets for exported code generation targets to make life of users easier
foreach(t ${darknet_ros_msgs_EXPORTED_TARGETS})
  if(NOT TARGET ${t})
    add_custom_target(${t})
  endif()
endforeach()

set(depends "actionlib_msgs;geometry_msgs;sensor_msgs;message_runtime;std_msgs")
foreach(depend ${depends})
  string(REPLACE " " ";" depend_list ${depend})
  # the package name of the dependency must be kept in a unique variable so that it is not overwritten in recursive calls
  list(GET depend_list 0 darknet_ros_msgs_dep)
  list(LENGTH depend_list count)
  if(${count} EQUAL 1)
    # simple dependencies must only be find_package()-ed once
    if(NOT ${darknet_ros_msgs_dep}_FOUND)
      find_package(${darknet_ros_msgs_dep} REQUIRED NO_MODULE)
    endif()
  else()
    # dependencies with components must be find_package()-ed again
    list(REMOVE_AT depend_list 0)
    find_package(${darknet_ros_msgs_dep} REQUIRED NO_MODULE ${depend_list})
  endif()
  _list_append_unique(darknet_ros_msgs_INCLUDE_DIRS ${${darknet_ros_msgs_dep}_INCLUDE_DIRS})

  # merge build configuration keywords with library names to correctly deduplicate
  _pack_libraries_with_build_configuration(darknet_ros_msgs_LIBRARIES ${darknet_ros_msgs_LIBRARIES})
  _pack_libraries_with_build_configuration(_libraries ${${darknet_ros_msgs_dep}_LIBRARIES})
  _list_append_deduplicate(darknet_ros_msgs_LIBRARIES ${_libraries})
  # undo build configuration keyword merging after deduplication
  _unpack_libraries_with_build_configuration(darknet_ros_msgs_LIBRARIES ${darknet_ros_msgs_LIBRARIES})

  _list_append_unique(darknet_ros_msgs_LIBRARY_DIRS ${${darknet_ros_msgs_dep}_LIBRARY_DIRS})
  _list_append_deduplicate(darknet_ros_msgs_EXPORTED_TARGETS ${${darknet_ros_msgs_dep}_EXPORTED_TARGETS})
endforeach()

set(pkg_cfg_extras "darknet_ros_msgs-msg-extras.cmake")
foreach(extra ${pkg_cfg_extras})
  if(NOT IS_ABSOLUTE ${extra})
    set(extra ${darknet_ros_msgs_DIR}/${extra})
  endif()
  include(${extra})
endforeach()