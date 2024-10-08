#!/usr/bin/env bash

test -f /etc/redhat-release || exit 1
test $(id -u) -eq 0 || exit 2

dnf -y install python3-pip git make

rm -rf /tmp/init
git clone https://github.com/YumaYX/init.git /tmp/init
cd /tmp/init && time make all

