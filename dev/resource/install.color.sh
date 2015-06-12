#!/usr/bin/env bash
CUR_DIR=$(cd `dirname $0`; pwd)
cd $CUR_DIR;
. $CUR_DIR/cfg.sh

set -e
name="dircolors-solarized"
func_get_source "$name"
mv $name ~/.${name}

