SYZOJ Docker 版
---
基于 docker-compose 实现的版本。

为了确保 runner 能够运行，需要在本机上进行配置：
* 在 `/etc/default/grub` 中找到 `GRUB_CMDLINE_LINUX_DEFAULT` 一行，在引号内加入 `swapaccount=1`.
* 执行 `update-grub` 后重启。

安装步骤如下：
1. clone 本 repo. 文件夹名必须是 `syzoj-docker`.
2. 获取 rootfs：在目录下执行 `mkdir sandbox-rootfs`, `docker pull syzoj/rootfs:181202`, `sudo docker save syzoj/rootfs:181202 | tar xvf - -C sandbox-rootfs`.
3. 启动：`docker-compose up -d`.
4. 进行初始配置：在当前目录下运行 `install.sh`.
5. 再次启动未启动成功的服务：`docker-compose up -d`.

可以在 docker-compose.yml 中修改向外开放的端口号。 
