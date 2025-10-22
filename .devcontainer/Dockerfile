FROM ubuntu:24.04

ARG USERNAME=user
ARG USER_UID=$USER_UID
ARG USER_GID=$USER_UID
ARG TARGETPLATFORM=linux/amd64
ARG TOOLS_PATH=/opt/gcc-arm-none-eabi
ARG ARM_VERSION=14.3.rel1

# Prep basic packages to build STM32 CMake project
RUN apt-get update && apt-get install -y \
	build-essential \
	ninja-build \
  python3 \
  python3-pip \
	git gnupg2 \
	stlink-tools \
	xz-utils curl

# Get ARM Toolchain
RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then export ARM_ARCH=x86_64; \
	else export ARM_ARCH=aarch64; \
	fi \
	&& echo "Downloading ARM GNU GCC for Platform: $ARM_ARCH" \
	&& mkdir ${TOOLS_PATH} \
	&& curl -Lo gcc-arm-none-eabi.tar.xz "https://developer.arm.com/-/media/Files/downloads/gnu/${ARM_VERSION}/binrel/arm-gnu-toolchain-${ARM_VERSION}-${ARM_ARCH}-arm-none-eabi.tar.xz" \
	&& tar xf gcc-arm-none-eabi.tar.xz --strip-components=1 -C ${TOOLS_PATH} \
	&& rm gcc-arm-none-eabi.tar.xz \
	&& rm ${TOOLS_PATH}/*.txt \
	&& rm -rf ${TOOLS_PATH}/share/doc \
	&& echo "https://developer.arm.com/-/media/Files/downloads/gnu/${ARM_VERSION}/binrel/arm-gnu-toolchain-${ARM_VERSION}-${ARM_ARCH}-arm-none-eabi.tar.xz"

# Add Toolchain to PATH
ENV PATH="$PATH:${TOOLS_PATH}/bin"

# create a non-root user
RUN groupadd --gid 1001 ${USERNAME}
RUN useradd -s /bin/bash --uid 1001 --gid 1001 -m ${USERNAME} \
  && apt -qq install -y sudo \
  && echo ${USERNAME} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${USERNAME} \
  && chmod 0440 /etc/sudoers.d/${USERNAME}

RUN curl -Lo cmake-4.1.2-linux-x86_64.tar.gz https://cmake.org/files/v4.1/cmake-4.1.2-linux-x86_64.tar.gz
RUN tar -xvzf cmake-4.1.2-linux-x86_64.tar.gz --strip-components=1  -C /usr/local

USER ${USERNAME}
