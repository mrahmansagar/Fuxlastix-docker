FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y

COPY qtcCode /app/qtcCode
COPY fuxlastix-Lin /app/fuxlastix-Lin

WORKDIR /app


RUN apt install -y \
    build-essential cmake ninja-build git




RUN apt install -y \
    qt6-base-dev qt6-base-private-dev qt6-declarative-dev qt6-declarative-private-dev qt6-tools-dev qt6-tools-private-dev qt6-scxml-dev qt6-documentation-tools libqt6core5compat6-dev qt6-tools-dev-tools qt6-l10n-tools qt6-shader-baker libqt6shadertools6-dev qt6-quick3d-dev qt6-quick3d-dev-tools libqt6svg6-dev libqt6quicktimeline6-dev libqt6serialport6-dev
RUN apt install -y \
    clang-15 clangd-15 libclang-15-dev
RUN apt install -y \ 
    libgl1-mesa-dev libvulkan-dev libxcb-xinput-dev libxcb-xinerama0-dev libxkbcommon-dev libxkbcommon-x11-dev libxcb-image0 libxcb-keysyms1 libxcb-render-util0 libxcb-xkb1 libxcb-randr0 libxcb-icccm4

RUN mkdir /app/qtc

RUN cmake -G Ninja -S qtcCode -B /app/qtc/build -D CMAKE_BUILD_TYPE=Release

RUN cmake --build /app/qtc/build

RUN cmake --install /app/qtc/build --prefix /app/QtCreator

RUN apt-get install elastix -y

RUN apt-get install -y pcmanfm xterm featherpad