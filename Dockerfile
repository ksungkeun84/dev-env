FROM ubuntu:20.04
MAINTAINER Sungkeun Kim <ksungkeun84@tamu.edu>

# Disable prompt during package installation
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update

#RUN mkdir /home/sungkeun
#VOLUME /home/sungkeun
#WORKDIR /home/sungkeun
#ENV HOME /home/sungkeun
#VOLUME /root
#WORKDIR /root
#ENV HOME /root
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

######################################
# nodejs
######################################
RUN apt-get update
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y ripgrep


#RUN curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh
#RUN sudo bash nodesource_setup.sh
RUN apt-get install -yq nodejs 
#RUN apt-get install -y libssl1.1=1.1.1f-1ubuntu2
RUN apt-get install -yq npm 


######################################
# Python
######################################
RUN apt-get install -y python python-dev 
RUN apt-get install -y python3.8 python3-dev
RUN apt-get install -y pip


######################################
# Neo Vim 
######################################
#ADD nvim.appimage /usr/bin/nvim
#RUN chmod +x /usr/bin/nvim
#RUN echo "alias vi=nvim" >> /home/ubuntu/.bashrc

#RUN mkdir -p .local/share/nvim/site/autoload/
#ADD plug.vim .local/share/nvim/site/autoload/plug.vim

#RUN mkdir -p .config/nvim 
#ADD init.vim .config/nvim/init.vim
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


######################################
# apt-get clean
######################################
RUN apt-get clean
RUN apt-get autoremove 
RUN apt-get clean 
RUN apt-get autoclean

######################################
# Add user
######################################
#RUN adduser --disabled-password --gecos '' ubuntu
#RUN adduser ubuntu sudo
#RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN mkdir /home/ubuntu
ENV HOME /home/ubuntu

CMD bash

