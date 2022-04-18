FROM ubuntu:20.04
MAINTAINER Sungkeun Kim <sungkeun.kim@icloud.com>

# Disable prompt during package installation
ARG DEBIAN_FRONTEND=noninteractive

RUN echo "root:1234" | chpasswd
######################################
# Locale
######################################
RUN apt-get update
RUN apt-get install -y locales locales-all
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
######################################
# Python
######################################
RUN apt-get install -y python python-dev
RUN apt-get install -y python3 python3-dev --fix-missing
RUN apt-get install -y pip

######################################
# For pypi packaging
######################################
RUN pip3 install --upgrade build
RUN pip3 install --upgrade twine
RUN pip3 install rich
RUN pip3 install pyfiglet
RUN pip3 install pyclibase

######################################
# Utilities
######################################
RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y curl
RUN apt-get install -y wget
RUN apt-get install -y bash
RUN apt-get install -y bzip2
RUN apt-get install -y sudo
RUN apt-get install -y gdb
RUN apt-get install -y ripgrep
RUN apt-get install -y libtinfo-dev
RUN apt-get install -y locate
RUN apt-get install -y make
RUN apt-get install -y cmake
RUN apt-get install -y g++
RUN apt-get install -y git
RUN apt-get install -y git-core
RUN apt-get install -y zlib1g-dev
RUN apt-get install -y libncurses5-dev
RUN apt-get install -y libncurses5
RUN apt-get install -y libssl-dev
RUN apt-get install -y libpcre2-dev
RUN apt-get install -y zip
RUN apt-get install -y graphviz
RUN apt-get install -y xsel


######################################
# gem5
######################################
RUN apt-get install -y build-essential 
RUN apt-get install -y git-core 
RUN apt-get install -y m4
RUN apt-get install -y zlib1g 
RUN apt-get install -y zlib1g-dev 
RUN apt-get install -y libprotobuf-dev 
RUN apt-get install -y protobuf-compiler 
RUN apt-get install -y libprotoc-dev 
RUN apt-get install -y libgoogle-perftools-dev 
RUN apt-get install -y swig
RUN apt-get install -y libboost-all-dev
RUN apt-get install -y pkg-config
RUN apt-get install -y libpng-dev
# If gem5 v19 does not work, remove the following apps
RUN apt-get install -y scons
RUN apt-get install -y python3-six
RUN apt-get install -y python-is-python3
RUN apt-get install -y libhdf5-serial-dev
RUN apt-get install -y python3-pydot
RUN apt-get install -y python3-venv
RUN apt-get install -y pkg-config

######################################
# Neo Vim
######################################
RUN apt-get update
RUN apt-get install -y vim-scripts

# for /dev/fuse
RUN apt-get install -y fuse

######################################
# nodejs
######################################
RUN apt-get install -yq nodejs
RUN apt-get install -yq npm

######################################
# Install older version of gcc/g++
######################################
#RUN echo "deb http://dk.archive.ubuntu.com/ubuntu/ xenial main" >> /etc/apt/sources.list
#RUN echo "deb http://dk.archive.ubuntu.com/ubuntu/ xenial universe">> /etc/apt/sources.list
#RUN sudo apt update
#RUN apt-get install -y gcc-4.8 g++-4.8
#
#RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 1
#RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 1
#RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 2
#RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 2
#RUN echo 2 | update-alternatives --config gcc
#RUN echo 2 | update-alternatives --config g++


######################################
# Assign users to users.d
######################################
RUN touch /etc/sudoers.d/custom
RUN echo "sungkeun ALL=(ALL) ALL" >> /etc/sudoers.d/custom
RUN echo "vrc ALL=(ALL) /usr/bin/update-alternatives" >> /etc/sudoers.d/custom
RUN echo "jp53456 ALL=(ALL) /usr/bin/update-alternatives" >> /etc/sudoers.d/custom

######################################
# zsh
######################################
RUN apt-get install -y zsh
RUN apt-get install -y powerline 
RUN apt-get install -y fonts-powerline

######################################
# Set up for pintool
######################################
#RUN echo 0 > /proc/sys/kernel/yama/ptrace_scope
#RUN chmod a+w /proc/sys/kernel/yama/ptrace_scope

RUN mkdir /SPEC2017_BINS
RUN mkdir /SPEC2017_INPUTS
COPY SPEC2017_BINS/ /SPEC2017_BINS/
COPY SPEC2017_INPUTS/ /SPEC2017_INPUTS/

RUN chmod -R 755 /SPEC2017_BINS/
RUN chmod -R 755 /SPEC2017_INPUTS/

######################################
# apt-get clean
######################################
RUN apt-get clean
#RUN apt-get autoremove
#RUN apt-get clean
RUN apt-get autoclean


CMD zsh
