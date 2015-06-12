FROM centos:6.6
MAINTAINER Jiadong Zhuang <jiadong.zhuang@qq.com>

ADD resource /tmp/resource

RUN set -e; \
curl -so /etc/yum.repos.d/CentOS-Base.repo "http://mirrors.163.com/.help/CentOS6-Base-163.repo"; \
yum -y update; \
yum -y install wget tar bzip2 git md5sum gcc-c++ patch cmake ctags ncurses-devel zlib-devel bzip2-devel openssh-server; \
yum -y remove vim-minimal; \
yum clean all; \
cd /tmp/resource; \
bash ./install.vim.sh; \
bash ./install.color.sh; \
bash ./install.id_rsa.sh; \
cp ./start_sshd.sh /start_sshd.sh; \
rm -rf /tmp/resource/*;

EXPOSE 22

CMD ["bash", "/start_sshd.sh", "-D"]

