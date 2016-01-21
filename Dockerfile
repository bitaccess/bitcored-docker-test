# Warning: node:argon is based off of an odd base image.
FROM node:argon
MAINTAINER Moe Adham <moe@bitaccess.co>

# Install base dependencies
RUN apt-get update && apt-get install -y -q --no-install-recommends \
        apt-transport-https \
        build-essential \
        ca-certificates \
        curl \
        git \
        libssl-dev \
        python \
        rsync \
        software-properties-common \
        wget \
    && rm -rf /var/lib/apt/lists/*

# Install Bitcore
RUN npm install -g bitcore
ADD bitcore-node.json /root/.bitcore/
EXPOSE 3000 18333
ENTRYPOINT "bitcored"
