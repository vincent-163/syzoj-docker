#!/bin/bash
service redis-server start
service rabbitmq-server start
while ! mysqladmin ping -hmysql -uroot -proot; do
	sleep 1
done
if [ ! -e installed ]; then
	./install.sh
	touch installed
fi

cd /var/syzoj/syzoj
node /var/syzoj/syzoj/app.js -c /etc/syzoj-config/web.json > /root/web.log 2>&1 &
cd /var/syzoj/judge-v3
#node /var/syzoj/judge-v3/lib/frontend-syzoj/index.js -c /etc/syzoj-config/frontend.json > /root/frontend.log 2>&1 &
node /var/syzoj/judge-v3/lib/daemon/index.js -c /etc/syzoj-config/daemon.json > /root/daemon.log 2>&1 &
node /var/syzoj/judge-v3/lib/runner/index.js -s /etc/syzoj-config/runner-shared.json -i /etc/syzoj-config/runner-instance-1.json > /root/runner-1.log 2>&1 &
cd /root
/bin/bash
