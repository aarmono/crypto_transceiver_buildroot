#!/bin/sh

if test -e "${TARGET_DIR}/etc/init.d/S50sshd"
then
	mv "${TARGET_DIR}/etc/init.d/S50sshd" "${TARGET_DIR}/etc/init.d/manual/"
fi
