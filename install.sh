#!/bin/bash
cp -r config-base config
SECRET=$(dd if=/dev/urandom | tr -dc A-Za-z0-9 | head -c${1:-16})
sed -i "s/@SESSION_SECRET@/$SECRET/g" config/web.json
sed -i "s/@JUDGE_TOKEN@/$SECRET/g" config/web.json
sed -i "s/@JUDGE_TOKEN@/$SECRET/g" config/daemon.json
sed -i "s/@EMAIL_JWT_SECRET@/$SECRET/g" config/web.json
docker run -i --rm --network syzoj-docker_net mariadb:10.3 mysql -uroot -p123456 -hmysql < init.sql
