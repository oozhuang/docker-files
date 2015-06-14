FROM evo-dev:latest
MAINTAINER Jiadong Zhuang <jiadong.zhuang@qq.com>

ADD resource /tmp/resource

RUN set -e; \
yum -y install openssl-devel pcre-devel ; \
yum clean all; \
cd /tmp/resource; \
bash ./install.openresty.sh; \
cat /start.sh >> ./start.sh; \
cp -f ./start.sh  /start.sh; \
rm -rf /tmp/resource/*;

EXPOSE 22 80 443

CMD ["bash", "/start.sh"]

