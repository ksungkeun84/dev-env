FROM ubuntu:20.04
MAINTAINER Sungkeun Kim <ksungkeun84@tamu.edu>

# Disable prompt during package installation
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update

######################################
# Utilities
######################################
RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y curl
RUN apt-get install -y wget
RUN apt-get install -y bash
RUN apt-get install -y git
RUN apt-get install -y bzip2
RUN apt-get install -y sudo
RUN apt-get install -y gdb
RUN apt-get install -y ripgrep


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


RUN mkdir /home/ubuntu
VOLUME /home/ubuntu
ENV HOME /home/ubuntu

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


COPY miniconda-gem5.yml /home/ubuntu
COPY miniconda-ml.yml /home/ubuntu
ENV PATH /root/miniconda3/bin:$PATH

RUN cd /home/ubuntu
RUN conda init bash
RUN conda update conda
RUN conda env create -f /home/ubuntu/miniconda-gem5.yml
RUN conda env create -f /home/ubuntu/miniconda-ml.yml
RUN conda clean --all -f --yes

######################################
# apt-get clean
######################################
RUN apt-get clean
RUN apt-get autoremove
RUN apt-get clean
RUN apt-get autoclean



CMD bash

