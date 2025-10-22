# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file LICENSE.rst or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION ${CMAKE_VERSION}) # this file comes with cmake

# If CMAKE_DISABLE_SOURCE_CHANGES is set to true and the source directory is an
# existing directory in our source tree, calling file(MAKE_DIRECTORY) on it
# would cause a fatal error, even though it would be a no-op.
if(NOT EXISTS "/workspaces/CubeMX/AppliSecure")
  file(MAKE_DIRECTORY "/workspaces/CubeMX/AppliSecure")
endif()
file(MAKE_DIRECTORY
  "/workspaces/CubeMX/AppliSecure/build"
  "/workspaces/CubeMX/AppliSecure"
  "/workspaces/CubeMX/AppliSecure/tmp"
  "/workspaces/CubeMX/AppliSecure/src/CubeMX_AppliSecure-stamp"
  "/workspaces/CubeMX/AppliSecure/src"
  "/workspaces/CubeMX/AppliSecure/src/CubeMX_AppliSecure-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/workspaces/CubeMX/AppliSecure/src/CubeMX_AppliSecure-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/workspaces/CubeMX/AppliSecure/src/CubeMX_AppliSecure-stamp${cfgdir}") # cfgdir has leading slash
endif()
