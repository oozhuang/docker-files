#!/usr/bin/env bash
if [[ -f /config/id_rsa && -f /config/id_rsa.pub ]];then
	cp /config/id_rsa* ~/.ssh/
fi

if [[ -f /config/authorized_keys ]]; then
	cp /config/authorized_keys ~/.ssh/
	chmod 644 ~/.ssh/authorized_keys
	echo "starting sshd with /config/authorized_keys."
else
	echo "starting sshd without /config/authorized_keys."
fi

/usr/sbin/sshd -D #daemon off

