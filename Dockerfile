# Docker container for development

FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

# Install tools
RUN apt-get -y install git vim

# Copy over my private key
COPY id_rsa /root/.ssh/id_rsa
RUN chmod 400 /root/.ssh/id_rsa

# Install zsh
RUN apt-get -y install zsh

# Add github to the known_hosts so we can clone
RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan -H github.com >> /root/.ssh/known_hosts
RUN chmod 600 /root/.ssh/known_hosts

# Install my dotfiles
RUN git clone git@github.com:pneisen/dotfiles.git /root/dotfiles
RUN export SHELL=/bin/zsh && /root/dotfiles/setup.sh
RUN rm -rf /root/dotfiles_old

# Launch into zsh
CMD ["/bin/zsh"]

