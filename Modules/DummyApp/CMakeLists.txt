cmake_minimum_required(VERSION 3.22)

set(SRC_FILES
  ${CMAKE_CURRENT_SOURCE_DIR}/Dummy.cpp
)

add_library(dummy_app ${SRC_FILES})

target_link_libraries(
  dummy_app
)

set(CMAKE_ROOT_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../../)

# Add all of the various headers needed to get a simple module with
# a freertos task and BSP access compiling
set(MX_Include_Dirs
  ${CMAKE_CURRENT_SOURCE_DIR}/
  ${CMAKE_ROOT_DIR}/FSBL/Core/Inc
  ${CMAKE_ROOT_DIR}/Inc
  ${CMAKE_ROOT_DIR}/Drivers/STM32N6xx_HAL_Driver/Inc
  ${CMAKE_ROOT_DIR}/Drivers/CMSIS/Device/ST/STM32N6xx/Include
  ${CMAKE_ROOT_DIR}/Drivers/STM32N6xx_HAL_Driver/Inc/Legacy
  ${CMAKE_ROOT_DIR}/Drivers/BSP/STM32N6xx_Nucleo
  ${CMAKE_ROOT_DIR}/Drivers/CMSIS/Include
  ${CMAKE_ROOT_DIR}/Middlewares/FreeRTOS/Source/portable/GCC/ARM_CM55_NTZ/non_secure
  ${CMAKE_ROOT_DIR}/Middlewares/FreeRTOS/Source/include
  ${CMAKE_ROOT_DIR}/Middlewares/FreeRTOS/Source/include
)

target_include_directories(
  dummy_app
  PUBLIC
  ${MX_Include_Dirs}
)
