#!/usr/bin/env bash

if [[ "$1" == "all" ]]; then
	rm -f /etc/ssh/ssh_host_rsa_key*
	ssh-keygen -t rsa -q -f /etc/ssh/ssh_host_rsa_key -N ''
fi

rm -f ~/.ssh/id_rsa*
ssh-keygen -t rsa -q -f ~/.ssh/id_rsa -N ''
cp -f ~/.ssh/id_rsa.pub /config/

