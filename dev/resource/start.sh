#!/usr/bin/env bash
if [[ -f /config/authorized_keys ]]; then
	cp /config/authorized_keys ~/.ssh/
	chmod 644 ~/.ssh/authorized_keys
	echo "starting sshd with /config/authorized_keys."
else
	echo "starting sshd without /config/authorized_keys."
fi

if [[ -f /config/id_rsa.pub ]];then
	cat /config/id_rsa.pub >> ~/.ssh/authorized_keys 
	echo "/config/id_rsa.pub found, and applied to ~/.ssh/authorized_keys."
fi

/usr/sbin/sshd -D #daemon off

