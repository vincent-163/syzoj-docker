FROM ubuntu
RUN apt-get update -y && apt-get install -y ca-certificates curl gnupg && \
    echo "deb https://deb.nodesource.com/node_8.x bionic main" >> /etc/apt/sources.list.d/nodesource.list && \
    echo "deb-src https://deb.nodesource.com/node_8.x bionic main" >> /etc/apt/sources.list.d/nodesource.list && \
    curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
RUN apt-get update -y && apt-get install -y p7zip-full clang-format python-pygments nodejs gcc g++ make libboost-filesystem-dev
ADD syzoj /opt/syzoj
ADD judge-v3 /opt/judge-v3
WORKDIR /opt/syzoj
RUN npm install && (node_modules/.bin/tsc || true)
WORKDIR /opt/judge-v3
RUN npm install && (node_modules/.bin/tsc || true)
WORKDIR /
