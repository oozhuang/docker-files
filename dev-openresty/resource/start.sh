#!/usr/bin/env bash
OPENRESTY_PATH="/usr/local/openresty"
NGINX="$OPENRESTY_PATH/nginx/sbin/nginx"
$NGINX  #daemon on.

if [[ -f /config/authorized_keys ]]; then
	cp /config/authorized_keys ~/.ssh/
	chmod 644 ~/.ssh/authorized_keys
	echo "starting sshd with /config/authorized_keys."
	if [[ -f /config/id_rsa.pub ]]; then
		cat /config/id_rsa.pub >> ~/.ssh/authorized_keys
		echo "add /config/id_rsa.pub to authorized_keys."
	fi
else
	echo "starting sshd without /config/authorized_keys."
fi

/usr/sbin/sshd -D #daemon off

