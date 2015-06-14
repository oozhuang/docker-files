#!/usr/bin/env bash

install_path="/usr/local/develop"
repo_tree="https://github.com/oozhuang/source-collection/blob/master"

#*.tar.gz only
function func_get_source(){
	if [[ $# -lt 1 ]]; then echo "usage:func_get_source package-name">&2; return -1; fi
	wget -qO $1.tar.gz "$repo_tree/$1.tar.gz?raw=true"
	tar -zxf $1.tar.gz
}

