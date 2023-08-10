#!/bin/sh

if test -e "${TARGET_DIR}/etc/init.d/S50sshd"
then
	mv "${TARGET_DIR}/etc/init.d/S50sshd" "${TARGET_DIR}/etc/init.d/manual/"
fi

if test -e "${TARGET_DIR}/etc/ppp/pppoe.conf"
then
	rm "${TARGET_DIR}/etc/ppp/pppoe.conf"
fi
