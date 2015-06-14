#!/usr/bin/env bash

if [[ $# -lt 1 ]]; then
	echo "usage: $0 command">&2; exit 0;
fi

case $1 in
	gen) refresh_rsa_key.sh; cp -f ~/.ssh/id_rsa* /config/  ;;
	gen-all) refresh_rsa_key.sh all; cp -f ~/.ssh/id_rsa* /config/  ;;
	*)echo "nothing happen.";;
esac

