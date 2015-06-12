#!/usr/bin/env bash
CUR_DIR=$(cd `dirname $0`; pwd)
cd $CUR_DIR;
. $CUR_DIR/cfg.sh

set -e
cp ./bashrc ~/.bashrc;
mkdir -p /config;
cp ./gitconfig /config/.gitconfig;
ln -sf /config/.gitconfig ~/.gitconfig

func_get_source "vim7.4" 
tar -jxf vim-7.4.tar.bz2; 
tar -zxf vim-7.2-extra.tar.gz; 
tar -zxf vim-7.2-lang.tar.gz
tar -jxf vim-suite.tar.bz2; 

mv vim72 vim74; 
cd vim74/src; 
./configure --enable-multibyte --with-features=huge --disable-selinux; 
make; 
make install;

cd $CUR_DIR
cp -R ./vim-suite/.vim* ~/; 

