FROM ubuntu

RUN apt-get update && \
  apt-get install -y git cmake clang bison flex xz-utils libfuse-dev libxml2-dev libicu-dev libssl-dev libbz2-dev zlib1g-dev libudev-dev linux-headers-generic && \
  git clone --recursive https://github.com/darlinghq/darling.git && \
  cd darling && \
  mkdir build && \
  cd build && \
  cmake ../ -DCMAKE_TOOLCHAIN_FILE=../Toolchain.cmake && \
  make && \
  make install && \
  cd ../src/lkm && \
  make && \
  make install && \
  rm -rfv darling
