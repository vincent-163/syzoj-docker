FROM ubuntu:latest
RUN sed -i s/http:\\/\\/archive.ubuntu.com/http:\\/\\/mirrors.aliyun.com/g /etc/apt/sources.list && sed -i s/http:\\/\\/security.ubuntu.com/http:\\/\\/mirrors.aliyun.com/g /etc/apt/sources.list
RUN apt-get update -y
RUN apt-get install libboost-filesystem-dev build-essential curl -y
RUN apt-get install npm p7zip-full redis-server rabbitmq-server mysql-client -y
RUN npm set registry https://registry.npm.taobao.org
RUN npm install -g n
RUN n lts
RUN npm install -g npm@5.6.0
RUN mkdir /var/syzoj && mkdir /mnt/syzoj-bin && mkdir /etc/syzoj-config && mkdir /mnt/syzoj-tmp1 && mkdir /mnt/syzoj-tmp2 && mkdir /mnt/syzoj-data
ADD syzoj.tar.xz /var/syzoj/syzoj/
ADD judge-v3.tar.xz /var/syzoj/judge-v3/
WORKDIR /var/syzoj/syzoj
RUN npm install
WORKDIR /var/syzoj/judge-v3
RUN npm install
RUN npm install syspipe
RUN npm run-script build
ADD config/* /etc/syzoj-config/
WORKDIR /root
ADD scripts/* /root/
EXPOSE 5283
CMD ["/bin/bash", "/root/start.sh"]
