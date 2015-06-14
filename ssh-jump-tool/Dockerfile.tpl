FROM evo-ssh:latest
MAINTAINER Jiadong Zhuang <jiadong.zhuang@qq.com>

ADD resource /tmp/resource

RUN set -e; \
cd /tmp/resource; \
rm /start.sh; \
cp ./ssh-jump-tool.sh /usr/local/bin/; \
rm -rf /tmp/resource/*;

ENTRYPOINT ["bash", "ssh-jump-tool.sh"]

