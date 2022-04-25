cmake_minimum_required(VERSION 2.8.3)
project(zybozoombo)

find_package(catkin REQUIRED COMPONENTS
  roscpp
)

catkin_metapackage()

include_directories(
  ${catkin_INCLUDE_DIRS}
)

add_executable(zybo_drive
  src/zybo_drive.cpp
)
target_link_libraries(zybo_drive
  ${catkin_LIBRARIES}
)


