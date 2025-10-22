cmake_minimum_required(VERSION 3.22)


set(FreeRTOS_Src
    ${CMAKE_CURRENT_SOURCE_DIR}/Source/croutine.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Source/event_groups.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Source/list.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Source/portable/GCC/ARM_CM55_NTZ/non_secure/port.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Source/portable/GCC/ARM_CM55_NTZ/non_secure/portasm.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Source/portable/IAR/ARM_CM55_NTZ/non_secure/port.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Source/queue.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Source/tasks.c
    ${CMAKE_CURRENT_SOURCE_DIR}/Source/timers.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../../Src/freertos_libc.c
)

add_library(freertos_kernel ${FreeRTOS_Src})

target_include_directories(
  freertos_kernel 
  PUBLIC
  ${CMAKE_CURRENT_SOURCE_DIR}/Source/include
  ${CMAKE_CURRENT_SOURCE_DIR}/Source/portable/GCC/ARM_CM55_NTZ/non_secure
  ${CMAKE_CURRENT_SOURCE_DIR}/../../Inc
  ${CMAKE_CURRENT_SOURCE_DIR}/../../Drivers/CMSIS/Include/
)

