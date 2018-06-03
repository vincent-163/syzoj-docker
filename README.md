# SYZOJ Docker 版部署
首先需要对 `docker-compose.yml` 作出一些修改，具体如下：
* 第 6 行 `5283:5283` 可以改为 "任意端口:5283"，监听 5283 以外的端口。
* 第 12 行将 `/home/hewenyang/syzoj-docker/sandbox-rootfs` 改为本机上 `sandbox-rootfs` 的位置。
* 第 13 行将 `/opt/syzoj/data` 改为一个空目录，用于存储 syzoj 资料（测试数据等）。

对操作系统本身也需要进行配置，具体如下：
* 在 `/etc/default/grub` 中找到 `GRUB_CMDLINE_LINUX_DEFAULT` 一行，在引号内加入 `swapaccount=1`.

切换到本文件夹并运行 `docker-compose up -d`，随后便可以通过 127.0.0.1:5283 （或您指定的端口）访问。根据网络情况，构建过程可能会花费几分钟至几小时不等，也可能由于失败而中断，重新执行该指令即可，直到最终显示出 mysql 和 web 等字样。

如果部署后发现 `docker-compose.yml` 有误，可以删除容器后重新建构。由于镜像有缓存，该过程应该不会花费太久。

容器运行后会在 `/opt/syzoj/data` 对应的文件夹内创建若干文件夹，其中 `testdata` 用于存放测试数据，`testdata-archive` 用于存放测试数据的 zip 文件。`testdata` 文件夹下应存放以题号命名的文件夹，在文件夹内放置数据文件；`testdata-archive` 文件夹下应存放格式为 `XXX.zip` 的压缩文件，其中 XXX 为题号。

可以通过 `docker exec -it build_web_1 /bin/bash` 来访问容器的 shell。
随后执行 `mysql -hmysql -uroot -proot` 可以访问 MySQL 服务器，执行赋予管理员权限等操作。

# 注意事项
**部署后请一定进入管理后台**，修改配置文件中的 `session_secret` `judge_token` 和 `email_jwt_secret`。这三个值不需要记住，也不需要备份，写在配置文件中即可，但一旦泄漏，会造成安全隐患！使用随机密码生成器任意生成一组即可。
