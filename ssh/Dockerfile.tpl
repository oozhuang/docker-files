FROM centos:6.6
MAINTAINER Jiadong Zhuang <jiadong.zhuang@qq.com>

ADD resource /tmp/resource

RUN set -e; \
curl -so /etc/yum.repos.d/CentOS-Base.repo "http://mirrors.163.com/.help/CentOS6-Base-163.repo"; \
yum -y update; \
yum -y install openssh-server; \
yum clean all; \
cd /tmp/resource; \
bash ./install.id_rsa.sh; \
cp ./start.sh /start.sh; \
rm -rf /tmp/resource/*;

EXPOSE 22

CMD ["bash", "/start.sh"]

ONBUILD RUN bash refresh_rsa_key.sh all

