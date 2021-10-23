FROM ubuntu:20.04
MAINTAINER Sungkeun Kim <ksungkeun84@tamu.edu>

# Disable prompt during package installation
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN echo "root:1234" | chpasswd
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


######################################
# Python
######################################
RUN apt-get install -y python python-dev
RUN apt-get install -y python3.8 python3-dev
RUN apt-get install -y pip

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
RUN apt-get install -y swig python-dev 
RUN apt-get install -y python 
RUN apt-get install -y python3.8 python3-dev
RUN apt-get install -y pip
RUN apt-get install -y libprotobuf-dev 
RUN apt-get install -y protobuf-compiler 
RUN apt-get install -y libgoogle-perftools-dev
RUN apt-get install -y libgoogle-perftools-dev
RUN apt-get install -y python-six


######################################
# Neo Vim
######################################
RUN apt-get update
RUN apt-get install -y vim-scripts

# plug.vim
RUN pip3 install pynvim

# for /dev/fuse
RUN apt-get install -y fuse

######################################
# Miniconda
######################################
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN mkdir /root/.conda
RUN bash Miniconda3-latest-Linux-x86_64.sh -b

COPY miniconda-gem5.yml /root
COPY miniconda-dcce.yml /root
COPY miniconda-ml.yml /root
ENV PATH /root/miniconda3/bin:$PATH

RUN cd /root
RUN conda init bash
RUN conda update conda
RUN conda env create -f /root/miniconda-gem5.yml
RUN conda env create -f /root/miniconda-dcce.yml
RUN conda env create -f /root/miniconda-ml.yml
RUN conda clean --all -f --yes

######################################
# nodejs
######################################
#RUN apt-get update
#ENV DEBIAN_FRONTEND=noninteractive
#RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
#RUN export NVM_DIR="$HOME/.nvm"
#ENV NVIM_DIR /home/ubuntu/.nvim
#RUN [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#RUN [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 
#RUN nvm install nodes
#RUN apt-get install -yq nodejs
#RUN apt-get install -yq npm

######################################
# apt-get clean
######################################
RUN apt-get clean
RUN apt-get autoremove
RUN apt-get clean
RUN apt-get autoclean

######################################
# chmod to allow user to execute conda
######################################
RUN chmod +x /root
RUN chmod +x /root/miniconda3
RUN chmod +x -R /root/miniconda3/bin

CMD bash

