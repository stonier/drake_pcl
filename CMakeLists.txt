cmake_minimum_required(VERSION 3.5 FATAL_ERROR)

project(drake_pcl_test)

set(drake_ROOT "/opt/drake")
set(drake_DIR "/opt/drake/lib/cmake/drake")

# Find the xenial Eigen3 (3.2.92) - /usr/lib/cmake/eigen3/Eigen3Config.cmake and UseEigen3.cmake
# find_package(Eigen3 REQUIRED)                                                         # EIGEN3 does not work
# message(STATUS "LOOKING FOR...............................Eigen3")
# message(STATUS "EIGEN FOUND...............................${Eigen3_FOUND}")           # Eigen3 and EIGEN3 both work 
# message(STATUS "EIGEN VERSION.............................${EIGEN3_VERSION_STRING}")  # Eigen3 does not work, no EIGEN3_VERSION either

message(STATUS "LOOKING FOR...............................DRAKE")
find_package(drake REQUIRED)

# The drake provided Eigen3 (3.3.3)
message(STATUS "LOOKING FOR...............................Eigen3")
message(STATUS "EIGEN FOUND...............................${Eigen3_FOUND}")             # EIGEN3 does not work
message(STATUS "EIGEN VERSION.............................${Eigen3_VERSION}")           # No Eigen3_VERSION_STRING here! EIGEN3 does not work

message(STATUS "LOOKING FOR...............................PCL")

# ach, doesn't help it - it still finds the system version and throws that path into PCL_INCLUDE_DIRS
set(EIGEN_ROOT "${drake_ROOT}/include/eigen3")
find_package(PCL 1.7 REQUIRED)
message(STATUS "PCL FOUND.................................${PCL_FOUND}")
message(STATUS "PCL DIRS..................................${PCL_INCLUDE_DIRS}")

include_directories(
  # ${PROJECT_SOURCE_DIR}/include
  # Can't use this line, because it will point to /usr/include/eigen3 which conflicts with drake's eigen.
  ${PCL_INCLUDE_DIRS}
  # Comment the above and uncomment the following lines compiles.
  #/usr/local/include/pcl-1.8
  #/usr/include/ni
  #/usr/include/openni2
)

add_executable (my_test test.cc)
target_link_libraries(my_test ${PCL_LIBRARIES} drake::drake)
