FROM evo-ssh:latest
MAINTAINER Jiadong Zhuang <jiadong.zhuang@qq.com>

ADD resource /tmp/resource

RUN set -e; \
yum install -y openssh-clients; \
yum clean all; \
cd /tmp/resource; \
cp ./start.sh /start.sh; \
rm -rf /tmp/resource/*;

EXPOSE 22

CMD ["bash", "/start.sh"]

