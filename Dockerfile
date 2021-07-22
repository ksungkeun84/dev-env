FROM ubuntu:20.04
MAINTAINER Sungkeun Kim <ksungkeun84@tamu.edu>

RUN apt-get update

######################################
# Add user
######################################
#RUN adduser --disabled-password --gecos '' sungkeun
#RUN adduser sungkeun sudo
#RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
#USER sungkeun

RUN mkdir /home/sungkeun
VOLUME /home/sungkeun
WORKDIR /home/sungkeun
ENV HOME /home/sungkeun

######################################
# nodejs
######################################
RUN apt-get update
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get install -yq nodejs npm 
RUN apt-get install -y ripgrep

######################################
# Python
######################################
RUN apt-get install -y python python-dev 
RUN apt-get install -y python3.8 python3-dev
RUN apt-get install -y pip

######################################
# Utilities
######################################
RUN apt-get install -y curl
RUN apt-get install -y wget
RUN apt-get install -y bash
RUN apt-get install -y zsh
RUN apt-get install -y git
RUN apt-get install -y bzip2
RUN apt-get install -y sudo

######################################
# Neo Vim 
######################################
RUN apt-get install -y vim-scripts 

# plug.vim
RUN pip3 install pynvim 

# for /dev/fuse
RUN apt-get install -y fuse

######################################
# apt-get clean
######################################
RUN apt-get clean
RUN apt-get autoremove 
RUN apt-get clean 
RUN apt-get autoclean

CMD zsh
