FROM ubuntu:22.04
ARG DEBIAN_FRONTEND=noninteractive
ARG SDKVERSION
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        git \
        less \
        python3 \
        pkg-config \
        ca-certificates \
        cmake \
        make \
        gcc-arm-none-eabi \
        libnewlib-arm-none-eabi \
        libstdc++-arm-none-eabi-newlib \
        g++
RUN export SDKTAG=${SDKVERSION} && \
    export SDKDIR=/pico-sdk-${SDKTAG} && \
    git clone --depth 1 --branch ${SDKTAG} https://github.com/raspberrypi/pico-sdk.git ${SDKDIR} && \
    cd ${SDKDIR}/lib && \
    git submodule update --depth 1 --init && \
    echo "export PICO_SDK_PATH=${SDKDIR}" >> /etc/bash.bashrc

CMD ["/bin/bash"]
