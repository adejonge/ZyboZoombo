cmake_minimum_required(VERSION 2.8.3)
project(zybozoombo)

find_package(catkin REQUIRED)

catkin_package(CATKIN_DEPENDS roscpp)

include_directories(
  ${catkin_INCLUDE_DIRS}
)

add_executable(zybo_drive
  src/zybo_drive.cpp
)
target_link_libraries(zybo_drive
  ${catkin_LIBRARIES}
)

add_executable(test_zybo_drive test/test_zybo_drive.cpp)
target_link_libraries(test_zybo_drive
  ${catkin_LIBRARIES}
  ${GTEST_LIBRARIES}
)


