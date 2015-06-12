#!/usr/bin/env bash
CUR_DIR=$(cd `dirname $0`; pwd)
cd $CUR_DIR;
. $CUR_DIR/cfg.sh

set -e
mkdir -p /config;
mkdir -p ~/.ssh;
chmod 600 ~/.ssh;

ssh-keygen -t rsa -q -f /etc/ssh/ssh_host_rsa_key -N '' 

