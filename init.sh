#!/usr/bin/env bash

if [ ! -f /etc/redhat-release ]; then
    echo "terminated." 1>&2
    exit 1
fi

if [ $(id -u) -ne 0 ]; then
  echo "run as root" 1>&2
  echo "terminated." 1>&2
  exit 1
fi

dnf -y install python3.12-pip git make

if [ -e /tmp/init ]; then
  mv -v /tmp/init /tmp/init.bak$$$(date +%Y%m%d%H%M%S)
fi

git clone https://github.com/YumaYX/init.git /tmp/init
cd /tmp/init && time make all

mv -v /tmp/init /tmp/init.bak$$$(date +%Y%m%d%H%M%S)

