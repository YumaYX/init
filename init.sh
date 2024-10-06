#!/usr/bin/env bash

test -f /etc/redhat-release || exit 1
if [ $(id -u) -ne 0 ]; then
  echo -e "run as root.\nterminated."
  exit 1
fi

dnf -y install python3-pip git make

rm -rf /tmp/init
git clone https://github.com/YumaYX/init.git /tmp/init
cd /tmp/init && time make all

