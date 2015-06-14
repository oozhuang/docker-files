#!/usr/bin/env bash
CUR_DIR=$(cd `dirname $0`; pwd)
cd $CUR_DIR;
. ./cfg.sh

set -e
mkdir -p /config;
mkdir -p ~/.ssh;
chmod 600 ~/.ssh;

bash ./refresh_rsa_key.sh all
chmod 755 ./refresh_rsa_key.sh
cp ./refresh_rsa_key.sh /usr/local/bin/

