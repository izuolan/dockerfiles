# ------------------------------------------------------------------------------
# Based on a work at https://github.com/docker/docker.
# ------------------------------------------------------------------------------
# Pull base image.
FROM tutum/ubuntu
MAINTAINER ZuoLan <i@zuolan.me>

# ------------------------------------------------------------------------------
# Install dependencies
RUN apt-get update && apt-get -y install git curl build-essential supervisor

# ------------------------------------------------------------------------------
# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup | sudo bash -
RUN apt-get -y install nodejs

# ------------------------------------------------------------------------------
# Install Cloud9
RUN git clone https://github.com/c9/core.git /cloud9
WORKDIR /cloud9
RUN scripts/install-sdk.sh

# ------------------------------------------------------------------------------
# Add workspace volumes
RUN mkdir /cloud9/workspace
VOLUME /cloud9/workspace

# ------------------------------------------------------------------------------
# Set default workspace dir
ENV C9_WORKSPACE /cloud9/workspace

# ------------------------------------------------------------------------------
# Add supervisord conf
ADD supervisord.conf /etc/supervisor/conf.d/

# ------------------------------------------------------------------------------
# clean cache
RUN apt-get autoremove -y
RUN apt-get autoclean -y
RUN apt-get clean -y
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN npm cache clean

# ------------------------------------------------------------------------------
# Expose ports.
EXPOSE 80

# ------------------------------------------------------------------------------
# Start supervisor, define default command.
ENTRYPOINT /usr/bin/supervisord
