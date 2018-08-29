FROM ubuntu:latest
#RUN sed -i s/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g /etc/apt/sources.list && sed -i s/security.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g /etc/apt/sources.list && apt-get update -y
RUN apt-get install libboost-filesystem-dev build-essential curl git p7zip-full redis-server rabbitmq-server mysql-client -y
RUN curl -L https://git.io/n-install | bash -s -- -y lts
ENV PATH="/root/n/bin:${PATH}"
RUN mkdir /var/syzoj && mkdir /mnt/syzoj-bin && mkdir /etc/syzoj-config && mkdir /mnt/syzoj-tmp1 && mkdir /mnt/syzoj-tmp2 && mkdir /mnt/syzoj-data
ADD judge-v3.tar.xz /var/syzoj/judge-v3/
ADD syzoj.tar.xz /var/syzoj/syzoj
WORKDIR /var/syzoj/syzoj
#RUN npm set registry https://registry.npm.taobao.org
RUN npm install --loglevel verbose
WORKDIR /var/syzoj/judge-v3
RUN npm install --loglevel verbose
RUN npm install syspipe --loglevel verbose
RUN npm run-script build
ADD config/* /etc/syzoj-config/
WORKDIR /root
ADD scripts/* /root/
EXPOSE 5283
