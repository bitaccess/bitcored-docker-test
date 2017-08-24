
FROM ubuntu:16.04
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
        git-core \
        wget \
        libzmq3-dev \
    && rm -rf /var/lib/apt/lists/*

# Install node.js
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install -yqq nodejs
RUN npm i -g npm@5

# Install Bitcore
RUN npm install --unsafe-perm -g satoshilabs/bitcore#426eb972131fb50a1205780387e82e0a30172b22
ADD bitcore-node.json /root/.bitcore/
EXPOSE 3000 18333
ENTRYPOINT "bitcored"
