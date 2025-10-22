# Overview
This is a simple repo that was created from a CubeMX project for the STM32N657X0 microcontroller. A cmake build project was exported and then a devcontainer and associated docker environment were added. The CubeMX project was setup to support Secure, NonSecure and FSBL build targets. The external memory context was not selected for this project.

## Goals
Initial [Done]:
1. Create a cmake project that can build for the STM32N6 from command line and within vscode
  - This is to allow for easier development and inclusion of libraries without being limited by the Eclipse CDT capabilities
1. Have all of the HAL layers by default (in contrast to CubeIDE which will selectively include needed code)
1. Externally integrate FreeRTOS (as opposed to using the CubeMX middleware)
1. ~~Maintain compatibility with auto-generated code from CubeMX~~
  - CubeMX appears to blow away unexpected source files and the cmake source also needed to be manually edited
  - Changes will need to be manually integrated if CubeMX is needed in the future
1. Flash and execute this on the NUCLEO-N6 development board
Optional:
1. Integrate FreeRTOS Networking
  - Needs base RMII capabilities from CubeMX (unless FreeRTOS handles it)
1. [Done] Add a minimal dummy FreeRTOS task compiled with c++
1. [Done] Add [ETL](https://www.etlcpp.com/)

## STM32N6 Execution Contexts
This processor has 4 execution contexts. In the typical CubeIDE, each one has its own sub-project and build pipeline. In this cmake project, each has its own folder and they all link back to common Drivers for BSP, HAL and CMSIS information. The contexts are:
1. First Stage Boot Loader
  - The bootloader loads up to XXkB from external memory (?) into internal RAM, or the RAM can be programmed directly over ST-Link
  - The program is executed from RAM so it is volatile
  - This is considered development mode and has limited program code space
  - This is the initial target of this repository
1. Non Secure Application
1. Secure Application
1. External Memory 
  - Program code is flashed onto external memory
  - During execution, code is loaded directly from external memory and executed (no additional RAM usage)

## Building the projects
From the root directory run the command

`cmake -G"Ninja" . -B build -DCMAKE_TOOLCHAIN_FILE=`pwd`/gcc-arm-none-eabi.cmake`

Which will create a build folder and setup an absolute path for the compiler (configured in the docker container).

To build the projects run the command

`cmake --build build/ --clean-first`

Which will build all three projects.