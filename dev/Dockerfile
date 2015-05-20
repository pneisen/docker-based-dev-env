# Docker container for development
FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

# Install tools
RUN apt-get -y install git vim

# Install zsh
RUN apt-get -y install zsh

# Install my dotfiles
RUN git clone https://github.com/pneisen/dotfiles.git /root/dotfiles
RUN export SHELL=/bin/zsh && /root/dotfiles/setup.sh
RUN rm -rf /root/dotfiles_old

WORKDIR "/root"
